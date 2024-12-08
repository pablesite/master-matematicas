%% Carga de funciones

% Limpieza de la consola, variables y figuras
clc; clear; close all;

% Definición de las funciones objetivo
f1 = @(x) (x.^6) - 7*(x.^3) + 7;
f2 = @(x) log(x) - sin(x);
f3 = @(x) exp(1).^cos(x) - x;
f4 = @(x) funcionrr(x);


%% Visualización inicial
%x1_values = linspace(0, 3, 1000);
x1_values = linspace(-10, 10, 1000);
y1_values = f1(x1_values);
%x2_values = linspace(0, 10, 1000);
x2_values = linspace(-10, 10, 1000);
y2_values = f2(x2_values);
%x3_values = linspace(0, 8, 1000);
x3_values = linspace(-10, 10, 1000);
y3_values = f3(x3_values);
%x4_values = linspace(0, 5, 1000);
x4_values = linspace(-10, 10, 1000);
y4_values = f4(x4_values);

figure;
subplot(2, 2, 1), plot(x1_values, y1_values, 'b-', 'LineWidth', 2);
title('f(x) = x^6 - 7*x^3 + 7');
%ylim([-50, 50]);
ylim([-10, 50]);
xlabel('x');
ylabel('f(x)');
legend('f(x)');
hold on;
grid on;

subplot(2, 2, 2), plot(x2_values, y2_values, 'b-', 'LineWidth', 2);
title('f(x) = ln(x) - sin(x)');
%ylim([-10, 5]);
ylim([-5, 5]);
xlabel('x');
ylabel('f(x)');
legend('f(x)');
hold on;
grid on;

subplot(2, 2, 3), plot(x3_values, y3_values, 'b-', 'LineWidth', 2);
title('f(x) = e^{cos(x)} - x', 'Interpreter', 'tex');
%ylim([-10, 5]);
xlabel('x');
ylabel('f(x)');
legend('f(x)');
hold on;
grid on;

subplot(2, 2, 4), plot(x4_values, y4_values, 'b-', 'LineWidth', 2);
title('f(x) = funcionrr');
%ylim([-10, 5]);
xlabel('x');
ylabel('f(x)');
legend('f(x)');
hold on;
grid on;


%%  Calcula los intervalos de manera automática (si es posible)
% Calcula las raices de la derivada de las funciones (si es posible)
syms x
df1 = diff(f1, x);
df1_f = matlabFunction(df1);
df1_values = df1_f(x1_values);
subplot(2, 2, 1), plot(x1_values, df1_values, 'k:', 'LineWidth', 1);
xlim([0, 3]);
ylim([-30, 30]);
legend('f(x)', 'fp(x)');

df2 = diff(f2, x);
df2_f = matlabFunction(df2);
df2_values = df2_f(x2_values);
subplot(2, 2, 2), plot(x2_values, df2_values, 'k:', 'LineWidth', 1);
xlim([0, 10]);
legend('f(x)', 'fp(x)');

df3 = diff(f3, x);
df3_f = matlabFunction(df3);
df3_values = df3_f(x3_values);
subplot(2, 2, 3), plot(x3_values, df3_values, 'k:', 'LineWidth', 1);
xlim([0, 10]);
legend('f(x)', 'fp(x)');

%df4 = diff(f4, x);
%df4_f = matlabFunction(df4);
%df4_values = df4_f(x4_values);
subplot(2, 2, 4), plot(x4_values, 0, 'k:', 'LineWidth', 1);
xlim([1, 4]);
legend('f(x)');

%% 
% Calcula intervalos de manera automática
intervalo_f1 = calculo_intervalo(df1);
intervalo_f2 = [7, 8]; % Se calcula la derivada, pero no las raices. Se ajusta según la visualización.
intervalo_f3 = [4, 5]; % Se calcula la derivada, pero no las raices. Se ajusta según la visualización.
intervalo_f4 = [2, 3]; % Se calcula la derivada, pero no las raices. Se ajusta según la visualización.

% Dibujar las líneas verticales punteadas
subplot(2, 2, 1),xline(intervalo_f1(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
subplot(2, 2, 1),xline(intervalo_f1(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
legend('f(x)', 'fp(x)', 'a', 'b');

subplot(2, 2, 2),xline(intervalo_f2(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
subplot(2, 2, 2),xline(intervalo_f2(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
legend('f(x)', 'fp(x)', 'a', 'b');

subplot(2, 2, 3),xline(intervalo_f3(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
subplot(2, 2, 3),xline(intervalo_f3(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
legend('f(x)', 'fp(x)', 'a', 'b');

subplot(2, 2, 4),xline(intervalo_f4(1), '--r', 'a', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
subplot(2, 2, 4),xline(intervalo_f4(2), '--g', 'b', 'LabelOrientation', 'horizontal', 'LineWidth', 1.5);
legend('f(x)', 'a', 'b');


%% Cálculo de los mínimos
% Se define la tolerancia buscada
tol = 1e-5;

% Cálculo de las iteraciones mínimas de Budi
iter_min_budy = log(tol)/log(.5);
disp(['Número de iteraciones mínimas para búsqueda dicotómica: iter_min = ', num2str(iter_min_budy)])

% Llamadas a los métodos
tic;
[x1_budi, iter1_budi] = budi(f1, intervalo_f1(1), intervalo_f1(2), tol);
tiempo1_budi = toc;
disp(['Método de búsqueda dicotómica f1: x_min = ', num2str(x1_budi), ', iter = ', num2str(iter1_budi), ', tiempo = ', num2str(tiempo1_budi)]);

tic;
[x2_budi, iter2_budi] = budi(f2, intervalo_f2(1), intervalo_f2(2), tol);
tiempo2_budi = toc;
disp(['Método de búsqueda dicotómica f2: x_min = ', num2str(x2_budi), ', iter = ', num2str(iter2_budi), ', tiempo = ', num2str(tiempo2_budi)]);

tic;
[x3_budi, iter3_budi] = budi(f3, intervalo_f3(1), intervalo_f3(2), tol);
tiempo3_budi = toc;
disp(['Método de búsqueda dicotómica f3: x_min = ', num2str(x3_budi), ', iter = ', num2str(iter3_budi), ', tiempo = ', num2str(tiempo3_budi)]);

tic;
[x4_budi, iter4_budi] = budi(f4, intervalo_f4(1), intervalo_f4(2), tol);
tiempo4_budi = toc;
disp(['Método de búsqueda dicotómica f4: x_min = ', num2str(x4_budi), ', iter = ', num2str(iter4_budi), ', tiempo = ', num2str(tiempo4_budi)]);

% [x_incu, iter_incu] = incu(func, a, b, tol);
% disp(['Método de interpolación cuadrática: x_min = ', num2str(x_incu), ', iter = ', num2str(iter_incu)]);
% 
% [x_new, iter_new] = new(func, a, b, tol);
% disp(['Método de Newton: x_min = ', num2str(x_new), ', iter = ', num2str(iter_new)]);
% 
% [x_rein, iter_rein] = rein(func, a, b, tol);
% disp(['Método de las rectas inexactas: x_min = ', num2str(x_rein), ', iter = ', num2str(iter_rein)]);



 
%% Mostrar el resultado
f1_budy = f1(x1_budi);
subplot(2, 2, 1), plot(x1_budi, f1_budy, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r');  % Punto óptimo
legend('f(x)', 'fp(x)', 'a', 'b', 'min');
hold off;

f2_budy = f2(x2_budi);
subplot(2, 2, 2), plot(x2_budi, f2_budy, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r');  % Punto óptimo
legend('f(x)', 'fp(x)', 'a', 'b', 'min');
hold off;

f3_budy = f3(x3_budi);
subplot(2, 2, 3), plot(x3_budi, f3_budy, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r');  % Punto óptimo
legend('f(x)', 'fp(x)', 'a', 'b', 'min');
hold off;

f4_budy = f4(x4_budi);
subplot(2, 2, 4), plot(x4_budi, f4_budy, 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r');  % Punto óptimo
legend('f(x)', 'a', 'b', 'min');
hold off;



%% Recursos

% % Usar fminunc para encontrar el mínimo
% options = optimoptions('fminunc', 'Display', 'iter', 'Algorithm', 'quasi-newton');
% [x_opt, fval, exitflag, output] = fminunc(f, x0, options);