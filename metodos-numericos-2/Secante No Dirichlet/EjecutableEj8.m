%Ejecutable: Ejemplo 7
digits(6)
[xi ,yi ,t,iter,incre] = DisparoSecanteP1('ej8',1,3,log(1/3)-1,0.5*(log(3)-7),20,10e-07,100)

%%
yex=@(x)log(x./3)+1/2.*log(x)-x.^2;
exacta=yex(xi);

Error=abs(yi(:,1)-exacta);
format long
[xi,yi(:,1),exacta,Error]
vpa(Error(1:2:end),3)