clear all; close all;

%f = x.^2.*exp(-x);
a = 0; b = 1; h = 0.1;
[df, x] = DiferenciasFinitasCentrales_2('FuncionEjemplo1', a, b, h);
df_exacta = 2*x.*exp(-x) - x.^2.*exp(-x);
n = length(x);

figure
hold on
grid on
plot(x(1:n), df_exacta(1:n), '-')
plot(x(2:n-1), df(2:n-1), '-o')
hold off

% Cálculo del error para cada puntp.
err = abs(df_exacta(2:n-1) - df(2:n-1))