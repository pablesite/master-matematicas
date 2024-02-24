function [ai, bi, ci, di, p] = splineCubicoNatural(xi, fi)
    % Esta función se emplea para calcular el spline cúbico natural.
    % Salida:   ai = Coeficientes término grado 0
    %           bi = Coeficientes término grado 1
    %           ci = Coeficientes término grado 2
    %           di = Coeficientes término grado 3
    %           p = Spline cúbico natural

    xi = xi(:);
    fi = fi(:);
    
    n = length(xi);
    
    hi = xi(2:n) - xi(1:n - 1);
    ai = fi;
    
    dP = [1; 2*(hi(1:n - 2) + hi(2: n - 1)); 1];
    dS = [0; hi(2:n - 1)];
    dI = [hi(1:n - 2); 0];

    b = 3*[0; (ai(3:n) - ai(2:n - 1))./hi(2:n - 1) - (ai(2:n - 1) - ai(1:n - 2))./hi(1:n - 2); 0];
    ci = Crout(dP, dS, dI, b);
    bi = (ai(2:n) - ai(1:n - 1))./hi(1:n - 1) - hi(1:n - 1).*(2*ci(1:n - 1) + ci(2:n))/3;
    di = (ci(2:n) - ci(1: n - 1))./(3*hi(1:n - 1));
    
    ci = ci(1:n - 1);
    ai = ai(1:n - 1);
    
    syms x
    
    for i = 1:n - 1
        S(i) = ai(i) + bi(i)*(x - xi(i)) + ci(i)*(x - xi(i))^2 + di(i)*(x - xi(i))^3;
    end

    p = S(:);

end