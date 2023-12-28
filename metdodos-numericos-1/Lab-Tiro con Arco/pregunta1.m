close all; clear all;
% Entrada de datos
a = 0; b = 0.5;
h = 0.05;
x = a:h:b;
F = [0,	37,	71,	104, 134, 161, 185, 207, 225, 239, 250];

% Obtención de la integral numérica
n = length(x) - 1;
I_t = trapeciosDatos(F, a, b, n)
I_S = simpsonDatos(F, a, b, n)


