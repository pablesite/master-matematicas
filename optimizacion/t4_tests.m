syms x1 x2

f =  3*x1^2 - 2*x1*x2 + x2^2 + 3*exp(1)^(-x1);

disp("Jacobiana")
disp(jacobian(f, [x1, x2]))

disp("Hessiana")
disp(simplify(hessian(f, [x1, x2])))

disp("Determinante Hessiana")
disp(simplify(det(hessian(f, [x1, x2]))))


disp("Inversa de la Hessiana")
disp(simplify(inv(hessian(f, [x1, x2]))))


J = (jacobian(f, [x1, x2]));
norm_J = sqrt((J(1))^2 + (J(2))^2);

x1_val = 0.4689;
x2_val = 0.4689;
norm_evaluated = subs(norm_J, [x1, x2], [x1_val, x2_val]);
disp(norm_evaluated)