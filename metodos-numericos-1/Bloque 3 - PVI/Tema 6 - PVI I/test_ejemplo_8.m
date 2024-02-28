clear all; close all;

% Discretizamos la variable
a = 0; b = 3;

% Condición inicial
ya = 1;

%% Método rk %%
N_rk = [2, 4, 8, 16, 32, 64];
E_rk = zeros(length(N_rk), 1);
e_rk = zeros(length(N_rk), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_rk)
    [t_rk, y_rk] = RungeKutta('Funcion_ejemplo_3', a, b, N_rk(i), ya);
    plot(t_rk, y_rk, 'o-')
    hold on

    % Cálculo de errores
    sol = exp(1/4 - (1/2 - t_rk).^2); % solución teórica.
    E_rk(i) = max(abs(sol - y_rk));

    if (i ~= 1)
        e_rk(i) = max(abs(y_old - y_rk(1:2:end)));
    end
    y_old = y_rk;

end

grid on
title('Método de rk')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_rk = log2(E_rk(1:end-1)./E_rk(2:end));
orden_rk_e = log2(e_rk(2:end-1)./e_rk(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
