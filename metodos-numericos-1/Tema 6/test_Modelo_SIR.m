clear all; close all;

% Discretizamos la variable
a = 0; b = 10; N = 20;
h = (b - a)/N;
td = a:h:b;

% Condiciones iniciales
S0 = 100; I0 = 32; R0 = 5;
Ya = [S0, I0, R0];

%% Método ODE %%
[t_ode, Y_ode] = ode23('Modelo_SIR', td, Ya);

% Representación
figure(1)
plot(t_ode, Y_ode , 'o-')
grid on
title('Método ODE23 de Matlab')
xlabel('t'), ylabel('Y')
legend('S', 'I', 'R')

%% Método de Euler en un Sistema %%
%N_Euelr_Sis = [2, 4, 8, 16, 32, 64];
%e_Euler_Sis = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure(2)
for i = 1:length(N)
    
    [t_Euler_Sis, Y_Euler_Sis] = Euler_Sistemas('Modelo_SIR', a, b, N(i), Ya);
    
    plot(t_Euler_Sis, Y_Euler_Sis, 'o-')
    hold on

    % Cálculo de errores
    % if (i ~= 1)
        % e_Euler_Sis(i) = max(abs(y_old - Y_Euler_Sis(1:2:end)));
    %end
    %y_old = Y_Euler_Sis;
end

grid on
title('Método de Euler en un Sistema')
xlabel('t'), ylabel('Y')
%legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')
legend('S', 'I', 'R')

%orden_Euler_Sis_e = log2(e_Euler_Sis(2:end-1)./e_Euler_Sis(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método de Heun en un Sistema %%
%N_Heun_Sis = [2, 4, 8, 16, 32, 64];
e_Heun_Sis = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure(3)
for i = 1:length(N)
    
    [t_Euler_Sis, Y_Euler_Sis] = Heun_Sistemas('Modelo_SIR', a, b, N(i), Ya);
    
    plot(t_Euler_Sis, Y_Euler_Sis, 'o-')
    hold on

    % Cálculo de errores
    % if (i ~= 1)
        % e_Heun_Sis(i) = max(abs(y_old - Y_Euler_Sis(1:2:end)));
    %end
    %y_old = Y_Euler_Sis;
end

grid on
title('Método de Heun en un Sistema')
xlabel('t'), ylabel('Y')
%legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')
legend('S', 'I', 'R')

%orden_Euler_Sis_e = log2(e_Heun_Sis(2:end-1)./e_Heun_Sis(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método de Runge-Kutta en un Sistema %%
%N_Heun_Sis = [2, 4, 8, 16, 32, 64];
e_Runge_Kutta_Sis = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure(4)
for i = 1:length(N)
    
    [t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis] = RungeKutta_Sistemas('Modelo_SIR', a, b, N(i), Ya);
    
    plot(t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis, 'o-')
    hold on

    % Cálculo de errores
    % if (i ~= 1)
        % e_Runge_Kutta_Sis(i) = max(abs(y_old - Y_Runge_Kutta_Sis(1:2:end)));
    %end
    %y_old = Y_Runge_Kutta_Sis;
end

grid on
title('Método de Runge-Kutta en un Sistema')
xlabel('t'), ylabel('Y')
%legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')
legend('S', 'I', 'R')

%orden_Runge_Kutta_Sis_e = log2(e_Runge_Kutta_Sis(2:end-1)./e_Runge_Kutta_Sis(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
