%% Matlab HU Aufgabe I
clear; close all; clc
s = tf('s');

idx = 1; %Select Testbeispiel

if idx = 1
    P = (s+3)/(s*(s-1));
    T = 1/(s+1);
elif idx = 2
    P = (s+3)/(s*(s-1));
    T = 1/(s-1);
elif idx = 3
    P = (s-3)/(s*(s-1));
    T = 1/(s+1)^2;
elif idx = 4
    P = 1/(s*(s-1));
    T = 1/(s+1);
elif idx = 5
    P = (s-3)^2/(s*(s-1)^2);
    T = 1/(s+1);

end



%% Matlab HU Aufgabe 2
clear; close all; clc
s = tf('s');

P = (s-3)/(s*(s-1));

omega = 3;

nut = s + 5;
%nut = (s + 5)^2;
%nut = (s + 5)^5;

[R, T] = polvorgabe_HStoerung(P, nut, omega);


