function [nodos ,solaprox ,t,iter, incre ] = T2dDisparoNewtonNat(funcion, a, b, alfa, beta, h, tol, maxiter)
    % ru'' + u' = 0, x en [1, 3]
    % u''= -u'/r, x en [1, 3]
    % u(1) + u'(1) = 1 - 1/(2*ln(3))
    % u(3) + u'(3) = 0.5 - 1/(6*ln(3)) 

    % Vector de nodos
    x = a:h:b; 

    % Solución de los dos PVIs conjuntos
    t0 = (beta - alfa)/(b - a);
    [x, Y] = ode45(funcion, x, [t0, alfa - t0, 1, -1]'); %<-----
    yb1 = Y(end, 1); % u (3, t0) <----
    yb2 = Y(end, 2); % u'(3, t0) <----
    zb1 = Y(end, 3); % z (3, t0) <----
    zb2 = Y(end, 4); % z'(3, t0) <----
    
    % Inicialización del criterio de parada
    iter = 1; 
    incre = tol + 1;
    
    while incre > tol && iter < maxiter
        % Aplicación del método de Newton
        t = t0 - (yb1 + yb2 - beta)/(zb1 + zb2); % Método de Newton <-----

        % Sucesivas iteraciones de los PVIs iterativos
        [x,Y] = ode45(funcion, x, [t, alfa - t, 1, -1]'); %<-----
        yb1 = Y(end, 1); 
        yb2 = Y(end, 2);
        zb1 = Y(end, 3);
        zb2 = Y(end, 4);

        % Se actualizan los criterios de parada
        incre = abs(yb1 + yb2 - beta); %<------ |u(3, t1) - u'(3, t1) - beta| <= tol
        iter = iter + 1;

        % Se actualiza la variable de cara a la posible nueva iteración
        t0 = t; 
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