close all; clear all;

% Entrada de datios
x_i = 0:5:30;
f_i = [1.6595, 1.5434, 1.4186, 1.2925, 1.1712, 1.0585, 0.9561];

% Genero el polinomio de Newton
[b, p_N] = polinomioNewton(x_i, f_i);
disp("El polinomio es: " + char(expand(vpa(p_N, 4))))

% Genero el polinomio de Lagrange
%[p_L] = polinomioLagrange(x_i, f_i);

% Evalúo la función en alpha = 12
syms x
alpha = 12;
beta = double(subs(p_N, x, alpha));
disp("El valor de beta en (alpha = 12) es: " + num2str(beta, '%.4f') )

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% función con precisión.

y = zeros(1,x_i(end));
for i = x_i(1):1:x_i(end)
    y(i + 1) = vpa(subs(p_N, x, i));
end

% Pinto la figura
figure, hold on
plot(x_i(1):1:x_i(end), y, 'k')
scatter(x_i, f_i, 66, 'b', 'Marker', 'o');
scatter(alpha, beta, 66, 'r', 'Marker', '*');
% Añado ejes y grid.
grid on
title('Movimiento Articulado')
xlabel('Alpha (deg)')
ylabel('Beta (rad)')


