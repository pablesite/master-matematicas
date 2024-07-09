% Ejemplo
% u_t(x, t) - u_xx(x, t) = 0
% u(0, t) = u(1, t) = 0, t > 0.
% u(x, 0) = sin(pi*x), x € [0, 1]
% Sol exacta => u(x, t) = exp(-pi^2*t)*sin(pi*x)
% ¿Solución aprox para Tmax = 0.5 y h = 0.1 - k = 0.01 - k = 0.0005?
clear all; close all;

%% Inicialización de parámetros
% Parámetros
alpha = 1;
L = 1;
Tmax = 0.5;
% Condición inicial (en función de x)
ci = @(x)sin(pi.*x);
% Condiciones de contorno (en función de t)
h1 = @(t)0;
h2 = @(t)0;
% Número de pasos de la x.
nx = (L-0)/0.1; % nx = (L-0)/h;
% Número de pasos de la t.

%% a) Cálculo de la función (Estable)
nt = (Tmax-0)/0.0005; % nt = (Tmax-0)/k
[ua, xa, ta] = CalorExplDir(alpha, ci, h1, h2, L, nx, Tmax, nt);

%% b) Cálculo de la función (Inestable)
nt = (0.5-0)/0.01; % nt = (Tmax-0)/k
[ub, xb, tb] = CalorExplDir(alpha, ci, h1, h2, L, nx, Tmax, nt);

%% Solución Exacta
exacta = @(x,t)exp(-pi^2.*t).*sin(pi.*x);
ex = exacta(xa, 0.5)

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de contorno multidimensional parabólico, explícito, dirichlet. Estable');
hold on
grid on
plot(xa, ex, 'r')
plot(xa, ua(:, end), '*--b')
xlabel('x');
ylabel('u');
legend('u(x) - exacta', 'u(x) - aproximada');

% Solución aproximada inestable
figure(2)
title('Problema de contorno multidimensional parabólico, explícito, dirichlet. Inestable');
hold on
grid on
plot(xa, ex,'r')
plot(xb, ub(:, end),'*--g')
xlabel('x');
ylabel('u');
legend('u(x) - exacta', 'u(x) - aproximada');

% Tabla de datos
format long e
[xa', ua(:,end), abs((exacta(xa, 0.5))'- ua(:, end)), ub(:, end), abs((exacta(xb, 0.5))'- ub(:,end))]