clear all; close all;

% Discretizamos la variable
a = 0; b = 2; N = 64;
h = (b - a)/N;
td = a:h:b;
td = td(:);

% Condición inicial
ya = 10;


%% Método Adams-Moulton 2 Pasos %%
N_AM2 = [8, 16, 32, 64, 128];
%N_AB2 = 10;
E_AM2 = zeros(length(N_AM2), 1); % Error a partir de la solución analítica
e_AM2 = zeros(length(N_AM2), 1); % Error a partir de las soluciones discretas
figure
hold on
for i = 1:length(N_AM2)
    
    [t_AM2, y_AM2] = AM2('Verhulst2PVI', a, b, N_AM2(i), ya);
    
    plot(t_AM2, y_AM2, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_AM2)); % solución teórica.
    E_AM2(i) = max(abs(sol - y_AM2));
    
    if (i ~= 1)
        e_AM2(i) = max(abs(y_old - y_AM2(1:2:end)));
    end
    y_old = y_AM2;
end

grid on
title('Método de Adams-Moulton 2')
xlabel('t'), ylabel('y')
legend('N=8', 'N=16', 'N=32', 'N=64', 'N=128')

orden_AM2_E = log2(E_AM2(1:end-1)./E_AM2(2:end));
orden_AM2_e = log2(e_AM2(2:end-1)./e_AM2(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método Adams-Moulton 3 Pasos %%
N_AM3 = [8, 16, 32, 64, 128];
E_AM3 = zeros(length(N_AM3), 1); % Error a partir de la solución analítica
e_AM3 = zeros(length(N_AM3), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_AM3)
    
    [t_AM3, y_AM3] = AM3('Verhulst2PVI', a, b, N_AM3(i), ya);
    
    plot(t_AM3, y_AM3, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_AM3)); % solución teórica.
    E_AM3(i) = max(abs(sol - y_AM3));
    
    if (i ~= 1)
        e_AM3(i) = max(abs(y_old - y_AM3(1:2:end)));
    end
    y_old = y_AM3;
end

grid on
title('Método de Adams-Moulton 3')
xlabel('t'), ylabel('y')
legend('N=8', 'N=16', 'N=32', 'N=64', 'N=128')

orden_AM3_E = log2(E_AM3(1:end-1)./E_AM3(2:end));
orden_AM3_e = log2(e_AM3(2:end-1)./e_AM3(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método Adams-Moulton 4 Pasos %%
N_AM4 = [8, 16, 32, 64, 128];
E_AM4 = zeros(length(N_AM4), 1); % Error a partir de la solución analítica
e_AM4 = zeros(length(N_AM4), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_AM4)
    
    [t_AM4, y_AM4] = AM4('Verhulst2PVI', a, b, N_AM4(i), ya);
    
    plot(t_AM4, y_AM4, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_AM4)); % solución teórica.
    E_AM4(i) = max(abs(sol - y_AM4));
    
    if (i ~= 1)
        e_AM4(i) = max(abs(y_old - y_AM4(1:2:end)));
    end
    y_old = y_AM4;
end

grid on
title('Método de Adams-Moulton 4')
xlabel('t'), ylabel('y')
legend('N=8', 'N=16', 'N=32', 'N=64', 'N=128')

orden_AM4_E = log2(E_AM4(1:end-1)./E_AM4(2:end));
orden_AM4_e = log2(e_AM4(2:end-1)./e_AM4(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
