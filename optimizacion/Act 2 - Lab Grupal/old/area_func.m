function area = area_func(u, n)
    % Cálculo del área total (fórmula completa)
    area = 0;
    for j = 1:n
        delta_u = u(j+1) - u(j); % Diferencia entre u_{j+1} y u_j
        factor = sqrt(1 + n^2 * delta_u^2); % Factor raíz
        Tj = ((u(j) + u(j+1)) * factor) / (2 * n); % Término de área
        area = area + Tj; % Sumar al área total
    end
end