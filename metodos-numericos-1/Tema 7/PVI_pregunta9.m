% Función a resolver en el Ejemplo 3 del tema 7
function [dy, df] = PVI_pregunta9(t, y)
    dy = y - t^2 + 1;
    df = 1
end