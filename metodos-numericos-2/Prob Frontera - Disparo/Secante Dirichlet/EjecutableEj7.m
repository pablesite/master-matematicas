%Ejecutable: Ejemplo 7
digits(6)
[xs ,ys ,t,iter ] = DisparoSecante ('ej7',1,3,17,43/3,19,1e-05,50)
%%
yex=@(x)x.^2+16./x;

exacta=yex(xs);
Error=abs(ys(:,1)-exacta);
format long
[xs,ys(:,1),exacta,Error]
%%
vpa(Error,2)
%%
hold on
plot(xs,exacta,'r')
plot(xs,ys(:,1),'*b')