
%% Minimización transformada desde maximización con Cs negativos
% Coeficientes de la función objetivo (Minimizar 4*x1 - x2)
f = [-8000; -6000; 0; 0];

% Coeficientes de las restricciones de igualdad
Aeq = [2, 3, 1, 0;
       3, 1, 0, 1];

% Lado derecho de las restricciones de igualdad
beq = [30; 38];

% Límite inferior para las variables (todas mayores o iguales a 0)
lb = zeros(4,1); 

% Resolver el problema de optimización con el método simplex
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% Mostrar resultados
disp('Valores óptimos de las variables:')
disp(x)
disp('Valor mínimo de la función objetivo:')
disp(-fval) % Si es un problema de maximización pasado a minimización

%% Minimización directa con Cs positivos (con 3 restricciones)
clear all; close all
% Coeficientes de la función objetivo (Minimizar 4*x1 - x2)
f = [10; 15; 0; 0; 0];

% Coeficientes de las restricciones de igualdad
Aeq = [2, 1, -1, 0, 0;
       3, 6, 0, -1, 0;
       2, 2, 0, 0, -1];

% Lado derecho de las restricciones de igualdad
beq = [100; 250; 100];

% Límite inferior para las variables (todas mayores o iguales a 0)
lb = zeros(5,1); 

% Resolver el problema de optimización con el método simplex
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% Mostrar resultados
disp('Valores óptimos de las variables:')
disp(x)
disp('Valor mínimo de la función objetivo:')
disp(fval) % Si es un problema de maximización pasado a minimización

%% Minimización directa con Cs positivos (con 2 restricciones)
clear all; close all
% Coeficientes de la función objetivo (Minimizar 4*x1 - x2)
f = [10; 15; 0; 0];

% Coeficientes de las restricciones de igualdad
Aeq = [2, 1, -1, 0;
       3, 6, 0, -1];

% Lado derecho de las restricciones de igualdad
beq = [100; 250];

% Límite inferior para las variables (todas mayores o iguales a 0)
lb = zeros(4,1); 

% Resolver el problema de optimización con el método simplex
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% Mostrar resultados
disp('Valores óptimos de las variables:')
disp(x)
disp('Valor mínimo de la función objetivo:')
disp(fval) % Si es un problema de maximización pasado a minimización

%% Minimización transformada desde maximización con Cs negativos
% Coeficientes de la función objetivo (Minimizar 4*x1 - x2)
f = [-50; -40; 0; 0];

% Coeficientes de las restricciones de igualdad
Aeq = [4, 3, 1, 0;
       2, 3, 0, 1];

% Lado derecho de las restricciones de igualdad
beq = [240; 180];

% Límite inferior para las variables (todas mayores o iguales a 0)
lb = zeros(4,1); 

% Resolver el problema de optimización con el método simplex
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% Mostrar resultados
disp('Valores óptimos de las variables:')
disp(x)
disp('Valor mínimo de la función objetivo:')
disp(-fval) % Si es un problema de maximización pasado a minimización

%% Minimización directa con Cs positivos (con 3 restricciones)
% Notar que x3, x4 y x5 se toman como variables de exceso a la hora de
% representar la región de factibilidad.
clear all; close all

% Región factible:
x1 = linspace(0, 100, 1000);

figure, hold on, grid on
x2_1 = 2 + 2*x1;
x2_2 = 3 + x1;
%x2_3 = ; % Es 100
ylim([0 10])
xlim([0 10])
plot(x1, x2_1)
plot(x1, x2_2)
plot([4, 4], ylim)
legend('s1', 's2', 's3')


% Coeficientes de la función objetivo (Minimizar 4*x1 - x2)
f = [-1; -2; 0; 0; 0];

% Coeficientes de las restricciones de igualdad
Aeq = [-2, 1, 1, 0, 0;
       -1, 1, 0, 1, 0;
       1, 0, 0, 0, 1];

% Lado derecho de las restricciones de igualdad
beq = [2; 3; 4];

% Límite inferior para las variables (todas mayores o iguales a 0)
lb = zeros(5,1); 

% Resolver el problema de optimización con el método simplex
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], options);

% Mostrar resultados
disp('Valores óptimos de las variables:')
disp(x)
disp('Valor mínimo de la función objetivo:')
disp(fval) % Si es un problema de maximización pasado a minimización