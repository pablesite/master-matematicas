function [f, df] = Function_examen(x)
    f = sin(x) - x.^2 + 1;
    df = cos(x) - 2*x;
end