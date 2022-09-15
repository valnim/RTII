%
% Steuerung 2 - nicht-phasenminimal (d.h. mu(s) ist nicht Hurwitz)
%

close all
clear all
clc

s=tf('s');
P=(s-2)/(s^2-s);

R=(-5.5*s-0.5)/(s+8.5);
%R=R*0;  % Regler aus

sim('ff2',25)

plot(t,uv),grid
hold on
plot(t,u,'r')
legend('u_v','u')

figure
plot(t,r,'r');
hold on
plot(t,y),grid
legend('r','y')
