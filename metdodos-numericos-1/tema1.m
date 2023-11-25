x = linspace(-1,2);
y = linspace(-2,3);
[X, Y] = meshgrid(x,y);
f = exp(-X.^2 - Y.^2)
figure
subplot(1,3,1), plot3(X,Y,f), title('plot3')
subplot(1,3,2), mesh(X,Y,f), title('mesh')
subplot(1,3,3), surf(X,Y,f), title('surf')