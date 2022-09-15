%
% Steuerung 1 - phasenminimal (mu(s) ist Hurwitz)
%

close all
clear all
clc

s=tf('s');
P=(s+1)/(s^2-s);

% stabilisierender Regler
R=(2*s+1)/(s+1);
%R=R*0;  % Regler aus

sim('ff1',12)

plot(t,uv),grid
hold on
plot(t,u,'r')
legend('u_v','u')

figure
plot(t,r,'r');
hold on
plot(t,y),grid
legend('r','y')