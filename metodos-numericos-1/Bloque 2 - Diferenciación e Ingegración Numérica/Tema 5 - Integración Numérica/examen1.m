clear all; close all;

%Función a evaluar (lo que no está definido en Gauss Chebyshev
g = @(y) (y.^2 - 1).*y;

n = 8;
% Se calculan los coeficientes y la integral.
[xi, ci] = xcGaussLaguerre(n);
I = 2*sum(ci.*g(xi))


syms x
f = @(x) exp(-sqrt(x)).*(x - 1);
IMatlab = integral(f, 0, inf);
e = abs(IMatlab - I)

