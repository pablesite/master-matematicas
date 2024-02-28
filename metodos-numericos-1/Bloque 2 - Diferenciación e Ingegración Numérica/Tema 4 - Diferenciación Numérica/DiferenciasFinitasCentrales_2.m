function [df, x] = DiferenciasFinitasCentrales_2(f, a, b, h)
    x = a:h:b;
    n = length(x);
    df(2:n-1) = (feval(f, x(3:n)) - feval(f, x(1:n-2)))/(2*h);
end