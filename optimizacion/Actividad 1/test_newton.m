clear all; close all;
f = @(x) (x.^6) - 7*(x.^3) + 7;
f = @(x) funcionrr(x);

x_values = linspace(-10, 10, 1000); 
y_values = f(x_values);
intervalo_f = [2, 3];

% Parámetros del método de Newton
delta = 1e-6;  % Tolerancia (delta)

% Ejecución del método para cada función
x_min_new = zeros(1, 4); 
iter_new = zeros(1, 4);
tiempos_new = zeros(1, 4);
f_min_new = zeros(1, 4);

tic;
[x_min_new, iter_new] = new(y_values, x_values, intervalo_f, delta); 
tiempos_new = toc * 1000;
f_min_new = f(x_min_new);

figure
plot(x_values, y_values, 'b-', 'LineWidth', 2);
hold on;
xline(intervalo_f(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
xline(intervalo_f(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
plot(x_min_new, f_min_new, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 

title('f','Interpreter', 'tex');
xlims = [0, 3];
ylims = [-20, 30]; 
xlabel('x');
ylabel('f(x)');
legend('f', 'a', 'b', 'min');
hold on;
grid on;