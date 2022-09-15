function [R,V]=algsynth(P,T,w)
% ALGSYNTH ... algebraischer Entwurf für die erweiterte Regelkreis-Struktur
%
% [R,V]=algsynth(P,T,w)
%
% P ... Strecke (tf)
% T ... gewünschte Führungsübertragungsfunktion (tf)
% w ... Erweiterungspolynom 
%
% R,V ... Regler (tf)
%
% (c) M.Horn IRT TUG
%
R=[]; V=[]; 
if nargin==2            % Anzahl Übergabewerte!
    w=[1];
end
if ~isimp(T,P)
    disp('algsynth: T ist nicht implementierbar')
    return;
end
P=minreal(P);
[mu,nu]=tfdata(P,'v');
n=length(nu)-1;
rho=n-1;
H=tf(1,mu,P.Ts);
Ts=minreal(T*H);
[mus,nus]=tfdata(Ts,'v');
g_nus=length(nus)-1;
if g_nus>(n+rho)
    disp('algsynth: Ordnung von T zu hoch!')
    return;
end 
if g_nus<(n+rho)
    % Erweiterungspolynom nötig
    g_w=(n+rho)-g_nus;
    if (length(w)-1)~=g_w
        if nargin==3
            disp('algsynth: fascher Grad von w!')
            txt=sprintf('erforderliche Grad: %ld',g_w);
            disp(txt)         
            return;
        end
        if nargin==2
            hlp=[];
            for i=1:g_w
                if P.Ts>0
                    hlp=[hlp 0];
                else
                    hlp=[hlp -1];
                end
            end
            w=poly(diag(hlp));
            txt=sprintf('algsynth: erweitert mit dem Polynom w: [%s] ',num2str(w));           
            disp(txt)         
        end
    end
end
if ~isstable(tf(1,w,P.Ts))
    disp('algsynth: w ist nicht stabil!')
    return
end
Ts=minreal(T*H)*tf(w,w,P.Ts);
[mus,nus]=tfdata(Ts,'v');
Res=resultante(nu,mu,rho);
nus=nus(:); nus=flipud(nus);

x=Res\nus; x=x(:);

a=x(1:rho+1); a=flipud(a)';
b=x(rho+2:end); b=flipud(b)';
V=tf(mus,a,P.Ts);
R=tf(b,a,P.Ts);
    

