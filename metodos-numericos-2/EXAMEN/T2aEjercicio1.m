% Problema de Frontera - Disparo No Lineal -> Secante (Condiciones
% Dirichlet)
% y'' = -y'*y + 2*x*y + 2, x en [1, 2]
% y(1) = 3/2
% y(2) = 9/2 

clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 1;
b = 2;
% Condición inicial
alfa = 3/2;
beta = 9/2;
% Valor para t0
t0 = 0;

% Número de pasos de la x.
n = 19; % Solución [0:n+1] => n + 2
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 1e-05;
maxiter = 50;

%% Cálculo de la función
[xs, ys, t, iter] = T2aDisparoSecante ('T2aFunEjerc1', a, b, alfa, beta, t0, h, tol, maxiter);

% %% Cálculo de la solución exacta (si la hay)
% yex = @(x)x.^2+16./x;
% exacta = yex(xs);
% Error = abs(ys(:,1) - exacta);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Secante, Dirichlet');
hold on
grid on
% plot(xs, exacta, 'r')
plot(xs, ys(:, 1), 'k')
plot(xs, ys(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - aproximada');
%legend('y(x) - exacta', 'y(x) - aproximada');

% Tabla de datos
format long
%[xs, ys(:,1), exacta, Error]
[xs, ys(:,1)]

% % Error 
% vpa(Error,3)