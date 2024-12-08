clear all; close all;
f = @(x) (x.^6) - 7*(x.^3) + 7;
%f = @(x) funcionrr(x);

x_values = linspace(-10, 10, 1000); 
y_values = f(x_values);
intervalo_f = [1, 2];

% Parámetros del método de rectas inexactas
delta = 1e-6;  % Tolerancia (delta)
x0 = 1.5; alpha = 10^-4; beta = 10^-1;
%alpha = 10^-1; beta = 0.9;

% Ejecución del método para cada función
x_min_rein = zeros(1, 4); 
iter_rein = zeros(1, 4);
tiempos_rein = zeros(1, 4);
f_min_rein = zeros(1, 4);

tic;
[x_min_rein, iter_rein] = rein(f, x0, alpha, beta,  delta); 
tiempos_rein = toc * 1000;
f_min_rein = f(x_min_rein);

figure
plot(x_values, y_values, 'b-', 'LineWidth', 2);
hold on;
xline(intervalo_f(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
xline(intervalo_f(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
plot(x_min_rein, f_min_rein, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 

title('f','Interpreter', 'tex');
xlim([0, 3]);
ylim([-20, 30]); 
xlabel('x');
ylabel('f(x)');
legend('f', 'a', 'b', 'min');
hold on;
grid on;