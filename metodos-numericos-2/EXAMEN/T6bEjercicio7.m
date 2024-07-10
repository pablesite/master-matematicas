% Ejemplo
% u_t(x, t) = u_xx(x, t) + exp(-t)
% u(x, 0) = 1 - x, x € [0, 1]
% u_x(0, 1) = 0 
% u_x(1, t) + u(1, t) = 0, t > 0.
% ¿Solución aprox para Tmax = 1 y h = 0.1, k = 0.0005?
clear all; close all;

%% Inicialización de parámetros
% Parámetros
alpha = 1;
L = 1;
Tmax = 1;
a = 0;
b = 1;
% Condición inicial (en función de x)
ci = @(x)1-x;
% Número de pasos de la x.
%nx=10;
nx = (L-0)/0.1; % nx = (L-0)/h;
% Número de pasos de la t.
%nt=2000;
nt = (Tmax-0)/0.0005; % nt = (Tmax-0)/k

%% Cálculo de la función (Siempre Estable)
[u, x] = T6bImplicitoNat(alpha, ci, 0, 1, nx, Tmax, nt);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de contorno multidimensional parabólico, implícito, naturales. Estable');
hold on
grid on
plot(x, u(:, end), '*--b')
xlabel('x');
ylabel('u');
legend('u(x) - aproximada');

% Tabla de datos
format long e
[x', u(:,(end-1)/4), u(:,(end-1)/2), u(:,3*(end-1)/4), u(:,end)]

