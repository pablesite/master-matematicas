%%% Ejemplo 1 %%%
clear all; close all;

%% Se definen las funciones p(x), q(x) y r(x)
p = @(x)-2./x;
q = @(x)2./(x.^2);
r = @(x)(sin(log(x)))./(x.^2);

%% Se establecen los parámetros inciales
a = 1; b = 2; alfa = 1; beta = 2; N = 9; % N + 1 intervalos -> N + 2 nodos.

%% Se ejecuta el método de Diferencias Finitas para un problema líneal con condiciones Dirichlet
[xi,yi] = DiFiLinealEj1 (p,q,r,a,b,alfa ,beta ,N);

%% Se calcula la solución exacta
c1 = 1/70*(69+4*cos(log(2))+12*sin(log(2)));
c2 = 4/35-2/35*cos(log(2))-6/35*sin(log(2));
ex = @(x)c1.*x+c2./(x.^2)-3/10.*sin(log(x))-1/10.*cos(log(x));

%% Se evalua la solución exacta en xi y se calcula el Error
exacta = ex(xi);
digits(8)
Error = vpa(abs(exacta-yi),6);

%% Se imprimen por consola los resultados en precisión aritmética
[vpa(xi),vpa(yi),vpa(exacta),vpa(Error)]

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera líneal - Dirichlet")
xlabel('x');
ylabel('y(x)');
plot(xi,yi,'*-r')
plot(xi,exacta,'b')
legend('y(x) aproximada', 'y(x) exacta');

