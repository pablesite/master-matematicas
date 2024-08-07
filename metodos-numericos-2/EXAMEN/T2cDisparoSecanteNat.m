function [nodos, solaprox, t, iter, incre] = T2cDisparoSecanteNat(funcion, a, b, alfa, beta, h, tol, maxiter)
    % Vector de nodos
    x = a:h:b;  
    x = x(:);

    % Solución del primer PVI
    t0 = 1;
    [x, Y] = ode45(funcion, x, [alfa, t0]');
    yb0 = Y(end ,1); % u(b, t0)
    ypb0 = Y(end,2); % u'(b, t0) <----
    
    % Segunda iteración del PVI
    t1 = 2;
    [x, Y] = ode45(funcion, x, [alfa, t1]');
    yb1 = Y(end, 1); % u(b, t1)
    ypb1 = Y(end, 2);  %u'(b, t1) <----  
    
    % Inicialización del criterio de parada
    iter = 0; 
    incre = abs(yb1 - ypb1 - beta); % Criterio que debe satisfacer t <-----

    while incre >tol && iter < maxiter
        % Aplicación del método de Secante <---- (yb1 - ypb1 - beta - yb0 + ypb0 + beta))
        t = t1 - ((t1 - t0)*(yb1 - ypb1 - beta))./(yb1 - ypb1 - yb0 + ypb0); 
        
        % Sucesivas iteraciones del PVI iterativo
        [x, Y] = ode45 (funcion, x, [alfa, t]');
        
        % Se actualizan las variables de cara a la posible nueva iteración
        t0 = t1;  
        yb0 = yb1; 
        ypb0 = ypb1; %<----
        
        t1 = t; 
        yb1 = Y(end, 1);  % u(b,t2)
        ypb1 = Y(end, 2); % u'(b,t2) <----
        
        % Se actualizan los criterios de parada
        incre = abs(yb1 - ypb1 - beta); %<-----
        iter = iter + 1;
    end

    % Se devuelve la solución en caso de que la tolerancia sea ya
    % suficientemente baja.
    if incre <= tol
        nodos = x;
        solaprox = Y;
    else
        disp('Se necesitan más iteraciones')
    end
end
