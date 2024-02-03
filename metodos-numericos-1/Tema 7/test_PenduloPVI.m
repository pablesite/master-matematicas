clear all; close all;
% Discretizamos la variable
a = 0; b = 2; h = 0.2;
N = (b - a)/h;

% Condición inicial
Ya = [0, 0.25];

% Resolución
[t_Y_AB2_S, Y_AB2_S] = AB2_Sistemas('PenduloPVI', a, b, N, Ya);
[t_Y_AB3_S, Y_AB3_S] = AB3_Sistemas('PenduloPVI', a, b, N, Ya);
[t_Y_AB4_S, Y_AB4_S] = AB4_Sistemas('PenduloPVI', a, b, N, Ya);

% Representación
plot(t_Y_AB2_S, Y_AB2_S(:,1), 'o-')
hold on
grid on
plot(t_Y_AB3_S, Y_AB3_S(:,1), 'o-')
plot(t_Y_AB4_S, Y_AB4_S(:,1), 'o-')

legend('AB2 Sistemas', 'AB3 Sistemas', 'AB4 Sistemas')