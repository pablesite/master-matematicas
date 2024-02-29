clear all; close all;

fun = @ Function_ejemplo_4;
x0 = 0.3;
tol = 10^-9;
maxiter = 20;

[sol, iter, ACOC, incre1, incre2] = Newton(fun, x0, tol, maxiter)