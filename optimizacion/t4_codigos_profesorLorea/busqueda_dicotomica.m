function [x_min, f_min, iter] = busqueda_dicotomica(f, a, b, delta, it_max) % Método de búsqueda dicotómica
    eps = delta/10; % Distancia entre los puntos (epsilon < delta)
    iter = 0; % Contador de iteraciones
    %Algoritmo
    while abs(b - a) > delta && iter < it_max
        iter = iter + 1;
        % Calcular los dos puntos cercanos al punto medio
        x1 = (a + b) / 2 - eps / 2;
        x2 = (a + b) / 2 + eps / 2;
        % Evaluar la función en los puntos x1, x2 y actualizar intervalo
        if f(x1) < f(x2)
            b = x2;  % Reducir el límite superior
        else
            a = x1;  % Reducir el límite inferior
        end
    end
    % Resultado final
    x_min = (a + b) / 2;     
    f_min = f(x_min);
end