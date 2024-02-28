function [xi, ci] = xcGaussHermite(n)
% Obtiene los coeficientes ci y los nodos xi de la cuadratura de
% Gauss-Hermite para un valor de n dado como parámetro de entrada
syms x
H{1} = 1;       % L0(x)
H{2} = 2*x;     % L1(x)
for k = 0:n-2 
    H{k+3} = 2*x*H{k+2} - 2*(k+1)*H{k+1};
end
xi = double(solve(H{n+1} == 0, x));
ci = double((2^(n-1)*factorial(n)*sqrt(pi))./(n^2*subs(H{n}^2, x, xi)));

% La solución a la integral será:
% sum (ci(i)*x(i))
% no será sum(xi(i)*f(x(i))??