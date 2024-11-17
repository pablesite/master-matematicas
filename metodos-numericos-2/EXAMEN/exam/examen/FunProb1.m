function du = FunProb1(x, u)
    % y'' = -y'*y, x en [2, 3]
    % u(1) = y; --> du(1) = u(2);
    % u(2) = y' --> du(2) = -u(2)*u(1);
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = -u(2)*u(1);
end