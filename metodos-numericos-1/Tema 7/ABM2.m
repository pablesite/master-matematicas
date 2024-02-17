function [t, y] = ABM2(f, a, b, N, ya)
    h = (b - a)/N;
    t = a:h:b;
    t = t(:);
    y = zeros(N+1, 1);
    y(1) = ya;

    % Primer paso con el método de Heun
    k1 = h* feval(f, t(1), y(1));
    k2 = h* feval(f, t(2), y(1) + k1);
    y(2) = y(1) + k1/2 + k2/2;

    % Siguientes pasos con el método ABM2
    for k = 2:N
        % Predictor AB2
        k1 = feval(f, t(k), y(k));
        k2 = feval(f, t(k - 1), y(k - 1));
        yp = y(k) + h/2*(3*k1 - k2);
        % Corrector AM2
        y(k + 1) = y(k) + h/2*(feval(f, t(k+1), yp) + k1);
    end
end