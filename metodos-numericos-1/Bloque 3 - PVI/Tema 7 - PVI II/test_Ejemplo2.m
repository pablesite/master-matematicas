clear all; close all;
% Discretizamos la variable
a = 0; b = 3; h = 0.1875;
N = (b - a)/h;

% Condición inicial
Ya = 1;

% Cálculo de errores
% N = [10, 20, 40, 80, 160, 320, 640];
e_AM2 = zeros(length(N), 1); % Error a partir de las soluciones discretas
e_AM3 = zeros(length(N), 1); % Error a partir de las soluciones discretas
e_AM4 = zeros(length(N), 1); % Error a partir de las soluciones discretas
% e_AB4 = zeros(length(N), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N)
    [t_AM2, y_AM2] = AM2('PVI_Ejemplo2', a, b, N(i), Ya);
    [t_AM3, y_AM3] = AM3('PVI_Ejemplo2', a, b, N(i), Ya);
    [t_AM4, y_AM4] = AM4('PVI_Ejemplo2', a, b, N(i), Ya);
    % [t_AB4, y_AB4] = AB4_Sistemas('PenduloPVI', a, b, N(i), Ya);
    
    plot(t_AM2, y_AM2, 'o-')
    hold on
    plot(t_AM3, y_AM3, 'o-')
    plot(t_AM4, y_AM4, 'o-')

    % Cálculo de error
    if (i ~= 1)
        e_AM2(i) = max(abs(y_old_AM2(:, 1) - y_AM2(1:2:end, 1)));
        e_AM3(i) = max(abs(y_old_AM3(:, 1) - y_AM3(1:2:end, 1)));
        e_AM4(i) = max(abs(y_old_AM4(:, 1) - y_AM4(1:2:end, 1)));
        % e_AB4(i) = max(abs(y_old_AB4(:, 1) - y_AB4(1:2:end, 1)));
    end
    y_old_AM2 = y_AM2;
    y_old_AM3 = y_AM3;
    y_old_AM4 = y_AM4;
    % y_old_AB4 = y_AB4;

end

orden_AM2_e = log2(e_AM2(2:end-1)./e_AM2(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
orden_AM3_e = log2(e_AM3(2:end-1)./e_AM3(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
orden_AM4_e = log2(e_AM4(2:end-1)./e_AM4(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
% orden_AB4_e = log2(e_AB4(2:end-1)./e_AB4(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
