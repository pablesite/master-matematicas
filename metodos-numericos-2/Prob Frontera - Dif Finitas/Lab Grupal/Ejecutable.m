clear all; close all;
%% Se ejecuta el método de Diferencias Finitas para un problema NO líneal con condiciones Naturales

for i=1:1000
    %% Se define la función y'' y sus derivadas parciales en y' y en xx
    f    = @(x, y, y_p) -y_p.^2+4*y+2;    % Ecuación diferencial de segundo orden
    fy   = @(x, y, y_p)  4+0*y;                 % Derivada parcial de f respecto a y
    fy_p = @(x, y, y_p) -2.*y_p;             % Derivada parcial de f respecto a y' = y_p;

    %% Se establecen los parámetros iniciales
    a = 1; b = 2; alfa = 0; beta = -3; N = 99; % El número de subintervalos es 100.
    maxiter = 50; tol = 1e-6; % Condiciones de parada

    tic;
    [Xc, Yc, iterc, incrc] = DifnolinNat(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);
    croutTime(i) = toc;
    clear f fy fy_p a b alfa beta N maxiter tol Xc Yc iterc incrc;
end
croutTime_ = mean(croutTime)

for i=1:1000
    
    %% Se define la función y'' y sus derivadas parciales en y' y en xx
    f    = @(x, y, y_p) -y_p.^2+4*y+2;    % Ecuación diferencial de segundo orden
    fy   = @(x, y, y_p)  4+0*y;                 % Derivada parcial de f respecto a y
    fy_p = @(x, y, y_p) -2.*y_p;             % Derivada parcial de f respecto a y' = y_p;

    %% Se establecen los parámetros iniciales
    a = 1; b = 2; alfa = 0; beta = -3; N = 99; % El número de subintervalos es 100.
    maxiter = 50; tol = 1e-6; % Condiciones de parada

    tic;
    [Xg, Yg, iterg, incrg] = DifnolinNat_Gauss(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);
    gaussTime(i) = toc;
    clear f fy fy_p a b alfa beta N maxiter tol Xg Yg iterg incrg;
end
gaussTime_= mean(gaussTime)


%% Se define la función y'' y sus derivadas parciales en y' y en xx
f    = @(x, y, y_p) -y_p.^2+4*y+2;    % Ecuación diferencial de segundo orden
fy   = @(x, y, y_p)  4+0*y;                 % Derivada parcial de f respecto a y
fy_p = @(x, y, y_p) -2.*y_p;             % Derivada parcial de f respecto a y' = y_p;

%% Se establecen los parámetros iniciales
a = 1; b = 2; alfa = 0; beta = -3; N = 99; % El número de subintervalos es 100.
maxiter = 50; tol = 1e-6; % Condiciones de parada

[Xc, Yc, iterc, incrc] = DifnolinNat(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);
[Xg, Yg, iterg, incrg] = DifnolinNat_Gauss(f, fy, fy_p, a, b, alfa, beta, N, maxiter, tol);

%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
% [vpa(X), vpa(Y), vpa(exacta), vpa(Error)]
[vpa(Xc), vpa(Yc)];

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Naturales")
xlabel('x');
ylabel('y(x)');
plot(Xc,Yc,'*-r')
plot(Xg,Yg,'-k')
legend('y(x) Crout', 'y(x) Gauss');
