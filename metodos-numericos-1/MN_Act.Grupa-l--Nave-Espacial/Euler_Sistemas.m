function [t, Y] = Euler_Sistemas(f, a, b, N, Ya)
% Código para resolver un PVI con el método de Euler en un sistema
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);
    % Se inicia el vector solcuión y se añade la condición inicial
    Y = zeros(N + 1, length(Ya));
    Y(1,:) = Ya;
    for k = 1:N
        Y(k + 1, :) = Y(k,:) + h*feval(f, t(k), Y(k,:))'; 
    end
end