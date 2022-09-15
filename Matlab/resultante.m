function R = resultante(nu,mu,rho)

% Student - TO DO
% Hier kommt die Implementierung für die 
% Eingangsparameter nu, mu, rho !!!

% -> toeplitz 
%R = [ 4 , 0 , 1 , 0 ;
%      4 , 4 , 1 , 1 ;
%      1 , 4 , 0 , 1 ;
%      0 , 1 , 0 , 0 ];

zeros1= zeros(rho+1);
n = length(nu) - 1;
dim1 = n + rho + 1;
dim2 = 2*rho + 2;
c1 = [flip(mu) zeros(1,dim1-length(mu))];
c2 = [flip(nu) zeros(1,dim1-length(nu))];

a = toeplitz(c1, zeros1);
b = toeplitz(c2, zeros1);
R= a(1:end, 1:dim2);
R(1:end, dim2/2 + 1 : end)= b(1:end, 1:dim2/2);
  
%Lösung R
end




