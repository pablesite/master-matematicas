% ode23   --> non-stiff, low order (stiff es rígido)
% ode113  --> non-stiff, variable order
% ode15s  --> stiff, variable order, includes DAE (mejor solución para
% problemas adaptativos).
% ode23s  --> stiff, low order
% ode23t  --> trapezoid rule
% ode23tb --> stiff, low order
% ode45   --> non-stiff, medium order (Runge-Kutta)
clear all; close all;

f = @ PVI_rigidos

y0 = 0;
a = 0;
b = 0.1;

[t, y_AB4] = AB4(f, a, b, 100, y0)
[t, y_ABM4] = ABM4(f, a, b, 100, y0)

T = linspace(a, b, 11);
[t_o, y_o] = ode15s(f, [a b], y0)
[t_o2, y_o2] = ode15s(f, T, y0) % para indicarle que use menos nodos, a ver si va bien también

[t_o45, y_o45] = ode45(f, [a b], y0)
[t_o45_2, y_o45_2] = ode45(f, T, y0)
%plot(t, y_AB4)

plot(t, y_ABM4)
hold on
plot(t_o, y_o)
plot(t_o2, y_o2)
plot(t_o45, y_o45)
plot(t_o45_2, y_o45_2)

