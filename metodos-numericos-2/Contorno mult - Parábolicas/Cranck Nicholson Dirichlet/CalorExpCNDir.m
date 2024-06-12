function [x, u] = CalorExpCNDir(cc2, cc1, ci, a, b, nx, Tmax, nt, alfa)
    % Método de Cranck-Nicholson para la ecuación del calor con condiciones Dirichlet
    
    % Inicialización de parámetros
    h = (b-a)/nx;
    x = a:h:b;
    k = Tmax/nt;
    t = 0:k:Tmax;
    
    % Evaluación de las condiciones iniciales y de contorno
    c1t = feval(cc1, t); 
    c2t = feval(cc2, t);
    cix = feval(ci, x);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(1, :) = c1t;
    u(nx+1, :) = c2t;
    u(:, 1) = cix;
    
    % Lambda
    lambda = k*alfa^2/h^2;
    
    % Tridiagonales A
    Ap = (1+lambda)*ones(nx-1,1);
    As = (-lambda/2)*ones(nx-2,1);
    Ai = As;
    
    % Matriz tridiagonal B
    Bp = (1-lambda)*ones(nx-1,1);
    Bs = (lambda/2)*ones(nx-2,1);
    Bi = Bs;
    B = diag(Bp)+diag(Bs, 1)+diag(Bi, -1);
    
    % Resolución del método
    for j = 1:nt
        % Términos independientes
        D = B*u(2:nx,j);

        % Se resuelve el sistema usando Crout
        z = Crout(Ap, As, Ai, D);
        u(2:nx,j+1) = z;
    end
end
