function du = T2cFunEjerc2(x, u)
    % y'' = -(1./x).*y(2) - 4, x en [1, 3]
    % u(1) = y  --> du(1) = u(2);
    % u(2) = y' --> du(2) = -(1./x).*y(2) - 4;
    du = zeros(2, 1);
    du(1) = u(2);
    du(2) = -(1./x).*u(2) - 4;
end