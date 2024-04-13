%Ejecutable: Ejemplo 6
digits(6)
a = 1; b = 2; n = 10; alpha = 1; beta = 2;

[xi,yi,Y1,Y2] = DisparoLineal('pvi1','pvi2',a ,b ,n ,alpha ,beta)

[xi,yi,Y1(:,1),Y2(:,1)]



%% Solución exacta
c1 = 1/70*(69+4*cos(log(2))+12*sin(log(2)));
c2 = 4/35-2/35*cos(log(2))-6/35*sin(log(2));
yex = @(x) c1.*x+(c2./(x.^2))-3/10.*sin(log(x))-1/10.*cos(log(x));
exacta = yex(xi);

%% Cálculo del error
Error = abs(yi-exacta);
format short e
[xi,yi,exacta,Error]

vpa(Error)

%%
hold on
plot(xi,yi,'*-r')
plot(xi,Y1(:,1),'k')
plot(xi,Y2(:,1),'k')
plot(xi,exacta,'b')