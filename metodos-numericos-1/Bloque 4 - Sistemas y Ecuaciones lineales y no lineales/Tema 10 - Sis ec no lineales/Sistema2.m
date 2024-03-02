function [F, dF] = Sistema2(X)
    x = X(1); y = X(2); z = X(3);
    F = [cos(y) - sin(x); z^x - 1/y; exp(x) - z^2];
    % Calculo las derivadas usando diff con expresiones simbólicas en el
    % command window.
    dF = [-cos(x), -sin(y), 0; z^x*log(z), 1/y^2, x*z^(x - 1); exp(x), 0, -2*z];

end