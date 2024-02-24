clear all;
syms x y;

g1 = @(x, y) x^2*y - 2*x
solx1 = feval(g1, 2, 3)
solx1_1 = g1(2,3)
dfx1 = diff(g1, x)


g2 = x^2*y - 2*x
solx = solve(g2 == 0, x)
dfx2 = diff(g2, x)
dfy2 = diff(g2, y)
df = diff(g2, x, y)
