function I = simpsonDatos(f, a, b, n)
    % I = simpson(f, a, b, n) obtiene la integral de f(x) con datos tabulados 
    % con la fórmula de Simpson compuesta
    h = (b - a)/n;
    pesos = ones(1, n + 1);
    pesos(2:2:n) = 4; pesos(3:2:n-1) = 2;
    I = h/3*sum(pesos.*f);
end