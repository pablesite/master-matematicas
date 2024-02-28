function I = trapeciosDatos(f, a, b, n)
    % I = trapeciosDatos(f, a, b, n) obtiene la integral de f(x) con datos
    % tabulados con la fórmula de trapecios compuesta
    h = (b - a)/n;
    pesos = [1, 2*ones(1, n - 1), 1];
    I = h/2*sum(pesos.*f);
end