%% Testscript

%% Aufgabe 1
clc
clear all
s = tf('s');

%Testbeispiel der Funktionen
%Ts = (s+2)/((s+1)*(s+3));
%Ts = (s-1)/((s+1)^2*(s+3));
Ts = 1;
Ps = ((s+2)*(s-1))/(s*(s^2+2*s+1));

%Überprüfung
myisimp(Ts,Ps);

%% Aufgabe 2
nu = [1, 2, 3];
mu = [3,4];
rho= 1;
Res = resultante(nu,mu,rho);

%% Aufgabe 3
Ps = (s-2) / (s*(s-1));
nut = [1, 3, 3, 1];

[R, T] = polvorgabe(Ps, nut);

