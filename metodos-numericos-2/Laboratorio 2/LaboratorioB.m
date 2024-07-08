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
[u, x, t] = ImplicitoMixtas(ci, cc2, a, b, Tmax, h, k);

%% Solución Exacta
exacta = @(x,t)sin(x.*t);
ex = exacta(x, 0.5);

%% Representación de los resultados
% Solución aproximada estable
figure(1)
%title('Problema de contorno multidimensional parabólico, implícito, mixtas.');
hold on
grid on
%plot(x, ex, 'r')
plot(x, u(:, end), '*--b')
xlabel('x');
ylabel('u(x)');
legend('u(x) - aproximada');


% Crear mallas para las coordenadas X e Y
[T, X] = meshgrid(t, x);

% Graficar
figure;
mesh(X, T, u);

% Mejorar la visualización
colormap(sky(100)); % Usar un mapa de colores para mejor visualización
colorbar; % Añadir una barra de colores para referencia

xlabel('x');
ylabel('t');
zlabel('u(x,t)');
%title('Representación 3D de la Función');

% Tabla de datos
format long e
[x', u(:,(end-1)/4), u(:,(end-1)/2), u(:,3*(end-1)/4), u(:,end)]

