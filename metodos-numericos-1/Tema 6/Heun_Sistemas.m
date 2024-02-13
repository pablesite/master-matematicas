function [t, Y] = Heun_Sistemas(f, a, b, N, Ya)
% Código para resolver un PVI con el método de Heun en un sistema
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);
    % Se inicia el vector solcuión y se añade la condición inicial
    Y = zeros(N+1, length(Ya));
    Y(1,:) = Ya;
    for k = 1:N
        k1(1,:) = h*feval(f, t(k), Y(k,:));
        k2(1,:) = h*feval(f, t(k+1), Y(k,:) + k1);
        Y(k + 1,:) = Y(k,:) + (k1 + k2)/2;
    end
end