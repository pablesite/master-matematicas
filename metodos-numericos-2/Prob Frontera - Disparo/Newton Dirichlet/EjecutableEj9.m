%Ejecutable: Ejemplo 9
digits(8)
[xn, yn, t, iter] = DisparoNewton('ej9', 1, 3, 17 ,43/3, 19, 1e-05, 50)
%%
yex = @(x)x.^2+16./x;
exacta = yex(xn);
Error = abs(yn(:,1)-exacta);
format long
[xn(1:2:end), yn(1:2:end,1), exacta(1:2:end), Error(1:2:end)]

%%
vpa(Error,3)
%%
hold on
plot(xn,exacta,'r')
plot(xs,ys(:,1),'*b')
plot(xn,yn(:,1),'go')
