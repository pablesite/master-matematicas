clear all; close all;
%Ejecutable: Laboratorio Grupal
digits(6)
[xi ,yi ,t,iter,incre] = DisparoSecanteP1('ejercicioParaSecante',1,2,0,-3,100,10e-06,50)

%% Se imprimen por consola los resultados en precisión aritmética
digits(8)
% [vpa(X), vpa(Y), vpa(exacta), vpa(Error)]
[vpa(xi), vpa(yi)]

%% Se representan las dos soluciones
hold on
grid on
title("problema de frontera NO líneal - Naturales")
xlabel('x');
ylabel('y(x)');
plot(xi,yi(1),'*-r')
legend('y(x) aproximada');