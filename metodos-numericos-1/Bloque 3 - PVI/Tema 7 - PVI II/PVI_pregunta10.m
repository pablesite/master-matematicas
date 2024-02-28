% Función a resolver en el Ejemplo 3 del tema 7
function [dy, df] = PVI_pregunta10(t, y)
    dy = 1 + 1/t*y + (1/(t^2))*y^2;
    df = 1/t + 1/(t^2);
end