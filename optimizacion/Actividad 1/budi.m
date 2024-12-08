function [x_min, iter] = budi(func, a, b, tol)
    % Método de búsqueda dicotómica
    % Entradas:
    %   func: función objetivo
    %   a, b: extremos iniciales del intervalo unimodal
    %   tol: tolerancia para la convergencia
    %
    % Salidas:
    %   x_min: punto donde se alcanza el mínimo
    %   iter: número de iteraciones realizadas

    % Implementación del método

    % valores iniciales
    delta = tol/10; % Siempre más pequeño que la tolerancia.
    iter = 0;
    
    % mientras (b - a) >= tol
    while (b - a) > tol
        iter = iter + 1;

        % Calcular xa y xb
        x = (a + b) / 2; 
        xa = x - delta / 2;
        xb = x + delta / 2;

        % Evaluar la función en los extremos del nuevo intervalo
        if func(xa) < func(xb)
            b = xb;
        else
            a = xa;
        end
    end
    % Cálculo del mínimo
    x_min = (a + b) / 2;
end
