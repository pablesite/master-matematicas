
close all; clear all;
addpath('C:\Users\Pablo Ruiz\Desktop\Proyectos\master-matematicas\metodos-numericos-1\Bloque 1 - Interpolación\Tema 3 - Interpolación') 
% Entrada de datos
a = 0;
b = 0.5;
h = 0.05;
x_i = a:h:b;
f_i = [0, 37, 71, 104, 134, 161, 185, 207, 225, 239, 250];

% Genero el polinomio de Lagrange
[p_n] = polinomioLagrange(x_i, f_i);

% Evaluo la integral del polinomio de Lagrange en [a, b]
q = eval(int(p_n,a,b))

% Intento de obtener el error a través de la expresión de error.
syms x
% Calculo la primera derivada
df_p_n = diff(p_n, x);
% Calculo la segunda derivada
df2_p_n = diff(df_p_n, x);
% Calculo la tercera derivada
df3_p_n = diff(df2_p_n, x);
% Calculo la cuarta derivada
df4_p_n = diff(df3_p_n, x);
% Calculo la quinta derivada
df5_p_n = diff(df4_p_n, x);

% Recorro el polinomio desde x0 hasta xn con pasos de 1 año para obtener la
% evaluación de la función en todos los puntos.
y = [];
df_y = [];
cont = 1;
for i = x_i(1):h/10:x_i(end)
    y(cont) = vpa(subs(p_n, x, i));
    df_y(cont) = vpa(subs(df_p_n, x, i));
    df2_y(cont) = vpa(subs(df2_p_n, x, i)); 
    df3_y(cont) = vpa(subs(df3_p_n, x, i)); 
    df4_y(cont) = vpa(subs(df4_p_n, x, i)); 
    df5_y(cont) = vpa(subs(df5_p_n, x, i)); 
    % genérica para que el código pueda servir en polinomios con más grado.
    cont = cont +1;
end

M2 = max(abs(double(df2_y))); 
M4 = max(abs(double(df4_y))); 

e2 = h^2*(b-a)*M2/12
e4 = h^4*(b-a)*M4/180


% Pinto las figuras
subplot(231), hold on
plot(x_i(1):1:x_i(end), y, 'k')
scatter(x_i, f_i, 66, 'b', 'Marker', 'o');
plot(x_i:h/10:x_i(end), y, 'r')
grid on
title('Relación F/x')
xlabel('x (m)')
ylabel('F (N)')

subplot(232) 
plot(x_i(1):h/10:x_i(end), df_y, 'r')
grid on
title('Relación F/x - dif1')
xlabel('x (m)')
ylabel('F (N/m)')

subplot(233)
plot(x_i(1):h/10:x_i(end), df2_y, 'r')
grid on
title('Relación F/x - dif2')
xlabel('x (m)')
ylabel('F (N/m^2)')

subplot(234) 
plot(x_i(1):h/10:x_i(end), df3_y, 'r')
grid on
title('Relación F/x - dif3')
xlabel('x (m)')
ylabel('F (N/m^3)')

subplot(235)
plot(x_i(1):h/10:x_i(end), df4_y, 'r')
grid on
title('Relación F/x - dif4')
xlabel('x (m)')
ylabel('F (N/m^4)')

subplot(236)
plot(x_i(1):h/10:x_i(end), df5_y, 'r')
grid on
title('Relación F/x - dif5')
xlabel('x (m)')
ylabel('F (N/m^5)')
