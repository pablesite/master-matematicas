function [x,y,Y1,Y2]=DisparoLineal(PVI1,PVI2,a,b,n,alfa,beta)
    % PVI1 y PVI2 son archivos .m donde definimos las funciones que
    % describen los dos problemas de valor incial.
    h=(b-a)/n;
    x=a:h:b;
    x=x(:);

    % Se pueden definir los dos problemas de valor incial dentro de esta
    % propia función, pero de esta manera no sería genérica.
    %PVI1 = @(x,u)[u(2);-2./x*u(2) +2./x.^2*u(1)+sin(log(x))./x.^2];
    %PVI2 = @(r,x)[x(2) ;-2./r*x(2) ];

    [x,Y1]=ode45(PVI1,x,[alfa,0]'); %Primer pvi
    [x,Y2]=ode45(PVI2,x,[0,1]');

    y=Y1(:,1)+((beta-Y1(end,1))/Y2(end,1))*Y2(:,1);
end