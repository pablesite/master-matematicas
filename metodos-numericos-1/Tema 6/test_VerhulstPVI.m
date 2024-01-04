% Discretizamos la variable
a = 0; b = 2; N = 30;
h = (b - a)/N;
td = a:h:b;

% Condición inicial
ya = 10;

% Resolución
[t, y] = ode23('VerhulstPVI', td, ya);

% Representación
plot(t, y, 'o-')

