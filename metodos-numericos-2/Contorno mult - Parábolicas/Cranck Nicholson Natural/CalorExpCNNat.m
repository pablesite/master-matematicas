function [x, u] = CalorExpCNNat(ci,a,b,nx,Tmax,nt,alfa)
    % Método Cranck-Nicholson para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros
    h = (b-a)/nx;
    x = a:h:b;
    k = Tmax/nt;
    t = 0:k:Tmax;

    % Evaluación de las condiciones de contorno
    cix = feval (ci, x);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(:, 1) = cix'; % Ojo con este traspuesto
    
    % Lambda
    lambda = k*alfa^2/h^2;
    
    % Tridiagonal de A
    Ap = (1+lambda)*ones(nx+1,1);
    Ap(end) = 1+lambda+lambda*h;
    As = (-lambda/2)*ones(nx,1);
    Ai = As;
    As(1) = -lambda;
    Ai(end) = -lambda;
    
    % Matriz B
    Bp = (1-lambda)*ones(nx+1,1);
    Bp(end) = 1-lambda-lambda*h;
    Bs = (lambda/2)*ones(nx,1);
    Bi = Bs;
    Bs(1) = lambda;
    Bi(end) = lambda;
    
    B = diag(Bp)+diag(Bs,1)+diag(Bi,-1);
    
    % Resolución del método
    for j = 1:nt
        % Términos independientes
        D_ = B*u(1:nx+1,j);
        D = D_ + k/2*(exp(-t(j))+exp(-t(j+1)))*ones(nx+1,1);

        % Se resuelve el sistema usando Crout
        z = Crout(Ap, As, Ai, D);
        u(1:nx+1,j+1) = z;
    end
end
