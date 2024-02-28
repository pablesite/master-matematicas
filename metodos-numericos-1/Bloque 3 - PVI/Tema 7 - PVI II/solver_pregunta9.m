clear all; close all;

f = @ PVI_pregunta9

a = 0;
b = 2;

y0 = 0.5;

%N = 4;
%h = (b - a)/N;
h = 0.1;
td = a:h:b;
N = length(td);
td = td(:);

[tAB2, yAB2] = AB2(f, a, b, N-1, y0)
[tAB4, yAB4] = AB4(f, a, b, N-1, y0)
[tAM2, yAM2] = AM2(f, a, b, N-1, y0)
[tAM4, yAM4] = AM4(f, a, b, N-1, y0)

plot(tAB2, yAB2)
hold on
plot(tAB4, yAB4)
plot(tAM2, yAM2)
plot(tAM4, yAM4)
