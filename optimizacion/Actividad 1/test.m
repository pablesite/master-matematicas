
close all, clear all;
% syms x
% f1 = @(x) (x.^6) - 7*(x.^3) + 7;
% df1 = @(x) 5*(x.^5) - 21*(x.^2);
% df2 = matlabFunction(diff(f1, x));
% 
% x1_values = linspace(-10, 10, 1000);
% y1_values = f1(x1_values);
% df1_values = df1(x1_values);
% df2_values = df2(x1_values);
% 
% df_aprox = (y1_values(3:length(y1_values)) - y1_values(1:length(y1_values)-2))/(2/length(x1_values));
% df_aprox = [df_aprox(1), df_aprox, df_aprox(end)];
% 
% df_aprox2 = (-y1_values(5:length(y1_values))+8*y1_values(4:length(y1_values)-1)-8*y1_values(2:length(y1_values)-3)+y1_values(1:length(y1_values)-4))/(12/length(x1_values));
% df_aprox2 = [df_aprox2(1), df_aprox2(2), df_aprox2, df_aprox2(end-1), df_aprox2(end)];
% 
% figure
% %plot(x1_values, y1_values)
% hold on
% grid on
% plot(x1_values, df1_values)
% plot(x1_values, df2_values)
% plot(x1_values, df_aprox)
% plot(x1_values, df_aprox2)
% legend('df teórica', 'df matlab', 'dfaprox', 'dfaprox2')
% 
% 
% %df_aprox = [y1_values(1), (y1_values(3:length(y1_values)) - y1_values(1:length(y1_values)-2))/(2/length(x1_values)), y1_values(1000)];
% 
% figure(2)
% % Datos discretos
% % x_data = [1, 2, 3, 4, 5]; % Valores de x
% % y_data = [2, 4, 6, 8, 10]; % Valores de f(x)
% 
% 
% % % Crear la función interpolada
% % f_interp = @(x) interp1(x_data, y_data, x, 'linear');
% 
% % % Usar la función
% % valor = f_interp(2.5); % Interpola el valor para x = 2.5
% % disp(['f(2.5) = ', num2str(valor)]);
% 
% f4 = @(x) funcionrr(x);
% x4_values = linspace(-10, 10, 1000);
% y4_values = f4(x4_values);
% 
% 
% df_aprox = (y4_values(3:length(y1_values)) - y4_values(1:length(y4_values)-2))/(2/length(x4_values));
% df_aprox = [df_aprox(1), df_aprox, df_aprox(end)];
% f_interp = @(x) interp1(x4_values, df_aprox, x, 'linear');
% df_aprox_interp = f_interp(x4_values);
% 
% %plot(x4_values,y4_values)
% hold on
% plot(x4_values,df_aprox)
% plot(x4_values,df_aprox_interp)
% legend('derivada', 'derivada interp')


x = -3:0.1:3; % Valores de x en el rango -3 a 3
y = sinh(x); % Calcular el seno hiperbólico para cada x

% Graficar
plot(x, y, 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('sinh(x)');
title('Gráfica de la función seno hiperbólico');

