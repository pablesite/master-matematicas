function [X, Y, iter, incr] = Difnolin(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol)
    % Se resuelve un problema de frontera de segundo orden NO líneal con 
    % condiciones Dirichlet aplicando diferencias finitas

    % f    = f   (x,y,y_p) es la ecuacion diferencial
    % fy   = fy  (x,y,y_p) es la derivada parcial de f respecto a y
    % fy_p = fy_p(x,y,y_p) es la derivada parcial de f respecto a y'= y_p;

    %% Se define el tamaño de paso y se prepara el vector de las xi
    % N es el numero de incognitas a resolver
    % Se tienen entonces N + 1 intervalos
    % Y por tanto, N + 2 nodos.
    h = (b-a)/(N+1); 
    k = (beta-alfa)/(N+1);
    X = a:h:b; 
    Y = alfa:k:beta;
    
    %% Se definen los vectores x e y sobre los que trabajar
    % Nótese que i = 0 -> alfa y N = i + 1 = beta (condiciones Dirichlet)
    x = X(2:end-1); 
    y = Y(2:end-1);

    %% Se inicializan las condiciones de parada
    incr = tol+1;
    iter = 0;

    %% Se arranca el bucle
    while incr>tol && iter<maxiter
        % Estimacion de la derivada por diferencias centrales
        y_p = (Y(3:N+2)-Y(1:N))/(2*h);

        % Se evaluan f, fy y fy_p
        fe    = feval (f,    x, y, y_p);
        fye   = feval (fy,   x, y, y_p);
        fy_pe = feval (fy_p, x, y, y_p);
        
        % Se calculan las 3 diagonales y los términos independientes
        ds = -1+h/2*fy_pe(1:end-1); % Diagonal superior
        dp =  2+h^2*fye;            % Diagonal principal
        di = -1-h/2*fy_pe(2:end);   % Diagonal inferior
        d  = -(-diff(Y,2)+h^2*fe);  % Términos independientes (se usa diff en vez de la aproximación en diferencias finitas)
        
        % Se resuelve el sistema lineal usando Crout
        z = Crout(dp, ds, di, d); 

        % Se calcula la siguiente iteración de la y.
        y = y+z'; % Se traspone la z para que quede un vector columna

        % Se construye la solución final incluyendo el valor inicial y el
        % final.
        Y = [alfa y beta];

        % Se actualizan los criterios de parada
        incr = max(abs(z));
        iter = iter+1;
    end

    % Vectores columna
    X = X(:);
    Y = Y(:);
end