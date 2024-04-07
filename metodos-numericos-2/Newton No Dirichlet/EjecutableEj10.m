%Ejecutable: Ejemplo 9
digits(8)
[xi ,yi ,t,iter, incre ] = DisparoNewtonP1 ('ej10',1,3,1-1/(2*log(3)),0.5-1/(6*log(3)),19,1e-07,100)
%%
yex=@(x)1/(log(1/3)).*(log(x./3)-0.5.*log(x));
exacta=yex(xi);
Error=abs(yi(:,1)-exacta);
format long
[xi(1:2:end),yi(1:2:end,1),exacta(1:2:end),Error(1:2:end)]
vpa(Error(1:2:end),2)
%%
hold on
plot(yi(:,1),xi,'or')
plot(exacta,xi,'g')