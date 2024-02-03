function [t, y] = AM3(f, a, b, N, ya)
    h = (b - a)/N;
    t = a:h:b;
    t = t(:);
    y = zeros(N+1, 1);
    y(1) = ya;
    
    % Variables para limitar el proceso iterativo.
    tol = 1e-6; max_iter = 10;

    % Primer paso con el método de Heun
    k1 = h* feval(f, t(1), y(1));
    k2 = h* feval(f, t(2), y(1) + k1);
    y(2) = y(1) + k1/2 + k2/2;

    % Siguientes pasos con el método AM3
    for k = 2:N
        ff = feval(f, t(k), y(k));
        k1 = feval(f, t(k - 1), y(k - 1));
        % Método de Newton
        iter = 1; dif = tol + 1;
        x0 = y(k);

        while (iter < max_iter && dif > tol)
            [fx0, dfx0] = feval(f, t(k+1), x0);
            g = x0 - y(k) - h/12*(-k1 + 8*ff + 5*fx0);
            dg = 1 - h/12*5*dfx0;
            x1 = x0 - g/dg;

            dif = abs(x1 - x0);
            iter = iter + 1;
            x0 = x1;
        end
        y(k + 1) = y(k) + h/12*(-k1 + 8*ff + 5* feval(f, t(k+1), x0));
    end
end