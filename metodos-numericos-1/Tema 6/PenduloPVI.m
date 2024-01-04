% Función a resolver en el Ejemplo 2 del tema 6
function dy = PenduloPVI(t, theta)
    g = 9.8; L = 1;
    Y1 = theta(1); Y2 = theta(2);
    dy = [Y2; (g/L)*sin(Y1)];
end