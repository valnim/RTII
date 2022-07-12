%% Regelungstechnik II-Übung
clear;
close all;
clc;
s = tf('s');
%% BSP Tafelübung
Ps = zpk([-2.6], [-5.982, -8, -0.1729], 10.069)

figure(1)
clf;
bode(Ps);
hold on;
grid on;

%% Proportionalregler
%wc*tr = 1.5
tr = 0.75;
wc = 1.5/tr;


[magPs, phasePs] = bode(Ps, wc);
K = 1 / magPs;
Ls = K * Ps;
[magLs, phaseLs] = bode(Ls, wc);

Phir = 180 + phaseLs;

Ts = Ls/(1+Ls);
figure(2)
clf
step(Ts, 10);
hold on;
grid on;

Ss = 1/(1+Ls);
figure(3)
clf
step(Ss, 10);
hold on;
grid on;

%% b) PI Regler
clearvars -except s Ps
tr = 0.75;
wc = 1.5/tr;
ue = 15;
Phir = 70 - ue;

[magPs_s, phasePs_s] = bode(Ps/s, wc);
argR1 = Phir - 180 - phasePs_s;
Tn = tand(argR1)/2;
R1 = (1+s/(1/Tn));

L1s = Ps/s*R1;
[magL1s, phaseL1s] = bode(L1s, wc);

%% Betragskorrektur mit Vr = Kp/Tn

Vr = 1/magL1s;
Kp = Vr*Tn;

Rs = Kp*(1+1/(s * Tn));
Ls = Rs*Ps;
figure(4);
clf;
bode(Ls);
hold on;
grid on;
[magLs, phaseLs] = bode(Ls, wc);




%% Aufgabe 1 a)Strecke
clear all;
close all;
s = tf('s');
Ps = zpk([], [-1, -10, -20], 500);

figure(1)
clf;
bode(Ps);
hold on;
grid on;

%wc*tr = 1.5
tr = 1;
wc = 1.5/tr;
ue = 10;
Phir = 70 - ue;

%% b) 
L1s = 1/s * Ps;
figure(2)
clf;
bode(L1s);
hold on;
grid on;

[magL1_s, phaseL1_s] = bode(L1s, wc);
argR1 = Phir - 180 - phaseL1_s;
% tand(argR1) = wc/wz 
wz = wc/tand(argR1);

%% c)
Tn = 1/wz;

L2s = 1/s * Ps * (1 + s/wz);
figure(3)
clf;
bode(L2s);
hold on;
grid on;

[magL2s, phaseL2s] = bode(L2s, wc);
Vr = 1/magL2s;
K = Vr;

%% d)

Rs = K*(1+(s / wz)) / s;
Ls = Rs*Ps;

figure(4)
clf;
bode(Ls);
hold on;
grid on;

[magLs_s, phaseLs_s] = bode(Ls, wc);
Phir_s = 180 + phaseLs_s;

figure(5)
clf;
margin(Ls);
hold on;
grid on;

%% e)
Ts = Ls/(1+Ls);

figure(6)
clf
step(Ts, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(Ts)

%% f)
clear all;
close all;
s = tf('s');
Ps = zpk([], [-1, -10, -20], 500);

figure(1)
clf;
bode(Ps);
hold on;
grid on;

%wc*tr = 1.5
tr = 0.3;
wc = 1.5/tr;
ue = 10;
Phir = 70 - ue;

L1s = 1/s * Ps;
figure(2)
clf;
bode(L1s);
hold on;
grid on;

[magL1_s, phaseL1_s] = bode(L1s, wc);
argR1 = Phir - 180 - phaseL1_s;
% tand(argR1) = wc/wz 
wz = wc/tand(argR1);

Tn = 1/wz;

L2s = 1/s * Ps * (1 + s/wz);
figure(3)
clf;
bode(L2s);
hold on;
grid on;

[magL2s, phaseL2s] = bode(L2s, wc);
Vr = 1/magL2s;
K = Vr;

Rs = K*(1+(s / wz)) / s;
Ls = Rs*Ps;

figure(4)
clf;
bode(Ls);
hold on;
grid on;

[magLs_s, phaseLs_s] = bode(Ls, wc);
Phir_s = 180 + phaseLs_s;

figure(5)
clf;
margin(Ls);
hold on;
grid on;

Ts = Ls/(1+Ls);

figure(6)
clf
step(Ts, 10);
hold on;
step(10, 10);
grid on;
legend('y(t)', 'u(t)')

stepinfo(Ts)


