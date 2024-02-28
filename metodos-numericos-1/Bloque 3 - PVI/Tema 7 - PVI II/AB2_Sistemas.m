function [t, Y] = AB2_Sistemas(f, a, b, N, Y0)
% Código para resolver un PVI con el método de Adams-Bashfort de dos pasos
    % Tamaño de paso
    h = (b - a)/N
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);

    n = length(Y0);
    % Se inicia el vector solcuión y se añade la condición inicial
    Y = zeros(N+1, n);
    Y(1,:) = Y0;

    % Primer paso con el método de Heun
    k1 = h*feval(f, t(1), Y(1,:));
    k2 = h*feval(f, t(2), Y(1,:) + k1');
    Y(2,:) = Y(1,:) + (k1' + k2')/2;

    % Siguientes pasos con el método de AB2
    for k = 2:N
        k1 = feval(f, t(k), Y(k,:));
        k2 = feval(f, t(k - 1), Y(k - 1,:));
        Y(k + 1,:) = Y(k,:) + h*(3*k1' - k2')/2;
    end
end