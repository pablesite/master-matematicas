function alpha_opt = busqueda_dorada(u, grad, n)
    % Intervalo inicial para alpha
    alpha_min = 0; % Sin movimiento
    alpha_max = 1; % Movimiento máximo razonable
    tol = 1e-5; % Tolerancia para detener la búsqueda
    
    % Razón áurea
    phi = (1 + sqrt(5)) / 2;
    resphi = 2 - phi;
    
    % Inicialización de puntos
    a = alpha_min;
    b = alpha_max;
    alpha1 = a + resphi * (b - a);
    alpha2 = b - resphi * (b - a);
    
    % Evaluación de la función objetivo
    f1 = area_func(u - alpha1 * grad, n);
    f2 = area_func(u - alpha2 * grad, n);
    
    % Búsqueda iterativa
    while abs(b - a) > tol
        if f1 < f2
            b = alpha2;
            alpha2 = alpha1;
            f2 = f1;
            alpha1 = a + resphi * (b - a);
            f1 = area_func(u - alpha1 * grad, n);
        else
            a = alpha1;
            alpha1 = alpha2;
            f1 = f2;
            alpha2 = b - resphi * (b - a);
            f2 = area_func(u - alpha2 * grad, n);
        end
    end
    
    % Resultado final
    alpha_opt = (a + b) / 2;
end