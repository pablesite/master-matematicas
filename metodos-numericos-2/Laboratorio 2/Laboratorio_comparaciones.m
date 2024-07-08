% Ejemplo
% u_t(x, t) = u_xx(x, t) + t^2*u + x*cos(x*t)
% u(x, 0) = 0, x € [0, 1]
% u_x(0, t) = t, t > 0. % Natural 
% u(1, t) = sin(t), t > 0. % Dirichlet
% Solución aprox para Tmax = 0.5 y h = 0.1, k = 0.0005
clear all; close all;

%% Inicialización de parámetros
% Parámetros
b = 1; a = 0;
Tmax = 0.5; h = 0.1; k = 0.0005;
% Condición inicial (en función de x)
ci = @(x)0;
% Condición de contorno Dirichlet para i = nx (en función de t)
cc2 = @(t)sin(t);

%% Cálculo del sistema a resolver
[u_exp, x_exp, t_exp] = ExplicitoMixtas(ci, cc2, a, b, Tmax, h, k);
[u_imp, x_imp, t_imp] = ImplicitoMixtas(ci, cc2, a, b, Tmax, h, k);
[u_cn, x_cn, t_cn] = Cranck_NicholsonMixtas(ci, cc2, a, b, Tmax, h, k);

%% Solución Exacta
exacta = @(x_exp,t_exp)sin(x_exp.*t_exp);
ex = exacta(x_exp, Tmax);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
%title('Problema de contorno multidimensional parabólico, implícito, mixtas.');
hold on
grid on
plot(x_exp, ex, 'g')
plot(x_exp, u_exp(:, end), '*--b')
plot(x_imp, u_imp(:, end), '*--k')
plot(x_cn, u_cn(:, end), '*--r')
xlabel('x');
ylabel('u(x)');
legend('Exacta', 'Explícito', 'Implícito', 'Cranck-Nicholson');

% Crear mallas para las coordenadas X e Y
[T, X] = meshgrid(t_exp, x_exp);

% Graficar
figure;
mesh(X, T, u_exp);

% Mejorar la visualización
colormap(sky(100)); % Usar un mapa de colores para mejor visualización
colorbar; % Añadir una barra de colores para referencia

xlabel('x');
ylabel('t');
zlabel('u(x,t)');
%title('Representación 3D de la Función');
