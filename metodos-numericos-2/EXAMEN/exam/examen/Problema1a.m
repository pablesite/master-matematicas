% Problema de Frontera - Disparo No Lineal -> Secante (Condiciones
% Dirichlet)
% y'' = -y'*y, x en [2, 3]
% y(2) = 1
% y(3) = 2/3

clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 2;
b = 3;
% Condición inicial
alfa = 1;
beta = 2/3;
% Valor para t0
t0 = 1;

% Número de pasos de la x.
n = 19; % Solución [0:n+1] => n + 2
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 10e-05;
maxiter = 50;

%% Cálculo de la función
[xs, ys, t, iter] = DisparoSecante('FunProb1', a, b, alfa, beta, t0, h, tol, maxiter);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Secante, Dirichlet');
hold on
grid on
plot(xs, ys(:, 1), 'k')
plot(xs, ys(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - aproximada');

% Tabla de datos
format long
[xs, ys(:,1), ys(:,2)]
t
iter
