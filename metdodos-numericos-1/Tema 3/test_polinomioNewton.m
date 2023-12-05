close all; clear all;

% Entrada de datios
xi = 1971:10:2011;
fi = [33.956, 37.743, 39.434, 40.847, 46.816];

% Genero el polinomio de Newton
[b, p] = polinomioNewton(xi, fi);

% Evalúo la función en x = 2005
syms x
eval = subs(p, x, 2005);
eval_float = vpa(eval, 5); % Fuerzo a ver el resultado con al menos 5 dígitos significativos

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% función con precisión.

y = []
cont = 1
for i = xi(1):1:xi(end)
    y(cont) = vpa(subs(p, x, i));
    cont = cont +1
end

% Pinto la figura
figure, hold on
plot(xi(1):1:xi(end), y, 'k')
scatter(xi, fi, 66, 'b', 'Marker', 'o');
scatter(2005, eval_float, 66, 'r', 'Marker', '*');
% Añado ejes y grid.
grid on
title('Censo de Población de España')
xlabel('Año')
ylabel('Población [MPersonas]')


