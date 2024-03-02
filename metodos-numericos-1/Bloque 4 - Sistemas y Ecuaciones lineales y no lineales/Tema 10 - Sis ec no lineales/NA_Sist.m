function [sol, iter, ACOC, incre1, incre2] = RN_Sist(F, x0, tol, maxiter)
    % Creo que no funciona bien y no se por qué.
    digits(200)
    x0 = x0(:);
    iter = 1;
    [Fx, dFx] = feval(F,x0);
    incre1 = tol + 1;
    incre2 = tol + 1;
    p = [];

    a = (-1 - sqrt(5)/2); b = (3 + sqrt(5)/2);
    while(incre2 > tol && incre1 > tol && iter < maxiter)
    %while (incre1 + incre2 > tol && iter < maxiter)
        % Cálculo de RN
        
        y = x0 - a*dFx\Fx;

        [Fy, dFy] = feval(F, y);
        z = x0 - b*dFx\Fy;
        
        [Fz, dFz] = feval(F, z);
        x = z - dFx\Fz;


        % Actualizo criterio de parada
        incre1 = norm(x - x0);
        p = [p incre1];
        x0 = x;
        % Actualizo la evaluación de la función
        [Fx, dFx] = feval(F,x0);
        incre2 = norm(Fx);
        iter = iter + 1;
    end
    
    iter = iter - 1;
    % Cálculo del ACOC
    if length(p) > 2
        sol = x;
        ACOC = log(p(3:end)./p(2:end - 1))./log(p(2:end - 1)./p(1:end - 2));
    else
        disp('necesito más iteraciones')
    end
    
    incre1 = vpa(incre1, 6);
    incre2 = vpa(incre2, 6);
    ACOC = vpa(ACOC, 6);
    ACOC = ACOC(:);
    sol = vpa(sol, 10);
end