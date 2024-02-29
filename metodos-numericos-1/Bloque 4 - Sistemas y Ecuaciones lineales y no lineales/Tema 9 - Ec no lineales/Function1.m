function [f, df, d2f] = Function1(x0)
    syms x
    f = sin(x)^2 -x^2 + 1;
    df = diff(f, x, 1);
    d2f = diff(f, x, 2);

    f = vpa(subs(f, x, x0), 5);
    df = vpa(subs(df, x, x0), 5);
    d2f = vpa(subs(d2f, x, x0), 5);
end