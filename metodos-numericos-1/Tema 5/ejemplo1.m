f = @(x) sin(x).*exp(-x);
a = 0;
b = pi/2;
n1 = 4;

IT1 = trapecios(f, a, b, n1)