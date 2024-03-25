clear all; close all;

% Discretizamos la variable
a = 0; b = 3;

% Condición inicial
Ya = [0; 2; 4];

%% Método Adams Bashforths %%
N = 30;
[t_AB2, y_AB2] = AB2_Sistemas('PVI_examen', a, b, N, Ya);

figure
plot(t_AB2, y_AB2(:, 1), 'o-')
grid on
hold on
legend('u(t)')
title('AB2 vs RK4')

%% Método Adams Bashforths %%
N = 30;
[t_RK4, y_RK4] = RungeKutta_Sistemas('PVI_examen', a, b, N, Ya);


plot(t_RK4, y_RK4(:, 1), 'o-')
grid on
legend('u(t) AB2', 'u(t) RK4')
%title('RK4')


%% Método Punto Medio %%
N = [2, 4, 8, 16, 32, 64];
e_AB2 = zeros(length(N), 1); % Error a partir de las soluciones discretas
e_RK4 = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure()
for i = 1:length(N)
    [t_AB2, y_AB2] = AB2_Sistemas('PVI_examen', a, b, N(i), Ya);
    [t_RK4, y_RK4] = RungeKutta_Sistemas('PVI_examen', a, b, N(i), Ya);

    % Cálculo de errores
    if (i ~= 1)
        e_AB2(i) = max(abs(y_oldAB2(:, 1) - y_AB2(1:2:end, 1)));
        e_RK4(i) = max(abs(y_oldRK4(:, 1) - y_RK4(1:2:end, 1)));
    end
    y_oldAB2 = y_AB2;
    y_oldRK4 = y_RK4;

end

grid on
title('Método del Punto medio')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_AB2 = log2(e_AB2(1:end-1)./e_AB2(2:end));
orden_RK4 = log2(e_RK4(1:end-1)./e_RK4(2:end));

