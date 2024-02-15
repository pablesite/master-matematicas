function [x, iter, incre] = JSOR(A, b, x0, tol, maxiter)
    b = b(:);
    x0 = x0(:);
    iter = 0;
    incre = tol + 1; % Criterio de parada?


    d = diag(A);
    iD = diag(1./d);

    while iter < maxiter && incre > tol
        r = b - A*x0;
        x = x0 + w*iD*r;
        % Diferentes criterios de parada.
        %incre = norm(x - x0, inf);
        %incre = norm(b - A*x);
        %incre = norm(x - x0, inf)/norm(x, inf);
        incre = norm(x - x0, inf)/norm(x0, inf); % parada del Ejemplo 1

        iter = iter + 1;
        x0 = x;
    end

    if incre > tol
        disp('Necesito más iteraciones')
    end
end