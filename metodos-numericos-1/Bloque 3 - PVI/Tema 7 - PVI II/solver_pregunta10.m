clear all; close all;

f = @ PVI_pregunta10

a = 1;
b = 3;

y0 = 0;
N = 4;

[tAB2, yAB2] = AB2(f, a, b, N, y0)
[tAB4, yAB4] = AB4(f, a, b, N, y0)
[tAM2, yAM2] = AM2(f, a, b, N, y0)
[tAM4, yAM4] = AM4(f, a, b, N, y0)

plot(tAB2, yAB2)
hold on
plot(tAB4, yAB4)
plot(tAM2, yAM2)
plot(tAM4, yAM4)
