clear all;
clc;

%% Matrizenrechnung

A1 = [1,2;3,4];
A2 = [1,1,;2,2];
A3 = [1,2,3;4,5,6];

b1 = [1;2];
b2 = [3,4];
    
%% Transponieren

A1T = A1.';

%% Rang
rank(A1)
size(A1)

%% Inverse

inv(A1)

A1^-1


%% Matrix Multiplikation

A1 * A2
A2*A3

A1.*A2


%% Vektor Vektor Multiplik

b1.' * b2
b2 * b1.'

%% Eigenwerte
[V,D] = eig(A1)
V1 = V(:,1);
V2 = V(:,2);

%% Übertragungsfunktionen im Bildbereich

s = tf('s');

Num = s+1;
Den = s+1;
P=Num/Den;

%% Zero Pole gain

z = [1,1,1]
p = [3,4,5]
k = 10;

R2 = zpk(z,p,k)
s = tf('s');

n = 7*s^2 + 49*s + 70;
d = s^3 + 15 * s^2 + 71*s + 105;

P = n/d;
[z,p,k] = zpkdata(P,'v');

[num, den] = tfdata(P, 'v');

%% Bode diagramme

bode(P)

[mag, ~, ~] = bode(P, 10)

[~, phi, ~] = bode(P, 10)

%% funktionen

add(2, 3)

%%

R = 100*1e3;
C = 100*1e-6;
Uin=2;

C0=0;
%%
uc = out.uc;

figure(1);
plot(uc.time, uc.data)
grid on
hold on
yline(Uin)
title('einschaltvorgang kondensator')
ylabel('Soannung in V')
ylim([0, 2.2])
legend('uc')

hold off
