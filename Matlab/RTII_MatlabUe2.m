%% Regelungstechnik II - Matlab-Übung 2 
clear; close all; clc
s = tf('s');
%% functions
a = 1; b = 2; 
result = myfunction(a,b);

if a == 1 
    disp('a = 1')
end
%% Polvorgabe - relevante Matlab-Befehle
Ps = (s+1)/(s+2)^2;

[numPs,denPs] = tfdata(Ps,'v'); % Reihenfolge beachten!

fliplr(numPs) %flip-left-right oder flip-up-down spiegelt links/rechts, oben/unten

M1 = [1,2;3,4]; M2 = [1,1,1;2,2,2];

M = [M1,M2]; % Dimensionen beachten!

%% Resultante
Res = resultante(numPs,denPs,1)
%%
numRs = 1;
denRs = [1,2];
Rs = tf(numRs,denRs); % Reihenfolge beachten! (Zählervektor,Nennervektor)
%% Gleichungssystem A*x = b
A = [1,2;3,4]; b = [1;2];
x1 = A\b;
x2 = A^-1*b;


%% Aufgabe 1
clc
clear all
s = tf('s');

%Testbeispiel der Funktionen
%Ts = (s+2)/((s+1)*(s+3));
Ts = (s-1)/((s+1)^2*(s+3));
%Ts = 1;
Ps = ((s+2)*(s-1))/(s*(s^2+2*s+1));

%Überprüfung
myisimp(Ts,Ps);

%% Aufgabe 2
clc
clear all;
nu = [1, 2, 3];
mu = [3,4];
rho= 1;
Res = resultante(nu,mu,rho);


%% Resultante Test
clc
clear all;
s = tf('s');
P = (2*s^2+1*s+0)/(3*s^3+4*s^2+5*s+6);
[mu, nu] = tfdata(P,'v');
n = length(nu);
rho = n - 1;
res = resultante(nu,mu,rho);
%%
nut = (3*s^3+4*s^2+5*s+6);
[f] = tfdata(nut, 'v');
f = flipud(transpose(f));

%% Aufgabe 3
clc
clear all;
s = tf('s');

nut = (s^3 + 3 * s^2 + 3 * s + 1);
Ps = (s-2) / (s*(s-1));

[R, T] = polvorgabe(Ps, nut);

figure(1)
clf
step(T, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(T)




