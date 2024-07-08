function [u,x,t] = ExplicitoMixtas(ci, cc2, a, b, Tmax, h, k)
    % Método explícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros x y t.
    x = a:h:b;
    t = 0:k:Tmax;
    
    % Número de pasos de la x.
    nx = (b-a)/h; % nx = (b-a)/h;
    % Número de pasos de la t.
    nt = (Tmax-0)/k; % nt = (Tmax-0)/k

    % Evaluación de las condiciones inicial y de contorno
    cix = feval(ci, x);
    cc2t = feval(cc2, t);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(:, 1) = cix';
    u(nx+1, :) = cc2t;
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
    u(nx+1, 1) = (cc2t(1)+cix(end))/2;
    
    % Condicion de estabilidad/convergencia
    lambda = k/h^2; % Notar que en este problema alpha es 1.

    if lambda > 1/2
        disp('No se cumple el criterio de convergencia.')
    else
        disp('El problema debe converger.')
    end
    
    % Resolución del método
    for j = 1:nt
        u(1, j+1) = (1-2*lambda+k*t(j)^2)*u(1,j) + 2*lambda *u(2,j) + k*x(1).*cos(x(1).*t(j))-lambda*2*h*t(j);
        u(2:nx-1, j+1) = (1-2*lambda+k*t(j)^2)*u(2:nx-1,j) + lambda*(u(3:nx,j)+u(1:nx-2,j)) + k*x(2:nx-1)'.*cos(x(2:nx-1)'.*t(j));
        u(nx, j+1) = lambda *u(nx-1,j) + (1-2*lambda+k*t(j)^2)*u(nx,j) + k*x(nx).*cos(x(nx).*t(j))+lambda*sin(t(j));
    end
end
