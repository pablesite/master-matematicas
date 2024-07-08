% Ejecutable: Ejemplo 7
% Problema de Frontera - Disparo No Lineal -> Secante (Condiciones
% Dirichlet)
% y'' = 1/8*(32 + 2*x^3 - y*y'), x en [1, 3]
% y(1) = 17
% y(3) = 43/3 

clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 1;
b = 3;
% Condición inicial
alfa = 17;
beta = 43/3;

% Número de pasos de la x.
%nx = (L-0)/0.1; % nx = (L-0)/h;
n = 19; % Solución [0:n+1] => n + 2
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 1e-05;
maxiter = 50;

%% Cálculo de la función
[xs, ys, t, iter] = DisparoSecante ('ej7', a, b, alfa, beta, h, tol, maxiter);

%% Cálculo de la solución exacta (si la hay)
yex = @(x)x.^2+16./x;
exacta = yex(xs);
Error = abs(ys(:,1) - exacta);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Newton, Dirichlet');
hold on
grid on
plot(xs, exacta, 'r')
plot(xs, ys(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - exacta', 'y(x) - aproximada');

% Tabla de datos
format long
%[xs(1:2:end), ys(1:2:end,1), exacta(1:2:end), Error(1:2:end)]
[xs, ys(:,1), exacta, Error]

% Error 
vpa(Error,3)