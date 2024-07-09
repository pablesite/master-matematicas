%Ejecutable: Ejemplo 9
digits(8)
[xi ,yi ,t,iter, incre ] = DisparoNewtonP1 ('ej10',1,3,1-1/(2*log(3)),0.5-1/(6*log(3)),19,1e-07,100)
%%
yex=@(x)1/(log(1/3)).*(log(x./3)-0.5.*log(x));
exacta=yex(xi);
Error=abs(yi(:,1)-exacta);
format long
[xi(1:2:end),yi(1:2:end,1),exacta(1:2:end),Error(1:2:end)]
vpa(Error(1:2:end),2)
%%
hold on
plot(yi(:,1),xi,'or')
plot(exacta,xi,'g')




% Ejecutable: Ejemplo 9
% Problema de Frontera - Disparo No Lineal -> Newton (Condiciones
% Dirichlet)
% y'' = 1/8*(32 + 2*x^3 - y*y'), x E [1, 3]
% y(1) = 17
% y(3) = 43/3 

clear all; close all;
digits(8)

%% Inicialización de parámetros
% Frontera
a = 1;
b = 3;
% Condición inicial
alfa = 17;
beta = 43/3;

% Número de pasos de la x.
n = 19; % Solución [0:n+1] => n + 2 nodos = n + 1 intervalos
h = (b - a)/(n + 1); 

% Criterios de parada
tol = 1e-05;
maxiter = 50;

%% Cálculo de la función
[xn, yn, t, iter] = DisparoNewton('ej9', a, b, alfa, beta, h, tol, maxiter)

%% Cálculo de la solución exacta (si la hay)
yex = @(x)x.^2+16./x;
exacta = yex(xn);
Error = abs(yn(:,1) - exacta);

% Tabla de datos
format long
[xn(1:2:end), yn(1:2:end,1), exacta(1:2:end), Error(1:2:end)]

% Error 
vpa(Error,3)

%% Representación de los resultados
% Solución aproximada estable
figure(1)
title('Problema de frontera-disparo. Método Newton, Dirichlet');
hold on
grid on
plot(xn, exacta, 'r')
plot(xn, yn(:, 1), 'bo')
xlabel('x');
ylabel('y');
legend('y(x) - exacta', 'y(x) - aproximada');
