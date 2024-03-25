clear all; close all;

x = linspace (0 ,2);
y1 = sin(x);
y2 = x.^2 - 1;
plot(x, [y1; y2 ]);
hold on
plot(x, y1 - y2)
grid on; xlabel ('x'); legend ('sin(x)','x^2 - 1', 'resta')

fun = @ Function_examen;
x0 = vpa(1);
tol = 10^-9;
maxiter = 50;
[sol, iter, ACOC, incre1, incre2] = Newton(fun, x0, tol, maxiter)
[solTO, iterTO, ACOCTO, incre1TO, incre2TO] = TO(fun, x0, tol, maxiter)

