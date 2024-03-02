clear all; close all;

x = linspace (-1 ,1);
y1 = sin(x);
y2 = exp(-x);
plot(x, [y1; y2 ]);
hold on
plot(x, y1 - y2)
grid on; xlabel ('x'); legend ('sin(x)','e^{-x}')

fun = @ Function_ejemplo_3;
x0 = vpa(0.5);
tol = exp(-100);
maxiter = 100;
[sol, iter, ACOC, incre1, incre2] = Newton(fun, x0, tol, maxiter)
[solS, iterS, ACOCS, incre1S, incre2S] = Steffensen(fun, x0, tol, maxiter)
[solH, iterH, ACOCH, incre1H, incre2H] = Halley(fun, x0, tol, maxiter)
[solT, iterT, ACOCT, incre1T, incre2T] = Traub(fun, x0, tol, maxiter)
[solJ, iterJ, ACOCJ, incre1J, incre2J] = Jarratt(fun, x0, tol, maxiter)


% Algunos métodos que debería haber implementado:
% Newton, Halley, Ostrowski, Traub,
% Punto medio, Jarratt y Newton doble

