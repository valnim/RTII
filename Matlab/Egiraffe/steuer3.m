%
% Steuerung 3 - nicht-phasenminimal (d.h. mu(s) ist nicht Hurwitz) mit Hilfsgröße (flacher Ausgang) z
%

close all
clear all
clc

s=tf('s');
P=(s-2)/(s^2-s);

% stabilisierender Regler
R=(-5.5*s-0.5)/(s+8.5);
%R=R*0;  % Regler aus

sim('ff3',35)

plot(t,uv),grid
hold on
plot(t,u,'r')
legend('u_v','u')

figure
plot(t,r,'r');
hold on
plot(t,y),grid
legend('r','y')