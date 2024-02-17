% Función a resolver en el Ejemplo 3 del tema 7
function [dy, df] = PVI_rigidos(t, y)
    dy = -1000*y + 3000 - 2000*exp(t);
    df = -1000;
end