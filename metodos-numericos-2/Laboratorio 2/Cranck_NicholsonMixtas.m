function [u, x, t] = Cranck_NicholsonMixtas(ci, cc2, a, b, Tmax, h, k)
    % Método Cranck-Nicholson para la ecuación del calor con condiciones Naturales

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

    % Tridiagonal de A
    % La diagonal principal depende de j+1 -> Se define en el for.
    As = (-lambda/2)*ones(nx-1,1);
    Ai = As;
    As(1) = -lambda;
    
    % Matriz B
    % La diagonal principal depende de j -> Se define en el for.
    Bs = (lambda/2)*ones(nx-1,1);
    Bi = Bs;
    Bs(1) = lambda;
    
    % Resolución del método
    for j = 1:nt
        % Diagonal de A
        Ap = (1+lambda-k*t(j+1)^2/2)*ones(nx,1);
        % Diagonal de B
        Bp = (1-lambda+k*t(j)^2/2)*ones(nx,1);
        B = diag(Bp)+diag(Bs,1)+diag(Bi,-1);

        % Términos independientes
        Bu = B*u(1:nx,j);
        
        d(1) = k/2*(x(1)'.*cos(x(1)'.*t(j)) + x(1)'.*cos(x(1)'.*t(j+1))) - lambda*h*(t(j)+t(j+1));
        d(2:nx-1) = k/2*(x(2:nx-1)'.*cos(x(2:nx-1)'.*t(j)) + x(2:nx-1)'.*cos(x(2:nx-1)'.*t(j+1)));
        d(nx) = k/2*(x(nx)'.*cos(x(nx)'.*t(j)) + x(nx)'.*cos(x(nx)'.*t(j+1))) + lambda/2*(sin(t(j))+sin(t(j+1)));
        
        d = Bu + d;
        
        % Se resuelve el sistema usando Crout
        z = Crout(Ap, As, Ai, d);
        u(1:nx,j+1) = z;
    end
end
