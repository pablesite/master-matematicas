function du = T2dFunEjerc3(r, u)
    % u'' = -(1./r).*u(2), x en [1, 3]
    % u(1) = y  --> du(1) = u(2);
    % u(2) = y' --> du(2) = -(1./r).*y(2) - 4;
    % u(3) = z  --> du(3) = u(4)
    % u(4) = z' --> du(4) = (df/dy)*z + (df/dy')*z' = -(1./r).*u(4);
    du = zeros (4,1);
    du(1) = u(2);
    du(2) = -(1./r).*u(2);
    du(3) = u(4);
    du(4) = -(1./r).*u(4);
end