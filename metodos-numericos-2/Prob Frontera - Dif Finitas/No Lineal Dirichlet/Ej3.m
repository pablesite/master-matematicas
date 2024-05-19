clear all; close all;

% Ejemplo 3: Para resolver el problema de contorno
% y" = (32+2x^3-yy')/8 -> 1<=x<=3
% y(1) = 17, y(3) = 43/3,

%% Se define la función y'' y sus derivadas parciales en y' y en xx
f    = @(x, y, y_p)  1/8*(32+2*x.^3-y.*y_p);    % Ecuación diferencial de segundo orden
fy   = @(x, y, y_p) -1/8*y_p;                   % Derivada parcial de f respecto a y
fy_p = @(x, y, y_p) -1/8*y;                     % Derivada parcial de f respecto a y' = y_p;

%% Se establecen los parámetros iniciales
a = 1; b = 3; alfa = 17; beta = 43/3; N = 19;
maxiter = 50; tol = 1e-5; % Condiciones de parada

%% Se ejecuta el método de Diferencias Finitas para un problema NO líneal con condiciones Dirichlet
[X, Y, iter, incr] = Difnolin(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);

%% Se calcula la solución exacta
ex = @(x)x.^2+16./x;

%% Se evalua la solución exacta en X y se calcula el Error
exacta = ex(X);
Error = abs(exacta-Y);

%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
[vpa(X), vpa(Y), vpa(exacta), vpa(Error)]

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Dirichlet")
xlabel('x');
ylabel('y(x)');
plot(X,Y,'*-r')
plot(X,exacta,'b')
legend('y(x) aproximada', 'y(x) exacta');