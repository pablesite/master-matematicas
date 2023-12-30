close all; clear all;
% Entrada de datos
a = 0; b = 0.5;
h = 0.05;
x = a:h:b;
F = [0,	37,	71,	104, 134, 161, 185, 207, 225, 239, 250];

% Obtención de la integral numérica
I = zeros(1, length(x)-1);
for i = 2:length(x)
    n = i - 1;
    if mod(n,2) == 0
        I(i-1) = simpsonDatos(F(1:i), a, x(i), n);
    else
        I(i-1) = trapeciosDatos(F(1:i), a, x(i), n);
    end
end

% Obtención de la velocidad
m = 0.075;
v = [0, sqrt((2/m)*I)]

% Representación de la velocidad
figure
yyaxis left, hold on
ylabel('F (N)')
plot(x, F)
grid on
yyaxis right
ylabel('v (m/s)')
plot(x, v)
grid on
title('Fuerza (N) y Velocidad m/s')
xlabel('x (m)')

