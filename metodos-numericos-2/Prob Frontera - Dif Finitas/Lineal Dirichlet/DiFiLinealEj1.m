function [ x,y ] = DiFiLinealEj1 (p,q,r,a,b,alfa ,beta ,N)
    % Se resuelve un problema de frontera de segundo ordenlíneal con 
    % condiciones Dirichlet aplicando diferencias finitas

    % N es el numero de incognitas a resolver
    % Se tienen entonces N + 1 intervalos
    % Y por tanto, N + 2 nodos

    %% Se define el tamaño de paso y se perpara el vector de las xi
    h = (b-a)/(N+1);
    x = a:h:b;
    x = x(:);
    X = x(2:end-1); % x0 = x(1) = alfa ; x_N+1 = x(N+2) = beta
    
    %% Se evaluan las funciones p(xi), q(xi) y r(xi)
    px = feval(p, X);
    qx = feval(q, X);
    rx = feval(r, X);
    
    %% Se calculan las 3 diagonales
    dp =  2+h^2*qx;             % diagonal principal
    ds = -1+h/2*px(1:end-1);    % diagonal superior
    di = -1-h/2*px (2 :end);    % diagonal inferior
    d  = -h^2*rx;               % términos independientes
    d(1) = d(1)+(1+h/2*px(1))*alfa ; % el primer término independiente incluye alfa
    d(end) = d(end)+(1-h/2*px(end))*beta ; % el último término independiente incluye beta
    
    %% Se resuelve el sistema lineal usando Crout
    y = Crout(dp ,ds ,di ,d);
    y = [alfa;y;beta]; % La solución final tiene como primer resultado alfa y último beta.
end
