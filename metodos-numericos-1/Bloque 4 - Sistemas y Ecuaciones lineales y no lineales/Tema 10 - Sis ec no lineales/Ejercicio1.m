F = @Sistema;
x0 = vpa([2, -1]);
tol = 10^(-12);
maxiter = 10;
[sol, iter, ACOC, incre1, incre2] = Newton_Sist(F, x0, tol, maxiter);
