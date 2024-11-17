function du = T2aFunEjerc1(x, u)
    % y'' = (-y')^2 - y + ln(x), x en [1, 2]
    % u(1) = y; --> du(1) = u(2);
    % u(2) = y' --> du(2) = -(u(2))^2 - u(1) + log(x);
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = -(u(2))^2 - u(1) + log(x);
end