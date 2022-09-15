clear all;
close all;
clc;

s=zpk('s');                         % Definition von symbolisch s
fig = 0;

% docked windows with figurs only
set(0,'DefaultFigureWindowStyle','docked')

% Schriftgröße plots
Textsize = 20;
% Liniendicke plots
Liniengroesse = 2;

%% Ausgangsbasis sind alle Programme die bis zur Matlab-Übung 4 erstellt wurden
%  alle neuen Elemente sind hier angeführt und auch dementsprechend
%  verifiziert

%% Beispiel Skript für inkonsistende Polynomgrade
P = (s+2)/((s+1)*(s-1));
T = 1/(s^3+3*s^2+3*s+1);
[R,V]=algsynth(P,T);                    %passt!
%% Beispiel Skript für   konsistende Polynomgrade
P = 1/((s+1)*(s-1));
T = 1/(s^3+3*s^2+3*s+1);
[R,V]=algsynth(P,T);
%Lösung: R=4(s+1)/(s+3) V=1/(s+3)       passt!
%% Verifikation von:
P =   (s-3) / (s*(s-1))
T =   (3-s) / (3*s^2 + 6*s + 3)
%% ohne Übergabe von w
disp('ohne Übergabe von w:')
[R,V]=algsynth2(P,T)
T1=V*P/(1+R*P);
%% Verwendung von w1
w{1} =  [1 5];
disp('Verwendung von w1:')
[R,V]=algsynth2(P,T,w{1})
T2=V*P/(1+R*P);
%% Verwendung von w2
w{2} = [1 10 25];
disp('Verwendung von w2:')
[R,V]=algsynth2(P,T,w{2})
T3=V*P/(1+R*P);
%% Verwendung von w3
w{3} =  [1 -2];
disp('Verwendung von w3:')
[R,V]=algsynth2(P,T,w{3})
T4=V*P/(1+R*P);
%% Sprungantwort
fig=fig+1;  figure(fig);
h = stepplot(T,T1,T2,T3,T4);
legend('T','T1','T2','T3','T4')
setoptions(h,'Normalize','on')
grid minor
set(findall(gcf,'-property','FontSize'),'FontSize',Textsize)
set(findall(gca, 'Type', 'Line'),'LineWidth',Liniengroesse)
%% Aufgabe 2b-1 - unterdrückung harmonischer Störungen
P = (s-2) / (s^2-1);
T = -15/2 * (s-2) / (s^3 + 7*s^2 + 17*s +15);
omega = [1];
[R,V]=algsynth_haSt(P,T,1,omega)
T5=V*P/(1+R*P);

fig=fig+1;  figure(fig);
h1 = stepplot(T,T5);
legend('T','T5')
setoptions(h1,'Normalize','on')
grid minor
set(findall(gcf,'-property','FontSize'),'FontSize',Textsize)
set(findall(gca, 'Type', 'Line'),'LineWidth',Liniengroesse)

fig=fig+1;  figure(fig);

for u=0:1
    t = 0:0.1:10;
    if u==1
        t = 0:0.1:25;                
    end
    
    T=V*P/(1+R*P);
    S1=1/(1+R*P);
    subplot(2,2,1+u)
    lsim([T,S1],[0*t+1 ; sin(t)],t)
    grid minor
    legend('y')

    subplot(2,2,3+u)
    lsim([T,S1],[0*t+1 ; sin(1.1*t)],t)
    grid minor
    legend('y')
end
fig=fig+1;  figure(fig);
bode(S1)
grid minor
set(findall(gcf,'-property','FontSize'),'FontSize',Textsize)
set(findall(gca, 'Type', 'Line'),'LineWidth',Liniengroesse)

%% Aufgabe 2b-2 - unterdrückung harmonischer Störungen
P = (s-2) / (s^2-1);
T = -15/2 * (s-2) / (s^3 + 7*s^2 + 17*s +15);
omega = [1,1.2];
[R,V]=algsynth_haSt(P,T,1,omega)
T5=V*P/(1+R*P);

fig=fig+1;
figure(fig);
h1 = stepplot(T,T5);
legend('T','T5')
setoptions(h1,'Normalize','on')
grid minor
set(findall(gcf,'-property','FontSize'),'FontSize',Textsize)
set(findall(gca, 'Type', 'Line'),'LineWidth',Liniengroesse)

fig=fig+1;  figure(fig);

for u=0:1
    t = 0:0.1:10;
    if u==1
        t = 0:0.1:25;                
    end
    
    T=V*P/(1+R*P);
    S1=1/(1+R*P);
    subplot(2,2,1+u)
    lsim([T,S1],[0*t+1 ; sin(t)],t)
    grid minor
    legend('y')

    subplot(2,2,3+u)
    lsim([T,S1],[0*t+1 ; sin(1.1*t)],t)
    grid minor
    legend('y')
end
fig=fig+1;  figure(fig);
bode(S1)
grid minor
set(findall(gcf,'-property','FontSize'),'FontSize',Textsize)
set(findall(gca, 'Type', 'Line'),'LineWidth',Liniengroesse)