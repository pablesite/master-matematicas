function du = T2bFunEjerc1(x, u)
    % y'' = -y'*y + 2*x*y + 2
    % u(1) = y; --> du(1) = u(2);
    % u(2) = y' --> du(2) = -u(2)*u(1) + 2*x*u(1) + 2;
    % u(3) = z  --> du(3) = u(4)
    % u(4) = z' --> du(4) = (df/dy)*z + (df/dy')*z' = (2*x - u(2))*u(3) - u(1)*u(4);
    du = zeros(4,1);
    du(1) = u(2);
    du(2) = -u(2).*u(1) + 2*x*u(1) + 2;
    du(3) = u(4);
    du(4) = (2*x - u(2))*u(3) - u(1)*u(4);
end