close all; clear all;

% Entrada de datios
x_i = [0, 0.5, 1];
f_i = [1, 0.9385, 0.7652];
df_i = [0, -0.2423, -0.4401];

% Genero el polinomio de Lagrange
[p_L] = polinomioHermite(x_i, f_i, df_i);
disp("El polinomio es: " + char(expand(vpa(p_L, 4))))

% Evalúo la función en alpha = 12
syms x
alpha = 0.75;
beta = double(subs(p_L, x, alpha));
disp("El valor de beta en (alpha = 0.75) es: " + num2str(beta, '%.4f') )

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% función con precisión.

y = zeros(1,x_i(end));
cont = 1;
for i = x_i(1):0.01:x_i(end)
    y(cont) = vpa(subs(p_L, x, i));
    cont = cont + 1;
end

% Pinto la figura
figure, hold on
plot(x_i(1):0.01:x_i(end), y, 'k')
scatter(x_i, f_i, 66, 'b', 'Marker', 'o');
scatter(alpha, beta, 66, 'r', 'Marker', '*');
% Añado ejes y grid.
grid on
title('Movimiento Articulado')
xlabel('Alpha (deg)')
ylabel('Beta (rad)')



