% Función a resolver en el Ejemplo 1 del tema 7
function dy = PenduloPVI(t, theta)
    g = 9.81; L = 0.5;
    Y1 = theta(1); Y2 = theta(2);
    dy = [Y2; (g/L)*Y1];
end