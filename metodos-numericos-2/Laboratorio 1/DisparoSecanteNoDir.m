function [nodos, solaprox, t, iter, incre] = DisparoSecanteNoDir(sistema, a, b, alfa, beta, n, tol, maxiter)
    % Inicialización de los intervalos.
    h = (b-a)/(n); x = a:h:b; x = x(:);
    
    % PVI_1 para t0
    t0 = 0; % De acuerdo al enunciado
    [x, Y] = ode45 (sistema, x, [t0, t0 + alfa]');
    yb0 = Y(end, 1); % y(b,t0)
    ypb0 = Y(end, 2); % y'(b,t0)
    
    % PVI_1 para t1
    t1 = (beta-alfa)/(b-a); % Obtención de t1
    [x, Y] = ode45 (sistema, x, [t1, t1 + alfa]');
    yb1 = Y(end, 1); % y(b,t1)
    ypb1 = Y(end, 2); % y'(b,t1)  
    
    % Inicialización de los criterios de parada
    iter = 0; % Número de iteraciones
    incre = abs(ypb1+yb1-beta); % Criterio de parada del problema 
    
    while incre>tol && iter<maxiter
        % Se itera con el método de Secante, obteniendo un nuevo t.
        t = t1-((t1-t0)*(ypb1+yb1-beta))./(ypb1+yb1-ypb0-yb0); % Expresión de Secante del problema
        
        % PVI_1 para el nuevo t
        [x,Y] = ode45(sistema, x, [t, t + alfa]');
        
        % Actualización de los parámetros del tiempo t_k-1
        t0 = t1;  
        yb0 = yb1; 
        ypb0 = ypb1;
        
        % Actualización de los parámetros del tiempo t_k
        t1 = t; 
        yb1 = Y(end, 1); % y(b,t)
        ypb1 = Y(end, 2); % y'(b,t)
        
        % Actualización de los criterios de parada.
        incre = abs(ypb1+yb1-beta); % Criterio de parada del problema
        iter = iter+1;
    end
    
    % Si se ha cumplido el criterio de parada, entonces devuelve la
    % solución
    if incre <= tol
        nodos = x;
        solaprox = Y;
        else
        disp('se necesitan mas iteraciones ')
    end
end
