function [xi, ci] = xcGaussLaguerre(n)
% Obtiene los coeficientes ci y los nodos xi de la cuadratura de
% Gauss-Laguerre para un valor de n dado como parámetro de entrada
syms x
L{1} = 1;       % L0(x)
L{2} = 1 - x;   % L1(x)

for k = 0:n-1 % Se calcula un orden más para el cálculo posterior de los coeficientes.
    L{k+3} = (2*k + 3 - x)*L{k+2} - (k + 1)^2*L{k+1};
end

xi = double(solve(L{n+1} == 0, x));
ci = double((factorial(n)^2*xi)./subs(L{n+2}^2, x, xi));

% La solución a la integral será:
% sum (ci(i)*x(i))
% no será sum(xi(i)*f(x(i))??