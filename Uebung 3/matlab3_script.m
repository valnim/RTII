%% Regelungstechnik II - Matlab Übung
% Diskretisierung
clear; clc
s = tf('s');
%--------------------------------------------------------------------------
Gs = (s+4)/(s+1)/(s+2)^2;

Td = 0.2;
% sysd = c2d(sysc,Ts,method)
% discretizes the continuous-time dynamic system model sysc using 
% specific discretization method on the inputs and a sample time of Ts.
% methods: zoh, tustin  ....

Gz_zoh = c2d(Gs,Td) 
Gz_tustin = c2d(Gs,Td,'tustin')

[numGz,denGz] = tfdata(Gz_tustin,'v')

%% State-Space Model from Transfer Function 
% sys = ss(ltiSys)
sysC = ss(Gs)
A = sysC.a
b = sysC.b
cT = sysC.c
d = sysC.d