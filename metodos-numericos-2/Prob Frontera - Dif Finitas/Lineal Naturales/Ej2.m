%%% Ejemplo 1 %%%
clear all; close all;

%% Se establecen los parámetros inciales
alfa = 1-1/(2*log(3));
beta = 0.5-1/(6*log(3));
a = 1; b = 3; N = 9; % N + 1 intervalos -> N + 2 nodos

%% Se ejecuta el método de Diferencias Finitas para un problema líneal con condiciones Dirichlet
[ri,yi] = DiFiLinealEj2(a, b, alfa, beta, N);

%% Se calcula la solución exacta
ex=@(r)1./(log(1/3)).*(log(r/3)-0.5.*log(r));

%% Se evalua la solución exacta en xi y se calcula el Error
exacta = ex(ri);
digits(8)
Error = vpa(abs(exacta-yi),6);

%% Se imprimen por consola los resultados en precisión aritmética
[vpa(ri),vpa(yi),vpa(exacta),vpa(Error)]

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera líneal - Dirichlet")
xlabel('r');
ylabel('u(r)');
plot(ri,yi,'*-r')
plot(ri,exacta,'b')
legend('u(r) aproximada', 'u(r) exacta');
