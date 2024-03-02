clear all; close all;

F = @Sistema2;
x0 = vpa([1, 1, 2]);
tol = 10^(-12);
maxiter = 1000;
[sol, iter, ACOC, incre1, incre2] = Newton_Sist(F, x0, tol, maxiter)
[solTr, iterTr, ACOCTr, incre1Tr, incre2Tr] = Trapecios_Sist(F, x0, tol, maxiter)
[solNA, iterNA, ACOCNA, incre1NA, incre2NA] = NA_Sist(F, x0, tol, maxiter)
[solJ, iterJ, ACOCJ, incre1J, incre2J] = Jarrat_Sist(F, x0, tol, maxiter)
[solNJ, iterNJ, ACOCNJ, incre1NJ, incre2NJ] = Newton_Jarrat_Sist(F, x0, tol, maxiter)
[solRN, iterRN, ACOCRN, incre1RN, incre2RN] = RN_Sist(F, x0, tol, maxiter)
