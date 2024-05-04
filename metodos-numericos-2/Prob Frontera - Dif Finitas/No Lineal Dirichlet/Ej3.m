f=@(x,y,z)1/8*(32+2*x.^3-y.*z);
fy=@(x,y,z)-1/8*z;
fz=@(x,y,z)-1/8*y;
a=1;
b=3;
alfa=17;
beta=43/3;
N=19;
maxiter=50;
tol=1e-5;
[X,Y,iter ,incr ]= Difnolin (f,fy ,fz ,a,b,alfa , beta ,N,maxiter ,tol)
%%
ex=@(x)x.^2+16./x;
exacta=ex(X);
Error=abs(exacta-Y);
%%
hold on
plot(X,Y,'*-r')
plot(X,exacta,'b')