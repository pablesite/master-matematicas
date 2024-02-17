clear all; close all;

x = linspace ( -1 ,1);
y1 = sin(x);
y2 = exp(-x);
plot(x, [y1; y2 ]);
hold on
plot(x, y1 - y2)
grid on; xlabel ('x'); legend ('sin(x)','e^{-x}')

fun = @ Function_ejemplo_3;
x0 = 0;
tol = exp(-100);
maxiter = 100;
[sol, iter, ACOC, incre1, incre2] = Newton(fun, x0, tol, maxiter)
