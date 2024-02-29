function [f, df, d2f] = Function_ejemplo_3(x)
    f = sin(x) - exp(-x);
    df = cos(x) + exp(-x);
    d2f = -sin(x) - exp(-x);
end