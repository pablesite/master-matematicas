clear all; close all;

% Discretizamos la variable
a = 0; b = 2; N = 64;
h = (b - a)/N;
td = a:h:b;
td = td(:);

% Condición inicial
ya = 10;

%% Método ODE %%
[t_ode, y_ode] = ode23('VerhulstPVI', td, ya);

% Representación
figure
plot(t_ode, y_ode, 'o-')
hold on

%% Método Adams-Bashforth 2 Pasos %%
N_ABM2 = [2, 4, 8, 16, 32, 64];
E_ABM2 = zeros(length(N_ABM2), 1); % Error a partir de la solución analítica
e_ABM2 = zeros(length(N_ABM2), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_ABM2)
    
    [t_ABM2, y_ABM2] = ABM2('VerhulstPVI', a, b, N_ABM2(i), ya);
    
    plot(t_ABM2, y_ABM2, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_ABM2)); % solución teórica.
    E_ABM2(i) = max(abs(sol - y_ABM2));
    
    if (i ~= 1)
        e_ABM2(i) = max(abs(y_old - y_ABM2(1:2:end)));
    end
    y_old = y_ABM2;
end

grid on
title('Método de Adams-Bashfort-Moulton 2')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_ABM2_E = log2(E_ABM2(1:end-1)./E_ABM2(2:end));
orden_ABM2_e = log2(e_ABM2(2:end-1)./e_ABM2(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método Adams-Bashforth 3 Pasos %%
N_AB3 = [2, 4, 8, 16, 32, 64];
E_AB3 = zeros(length(N_AB3), 1); % Error a partir de la solución analítica
e_AB3 = zeros(length(N_AB3), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_AB3)
    
    [t_AB3, y_AB3] = AB3('VerhulstPVI', a, b, N_AB3(i), ya);
    
    plot(t_AB3, y_AB3, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_AB3)); % solución teórica.
    E_AB3(i) = max(abs(sol - y_AB3));
    
    if (i ~= 1)
        e_AB3(i) = max(abs(y_old - y_AB3(1:2:end)));
    end
    y_old = y_AB3;
end

grid on
title('Método de Adams-Bashfort 3')
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_AB3_E = log2(E_AB3(1:end-1)./E_AB3(2:end));
orden_AB3_e = log2(e_AB3(2:end-1)./e_AB3(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.

%% Método Adams-Bashforth-Moulton 4 Pasos %%
N_ABM4 = [8, 16, 32, 64, 128];
E_ABM4 = zeros(length(N_ABM4), 1); % Error a partir de la solución analítica
e_ABM4 = zeros(length(N_ABM4), 1); % Error a partir de las soluciones discretas
figure
for i = 1:length(N_ABM4)
    
    [t_ABM4, y_ABM4] = ABM4('VerhulstPVI', a, b, N_ABM4(i), ya);
    
    plot(t_ABM4, y_ABM4, 'o-')
    hold on

    % Cálculo de errores
    sol = 3*10./(0.1*10 + (3 - 0.1*10).*exp(-3*t_ABM4)); % solución teórica.
    E_ABM4(i) = max(abs(sol - y_ABM4));
    
    if (i ~= 1)
        e_ABM4(i) = max(abs(y_old - y_ABM4(1:2:end)));
    end
    y_old = y_ABM4;
end

grid on
title('Método de Adams-Bashfort-Moulton 4')
xlabel('t'), ylabel('y')
legend('N=4', 'N=8', 'N=16', 'N=32', 'N=64')

orden_ABM4_E = log2(E_ABM4(1:end-1)./E_ABM4(2:end));
orden_ABM4_e = log2(e_ABM4(2:end-1)./e_ABM4(3:end)); % Notar que para N = 4 no se puede calcular el orden porque el error es cero cuando N = 2.
