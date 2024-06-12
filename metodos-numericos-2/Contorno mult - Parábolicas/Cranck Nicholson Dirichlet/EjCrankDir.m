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
a = 0;
b = 1;
h = 0.1;
k = 0.01;
Tmax = 0.5;
% Condición inicial (en función de x)
ci=@(x)sin(pi*x);
% Condiciones de contorno (en función de t)
cc1=@(t)0*ones(length(t),1);
cc2=@(t)0*ones(length(t),1);
% Número de pasos de la x.
nx = (b-a)/h; % nx = (L-0)/h;
% Número de pasos de la t.
nt = Tmax/k;

%% Cálculo de la función
[xc, uc] = CalorExpCNDir(cc2, cc1, ci, a, b, nx, Tmax, nt, alpha);

%% Solución Exacta
exacta = @(x,t)exp(-pi^2.*t).*sin(pi.*x);
ex = exacta(xc, 0.5);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de contorno multidimensional parabólico, explícito, dirichlet. Estable');
hold on
grid on
plot(xc, ex, 'r')
plot(xc, uc(:, end), '*--b')
xlabel('x');
ylabel('u');
legend('u(x) - exacta', 'u(x) - aproximada');

% Tabla de datos
format short e
[xc', uc(:, end), ex', abs((exacta(xc, 0.5))'- uc(:, end))]