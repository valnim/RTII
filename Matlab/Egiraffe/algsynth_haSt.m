function [R,V]=algsynth_haSt(P,T,w,omega)
% ALGSYNTH_HAST ... algebraischer Entwurf für die erweiterte Regelkreis-Struktur
%                   inkl. Unterdrückung harmonsicher Störungen
% [R,V]=algsynth_haSt(P,T,w,omega)
%
% P ... Strecke (tf)
% T ... gewünschte Führungsübertragungsfunktion (tf)
% w ... Erweiterungspolynom 
% omega Vektor mit den entsprechenden Frequenzen
%
% R,V ... Regler (tf)
%
% (c) Hannes Schwingenschlögl & Stefan Zausinger
%
R=[]; V=[]; 
if nargin==2            % Anzahl Übergabewerte!
    w=[1];
end
if ~isimp(T,P)
    disp('algsynth2: T ist nicht implementierbar')
    return;
end
P=minreal(P);
[mu,nu]=tfdata(P,'v');
n=length(nu)-1;
rho=n-1;
H=tf(1,mu);
Ts=minreal(T*H);
[mus,nus]=tfdata(Ts,'v');
g_nus=length(nus)-1;
k=length(omega);
if g_nus>(n+rho+2*k)
    disp('algsynth2: Ordnung von T zu hoch!')
    return;
end 
if g_nus<(n+rho+2*(k))
    % Erweiterungspolynom nötig
    g_w=(n+rho+2*(k))-g_nus;
    if (length(w)-1)~=g_w
        if nargin==3+1
            disp('algsynth2: fascher Grad von w!')
            txt=sprintf('erforderlicher Grad: %ld',g_w);
            disp(txt) 
            w = create_w_haSt(g_w);
            txt=sprintf('algsynth2: erweitert mit dem Polynom w: [%s] ',num2str(w));           
            disp(txt)    
            %return;
        end
        if nargin==2+1
            w = create_w_haSt(g_w);
            
            %hlp=[];
            %for i=1:g_w
                %if P.Ts>0
                %    hlp=[hlp 0];
                %else
                %    hlp=[hlp -1];
                %end
            %end
            %w=poly(diag(hlp));
            txt=sprintf('algsynth2: erweitert mit dem Polynom w: [%s] ',num2str(w));           
            disp(txt)         
        end
    end
end
if ~isstable(tf(1,w))
    disp('algsynth: w ist nicht stabil!')
    w = create_w_haSt(g_w);
    txt=sprintf('algsynth2: erweitert mit dem Polynom w: [%s] ',num2str(w));           
    disp(txt)   
    %return
end
Ts=minreal(T*H)*tf(w,w);
[mus,nus]=tfdata(Ts,'v');


Res=resultante(nu,mu,rho+2*k);    % rho um 2*k erweitert für zus. Freiheitsgrade

% Resultante entsprechend erweitern für Unterdrückung harm. Störungen
for ii = 1:k
    i=0; add=[];
    while i <= rho/2 + k                        % while vorteilhaft weil bei z.B rho=3 -> rho=1,5 ist der vergleich trotzdem ok
        add = [add ,(-1)^i * omega(ii)^(2*i), 0];
        i=i+1;
    end
    add = [ add, zeros(1,length(Res(1,:)) - length(add)) ];    % Fehlende Nullen für Konsistenz
    add = [ add; circshift(add,1)];         % 2te Zeile um 1 versetzt (siehe Herleitung)
    Res = [Res;add];                        % anhängen der zusätzlichen Bedingungen
end

nus=nus(:); nus=flipud(nus);

for ii = 1:2*k
    nus = [nus;0];
end

x=Res\nus; x=x(:);

a=x(1:rho+1+(2*k)); a=flipud(a)';
b=x(rho+2+(2*k):end); b=flipud(b)';
V=tf(mus,a,P.Ts);
R=tf(b,a,P.Ts);
