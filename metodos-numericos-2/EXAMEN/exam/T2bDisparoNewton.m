function [nodos, solaprox, t, iter ] = T2bDisparoNewton(funcion, a, b, alfa, beta, h, tol, maxiter)
    % Vector de nodos
    x = a:h:b;
    x = x(:);
  
    % Solución de los dos PVIs conjuntos
    t0 = 1;
    %t0 =(alfa-beta)/(b-a);
    [x, Y] = ode45 (funcion, x, [alfa, t0, 0, 1]'); % No hace falta cambiarlo.
    yb1 = Y(end, 1);  % Solución del primer PVI (y'')
    zb1 = Y(end, 3);  % Solución del segundo PVI (z'')

    % Inicialización del criterio de parada
    iter = 1; 
    incre = abs(yb1 - beta);

    while incre >tol && iter < maxiter
        % Aplicación del método de Newton
        t = t0 - (yb1 - beta)/(zb1);

        % Sucesivas iteraciones de los PVIs iterativos
        [x, Y] = ode45 (funcion, x, [alfa, t, 0, 1]');
        yb1 = Y(end ,1); 
        zb1 = Y(end ,3);

        % Se actualizan los criterios de parada
        iter = iter + 1;
        incre = abs(yb1 - beta);
        
        % Se actualizan la variables de cara a la posible nueva iteración
        t0 = t; 
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