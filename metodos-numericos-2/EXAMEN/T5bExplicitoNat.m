function [u, x, t] = T5bExplicitoNat(alpha, ci, L, nx, Tmax, nt)
    % Método explícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros
    h = L/nx; 
    x = 0:h:L;
    k = Tmax/nt; 
    t = 0:k:Tmax;
    
    % Evaluación de las condiciones de contorno
    cix = feval (ci, x);

    % Valores iniciales de la solución
    u = zeros(nx + 1, nt + 1);
    u(:, 1) = cix';
    
    % Condicion de estabilidad / convergencia
    lambda = k*alpha ^2/h^2;

    if lambda > 1/2
        disp('No se cumple el criterio de convergencia.')
    else
        disp('El problema debe converger.')
    end
    
    % Resolución del método
    for j=1:nt
        u(1, j+1) = (1-2*lambda )*u(1,j) + 2*lambda *u(2,j) + k*exp(-t(j));
        u(2:nx, j+1) = (1-2*lambda)*u(2:nx,j) + lambda*(u(3:nx+1,j)+u(1:nx-1,j)) + k*exp(-t(j));
        u(nx+1, j+1) = (1-2*lambda*(1+h))*u(nx+1,j) + 2*lambda*u(nx, j) + k*exp(-t(j));
    end
end
