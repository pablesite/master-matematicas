function [sol,iter,ACOC,incre1,incre2] = Trapecios_Sist2(F,x0,tol,maxit)
digits(200);
% Inicializacion de las variables

x0=x0(:);
[Fx0,dFx0]=feval(F,x0); % Evaluamos F(x0) y F'(x0)

iter=1;
incre1=tol+1; % Criterio de parada 1: incre1<=tol
incre2=tol+1; % Criterio de parada 2: incre2<=tol
while incre1>tol && incre2>tol && iter<maxit
    % Metodo de TRAPECIOS
    u=dFx0\Fx0; % u=dFx^-1/Fx
    y0=x0-u;
    [~,dFy0]=feval(F,y0);
    v=(dFx0+dFy0)\Fx0;
    x1=x0-2*v;
    
    %vpa(x,5);
    incre1=norm(x1-x0);
    %incX=vpa(incre1,5)
    I(iter)=incre1;
    
    % Actualizacion de la estimacion inicial
    x0=x1;
    [Fx0,dFx0]=feval(F,x0);
    incre2=norm(Fx0);
    %incF=vpa(incre2,5)
    %pause
    iter=iter+1;
end

iter=iter-1;
if length(I)>2
    sol=x1;
    ACOC=log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
else
    disp('necesito mas iteraciones')
end

sol=vpa(sol);
incre1=vpa(incre1);
incre2=vpa(incre2);
ACOC=vpa(ACOC);
end

