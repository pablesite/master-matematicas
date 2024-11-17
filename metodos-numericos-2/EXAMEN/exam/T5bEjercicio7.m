% Ejemplo
% u_t(x, t) - u_xx(x, t) = 0, 
% u(x, 0) = sin(pi*x/2), x € [0, 2]
% u(0, t) + u_x(0, t) = pi/2*exp(-(pi/2)^2*t) 
% u(2, t) - 2*u_x(2, t) = pi*exp(-(pi/2)^2*t) , t >= 0.
% ¿Solución aprox para Tmax = 1 y h = 0.1, k = 0.0005?
clear all; close all;

%% Inicialización de parámetros
% Parámetros
alpha = 1; 

L = 2;
Tmax = 2;
% Condición inicial (en función de x)
ci = @(x)sin(pi*x/2);

% Condiciones de contorno (en función de t)
cc1 = @(t)pi/2*exp(-(pi/2)^2*t);
cc2 = @(t)pi*exp(-(pi/2)^2*t);

% Número de pasos de la x.
nx = (L - 0)/0.01; % nx = (L-0)/h;
% Número de pasos de la t.

%% a) Cálculo de la función (Estable)
nt = (Tmax - 0)/0.00005; % nt = (Tmax-0)/k
[u, x, t] = T5bExplicitoNat(alpha, cc1, cc2, ci, L, nx, Tmax, nt);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de contorno multidimensional parabólico, explícito, naturales. Estable');
hold on
grid on
plot(x, u(:, end), '*--b')
xlabel('x');
ylabel('u');
legend('u(x) - aproximada');

% Tabla de datos
format long e
[x', u(:,(end-1)/4), u(:,(end-1)/2), u(:,3*(end-1)/4), u(:,end)]

[x(1:10:end)', u(1:10:end,end)]