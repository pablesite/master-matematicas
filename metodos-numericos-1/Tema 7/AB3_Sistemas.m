function [t, Y] = AB3_Sistemas(f, a, b, N, Y0)
% Código para resolver un PVI con el método de Adams-Bashfort de dos pasos
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);

    n = length(Y0);
    % Se inicia el vector solcuión y se añade la condición inicial
    Y = zeros(N+1, n);
    Y(1,:) = Y0;

    % Primer paso con el método de Heun

    for k = 1:2
        k1 = feval(f, t(k), Y(k,:));
        k2 = feval(f, t(k) + h/2, Y(k,:) + h/2*k1');
        k3 = feval(f, t(k) + h/2, Y(k,:) + h/2*k2');
        k4 = feval(f, t(k + 1), Y(k,:) + h*k3);
        Y(k + 1,:) = Y(k,:) + h*(k1' + 2*k2' + 2*k3' + k4')/6;
    end

    % Siguientes pasos con el método de AB2
    for k = 3:N
        k1 = feval(f, t(k), Y(k,:));
        k2 = feval(f, t(k - 1), Y(k - 1,:));
        k3 = feval(f, t(k - 2), Y(k - 2,:));
        Y(k + 1,:) = Y(k,:) + h*(23*k1' - 16*k2' + 5*k3')/12;
    end
end