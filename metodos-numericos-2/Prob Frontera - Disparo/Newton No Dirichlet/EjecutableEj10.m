% Problema de Frontera - Disparo No Lineal -> Newton (Condiciones
% Naturales)
% ru'' + u' = 0, x en [1, 3]
% u'' + u' = 0, x en [1, 3]
% u(1) + u'(1) = 1 - 1/(2*ln(3))
% u(3) + u'(3) = 0.5 - 1/(6*ln(3)) 
clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 1;
b = 3;
% Condición inicial
alfa = 1 - 1/(2*log(3));
beta = 0.5 - 1/(6*log(3));

% Número de pasos de la x.
n = 19; % Solución [0:n+1] => n + 2 nodos = n + 1 intervalos
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 1e-07;
maxiter = 100;

%% Cálculo de la función
[xi, yi, t, iter, incre] = DisparoNewtonP1('ej10', a, b, alfa, beta, h, tol, maxiter);

%% Cálculo de la solución exacta (si la hay)
yex = @(x)1/(log(1/3)).*(log(x./3)-0.5.*log(x));
exacta = yex(xi);
Error = abs(yi(:,1) - exacta);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Newton, Dirichlet');
hold on
grid on
plot(xi, exacta, 'r')
plot(xi, yi(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - exacta', 'y(x) - aproximada');

% Tabla de datos
format long
[xi(1:2:end), yi(1:2:end,1), exacta(1:2:end), Error(1:2:end)]

% Error 
vpa(Error(1:2:end), 2)