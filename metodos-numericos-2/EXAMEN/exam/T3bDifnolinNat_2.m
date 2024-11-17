function [X, Y, iter, incr ] = T3bDifnolinNat_2(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol)

    % Se resuelve un problema de frontera de segundo orden NO líneal con 
    % condiciones Naturales aplicando diferencias finitas

    % f    = f   (x,y,y_p) es la ecuacion diferencial
    % fy   = fy  (x,y,y_p) es la derivada parcial de f respecto a y
    % fy_p = fy_p(x,y,y_p) es la derivada parcial de f respecto a y'= y_p;
    
    %% Se define el tamaño de paso y se prepara el vector de las xi
    % N es el numero de incognitas a resolver
    % Se tienen entonces N + 1 intervalos
    % Y por tanto, N + 2 nodos.
    h = (b-a)/(N+1); 
    k = (beta-alfa)/(N+1); %<- PROBLEMA
    X = a:h:b; 
    Y = alfa:k:beta; %<- PROBLEMA 

    %% Se definen los vectores x e y sobre los que trabajar
    % Nótese que se escoge el vector entero dado que ahora las condiciones son Naturales)
    x = X(1:N+2); 
    y = Y(1:N+2);

    %% Se inicializan las condiciones de parada
    incr = tol+1; % Inicializar parametros
    iter = 0;

    %% Se arranca el bucle
    while incr >tol && iter < maxiter
        % Estimacion de la derivada por diferencias centrales
        y_p = (Y(3:N+2)-Y(1:N))/(2*h);
        y_p = [-alfa-Y(1) y_p (-Y(end)/2+beta)]; % CAMBIAR

        % Se evaluan f, fy y fy_p
        fe    = feval (f,    x, y, y_p);
        fye   = feval (fy,   x, y, y_p);
        fy_pe = feval (fy_p, x, y, y_p);

        % Se calculan las 3 diagonales y los términos independientes
        % Diagonal principal
        dp = 2+h^2*fye;                                 
        dp(1) = 2*(1-h)+h^2*fye(1)-h^2*fy_pe(1);
        dp(end) = (2-h)+h^2*fye(end)-1/2*h^2*fy_pe(end);

        % Diagonal superior
        ds = -1+h/2*fy_pe(1:end-1);
        ds(1) = -2;
        
        % Diagonal inferior
        di = -1-h/2*fy_pe(2:end);
        di(end) = -2;
        
        % Términos independientes (se usa diff en vez de la aproximación en diferencias finitas)
        d(2:N+1) = -(-diff(Y,2)+h^2*fe(2:N+1));
        %d(2:N+1) = -(-y(1:N)+2*y(2:N+1)-y(3:N+2)+h^2*fe(2:N+1));
        d(1) = 2*(1-h)*y(1)-2*y(2)+h^2*fe(1)-2*h*alfa;
        d(1) = -d(1);
        
        d(N+2) = -2*y(N+1)+(2+h)*y(N+2)+h^2*fe(N+2)-2*beta*h;
        d(N+2) = -d(N+2);
        
        % Se resuelve el sistema lineal usando Crout
        z = T3bCrout(dp,ds,di,d);

        % Se calcula la siguiente iteración de la y.
        y = y+z'; % Se traspone la z para que quede un vector columna

        % Se construye la solución final (No hace falta añadir nada más por
        % ser condiciones Naturales
        Y = y;

        % Se actualizan los criterios de parada
        incr = max(abs(z));
        iter = iter +1;
    end

    % Vectores columna
    X = X(:);
    Y = Y(:);
end