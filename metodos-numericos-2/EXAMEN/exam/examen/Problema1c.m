clear all; close all;
% y'' = -y'*y, x en [2, 3]
% y(2) + y'(2) = 1/2
% -y(3) + y'(3) = -8/9 

%% Se define la función y'' y sus derivadas parciales en y' y en xx
f    = @(x, y, y_p)  - y.*y_p;   % Ecuación diferencial de segundo orden
fy   = @(x, y, y_p)  - y_p;      % Derivada parcial de f respecto a y
fy_p = @(x, y, y_p)  - y;        % Derivada parcial de f respecto a y' = y_p;

%% Se establecen los parámetros iniciales
a = 2; b = 3; alfa = 1/2; beta = -8/9; N = 19;
maxiter = 50; tol = 10e-5; % Condiciones de parada

%% Se ejecuta el método de Diferencias Finitas para un problema NO líneal con condiciones Dirichlet
[X, Y, iter, incr] = DifnolinNat(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);


%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
[vpa(X), vpa(Y)]
iter

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Naturales")
xlabel('x');
ylabel('y(x)');
plot(X,Y,'*-r')
legend('y(x) aproximada');
