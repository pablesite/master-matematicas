function [xi, ci] = xcGaussChebyshev(n)
% Obtiene los coeficientes ci y los nodos xi de la cuadratura de
% Gauss-Chebyshev para un valor de n dado como parámetro de entrada
syms x
T{1} = 1;   % p0(x)
T{2} = x;   % p1(x)
for k = 2:n
    T{k+1} = 2*x*T{k}-T{k-1};
end
xi = double(solve(T{n+1} == 0, x));
ci = pi/n;

% La solución a la integral será:
% sum (ci(i)*x(i))
% no será sum(xi(i)*f(x(i))??
