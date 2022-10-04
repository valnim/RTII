function [R,T] = polvorgabe_HStoerung(P, nut, omega)

s = tf('s');

[mu, nu] = tfdata(P,'v');
n =  length(pole(P));
rho = length(zero(nut)) - n;

while (rho - 1 < n )
    disp("Warning")
    warning;
    nut = nut * (s+4);
    rho = rho + 1;
end

res = resultante(nu,mu,rho);

[f] = tfdata(nut, 'v');
f = flipud(transpose(f));

row = zeros(1, 2*rho+2);
row(1,1) = 1;
row(1,3) = -omega*omega;
res(end+1, 1:end) = row(1,1:end);
f(end+1)=0;

row = zeros(1, 2*rho+2);
row(1,2) = 1;
row(1,4) = -omega*omega;
res(end+1, 1:end) = row(1,1:end);
f(end+1)=0;

x = res\f;
a = x(1:rho+1);
b = x(rho+2:2*rho+2);
a = flip(transpose(a));
b = flip(transpose(b));

R = tf(b, a);
T = R*P/(1+R*P);

end
