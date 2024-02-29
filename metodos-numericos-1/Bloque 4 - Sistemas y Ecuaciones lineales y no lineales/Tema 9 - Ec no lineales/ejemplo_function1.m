fun = @ Function1;
x0 = 1;
xm1 = 0.5; % Sólo para el Secante
tol = 10^-100;
maxiter = 20;

t = cputime
%[sol, iter, ACOC, incre1, incre2] = Newton(fun, x0, tol, maxiter)


%[sol, iter, ACOC, incre1, incre2] = Newton_Compuesto_2(fun, x0, tol, maxiter)


[sol, iter, ACOC, incre1, incre2] = Secante(fun, x0, xm1, tol, maxiter)

tiempo = cputime - t