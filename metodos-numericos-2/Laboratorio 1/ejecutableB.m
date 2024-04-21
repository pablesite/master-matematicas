clear all; close all;

digits(6)
format long
a = 1; b = 2; alfa = 1/2; beta = 17/2; n = 10; tol = 10e-08; maxiter = 10;
[xi, yi, t, iter, incre] = DisparoSecanteNoDir('sistema', a, b, alfa, beta, n, tol, maxiter);
[xi, yi(:,1), yi(:,2)]

plot(xi, yi(:,1)),
hold on
plot(xi, yi(:,1), 'go')

% Agrega un título al gráfico
title('Problema de contorno con método de Secante');

% Etiquetas de los ejes
xlabel('x');
ylabel('y');

% Agrega una leyenda
legend('y(x)');

% Habilita la cuadrícula
grid on;