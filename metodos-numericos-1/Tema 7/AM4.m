function [t, y] = AM4(f, a, b, N, ya)
    h = (b - a)/N;
    t = a:h:b;
    t = t(:);
    y = zeros(N+1, 1);
    y(1) = ya;
    
    % Variables para limitar el proceso iterativo.
    tol = 1e-6; max_iter = 10;

    % Primer paso con el método de Runge-Kutta
    for k = 1:2
        k1 = feval(f, t(k), y(k));
        k2 = feval(f, t(k) + h/2, y(k) + h/2*k1);
        k3 = feval(f, t(k) + h/2, y(k) + h/2*k2);
        k4 = feval(f, t(k + 1), y(k) + h*k3);
        y(k + 1) = y(k) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    end

    % Siguientes pasos con el método AM4
    for k = 3:N
        ff = feval(f, t(k), y(k));
        k1 = feval(f, t(k - 1), y(k - 1));
        k2 = feval(f, t(k - 2), y(k - 2));

        % Método de Newton
        iter = 1; dif = tol + 1;
        x0 = y(k);
        while (iter < max_iter && dif > tol)
            [fx0, dfx0] = feval(f, t(k+1), x0);
            g = x0 - y(k) - h/24*(k2 - 5*k1 + 19*ff + 9*fx0);
            dg = 1 - h/24*9*dfx0;
            x1 = x0 - g/dg;

            dif = abs(x1 - x0);
            iter = iter + 1;
            x0 = x1;
        end
        
        y(k + 1) = y(k) + h/24*(k2 - 5*k1 + 19*ff + 9*feval(f, t(k+1), x0));
    end
end