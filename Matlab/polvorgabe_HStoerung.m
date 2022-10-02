function [R,T] = polvorgabe_HStoerung(P, nut, omega)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

s = tf('s');

[mu, nu] = tfdata(P,'v');
n =  length(pole(P));
rho = length(zero(nut)) - n;

while (rho + 1 < n )
    disp("Warning")
    warning;
    nut = nut * (s+4);
    rho = rho + 1;
end

res = resultante(nu,mu,rho);

% Zusatzzeile:
[f] = tfdata(nut, 'v');
f = flipud(transpose(f));
if rho - n < 1
    for i = (1: (rho-n+1))
        row = zeros(1, 2*rho+2);
        row(1,1) = 1;
        res(end+1, 1:end) = row(1,1:end);
        f(end+1)=0;
    end
end

x = res\f;
a = x(1:rho+1);
b = x(rho+2:2*rho+2);
a = flip(transpose(a));
b = flip(transpose(b));

R = tf(b, a);
T = R*P/(1+R*P);

[magT, ~] = bode(T, omega);

end
