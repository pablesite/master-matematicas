function [df, x] = DiferenciasFinitasRegresivas_1(f, a, b, h)
    x = a:h:b;
    n = length(x);
    df(2:n) = (feval(f, x(2:n)) - feval(f, x(1:n-1)))/(h);
end