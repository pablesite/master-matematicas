function [x, iter, incre] = SOR(A, b, x0, w, tol, maxiter)
    b = b(:);
    x0 = x0(:);
    x = x0;
    iter = 0;
    incre = tol + 1; % Criterio de parada?

    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    
    M = D + L;
    N = -U;

    while iter < maxiter && incre > tol
        d = b + N*x0;
        x(1) = d(1)/M(1, 1);
        for j = 2:length(d)
            x(j) = (d(j) - M(j, 1:j - 1)*x(1:j - 1))/M(j, j);
        end
        x = (1 - w)*x0 + w*x;
        % Diferentes criterios de parada.
        incre = norm(x - x0, inf);
        %incre = norm(b - A*x);
        %incre = norm(x - x0, inf)/norm(x, inf);
        %incre = norm(x - x0, inf)/norm(x0, inf); % parada del Ejemplo 1

        iter = iter + 1;
        x0 = x;
    end

    if incre > tol
        disp('Necesito más iteraciones')
    end
end