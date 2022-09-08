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