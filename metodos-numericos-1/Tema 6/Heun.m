function [t, y] = Heun(f, a, b, N, y0)
% Código para resolver un PVI con el método de Heun
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);
    % Se inicia el vector solcuión y se añade la condición inicial
    y = zeros(N+1, 1)
    y(1) = y0;
    for k = 1:N
        k1 = h*feval(f, t(k), y(k));
        k2 = h*feval(f, t(k+1), y(k) + k1);
        y(k + 1) = y(k) + (k1 + k2)/2;
    end
end