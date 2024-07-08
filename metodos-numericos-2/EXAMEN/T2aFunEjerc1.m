function du = T2aFunEjerc1(x, u)
    % y'' = -y'*y + 2*x*y + 2
    % u(1) = y; --> du(1) = u(2);
    % u(2) = y' --> du(2) = -u(2)*u(1) + 2*x*u(1) + 2;
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = -u(2).*u(1) + 2*x*u(1) + 2;
end