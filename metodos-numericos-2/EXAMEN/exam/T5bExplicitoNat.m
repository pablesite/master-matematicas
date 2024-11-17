function [u, x, t] = T5bExplicitoNat(alpha, cc1, cc2, ci, L, nx, Tmax, nt)
    % Método explícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros
    h = L/nx; 
    x = 0:h:L;
    k = Tmax/nt; 
    t = 0:k:Tmax;
    
    % Evaluación de las condiciones de contorno
    cix = feval (ci, x);

    c1t = feval(cc1,t); 
    c2t = feval(cc2,t);

    % Valores iniciales de la solución
    u = zeros(nx + 1, nt + 1);
    u(:, 1) = cix';
    u(1, :) = c1t;
    u(nx+1,:) = c2t; 
    
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
    u(1, 1) = (c1t(1)+cix(1))/2;  
    u(end, 1) = (c2t(1)+cix(end))/2; 
    
    % Condicion de estabilidad / convergencia
    lambda = k*alpha ^2/h^2;

    if lambda > 1/2
        disp('No se cumple el criterio de convergencia.')
    else
        disp('El problema debe converger.')
    end
    
    % Resolución del método
    for j=1:nt
        u(1, j+1) = (1-2*lambda+2*h)*u(1,j) + 2*lambda *u(2,j) - 2*h*lambda*c1t(1);
        u(2:nx, j+1) = (1-2*lambda)*u(2:nx,j) + lambda*(u(3:nx+1,j)+u(1:nx-1,j));
        u(nx+1, j+1) = (1-2*lambda+h*lambda)*u(nx+1,j) + 2*lambda*u(nx, j) - h*lambda*lambda*c2t(nx+1);
    end
end
