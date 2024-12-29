clear all; close all;

% Parámetros iniciales
n = 100; % Número de intervalos n = 100
x = linspace(0, 1, n+1); % Discretización del intervalo [0, 1]

u = linspace(1, 1, n+1); % Curva inicial (línea horizontal entre (0,1) y (1,1))
%ruido = (rand(1, n+1) - 0.5) * 0.1; % Ruido uniforme en el rango [-0.05, 0.05]
%u = u + ruido; % Sumar el ruido al vector base

alpha = 0.005; % Tasa de aprendizaje alpha = 0.005 no satura
epsilon = 1e-8; % Tolerancia para detener el gradiente descendente
max_iter = 100000; % Número máximo de iteraciones

% Gradiente descendente
iter = 0;
grad_norm = inf; % Inicialización de la norma del gradiente

while grad_norm > epsilon && iter < max_iter
    grad = calculo_gradiente(u, n); % Calcular el gradiente
    
    % Búsqueda de alpha mediante la búsqueda dorada
    %alpha = busqueda_dorada(u, grad, n); % Optimizar alpha

    % Optimizar alpha mediante la búsqueda dicotómica
    alpha = busqueda_dicotomica(u, grad, n); % Si lo busco dinámico, acaba
    %convergiendo en un alpha de 0.0059, pero esto no hace que el gradiente
    %disminuya y sale del bucle por el número de iteraciones.
    % Si lo pongo fijo, me va guay con 0.005.. en este caso el gradiente sí
    % que converge. Todo esto, con n = 100

    u(2:n) = u(2:n) - alpha * grad(2:n); % Actualizar puntos intermedios
    
    grad_norm = norm(grad(2:n)); % Calcular la norma del gradiente
    iter = iter + 1;
    
    % Mostrar progreso
    if mod(iter, 50) == 0
        fprintf('Iteración %d: Norma del gradiente = %.6f\n', iter, grad_norm);
    end
end

% Mostrar resultado final
fprintf('Iteraciones totales: %d\n', iter);
% fprintf('Curva optimizada u(x):\n');
% disp(u);

% Graficar la curva optimizada
figure;
plot(x, u, '-o');
xlabel('x'); ylabel('u(x)');
ylim([0,1])
title('Curva Optimizada para Mínimo Área de Superficie de Revolución');
grid on;


% Cálculo del área
area_total = 0;
for j = 1:n
    delta_u = u(j+1) - u(j); % Diferencia entre u_{j+1} y u_j
    factor = sqrt(1 + n^2 * delta_u^2); % Factor raíz
    Tj = ((u(j) + u(j+1)) * factor) / (2 * n); % Término de área
    area_total = area_total + Tj; % Sumar al área total
end

% Mostrar el área
fprintf('El área total (fórmula) es: %.6f\n', area_total);

% Parámetros iniciales
n = length(u) - 1; % Número de intervalos

% Cálculo aproximado del área usando promedio entre puntos consecutivos
area_total = 0;
for j = 1:n
    area_total = area_total + (u(j) + u(j+1)) / (2 * n);
end

% Mostrar el área total
fprintf('El área aproximada (promedio entre puntos) es: %.6f\n', area_total);