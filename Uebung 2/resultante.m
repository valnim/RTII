function Res = resultante(nu,mu,rho)
zeros1= zeros(rho+1);
dim1 = length(nu) - 1 + rho + 1;
c1 = [flip(nu) zeros(1,dim1-length(nu))];
c2 = [flip(mu) zeros(1,dim1-length(mu))];

a = toeplitz(c1, zeros1);
b = toeplitz(c2, zeros1);
Res = a;
Res(1:end, dim1/2 + 1 : end)= b(1:end, 1:dim1/2);


end

