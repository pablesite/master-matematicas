function [df, x] = DiferenciasFinitasProgresivas_1(f, a, b, h)
    x = a:h:b;
    n = length(x);
    df(1:n-1) = (feval(f, x(2:n)) - feval(f, x(1:n-1)))/(h);
end