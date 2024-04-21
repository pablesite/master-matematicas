function [nodos, solaprox, t, iter, incre] = DisparoNewtonNoDir(sistema, a, b, alfa, beta, n, tol, maxiter)
    % Inicialización de los intervalos.
    h = (b-a)/(n); x = a:h:b; x = x(:);

    % PVI_1 + PVI_2 para t0
    t0 = 0; % De acuerdo al enunciado
    [x, Y] = ode45(sistema, x, [t0, t0 + alfa, 1, 1]');
    yp1 = Y(end, 1); % y1'(b,t0)
    yp2 = Y(end, 2); % y2'(b,t0)
    zp1 = Y(end, 3); % z1'(b,t0) 
    zp2 = Y(end, 4); % z2'(b,t0)

    % Inicialización de los criterios de parada
    iter = 0; % Número de iteraciones
    incre = abs(yp2+yp1-beta); % Criterio de parada del problema 
    
    while incre > tol && iter < maxiter
        % Se itera con el método de Newton, obteniendo un nuevo t.
        t = t0-(yp2+yp1-beta)./(zp2+zp1); % Expresión de Newton del problema

        % PVI_1 + PVI_2 para el nuevo t
        [x, Y] = ode45(sistema, x, [t, t + alfa, 1, 1]');

        % Actualización de los parámetros del tiempo t_k
        t0 = t; 
        yp1 = Y(end, 1); 
        yp2 = Y(end, 2);
        zp1 = Y(end, 3);
        zp2 = Y(end, 4);

        % Actualización de los criterios de parada.
        incre = abs(yp2+yp1-beta); % Criterio de parada del problema
        iter = iter + 1;
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