function [sol, iter, ACOC, incre1, incre2] = RN_Sist(F, x0, tol, maxiter)
    digits(200)
    x0 = x0(:);
    iter = 1;
    [Fx, dFx] = feval(F,x0);
    incre1 = tol + 1;
    incre2 = tol + 1;
    p = [];

    while (incre1 + incre2 > tol && iter < maxiter)
        % Cálculo de RN
        u = dFx\Fx;
        z = x0 - 2/3*u;
        
        [Fz, dFz] = feval(F, z);
        w = (3 * dFz - dFx)\(3*dFz + dFx);

        y = x0 -1/2*(w)*u;

        [Fy, dFy] = feval(F, y);
        x = y - dFy\Fy; % Para el JN
        
        %a = -0.5; b = 1.5;
        %x = y - (a*dFx - b*dFz)\Fy; % Para el RN

        
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