f=@(x,y,z)x.*y.*z-x.*cos(x).*y-sin(x);
fy=@(x,y,z)x.*z-x.*cos(x);
fz=@(x,y,z)x.*y;
a=0;
b=pi;
alfa=1;
beta=2;
N=9;
maxiter=50;
tol=1e-5;
[X,Y,iter ,incr ]= Difnolin3 (f,fy ,fz ,a,b,alfa , beta ,N,maxiter ,tol)
%%
ex=@(x) sin(x);
exacta=sin(X);
Error=abs(exacta-Y);
%%
hold on
plot(X,Y,'*-r')
plot(X,exacta,'b')
%%
X=vpa(X,6); Y=vpa(Y,6); Error=vpa(Error,6); exacta=vpa(exacta,6);
