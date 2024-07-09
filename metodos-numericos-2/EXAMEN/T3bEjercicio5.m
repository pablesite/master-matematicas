clear all; close all;

% Ejemplo 4: Para resolver el problema de contorno
% y" - x*y*y' + x*cos(x)*y + sin(x) = 0 -> 0<=x<=pi
% y(0) + y'(0) = 1, y(pi) - 2*y'(pi) = 2,

%% Se define la función y'' y sus derivadas parciales en y' y en xx
f    = @(x, y, y_p)  x.*y.*y_p-x.*cos(x).*y-sin(x);   % Ecuación diferencial de segundo orden
fy   = @(x, y, y_p)  x.*y_p-x.*cos(x);                % Derivada parcial de f respecto a y
fy_p = @(x, y, y_p)  x.*y;                            % Derivada parcial de f respecto a y' = y_p;

%% Se establecen los parámetros iniciales
a = 0; b = pi; alfa = 1; beta = 2; N = 9;
maxiter = 50; tol = 1e-5; % Condiciones de parada

%% Se ejecuta el método de Diferencias Finitas para un problema NO líneal con condiciones Dirichlet
[X, Y, iter, incr] = T3bDifnolinNat(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);

%% Se calcula la solución exacta
ex = @(x) sin(x);

%% Se evalua la solución exacta en X y se calcula el Error
exacta = ex(X);
Error = abs(exacta-Y);

%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
[vpa(X), vpa(Y), vpa(exacta), vpa(Error)]

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Naturales")
xlabel('x');
ylabel('y(x)');
plot(X,Y,'*-r')
plot(X,exacta,'b')
legend('y(x) aproximada', 'y(x) exacta');
