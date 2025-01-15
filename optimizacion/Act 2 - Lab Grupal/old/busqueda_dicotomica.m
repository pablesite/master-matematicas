function alpha_opt = busqueda_dicotomica(u, grad, n)
    % Parámetros de la búsqueda
    a = 0; % Límite inferior
    b = 1; % Límite superior
    tol = 1e-5; % Tolerancia
    epsilon = tol / 10; % Desplazamiento pequeño para evaluar
    
    while (b - a) > tol

        x = (a + b) / 2;

        % Dividir el intervalo
        alpha1 = x - epsilon/2;
        alpha2 = x + epsilon/2;
        
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
