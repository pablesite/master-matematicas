clear all; close all;

% Entrada de datos
x_i = 0:5:30; % α viene expresado en grados.
f_i = [1.6595, 1.5434, 1.4186, 1.2925, 1.1712, 1.0585, 0.9561]; % β en radianes

x_i_rad = deg2rad(x_i);
h = x_i_rad(2) - x_i_rad(1); % Notar que la h es cte.
n = length(x_i);

% Preparo vector de ceros para almacenar el resultado (diferencias
% finitas de orden 2)
df2 = zeros(1, n);

% Calculo el primer punto --> Diferencias progresivas de orden 2 
df2(1) = (-f_i(3) + 4*f_i(2) - 3*f_i(1))/(2*h);

% Calculo los puntos intermedios --> Diferencias centrales de orden 2.
% Cálculo vectorial.
df2(2:n-1) = (f_i(3:n) - f_i(1:n-2))/(2*h);
% Centrales de orden 4, por probar.
%df2_mat(3:n-2) = (-f(5:n) + 8 * f(4:n-1) - 8 * f(2:n-3) + f(1:n-4))./(12 * h); 

% Calculo el último punto --> Diferencias regresivas de orden 2 
df2(n) =(3*f_i(n) - 4*f_i(n-1) + f_i(n-2))/(2*h);

%%%%% PARA COMPROBAR: Derivada del polinomio de interpolación de Lagrange.
% Genero el polinomio de Lagrange
[p_n] = polinomioLagrange(x_i_rad, f_i);
% Calculo la primera derivada
syms x;
df_p_n = diff(p_n, x);
df_y = [];
cont = 1;
for i = x_i_rad(1):h/10:x_i_rad(end)
    df_y(cont) = vpa(subs(df_p_n, x, i));
    cont = cont + 1;
end
%%%%%

% Calculo la velocidad angular de beta: dβ/dt=(dβ/dα*dα/dt)
vel_ang_beta = df2 * 25;
vel_ang_beta_L = df_y * 25;

hold on
plot(x_i_rad(1:n), vel_ang_beta(1:n),'-o')
plot(x_i_rad(1):h/10:x_i_rad(end), vel_ang_beta_L, 'r')
hold off
grid on
title('Mecanismo articulado')
xlabel('α (rad)')
ylabel('Velocidad angular de β (rad/s)')
legend('Diferencias finitas', 'Aproximación Lagrange')