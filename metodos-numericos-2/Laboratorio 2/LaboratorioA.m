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
% Condición inicial (en función de x)
ci = @(x)0;
% Condiciones de contorno (en función de t)
%h1 = @(t)0;
h2 = @(t)sin(t);
% Número de pasos de la x.
nx = (L-0)/0.1; % nx = (L-0)/h;
% Número de pasos de la t.

%% a) Cálculo de la función (Estable)
nt = (Tmax-0)/0.0005; % nt = (Tmax-0)/k
[u, x, t] = ExplicitoMixtas(alpha, ci, h2, L, nx, Tmax, nt)

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de contorno multidimensional parabólico, explícito, mixtas. Estable');
hold on
grid on
plot(x, u(:, end), '*--b')
xlabel('x');
ylabel('u');
legend('u(x) - aproximada');

% Tabla de datos
format long e
[x', u(:,(end-1)/4), u(:,(end-1)/2), u(:,3*(end-1)/4), u(:,end)]