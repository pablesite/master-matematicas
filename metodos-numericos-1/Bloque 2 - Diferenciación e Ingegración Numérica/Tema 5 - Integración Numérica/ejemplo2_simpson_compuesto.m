clear all; close all;

f = @(x) sin(x).*exp(-x);

a = 0;
b = pi/2;
n1 = 4;
n2 = 8;

IT1 = simpson(f, a, b, n1)
IT2 = simpson(f, a, b, n2)

