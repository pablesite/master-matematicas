close all; clear all;

% Entrada de datios
x_i = 1971:10:2011;
f_i = [33.956, 37.743, 39.434, 40.847, 46.816];

% Genero el polinomio de los splines cúbicos naturales
[ai, bi, ci, d, p_S] = splineCubicoNatural(x_i, f_i);
disp("El polinomio es: " + char(expand(vpa(p_S, 4))))

% Evalúo la función en alpha = 12
syms x
alpha = 2005;
beta = double(subs(p_S(4), x, alpha)); %p_S(4) porque es el trozo que corresponde a 2005
disp("El valor de beta en (alpha = 12) es: " + num2str(beta, '%.4f') )

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% función con precisión.


y1 = zeros(1,(x_i(end) - x_i(1) + 1));
y2 = zeros(1,(x_i(end) - x_i(1) + 1));
y3 = zeros(1,(x_i(end) - x_i(1) + 1));
y4 = zeros(1,(x_i(end) - x_i(1) + 1));
cont = 1;
for i = x_i(1):1:x_i(end)
    y1(cont) = vpa(subs(p_S(1), x, i));
    y2(cont) = vpa(subs(p_S(2), x, i));
    y3(cont) = vpa(subs(p_S(3), x, i));
    y4(cont) = vpa(subs(p_S(4), x, i));
    cont = cont + 1;
end

y = zeros(1,(x_i(end) - x_i(1) + 1));
cont = 1;
for i = x_i(1):1:x_i(2)
    y(cont) = vpa(subs(p_S(1), x, i));
    cont = cont + 1;
end

for i = x_i(2)+1:1:x_i(3)
    y(cont) = vpa(subs(p_S(2), x, i));
    cont = cont + 1;
end

for i = x_i(3)+1:1:x_i(4)
    y(cont) = vpa(subs(p_S(3), x, i));
    cont = cont + 1;
end

for i = x_i(4)+1:1:x_i(5)
    y(cont) = vpa(subs(p_S(4), x, i));
    cont = cont + 1;
end

% Pinto la figura
figure, hold on
plot(x_i(1):1:x_i(end), y1, 'k')
plot(x_i(1):1:x_i(end), y2, 'k')
plot(x_i(1):1:x_i(end), y3, 'k')
plot(x_i(1):1:x_i(end), y4, 'k')
plot(x_i(1):1:x_i(end), y,  'LineWidth', 1.5, 'Color', 'b')
scatter(x_i, f_i, 66, 'b', 'Marker', 'o');
scatter(alpha, beta, 66, 'r', 'Marker', '*');
% Añado ejes y grid.
grid on
title('Movimiento Articulado')
xlabel('Alpha (deg)')
ylabel('Beta (rad)')
