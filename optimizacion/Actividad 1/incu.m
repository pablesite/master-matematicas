function [x_min, iter] = incu(f, x1, x2, x3, delta)
    % Método de búsqueda dicotómica
    % Entradas:
    %   f: función objetivo
    %   a, b: extremos iniciales del intervalo unimodal
    %   tol: tolerancia para la convergencia
    %
    % Salidas:
    %   x_min: punto donde se alcanza el mínimo
    %   iter: número de iteraciones realizadas

    % Implementación del método

    % valores iniciales
    % eps = delta/10; % Siempre más pequeño que la tolerancia.
    % Distancia entre los puntos (epsilon < delta)

    % Inicialización de las variables
    iter = 0;  % Contador de iteraciones
    max_iter = 100;  % Número máximo de iteraciones
    
    % mientras (b - a) >= tol
    while iter < max_iter %%REVISAR
        iter = iter + 1;

        % Calcular el valor mínimo del polinomio interpolador
        f1 = f(x1); f2 = f(x2); f3 = f(x3);
        num = ((x2^2-x3^2)*f1 + (x3^2-x1^2)*f2 + (x1^2-x2^2)*f3);
        den = 2*((x3-x2)*f1 + (x1-x3)*f2 + (x2-x1)*f3);
        x = -num/den;
        
        % Se cumple el criterio de parada?
        if abs(x2 - x) < delta
            x_min = x;
            return
        else
            % Se reduce el intervalo
            if x2 <= x
                x1 = x2; x2 = x; 
            else
                x3 = x2; x2 = x;
            end
        end
    end
    x_min = 0;

end