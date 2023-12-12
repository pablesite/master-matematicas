syms x
syms a
syms b
syms c
syms d
syms e

f1 = (x - a);
f2 = (x - a)*(x - b);
f3 = (x - a)*(x - b)*(x - c);
f4 = (x - a)*(x - b)*(x - c)*(x - d);
f5 = (x - a)*(x - b)*(x - c)*(x - d)*(x - e);

df1 = diff(f1)
df2 = diff(f2)
df3 = diff(f3)
df4 = diff(f4)
df5 = diff(f5)