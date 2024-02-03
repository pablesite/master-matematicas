function [t, y] = AB2(f, a, b, N, y0)
% Código para resolver un PVI con el método de Adams-Bashfort de dos pasos
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);
    % Se inicia el vector solcuión y se añade la condición inicial
    y = zeros(N+1, 1);
    y(1) = y0;

    % Primer paso con el método de Heun
    k1 = h*feval(f, t(1), y(1));
    k2 = h*feval(f, t(2), y(1) + k1);
    y(2) = y(1) + (k1 + k2)/2;

    % Siguientes pasos con el método de AB2
    for k = 2:N
        k1 = feval(f, t(k), y(k));
        k2 = feval(f, t(k - 1), y(k - 1));
        y(k + 1) = y(k) + h*(3*k1 - k2)/2;
    end
end