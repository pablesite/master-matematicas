function [sol, iter, ACOC, incre1, incre2] = Jarratt(fun, x0, tol, maxiter)
    % Método de Jarrat es óptimo porque se cumple que
    % p = 2^(d-1) dónde p es el orden (4) y d es el número
    % de evaluaciones (en este caso 3).
    digits(200)
    x0 = x0(:);
    iter = 0;
    [fx0, dfx0] = feval(fun,x0);
    incre1 = tol + 1;
    incre2 = tol + 1;
    p = [];

    while(incre2 > tol && incre1 > tol && iter < maxiter)
        % Cálculo de Jarrat
        y = x0 - 2/3*(fx0/dfx0);
        [fy, dfy] = feval(fun, y);
        x1 = x0 - 1/2*((3*dfy + dfx0)/(3*dfy - dfx0))*(fx0/dfx0);
        
        % Actualizo criterio de parada
        incre1 = norm(x1 - x0);
        p = [p incre1];
        x0 = x1;
        % Actualizo la evaluación de la función
        [fx0, dfx0] = feval(fun,x0);
        incre2 = norm(fx0);
        iter = iter + 1;
    end

    % Cálculo del ACOC (Orden de convergencia computacional)
    ACOC = log(p(3:end)./p(2:end - 1))./log(p(2:end - 1)./p(1:end - 2));
    sol = x1;
    incre1 = vpa(incre1, 6);
    incre2 = vpa(incre2, 6);
    ACOC = vpa(ACOC, 6);
    ACOC = ACOC(:);
    sol = vpa(sol, 10);
end