function [v, theta, r] = VelocidadImpacto(r, theta, dtheta, Re) 
    tol = 10000; % Se establece una tolerancia alta al inicio.
    indices = zeros(2, 1); % Para que no cumpla la condición inicial.
    while (length(indices) > 1)
        indices = find(((r - Re) <= tol) & ((r - Re) > 0));
        tol = tol - 1;
    end
    % Se busca la velocidad en el vector de velocidades.
    v = dtheta(indices(1))*Re;
    theta = theta(indices(1));
    r = r(indices(1));
end
