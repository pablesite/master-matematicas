clear all; close all;
% y'' = -y'*y, x en [1, 2]
% y(1) + y'(1) = 0
% -y(2) + y'(2) = -3/2 

%% Se define la función y'' y sus derivadas parciales en y' y en xx
f    = @(x, y, y_p)  - y.*y_p;   % Ecuación diferencial de segundo orden
fy   = @(x, y, y_p)  - y_p;      % Derivada parcial de f respecto a y
fy_p = @(x, y, y_p)  - y;        % Derivada parcial de f respecto a y' = y_p;

%% Se establecen los parámetros iniciales
a = 1; b = 2; alfa = 0; beta = -3/2; N = 19;
maxiter = 50; tol = 10e-5; % Condiciones de parada

%% Se ejecuta el método de Diferencias Finitas para un problema NO líneal con condiciones Dirichlet
[X, Y, iter, incr] = T3bDifnolinNat(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);

% %% Se calcula la solución exacta
% ex = @(x) sin(x);

% %% Se evalua la solución exacta en X y se calcula el Error
% exacta = ex(X);
% Error = abs(exacta-Y);

%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
[vpa(X), vpa(Y)]
% [vpa(X), vpa(Y), vpa(exacta), vpa(Error)]
iter

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Naturales")
xlabel('x');
ylabel('y(x)');
plot(X,Y,'*-r')
% plot(X,exacta,'b')
legend('y(x) aproximada');
% legend('y(x) aproximada', 'y(x) exacta');