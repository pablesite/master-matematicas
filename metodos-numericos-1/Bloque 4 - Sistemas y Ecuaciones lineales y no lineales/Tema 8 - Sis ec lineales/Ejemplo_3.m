clear all; close all;

% Ejemplo 3
A = [4, 3, 0; 3, 4, -1; 0, -1, 4];

% Diremos que la matriz A está bien condicionada si el número de 
% condición es un valor pequeño.
cond(A) 

b = [24, 30, -24];
x0 = [1, 1, 1];
tol = 10^-7;
maxiter = 35;
[x, iter, incre ] = Gauss_Seidel(A, b, x0, tol, maxiter);

w = 1.25;
[xSOR, iterSOR, increSOR ] = SOR(A, b, x0, w, tol, maxiter);
