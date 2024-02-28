clear all; close all;

% Discretizamos la variable
a = 0; b = 1; N = 10;
h = (b - a)/N;
td = a:h:b;
td = td(:);

% Condición inicial
X1 = 1;
Y1 = 1;

Z = [X1; Y1];

%% Método ODE %%
[t_ode, y_ode] = ode23('Funcion_ejemplo_12', td, Z);

% Representación
figure
plot(t_ode, y_ode, 'o-')
hold on

%% Método Euler %%
N_euler = [2, 4, 8, 16, 32, 64];
N_euler = 10;
E_eulerX = zeros(length(N_euler), 1);
E_eulerY = zeros(length(N_euler), 1);
figure
for i = 1:length(N_euler)
    [t_euler, y_euler] = Euler_Sistemas('Funcion_ejemplo_12', a, b, N_euler(i), Z);
    plot(t_euler, y_euler, 'o-')
    hold on
    % Cálculo de errores
    solX = exp(5*t_euler)/3 - exp(-t_euler)/3 + exp(2*t_euler); % solución teórica.
    solY = exp(5*t_euler)/3 + 2*exp(-t_euler)/3 + t_euler.^2.*exp(2*t_euler);
    E_eulerX(i) = max(abs(solX - y_euler(:,1)));
    E_eulerY(i) = max(abs(solY - y_euler(:,2)));
end

grid on
title('Método de Euler')
xlabel('t'), ylabel('y')
legend('X', 'Y')

%orden_euler = log2(E_euler(1:end-1)./E_euler(2:end));