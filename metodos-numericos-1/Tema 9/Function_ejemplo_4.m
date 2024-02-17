function [f, df] = Function_ejemplo_4(x)
    f = (cos(x)).^2 - x;
    df = 2 * cos(x).*(-sin(x)) - 1;
end