% Función a resolver en el Ejemplo 2 del tema 7
function [dy, df] = PVI_Ejemplo2(t, y)
    dy = (1 - 2*t)*y;
    df = 1 - 2*t;
end