clear all; close all;

%Función a evaluar (lo que no está definido en Gauss Chebyshev
g = @(y) abs(y/2);

n = 4;
% Se calculan los coeficientes y la integral.

[xi, ci] = xcGaussHermite(n)
I = 1/2*sum(ci.*g(xi))
