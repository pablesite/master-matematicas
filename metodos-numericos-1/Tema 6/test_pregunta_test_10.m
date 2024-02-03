clear all; close all;

% Discretizamos la variable
a = 1; b = 2; N = 2;
h = (b - a)/N;
td = a:h:b;
td = td(:);

% Condición inicial
X1 = 1;
X2 = 0;

X = [X1; X2];

%% Método ODE %%
[t_ode, y_ode] = ode23('Funcion_pregunta_test_10', td, X);

% Representación
figure
plot(t_ode, y_ode, 'o-')
hold on

%% Método Euler %%
N_euler = [2, 4, 8, 16, 32, 64];
E_euler = zeros(length(N_euler), 1);
figure
for i = 1:length(N_euler)
    [t_euler, y_euler] = Euler_Sistemas('Funcion_pregunta_test_10', a, b, N_euler(i), X);
    plot(t_euler, y_euler, 'o-')
    hold on
    % Cálculo de errores
    %sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_euler)); % solución teórica.
    %E_euler(i) = max(abs(sol - y_euler));
end

grid on
title('Método de Euler')
xlabel('t'), ylabel('y')
legend('Ode23', 'N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

%orden_euler = log2(E_euler(1:end-1)./E_euler(2:end));


%% Método de Heunn %%
N_Heun = [2, 4, 8, 16, 32, 64];
E_heun = zeros(length(N_Heun), 1); % Error a partir de la solución analítica
e_huen = zeros(length(N_Heun), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_Heun)
    
    [t_heun, y_heun] = Heun_Sistemas('Funcion_pregunta_test_10', a, b, N_Heun(i), X);
    
    plot(t_heun, y_heun, 'o-')
    hold on

    % Cálculo de errores
    %sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_heun)); % solución teórica.
    %E_heun(i) = max(abs(sol - y_heun));
    
    %if (i ~= 1)
    %    e_huen(i) = max(abs(y_old - y_heun(1:2:end)));
    %end
    %y_old = y_heun;
end

grid on
title('Método de Heun')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

%orden_heun_E = log2(E_heun(1:end-1)./E_heun(2:end));
%orden_heun_e = log2(e_huen(2:end-1)./e_huen(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.


%% Método Runge-Kutta %%
N_rk = [2, 4, 8, 16, 32, 64];
E_rk = zeros(length(N_rk), 1);
figure
for i = 1:length(N_rk)
    [t_rk, y_rk] = RungeKutta_Sistemas('Funcion_pregunta_test_10', a, b, N_rk(i), X);
    plot(t_rk, y_rk, 'o-')
    hold on
    % Cálculo de errores
    %sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_rk)); % solución teórica.
    %E_rk(i) = max(abs(sol - y_rk));
end

grid on
title('Método de Runge-Kutta')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

%orden_rk = log2(E_rk(1:end-1)./E_rk(2:end));

