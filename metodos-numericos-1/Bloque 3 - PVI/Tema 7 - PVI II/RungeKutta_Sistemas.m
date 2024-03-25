function [t, Y] = RungeKutta_Sistemas(f, a, b, N, Ya)
% Código para resolver un PVI con el método de Heun
    % Tamaño de paso
    h = (b - a)/N;
    % Se discretiza la variable temporal
    t = a:h:b;
    t = t(:);
    % Se inicia el vector solcuión y se añade la condición inicial
    Y = zeros(N + 1, length(Ya));
    Y(1,:) = Ya;
    for k = 1:N
        k1(1,:) = feval(f, t(k), Y(k,:));
        k2(1,:) = feval(f, t(k) + h/2, Y(k,:) + h/2*k1);
        k3(1,:) = feval(f, t(k) + h/2, Y(k,:) + h/2*k2);
        k4(1,:) = feval(f, t(k + 1), Y(k,:) + h*k3);
        Y(k + 1,:) = Y(k,:) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    end
end