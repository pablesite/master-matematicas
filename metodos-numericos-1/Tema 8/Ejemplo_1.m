clear all; close all;

% Ejemplo 1

A = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, -1; 0, 3, -1, 8];

cond(A) % 2.3597
b = [6, 25, -11, 15];
x0 = [0, 0, 0, 0];
tol = 10^-3;
maxiter = 20;
[x, iter, incre ] = Jacobi(A, b, x0, tol, maxiter);
% norm([1, 2, -1, 1])

[xG, iterG, increG ] = Gauss_Seidel(A, b, x0, tol, maxiter);
% norm([1, 2, -1, 1])