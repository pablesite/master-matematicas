function [sol, iter, ACOC, incre1, incre2] = Traub(fun, x0, tol, maxiter)
    digits(200)
    x0 = x0(:);
    iter = 0;
    [fx0, dfx0] = feval(fun,x0);
    incre1 = tol + 1;
    incre2 = tol + 1;
    p = [];

    while(incre2 > tol && incre1 > tol && iter < maxiter)
        % Cálculo de Newton
        y = x0 - fx0/dfx0;
        [fy] = feval(fun, y);
        x1 = y - fy/dfx0;
        
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