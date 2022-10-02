function [R,T] = polvorgabe_zusatz(P,nut)
%POLVORGABE Summary of this function goes here
%   Detailed explanation goes here

[mu, nu] = tfdata(P,'v');
n = length(nu) - 1;
rho = n - 1 + 1;
res = resultante(nu,mu,rho);
% Zusatzzeile:
row = zeros(1, 2*rho+2);
row(1,1) = 1;
res(end+1, 1:end) = row(1,1:end);
[f] = tfdata(nut, 'v');
f = flipud(transpose(f));
f(end+1)=0;

x = res\f;
a = x(1:rho+1);
b = x(rho+2:2*rho+2);
a = flip(transpose(a));
b = flip(transpose(b));

R = tf(b, a);
T = R*P/(1+R*P);
end

