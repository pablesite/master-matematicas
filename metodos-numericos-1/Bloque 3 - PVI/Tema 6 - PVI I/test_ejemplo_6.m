clear all; close all;

% Inicialización de variables.
a = 0;
b = 2;
ya = 1;
N = [2, 4, 8, 16, 32];
tol = 1e-6;
max_iter = 30;
% Cálculo de los métodos de Euler explícito e implícito.
E_imp = zeros(length(N), 1);
E_exp = zeros(length(N), 1);
for i = 1:length(N)
    [t1, y1] = Euler_implicito('Funcion_ejemplo', a, b, ya, N(i), tol, max_iter);
    [t2, y2] = Euler('Funcion_ejemplo', a, b, N(i), ya);
    figure(1)
    plot(t1, y1, 'o-')
    hold on
    
    figure(2)
    plot(t2, y2, 'o-')
    hold on
    
    % Errores
    sol_exacta_1 = exp(-10*t1);
    E_imp(i) = max(abs(sol_exacta_1 - y1));

    sol_exacta_2 = exp(-10*t2);
    E_exp(i) = max(abs(sol_exacta_2 - y2));

end

orden_imp = log2(E_imp(1:end-1)./E_imp(2:end));
orden_exp = log2(E_exp(1:end-1)./E_exp(2:end));


figure(1)
sol_exacta_1 = exp(-10*t1);
plot(t1, sol_exacta_1, 'o-')
grid on
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'Sol Exacta')

figure(2)
sol_exacta_2 = exp(-10*t2);
plot(t2, sol_exacta_2, 'o-')
grid on
xlabel('t'), ylabel('y')
legend('N=2', 'N=4', 'N=8', 'N=16', 'N=32', 'Sol Exacta')




