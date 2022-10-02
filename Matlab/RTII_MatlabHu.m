%% Matlab HU Aufgabe I
clear; close all; clc
s = tf('s');

idx = 5; %Select Testbeispiel

if idx == 1
    P = (s+3)/(s*(s-1));
    T = 1/(s+1);
elseif idx == 2
    P = (s+3)/(s*(s-1));
    T = 1/(s-1);
elseif idx == 3
    P = (s-3)/(s*(s-1));
    T = 1/(s+1)^2;
elseif idx == 4
    P = 1/(s*(s-1));
    T = 1/(s+1);
elseif idx == 5
    P = (s-3)^2/(s*(s-1)^2);
    T = 1/(s+1);
end

[isimp_ext__flag,modify_flag, Tresult] = myisimpl_extended(P, T);


%% Matlab HU Aufgabe 2
clear; close all; clc
s = tf('s');

P = (s-3)/(s*(s-1));

omega = 3;

%nut = s + 5;
%nut = (s + 5)^2;
nut = (s + 5)^5;

[R, T] = polvorgabe_HStoerung(P, nut, omega);
figure(2)
clf
step(T, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(T)
