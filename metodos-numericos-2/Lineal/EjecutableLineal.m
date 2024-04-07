%Ejecutable: Ejemplo 6
digits(6)

[xi,yi,Y1,Y2] = DisparoLineal('pvi1','pvi2',1 ,2 ,10 ,1 ,2)
[xi,yi,Y1(:,1),Y2(:,1)]



%%
c1=1/70*(69+4*cos(log(2))+12*sin(log(2)));
c2=4/35-2/35*cos(log(2))-6/35*sin(log(2));
yex=@(x) c1.*x+(c2./(x.^2))-3/10.*sin(log(x))-1/10.*cos(log(x));
%%
exacta=yex(xi);

Error=abs(yi-exacta);
format short e
[xi,yi,exacta,Error]

vpa(Error)

%%
hold on
plot(xi,yi,'*-r')
plot(xi,exacta,'b')