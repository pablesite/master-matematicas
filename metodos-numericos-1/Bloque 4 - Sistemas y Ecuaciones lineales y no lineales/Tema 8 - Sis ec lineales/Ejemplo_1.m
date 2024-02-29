clear all; close all;

% Ejemplo 1


A = [10, -1, 2, 0; -1, 11, -1, 3; 2, -1, 10, -1; 0, 3, -1, 8];

% Diremos que la matriz A está bien condicionada si el número de 
% condición es un valor pequeño.
cond(A) % 2.3597

b = [6, 25, -11, 15];
x0 = [0, 0, 0, 0];
tol = 10^-3;
maxiter = 20;
[x, iter, incre ] = Jacobi(A, b, x0, tol, maxiter);
% norm([1, 2, -1, 1])

[xG, iterG, increG ] = Gauss_Seidel(A, b, x0, tol, maxiter);
% norm([1, 2, -1, 1])

w = 0.9; % JSOR converge si w está entre 0 y 1
[xJSOR, iterJSOR, increJSOR ] = JSOR(A, b, x0, w, tol, maxiter);

w = 1.25; % SOR converge para w entre 0 y 2.
% Cuanto menor sea el radio espectral mayor será el radio de convergencia
% (R)

tol = 10^-3;
[xSOR, iterSOR, increSOR ] = SOR(A, b, x0, w, tol, maxiter);


%%%%%%%%%%%%%%%%%%%%%%%

% El teorema de Young dice que w es una expresión concreta que se puede
% calcular. (en una matriz tridiagonal)

% Cálculo de la w según el teorema de Young
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

M = D + L;
N = -U;

HGS = M^-1*N;
R_esp_HGS = max(abs(eig(HGS)));
w_opt = 2/(1 + sqrt(1 - R_esp_HGS))

[xSORopt, iterSORopt, increSORopt ] = SOR(A, b, x0, w_opt, tol, maxiter);