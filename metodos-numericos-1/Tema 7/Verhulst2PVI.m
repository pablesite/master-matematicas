% Función a resolver en el Ejemplo 1 del tema 6
function [fun, dfun] = Verhulst2PVI(t, y)
    k = 3; p = 0.1;
    fun = (k - p*y).*y;
    dfun = k - 2*p*y;
end