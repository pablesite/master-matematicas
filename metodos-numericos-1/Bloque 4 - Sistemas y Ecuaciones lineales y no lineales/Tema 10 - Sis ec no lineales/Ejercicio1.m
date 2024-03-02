clear all; close all;

F = @Sistema;
x0 = vpa([2, -1]);
tol = 10^(-12);
maxiter = 10;
[sol, iter, ACOC, incre1, incre2] = Newton_Sist(F, x0, tol, maxiter)
[solTr, iterTr, ACOCTr, incre1Tr, incre2Tr] = Trapecios_Sist(F, x0, tol, maxiter)
[solRN, iterRN, ACOCRN, incre1RN, incre2RN] = RN_Sist(F, x0, tol, maxiter)
