function [nodos ,solaprox ,t,iter,incre ] = DisparoSecanteP1(funcion ,a,b,alfa ,beta ,n,tol , maxiter )
h=(b-a)/(n);  x=a:h:b;  x=x(:);
t0=1;

[x,Y]= ode45 (funcion ,x ,[ alfa , t0]');
yb0=Y(end ,1); %u(b,t0)
ypb0=Y(end,2); %u'(b,t0) <----

t1 =2;
[x,Y]= ode45 (funcion ,x ,[ alfa ,t1]');
yb1=Y(end ,1); %u(b,t1)
ypb1=Y(end,2); %u'(b,t1) <----  

iter =0; 
incre =abs(yb1-ypb1-beta); %criterio que debe satisfacer t <-----

while incre >tol && iter < maxiter
t=t1 -((t1 -t0)*(yb1-ypb1-beta))./(yb1-ypb1-yb0+ypb0); %expresion mñetodo secante <---- (yb1-ypb1-beta-yb0+ypb0+beta))

[x,Y]= ode45 (funcion ,x ,[ alfa ,t]');
t0=t1;  
yb0=yb1; 
ypb0=ypb1; %<----

t1=t; 
yb1=Y(end ,1); %u(b,t2) (u(b,t))
ypb1=Y(end,2); %u'(b,t2) <----

incre =abs(yb1-ypb1-beta); %<-----
iter= iter +1;
end
if incre <= tol
nodos =x;
solaprox =Y;
else
disp('se necesitan mas iteraciones ')
end
end
