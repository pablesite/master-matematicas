clear all; close all;

% Discretizamos la variable
a = 0; b = 3;

% Condición inicial
ya = 1;

%% Método heun %%
N_heun = [2, 4, 8, 16, 32, 64];
E_heun = zeros(length(N_heun), 1);
e_heun = zeros(length(N_heun), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_heun)
    [t_heun, y_heun] = Heun('Funcion_ejemplo_3', a, b, N_heun(i), ya);
    plot(t_heun, y_heun, 'o-')
    hold on

    % Cálculo de errores
    sol = exp(1/4 - (1/2 - t_heun).^2); % solución teórica.
    E_heun(i) = max(abs(sol - y_heun));

    if (i ~= 1)
        e_heun(i) = max(abs(y_old - y_heun(1:2:end)));
    end
    y_old = y_heun;

end

grid on
title('Método de heun')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_heun = log2(E_heun(1:end-1)./E_heun(2:end));
orden_heun_e = log2(e_heun(2:end-1)./e_heun(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
