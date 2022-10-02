function [R,T] = polvorgabe(P,nut)
%POLVORGABE Summary of this function goes here
%   Detailed explanation goes here

[mu, nu] = tfdata(P,'v');
n = length(nu) - 1;
rho = n - 1;
res = resultante(nu,mu,rho);
[f] = tfdata(nut, 'v');
f = flipud(transpose(f));

x = res\f;
a = x(1:rho+1);
b = x(rho+2:2*rho+2);
a = flip(transpose(a));
b = flip(transpose(b));

R = tf(b, a);
T = R*P/(1+R*P);
end

