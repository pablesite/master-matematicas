clear all; close all;
% Discretizamos la variable
a = 0; b = 2; h = 0.2;
N = (b - a)/h;

% Condición inicial
Ya = [0, 0.25];

% Resolución
[t_Y_AB2_S, Y_AB2_S] = AB2_Sistemas('PenduloPVI', a, b, N, Ya);
[t_Y_AB3_S, Y_AB3_S] = AB3_Sistemas('PenduloPVI', a, b, N, Ya);
[t_Y_AB4_S, Y_AB4_S] = AB4_Sistemas('PenduloPVI', a, b, N, Ya);


% Representación
plot(t_Y_AB2_S, Y_AB2_S(:,1), 'o-')
hold on
grid on
plot(t_Y_AB3_S, Y_AB3_S(:,1), 'o-')
plot(t_Y_AB4_S, Y_AB4_S(:,1), 'o-')

legend('AB2 Sistemas', 'AB3 Sistemas', 'AB4 Sistemas')

% Cálculo de errores
N = [10, 20, 40, 80, 160, 320, 640];
e_AB2 = zeros(length(N), 1); % Error a partir de las soluciones discretas
e_AB4 = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N)
    [t_AB2, y_AB2] = AB2_Sistemas('PenduloPVI', a, b, N(i), Ya);
    [t_AB4, y_AB4] = AB4_Sistemas('PenduloPVI', a, b, N(i), Ya);
    
    plot(t_AB2, y_AB2, 'o-')
    hold on
    plot(t_AB4, y_AB4, 'o-')

    % Cálculo de error
    if (i ~= 1)
        e_AB2(i) = max(abs(y_old(:, 1) - y_AB2(1:2:end, 1)));
        e_AB4(i) = max(abs(y_old_AB4(:, 1) - y_AB4(1:2:end, 1)));
    end
    y_old = y_AB2;
    y_old_AB4 = y_AB4;

end

orden_AB2_e = log2(e_AB2(2:end-1)./e_AB2(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
orden_AB4_e = log2(e_AB4(2:end-1)./e_AB4(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
