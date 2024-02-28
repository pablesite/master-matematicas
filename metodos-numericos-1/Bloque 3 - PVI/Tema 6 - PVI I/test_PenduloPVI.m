clear all; close all;
% Discretizamos la variable
a = 0; b = 2; h = 0.1;
td = a:h:b;

% Condición inicial
Ya = [pi/6; 0];

% Resolución
[t, Y] = ode23('PenduloPVI', td, Ya);

% Representación
plot(t, Y, 'o-')