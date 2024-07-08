% Definir las variables simbólicas
syms Y Z t X

% Definir la función A y B
A = Y + exp((Y - Z) * t) * (-1 + X) * Y - X * Z;
B = Y + exp((Y - Z) * t) * (-1 + X) * Z - X * Z;

% Definir la función f
f = A / B;

% Calcular la matriz jacobiana con respecto a Y, Z y X
jacobiana_f = jacobian(f, [X, Y, Z]);

J = [diff(f,X),  diff(Y,X), diff(X,X); diff(f,Y),  diff(Y,Y), diff(X,Y); diff(f,Z),  diff(Y,Z), diff(X,Z)]

% Mostrar la matriz jacobiana
disp('Matriz Jacobiana:')
disp(jacobiana_f)

% Calcular el determinante de la matriz jacobiana
determinante_jacobiana = det(J);

% Mostrar el determinante de la matriz jacobiana
disp('Determinante de la Matriz Jacobiana:')
disp(determinante_jacobiana)