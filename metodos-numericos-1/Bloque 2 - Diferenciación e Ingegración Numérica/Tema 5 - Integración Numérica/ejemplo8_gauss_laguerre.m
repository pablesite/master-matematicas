clear all; close all;

%Función a evaluar (lo que no está definido en Gauss Chebyshev
g = @(y) sin(y/10);

n = 3;
% Se calculan los coeficientes y la integral.

[xi, ci] = xcGaussLaguerre(n);
I = 1/10*sum(ci.*g(xi))
