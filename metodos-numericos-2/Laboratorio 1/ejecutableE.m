clear all; close all;

digits(6)
format long
a = 1; b = 2; alfa = 1/2; beta = 17/2; n = 10; tol = 10e-08; maxiter = 10;
[xi_1, yi_1, t_1, iter_1, incre_1] = DisparoSecanteNoDir('sistema', a, b, alfa, beta, n, tol, maxiter);
[xi_2, yi_2, t_2, iter_2, incre_2] = DisparoNewtonNoDir('sistema1', a, b, alfa, beta, n, tol, maxiter);
[xi_1, yi_1(:,1), yi_2(:,1), yi_1(:,1)-yi_2(:,1)]
yi_1(:,1)-yi_2(:,1)

plot(xi_1, yi_1(:,1),'g'),
hold on
plot(xi_1, yi_2(:,1),'r')
plot(xi_1, yi_1(:,1), 'go')
plot(xi_1, yi_2(:,1), 'r*')

% Agrega un título al gráfico
title('Problema de contorno con métodos de Secante y Newton');

% Etiquetas de los ejes
xlabel('x');
ylabel('y');

% Agrega una leyenda
legend('y(x) con Secante', 'y(x) con Newton');

% Habilita la cuadrícula
grid on;