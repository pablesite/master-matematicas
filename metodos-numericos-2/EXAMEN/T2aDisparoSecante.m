function [nodos, solaprox, t, iter] = T2aDisparoSecante(funcion, a, b, alfa, beta, t0, h, tol, maxiter)
    % Vector de nodos
    x = a:h:b;  
    x = x(:);

    % Solución del primer PVI
    [x, Y] = ode45 (funcion, x, [alfa, t0]');
    yb0 = Y(end ,1);

    % Primera iteración del PVI iterativo
    t1 = (beta - alfa)/(b-a);
    [x, Y] = ode45 (funcion, x, [alfa, t1]');
    yb1 = Y(end, 1);
    
    % Inicialización del criterio de parada
    iter = 1; 
    incre = abs(yb1 - beta);

    while incre > tol && iter < maxiter
        % Aplicación del método de Secante
        t = t1 - (t1 - t0)*(yb1 - beta)/(yb1 - yb0); 
        
        % Sucesivas iteraciones del PVI iterativo
        [x, Y] = ode45 (funcion, x, [alfa, t]');
        
        % Se actualizan los criterios de parada
        iter = iter + 1;
        incre = abs(Y(end, 1) - beta);
        
        % Se actualizan las variables de cara a la posible nueva iteración
        t0 = t1; 
        yb0 = yb1;
        t1 = t; 
        yb1 = Y(end, 1);
    end
    
    % Se devuelve la solución en caso de que la tolerancia sea ya
    % suficientemente baja.
    if incre <= tol
        nodos = x;
        solaprox = Y;
    else
        disp('Se necesitan más iteraciones ')
    end
end
