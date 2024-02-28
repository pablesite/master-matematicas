function [df, x] = DiferenciasFinitasCentrales_4(f, a, b, h)
    x = a:h:b;
    n = length(x);
    df(3:n-2) = (-feval(f, x(5:n)) + 8*feval(f, x(4:n-1)) - 8*feval(f, x(2:n-3)) + feval(f, x(1:n-4)))/(12*h);
end