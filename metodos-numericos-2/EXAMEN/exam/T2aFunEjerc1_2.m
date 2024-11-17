function du = T2aFunEjerc1(x, u)
    % y'' = 1/x*y'-4*x^2*y, x en [1, 2]
    % u(1) = y; --> du(1) = u(2);
    % u(2) = y' --> du(2) = -(u(2))^2 - u(1) + log(x);
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = 1/x*u(2) - 4*x^2*u(1);
end