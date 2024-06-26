function [x,y] = DiFiLinealEj2(a, b, alfa, beta, N)
    % Se resuelve un problema de frontera de segundo orden líneal con 
    % condiciones Naturales aplicando diferencias finitas

    % N es el numero de incognitas a resolver
    % Se tienen entonces N + 1 intervalos
    % Y por tanto, N + 2 nodos

    %% Se define el tamaño de paso y se prepara el vector de las xi
    h = (b-a)/(N+1);
    x = a:h:b;
    x = x(:);
    
    %% Se calculan las 3 diagonales
    %% Diagonal superior
    % Forma general
    ds = x(1:end-1)+h/2; % Va de x(0) a x(N)
    % Se obtiene de la cond. inicial evaluada en a. Corresponde a la
    % componente y(1)
    ds(1) = 2*x(1);
 
    %% Diagonal principal
    % Forma general
    dp = -2*x(1:end); % Va de x(0) a x(N+1)
    % Se obtiene de la cond. inicial evaluada en a. Corresponde a la
    % componente y(0)
    dp(1) = 2*h*x(1)-h^2-2*x(1); 
    % Se obtiene de la cond. inicial evaluada en b. Corresponde a la
    % componente y(N+1)
    dp(end) = -h^2 -2*h*x(end) -2*x(end) ; %Cambiar

    %% Diagonal principal
    % Forma general
    di = x(2:end)-h/2; % Va de x(1) a x(N+1)
    % Se obtiene de la cond. inicial evaluada en b. Corresponde a la
    % componente y(N)
    di(end) = 2*x(end) ; % subdiagonal de A %Cambiar
    
    %% Términos independientes
    % Forma general
    d = zeros(N+2,1); % Va de x(0) a x(N+1)
    % Se obtiene de la cond. inicial evaluada en a. Corresponde al término
    % independiente
    d(1) = 2*h*alfa*(x(1)-h/2);
    % Se obtiene de la cond. inicial evaluada en b. Corresponde al término
    % independiente
    d(end) = -2*h*beta*(x(end)+h/2); %Cambiar
    
    %% Se resuelve el sistema lineal usando Crout
    y = Crout(dp, ds, di, d); %<-- x=A\d (Esto sería aplicando Gauss)

end