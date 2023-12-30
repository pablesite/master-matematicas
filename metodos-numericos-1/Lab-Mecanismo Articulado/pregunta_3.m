close all; clear all;

% Entrada de datios
x_i = 5:5:15;
f_i = [1.5434, 1.4186, 1.2925];

% Genero el polinomio de Newton
[b, p_n] = polinomioNewton(x_i, f_i);

% Evalúo la función en alpha = 12
syms x
alpha = 12;
beta = double(subs(p_n, x, alpha));

% Calculo la primera derivada
df_p_n = diff(p_n, x);
% Calculo la segunda derivada
df2_p_n = diff(df_p_n, x);

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% evaluación de la función en todos los puntos.
y = [];
df_y = [];
cont = 1;
for i = x_i(1):1:x_i(end)
    y(cont) = vpa(subs(p_n, x, i));
    df_y(cont) = vpa(subs(df_p_n, x, i));
    df2_y(cont) = vpa(subs(df2_p_n, x, i)); % Es cte. Se incluye de manera
    % genérica para que el código pueda servir en polinomios con más grado.
    cont = cont +1;
end

% Pinto las figuras
subplot(131), hold on
plot(x_i(1):1:x_i(end), y, 'k')
scatter(x_i, f_i, 66, 'b', 'Marker', 'o');
scatter(alpha, beta, 66, 'r', 'Marker', '*');
grid on
title('Relación beta/alpha')
xlabel('Alpha (deg)')
ylabel('Beta (rad)')

subplot(132) 
plot(x_i(1):1:x_i(end), df_y, 'r')
grid on
title('Relación beta/alpha - dif')
xlabel('Alpha (deg)')
ylabel('Beta (rad/deg)')

subplot(133)
plot(x_i(1):1:x_i(end), df2_y, 'r')
grid on
title('Relación beta/alpha - dif2')
xlabel('Alpha (deg)')
ylabel('Beta (rad/deg^2)')

% Cálculo alternativo:
% Obtengo los coeficientes del polinomio en su forma: p(x)=ax^2 + bx + c
C = coeffs(p_n);

% Uso coeffs para obtener el valor de (beta'') = 2a
df2_beta = vpa(2 * C(3), 4)

