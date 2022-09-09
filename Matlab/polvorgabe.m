function [R,T] = polvorgabe(P,nut)
%POLVORGABE Summary of this function goes here
%   Detailed explanation goes here

[nu, mu] = tfdata(P,'v');
n = length(mu) - 1;
rho = n - 1;
res = resultante(nu,mu,rho);
[f] = tfdata(nut, 'v');
f = transpose(f);
x = res\f;
a = x(1:rho+1);
b = x(rho+2:2*rho+2);
a = transpose(a);
b = transpose(b);



R = tf(b, a);
T = tf(b)*tf(mu) / (tf(a)*tf(nu)+tf(b)*tf(mu));
end

