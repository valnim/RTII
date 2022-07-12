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

Res = resultante(nu,mu,rho);