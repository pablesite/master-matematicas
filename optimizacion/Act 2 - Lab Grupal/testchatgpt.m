% Parámetros iniciales
x1 = 0; y1 = 1; % Punto inicial
x2 = 1; y2 = 2; % Punto final
n = 100; % Número de intervalos
epsilon = 1e-5; % Tolerancia para el método del gradiente
alpha = 0.01; % Tasa de aprendizaje (step size)

% Discretización del intervalo
x = linspace(x1, x2, n+1); % Coordenadas x
h = (x2 - x1) / n; % Tamaño del intervalo
u = zeros(1, n+1); % Valores iniciales desconocidos de u
u(1) = y1; % Condición inicial en el primer punto
u(end) = y2; % Condición inicial en el último punto

% Función para calcular el área discretizada
define_area = @(u) sum((u(1:end-1) + u(2:end)) .* sqrt(1 + n^2 * ((u(1:end-1) - u(2:end)).^2)) / (2 * n));

% Función auxiliar para calcular el gradiente punto a punto
function gk = calculate_gradient(k, u, n)
    h = 1 / n; % Tamaño del paso
    if k == 1
        % Caso k = 0
        gk = (1 / (2 * n)) * ( ...
            sqrt(1 + n^2 * (u(2) - u(1))^2) - ...
            n^2 * (u(2) - u(1)) * (u(1) + u(2)) / sqrt(1 + n^2 * (u(2) - u(1))^2) ...
        );
    elseif k == n+1
        % Caso k = n
        gk = (1 / (2 * n)) * ( ...
            n^2 * (u(n+1) - u(n)) * (u(n) + u(n+1)) / sqrt(1 + n^2 * (u(n+1) - u(n))^2) + ...
            sqrt(1 + n^2 * (u(n+1) - u(n))^2) ...
        );
    else
        % Caso k = 1, ..., n-1
        gk = (1 / (2 * n)) * ( ...
            n^2 * (u(k) - u(k-1)) / sqrt(1 + n^2 * (u(k) - u(k-1))^2) - ...
            n^2 * (u(k+1) - u(k)) * (u(k-1) + u(k+1)) / sqrt(1 + n^2 * (u(k+1) - u(k))^2) + ...
            sqrt(1 + n^2 * (u(k) - u(k-1))^2) + ...
            sqrt(1 + n^2 * (u(k+1) - u(k))^2) ...
        );
    end
end

% Método del gradiente
area_function = @(u) define_area(u); % Función de área
iteration = 0; % Contador de iteraciones
grad_norm = inf; % Inicialización de la norma del gradiente

while grad_norm > epsilon
    grad = zeros(1, n+1); % Inicializar gradiente
    for k = 2:n % Actualizar solo los puntos intermedios
        grad(k) = calculate_gradient(k, u, n); % Gradiente en k
      
        u(k) = u(k) - alpha * grad(k); % Actualizar el valor de u en k
    end
    
    % Calcular la norma del gradiente usando los valores ya almacenados
    grad_norm = norm(grad(2:n)); % Excluir bordes que no cambian
    iteration = iteration + 1;
    
    % Calcular área en cada iteración y mostrar progreso
    current_area = area_function(u);
    if mod(iteration, 50) == 0
        fprintf('Iteración %d: Área = %.6f, Norma del gradiente = %.6f\n', iteration, current_area, grad_norm);
    end
end

% Resultados
display(['Iteraciones totales: ', num2str(iteration)]);
display(['Área mínima aproximada: ', num2str(area_function(u))]);

% Graficar la curva óptima
figure;
plot(x, u, '-o');
xlabel('x'); ylabel('u');
title('Curva Óptima para el Área Mínima de Superficie de Revolución');
grid on;
