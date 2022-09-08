clear all;
clc;
%% Spielerei

r = rand();
n = 500;
m = 200;
X_train = zeros(n, 2);
Y_train = zeros(n, 1);
X_test = zeros(m, 2);
Y_test = zeros(m, 2);

for i = 1:n
    r = rand();
    if r < 0.5
        X_train(i,1) = 2 + r;
        X_train(i,2) = 1 + r;
        Y_train(i) = 0;
    else
        X_train(i,1) = 5 + r;
        X_train(i,2) = 6 + r;
        Y_train(i) = 1;
    end
end
for i = 1:m
    r = rand();
    if r < 0.5
        X_test(i,1) = 2 + r;
        X_test(i,2) = 1 + r;
        Y_test(i) = 0;
    else
        X_test(i,1) = 5 + r;
        X_test(i,2) = 6 + r;
        Y_test(i) = 1;
    end
end
writematrix(X_train, 'xtrain.csv');
writematrix(Y_train, 'ytrain.csv');
%%
Xtrain = datastore('xtrain.csv');
Ytrain = datastore('ytrain.csv');
%Xtest = datastore(X_test);
%Ytest = datastore(Y_test);



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
