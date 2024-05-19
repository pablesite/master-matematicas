f=@(x,y,z)2 + 4*y - z.^2 ;
fy=@(x,y,z)4+0*y;
fz=@(x,y,z)-2.*z;

a=1;
b=2;

alfa=0;
beta=-3;

N=100;

maxiter=50;
tol=1e-6;

[X,Y,iter ,incr ]= Difnolin3_Marcos (f,fy ,fz ,a,b,alfa , beta ,N,maxiter ,tol);
%%



%%
hold on
plot(X,Y,'-k')

% %%
% X=vpa(X,6); Y=vpa(Y,6); Error=vpa(Error,6); 
