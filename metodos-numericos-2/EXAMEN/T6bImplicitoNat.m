function [u, x] = T6bImplicitoNat(alfa, ci, a, b, nx, Tmax, nt)
    % Método implícito para la ecuación del calor con condiciones Naturales

    % Inicialización de parámetros
    h = (b-a)/nx;     x = a:h:b;
    k = Tmax/nt;      t = 0:k:Tmax;
    
    % Evaluación de las condiciones de contorno
    cix = feval(ci, x);

    % Valores iniciales de la solución
    u = zeros(nx+1,nt+1);
    u(:, 1) = cix';
    
    % Lambda
    lambda = alfa^2*k/h^2;
    
    % Tridiagonal del sistema lineal
    dp = (1+2*lambda)*ones(nx+1,1);
    ds = -lambda*ones(nx,1);
    di = ds; 
    
    dp(end) = (1+2*lambda+2*lambda*h);
    ds(1) = -2*lambda;
    di(end) = -2*lambda;
     
    for j = 2:nt+1
        % Términos independientes (general)
        d = u(1:nx+1,j-1)+k*exp(-t(j))*ones(nx+1,1);

        % Se resuelve el sistema usando Crout
        z = T6bCrout(dp,ds,di,d);
        u(1:nx+1,j) = z;
    end
end