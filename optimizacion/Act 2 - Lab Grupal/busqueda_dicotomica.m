function alpha_opt = busqueda_dicotomica(u, grad, n)
    % Parámetros de la búsqueda
    a = 0; % Límite inferior
    b = 1; % Límite superior
    tol = 1e-7; % Tolerancia
    epsilon = tol / 10; % Desplazamiento pequeño para evaluar
    
    while (b - a) > tol
        % Dividir el intervalo
        alpha1 = (a + b) / 2 - epsilon;
        alpha2 = (a + b) / 2 + epsilon;
        
        % Evaluar la función objetivo en alpha1 y alpha2
        f1 = area_func(u - alpha1 * grad, n);
        f2 = area_func(u - alpha2 * grad, n);
        
        % Reducir el intervalo basado en las evaluaciones
        if f1 < f2
            b = alpha2; % Mover límite superior
        else
            a = alpha1; % Mover límite inferior
        end
    end
    
    % Devuelve el punto medio del intervalo como alpha óptimo
    alpha_opt = (a + b) / 2;
end
