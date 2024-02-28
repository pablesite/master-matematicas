f = @(x) sin(x).*exp(-x);
a = 0; b = pi/2;
n1 = 4; n2 = 128;

I1 = puntoMedio(f,a,b,n1)
I2 = puntoMedio(f,a,b,n2)

e = abs ([I1 I2] - (1-exp(-pi/2))/2)