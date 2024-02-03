function [t, y] = AB3(f, a, b, N, y0)
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

    for k = 1:2
        k1 = feval(f, t(k), y(k));
        k2 = feval(f, t(k) + h/2, y(k) + h/2*k1);
        k3 = feval(f, t(k) + h/2, y(k) + h/2*k2);
        k4 = feval(f, t(k + 1), y(k) + h*k3);
        y(k + 1) = y(k) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    end

    % Siguientes pasos con el método de AB3
    for k = 3:N
        k1 = feval(f, t(k), y(k));
        k2 = feval(f, t(k - 1), y(k - 1));
        k3 = feval(f, t(k - 2), y(k - 2));
        y(k + 1) = y(k) + h*(23*k1 - 16*k2 + 5*k3)/12;
    end
end