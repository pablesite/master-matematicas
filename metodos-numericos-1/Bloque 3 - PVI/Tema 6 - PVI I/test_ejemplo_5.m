clear all; close all;

% Discretizamos la variable
a = 0; b = 3;

% Condición inicial
ya = 1;

%% Método Euler %%
N_euler = [2, 4, 8, 16, 32, 64];
E_euler = zeros(length(N_euler), 1);
e_euler = zeros(length(N_euler), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_euler)
    [t_euler, y_euler] = Euler('Funcion_ejemplo_3', a, b, N_euler(i), ya);
    plot(t_euler, y_euler, 'o-')
    hold on

    % Cálculo de errores
    sol = exp(1/4 - (1/2 - t_euler).^2); % solución teórica.
    E_euler(i) = max(abs(sol - y_euler));

    if (i ~= 1)
        e_euler(i) = max(abs(y_old - y_euler(1:2:end)));
    end
    y_old = y_euler;

end

grid on
title('Método de Euler')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_euler = log2(E_euler(1:end-1)./E_euler(2:end));
orden_euler_e = log2(e_euler(2:end-1)./e_euler(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
