function Res=resultante(nu,mu,rho)
%
% Res=resultante(nu,mu,rho)
%
% Berechnung der Resultante aus den Polynomen nu und mu.
% Hierbei muss gelten Grad(mu)<=Grad(nu)
%
% (c) M.Horn IRT TUG
%
Res=[];
nu=nu(:);
mu=mu(:);
rho=abs(rho); rho=floor(rho);
% Gradbedingung
if (length(mu)-length(nu))>0
    disp('resultante: Gradbedingung verletzt')
    return;
end
nu=flipud(nu); n=length(nu)-1;
mu=flipud(mu); m=length(mu)-1;

col=zeros(n+rho+1,1); col(1:n+1)=nu;
row=zeros(1,rho+1); row(1)=col(1);
R1=toeplitz(col,row);

col=zeros(n+rho+1,1); col(1:m+1)=mu;
row=zeros(1,rho+1); row(1)=col(1);
R2=toeplitz(col,row);

Res=[R1 R2];




