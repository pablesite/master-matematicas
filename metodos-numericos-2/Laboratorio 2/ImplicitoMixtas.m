function [u, x, t] = ImplicitoMixtas(ci, cc2, a, b, Tmax, h, k)
    % Método implícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros x y t.
    x = a:h:b;
    t = 0:k:Tmax;
    
    % Número de pasos de la x.
    nx = (b-a)/h; % nx = (b-a)/h;
    % Número de pasos de la t.
    nt = (Tmax-0)/k; % nt = (Tmax-0)/k
    
    % Evaluación de las condiciones de contorno
    cix = feval(ci, x);
    cc2t = feval(cc2, t);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(:, 1) = cix';
    u(nx+1, :) = cc2t;
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
    u(nx+1, 1) = (cc2t(1)+cix(end))/2;
    
    % Lambda
    lambda = k/h^2; % Notar que en este problema alpha es 1.
    
    % Tridiagonal del sistema lineal
    % La diagonal principal depende de j. Está en el bucle
    As = -lambda*ones(nx-1,1);
    Ai = As;
    As(1) = -2*lambda;
     
    for j = 2:nt+1
        % Diagonal principal del sistema lineal
        Ap = (1+2*lambda-k*t(j)^2)*ones(nx,1);

        % Términos independientes (general)
        d(1) = u(1,j-1)+k*x(1)'.*cos(x(1)'.*t(j))-2*lambda*h*t(j);
        d(2:nx-1) = u(2:nx-1,j-1)+k*x(2:nx-1)'.*cos(x(2:nx-1)'.*t(j));
        d(nx) = u(nx,j-1)+k*x(nx)'.*cos(x(nx)'.*t(j))+lambda*sin(t(j));

        % Se resuelve el sistema usando Crout
        z = Crout(Ap,As,Ai,d);
        u(1:nx,j) = z;
    end
end