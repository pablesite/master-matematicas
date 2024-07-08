% Problema de Frontera - Disparo No Lineal -> Secante (Condiciones
% Naturales)
% ru'' + u' = -4r, r en [1, 3]
% u(1) = ln(1/3) - 1
% u(3) - u'(3) = 0.5*(ln(3) - 7) 

clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 1;
b = 3;
% Condiciones iniciales
alfa = log(1/3) - 1;
beta = 0.5*(log(3) - 7);

% Número de pasos de la x
n = 9; % Solución [0:n+1] => n + 2
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 10e-07;
maxiter = 100;

%% Cálculo de la función
[xi, yi, t, iter, incre] = T2cDisparoSecanteNat('T2cFunEjerc2', a, b, alfa, beta, h, tol, maxiter);

%% Cálculo de la solución exacta (si la hay)
yex = @(x)log(x./3) + 1/2.*log(x) - x.^2;
exacta = yex(xi);
Error = abs(yi(:,1) - exacta);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Secante, Naturales');
hold on
grid on
plot(xi, exacta, 'r')
plot(xi, yi(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - exacta', 'y(x) - aproximada');

% Tabla de datos
format long
[xi, yi(:,1), exacta, Error]

% Error
vpa(Error(1:2:end), 3)

