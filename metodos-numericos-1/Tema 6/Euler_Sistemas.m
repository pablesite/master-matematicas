function [t, Y] = Euler_Sistemas(f, a, b, N, Ya)
% Código para resolver un PVI con el método de Euler en un sistema
    h = (b - a)/N;
    t = a:h:b;
    t = t(:);
    Y = zeros(N + 1, length(Ya));
    Y(1,:) = Ya;
    for k = 1:N
        Y(k + 1, :) = Y(k,:) + h*feval(f, t(k), Y(k,:))'; 
        % Este último vector será traspuesto o no dependiendo cómo defina luego las funciones del sistema.
        % Si las defino en de tipo fila (con ';', añadiendo columnas para cada
        % variable del sistema), entonces sí que sería traspuesta. Pero si
        % las defino de tipo columna (con ',', todas las variables del sistema en la misma columna)
        % creo que no debería hacer falta trasponer. COMPROBAR
    end
end