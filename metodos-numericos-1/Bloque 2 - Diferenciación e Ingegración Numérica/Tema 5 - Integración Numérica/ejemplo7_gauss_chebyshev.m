clear all; close all;
% Función original
f = @(x) exp(x)/sqrt(1-x.^2);

%Función a evaluar (lo que no está definido en Gauss Chebyshev
g = @(x) exp(x);

% Evaluación del error, para ver cuándo es menor de 6 decimales (10^-6)
e = @(n) (2*pi*exp(1))/((2.^(2*n))*(factorial(2*n)));
for i = 1:10
    i
    e(i)
end
% Para i = 5 el error ya es menor que 1e-6
% Se calculan los coeficientes y la integral.
n = 5;
[xi, ci] = xcGaussChebyshev(n);
I = ci * sum(g(xi))
