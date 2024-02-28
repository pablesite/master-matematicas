clear all; close all;

% Función original
fx = @(x) exp(-x.^2);
% Se hace un cambio de variable para conseguir el intervalo [-1, 1]
fy = @(y) exp(-((y + 5).^2/16));


format("long")
n = 3;
[xi, ci] = xcGaussLegendre(n);

% Con el cambio de variable para este caso particular, hay que añadir 1/4.
I = 1/4*sum(ci.*fy(xi))







