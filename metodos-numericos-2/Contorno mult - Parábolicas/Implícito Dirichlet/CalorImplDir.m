function [u, x] = CalorImplDir(alfa, ci, cc1, cc2, a, b, nx, Tmax, nt)
    % Método implícito para la ecuación del calor con condiciones Dirichlet
    
    % Inicialización de parámetros
    h = (b-a)/nx;     x = a:h:b;
    k = Tmax/nt;      t = 0:k:Tmax;
    
    % Evaluación de las condiciones iniciales y de contorno
    c1t = feval(cc1,t); 
    c2t = feval(cc2,t);
    cix = feval(ci, x);

    % Valores iniciales de la solución
    u = zeros(nx+1, nt+1);
    u(1, :) = c1t;
    u(nx+1,:) = c2t; 
    u(:, 1) = cix';
    % En caso de que las condiciones iniciales y de contorno no sean consistentes
    u(1, 1) = (c1t(1)+cix(1))/2;  
    u(end, 1) = (c2t(1)+cix(end))/2; 
    
    % Lambda
    lambda = alfa^2*k/h^2;
    
    % Tridiagonal del sistema lineal
    dp = (1+2*lambda)*ones(nx-1, 1);
    ds = -lambda*ones(nx-2, 1);
    di = ds;  
    
    for j = 2:nt+1
        % Términos independientes (general)
        d = u(2:nx,j-1); 
        % Particularización para el primero y el último.
        d(1) = d(1)+lambda*u(1, j-1); %
        d(end) = d(end)+lambda*u(nx+1, j-1);   
        
        % Se resuelve el sistema usando Crout
        z = Crout(dp, ds, di, d);
        u(2:nx,j) = z;
    end
end