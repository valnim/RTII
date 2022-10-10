function [R,T] = polvorgabe_HStoerung(P, nut, omega)
%  Polvorgabe und Unterdrückung von harmonischen Störungen
s = tf('s');

[mu, nu] = tfdata(P,'v');
n =  length(pole(P));
rho = length(zero(nut)) - n;

while (rho - 1 < n )
    warning('ny t ist nicht konsistent! Modifiziert mit extra Nullstellen bei s=-4');
    nut = nut * (s+4);
    rho = rho + 1;
end

res = resultante(nu,mu,rho);

[f] = tfdata(nut, 'v');
f = flipud(transpose(f));

row = zeros(1, 2*rho+2);
for i = 1:rho+1
    if mod(i,2) ~= 0
        row(1,i) = (1i)^(i+3) * omega^(i);
    end
end
res(end+1, 1:end) = row(1,1:end);
f(end+1)=0;

row = zeros(1, 2*rho+2);
for i = 1:rho+1
    if mod(i,2)==0
        row(1,i) = (1i)^(i+2) * omega^(i);
    end
end
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
