clear all; close all;

% Se discretiza la variable
a = 0; b = 1200; N = 1201;
h = (b - a)/N;
td = a:h:b;

% Condiciones iniciales
v0 = 6700; % m/s
H = 772e3; % m
Re = 6378.14e3; % m
r0 = Re + H; dr0 = 0; theta0 = 0; dtheta0 = v0/(Re + H);
Ya = [r0, dr0, theta0, dtheta0];

%% Método de Euler en un Sistema %%
tic
[t_Euler_Sis, Y_Euler_Sis] = Euler_Sistemas('NaveEspacial', a, b, N, Ya);
toc

figure(1)
subplot(221)
plot(t_Euler_Sis, Y_Euler_Sis(:,1)/1000 , '-')
hold on, grid on
title('Radio')
xlabel('t'), ylabel('r(t) (Km)')

subplot(222)
plot(t_Euler_Sis, Y_Euler_Sis(:,2)/1000 , '-')
hold on, grid on
title('Variación del Radio')
xlabel('t'), ylabel('dr(t)/dt (Km/s)')

subplot(223)
plot(t_Euler_Sis, Y_Euler_Sis(:,3), '-')
hold on, grid on
title('Ángulo')
xlabel('t'), ylabel('theta(t) (rad)')

subplot(224)
plot(t_Euler_Sis, Y_Euler_Sis(:,4) , '-')
hold on, grid on
title('Velocidad angular')
xlabel('t'), ylabel('dtheta(t)/dt (rad/s)')

%% Método de Runge-Kutta en un Sistema %%
tic
[t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis] = RungeKutta_Sistemas('NaveEspacial', a, b, N, Ya);
toc

subplot(221)
plot(t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis(:,1)/1000 , '-')

subplot(222)
plot(t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis(:,2)/1000 , '-')

subplot(223)
plot(t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis(:,3) , '-')

subplot(224)
plot(t_Runge_Kutta_Sis, Y_Runge_Kutta_Sis(:,4) , '-')

%% Método ODE %%
tic
[t_ode, Y_ode] = ode45('NaveEspacial', td, Ya);
toc

% Representación
subplot(221)
plot(t_ode, Y_ode(:,1)/1000 , '-')
legend('Euler explícito', 'Runge-Kutta', 'Matlab Ode45')

subplot(222)
plot(t_ode, Y_ode(:,2)/1000 , '-')
legend('Euler explícito', 'Runge-Kutta', 'Matlab Ode45')

subplot(223)
plot(t_ode, Y_ode(:,3) , '-')
legend('Euler explícito', 'Runge-Kutta', 'Matlab Ode45')

subplot(224)
plot(t_ode, Y_ode(:,4) , '-')
legend('Euler explícito', 'Runge-Kutta', 'Matlab Ode45')


%% Cálculo del Error Absoluto Medio (MAE) %%
MAE_Euler = zeros(length(Y_ode(1,:)), 1);
MAE_Runge_Kutta = zeros(length(Y_ode(1,:)), 1);
for i = 1:4
    MAE_Euler(i) = mae(Y_Euler_Sis(:,i) - Y_ode(:,i));
    MAE_Runge_Kutta(i) = mae(Y_Runge_Kutta_Sis(:,i) - Y_ode(:,i));
end

%% Representación de los espacios de fase %%
figure(2)
subplot(121)
plot(Y_ode(:,1)/1000, Y_ode(:,2)/1000 , '-')
grid on
title('Espacio de fase de (r, dr)')
xlabel('r(t) Km'), ylabel('dr(t) Km/s')

subplot(122)
plot(Y_ode(:,3), Y_ode(:,4) , '-')
grid on
title('Espacio de fase de (theta, dtheta)')
xlabel('theta(t) rad'), ylabel('dtheta(t) rad/s')

%% Obtención de la velocidad de impact %%
[v, theta, r] = VelocidadImpacto(Y_ode(:,1), Y_ode(:,3), Y_ode(:,4), Re)






