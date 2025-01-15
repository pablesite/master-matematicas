%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVIDAD 2                          %
% Optimización sin restricciones       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all; clc

% Parámetros iniciales
n = 100;                     % Número de intervalos
t = 0.005;                   % Paso
max_iter = 10000;           % Número máximo de iteraciones

u = ones(1, n+1);           % Vector inicial: u(0) = 1 y u(1) = 1
x = linspace(0, 1, n+1);    % Discretización de [0,1]

% Método del gradiente
for iter = 1:max_iter
    grad = calcula_gradiente(u, n);                 % Calcula el gradiente de la iteración
    u(2:end-1) = u(2:end-1) - t * grad(2:end-1);    % Actualiza u (excepto los extremos)
end

% Cálculo del área de revolución
area = calcula_area(u, n);
fprintf('Área de revolución = %.2f u^2\n', num2str(area));

% Función para calcular el gradiente de F.O.
function grad = calcula_gradiente(u, n)
    grad = zeros(1, n+1); 
    
    % Caso k = 0
    delta = (n) * (u(2) - u(1));
    grad(1) = (1 / (2 * n)) * (sqrt(1 + delta^2) - n^2 * delta * (u(1) + u(2)) / sqrt(1 + delta^2));
    
    % Caso k = 1,...,n-1
    for k = 2:n
        delta_minus = n * (u(k) - u(k-1));
        delta_plus = n * (u(k+1) - u(k));
        term1 = n^2 * delta_minus * (u(k) + u(k-1)) / sqrt(1 + delta_minus^2);
        term2 = n^2 * delta_plus * (u(k+1) + u(k)) / sqrt(1 + delta_plus^2);
        grad(k) = (1 / (2 * n)) * (sqrt(1 + delta_plus^2) - sqrt(1 + delta_minus^2) + term1 - term2);
    end
    
    % Caso k = n
    delta = n * (u(n+1) - u(n));
    grad(n+1) = (1 / (2 * n)) * (n^2 * delta * (u(n+1) + u(n)) / sqrt(1 + delta^2) + sqrt(1 + delta^2));
end

% Función para calcular el área de revolución
function area = calcula_area(u, n)
    area = 0;
    
    % Sumamos el área de cada intervalo usando la fórmula de trapecios
    for j = 1:n
        delta_u = n * (u(j+1) - u(j));  % Derivada u'(xj)
       
        % Aproximación de la integral
        T_j = ((u(j) + u(j+1)) * sqrt(1 + delta_u^2)) / (2 * n);
        area = area + T_j;
    end
end

% Visualización de resultados
figure;
plot(x, u, 'LineWidth', 2);
xlabel('x');
ylabel('u(x)');
title('Curva que minimiza el área de revolución');
grid on;