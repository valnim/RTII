%% Regelungstechnik II - Matlab-Übung 3

%% Aufgabe 1 
% a)
clear; close all; clc
s = tf('s');

P = 1/(s^2+2*s+1);

figure(1)
clf
step(P, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(P)

% b)
nut = (s+5)^4;

[R, T] = polvorgabe_zusatz(P, nut);

% c)
figure(2)
clf
step(T, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(T)

%% Aufgabe 2
clc;
Gs = 1/(s^2+2*s+1);

Td = 0.1;   
Gz = c2d(Gs, Td, 'tustin');
[numGz, denGz] = tfdata(Gz, 'v');

Rt = c2d(R, Td, 'tustin');
[numRt, denRt] = tfdata(Rt, 'v');

%d)
Rv = c2d(R, Td, '');
[numRt, denRt] = tfdata(Rv, 'v');

