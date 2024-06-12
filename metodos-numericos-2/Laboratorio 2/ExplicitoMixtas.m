function [u,x,t] = ExplicitoMixtas(alpha ,ci, h2, L,nx ,Tmax ,nt)
    % Método explícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros
    h = L/nx; 
    x = 0:h:L;
    k = Tmax/nt; 
    t = 0:k:Tmax;
    
    % Evaluación de las condiciones de contorno
    cix = feval (ci, x);
    c2t = feval(h2, t);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(:, 1) = cix';
    u(nx+1, :) = c2t;
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
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
        u(1, j+1) = (1-2*lambda+k*t(j))*u(1,j) + 2*lambda *u(2,j) + k*x(1).*cos(x(1).*t(j))-lambda*2*h*t(j);
        u(2:nx, j+1) = (1-2*lambda+k*t(j))*u(2:nx,j) + lambda*(u(3:nx+1,j)+u(1:nx-1,j)) + k*x(2:nx)'.*cos(x(2:nx)'.*t(j));
    end
end
