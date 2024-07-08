% Problema de Frontera - Disparo No Lineal -> Newton (Condiciones
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

% Número de pasos de la x.
n = 19; % Solución [0:n+1] => n + 2 nodos = n + 1 intervalos
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 1e-05;
maxiter = 50;

%% Cálculo de la función
[xn, yn, t, iter] = T2bDisparoNewton('T2bFunEjerc1', a, b, alfa, beta, h, tol, maxiter);

% %% Cálculo de la solución exacta (si la hay)
% yex = @(x)x.^2+16./x;
% exacta = yex(xn);
% Error = abs(yn(:,1) - exacta);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Newton, Dirichlet');
hold on
grid on
% plot(xn, exacta, 'r')
plot(xn, yn(:, 1), 'k')
plot(xn, yn(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - aproximada');
% legend('y(x) - exacta', 'y(x) - aproximada');

% Tabla de datos
format long
[xn(1:2:end), yn(1:2:end,1)]
% [xn(1:2:end), yn(1:2:end,1), exacta(1:2:end), Error(1:2:end)]

% % Error 
% vpa(Error,3)