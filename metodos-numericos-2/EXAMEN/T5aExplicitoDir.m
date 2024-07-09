function [u, x, t] = T5aExplicitoDir(alpha, ci, h1, h2, L, nx, Tmax, nt)
    % Método explícito para la ecuación del calor con condiciones Dirichlet
    
    % Inicialización de parámetros
    h = L/nx; 
    x = 0:h:L;
    k = Tmax/nt; 
    t = 0:k:Tmax;
    
    % Evaluación de las condiciones iniciales y de contorno
    cix = feval(ci, x);
    c1t = feval(h1, t); 
    c2t = feval(h2, t);
    
    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(1, :) = c1t; 
    u(nx + 1, :) = c2t;
    u(:, 1) = cix';
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
    u(1, 1) = (c1t(1) + cix(1))/2;  
    u(end, 1) = (c2t(1) + cix(end))/2;

    % Condicion de estabilidad / convergencia
    lambda = k*alpha^2/h^2;
    
    if lambda > 1/2
        disp('No se cumple el criterio de convergencia.')
    else
        disp('El problema debe converger.')
    end
    
    % Resolución del método
    for j = 1:nt
        for i = 2:nx %(i = 1, ..., nx-1) % i = 0 y i = nx
            u(i, j+1) = (1-2*lambda)*u(i, j) + lambda*(u(i+1,j) + u(i-1, j));
        end
    end
end