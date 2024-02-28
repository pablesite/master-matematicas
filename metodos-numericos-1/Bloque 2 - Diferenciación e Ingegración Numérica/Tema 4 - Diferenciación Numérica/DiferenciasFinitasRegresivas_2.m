function [df, x] = DiferenciasFinitasRegresivas_2(f, a, b, h)
    x = a:h:b;
    n = length(x);
    df(3:n) = (3*feval(f, x(3:n)) - 4*feval(f, x(2:n-1)) + feval(f, x(1:n-2)))/(2*h);
end