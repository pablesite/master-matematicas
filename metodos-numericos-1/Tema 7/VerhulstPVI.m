% Función a resolver en el Ejemplo 1 del tema 6
function dy = VerhulstPVI(t, y)
    k = 3;
    p = 0.1;
    dy = (k - p*y).*y;
end