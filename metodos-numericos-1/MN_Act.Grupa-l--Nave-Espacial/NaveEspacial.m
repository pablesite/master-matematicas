function [dY] = NaveEspacial(t, Y)
    G = 6.672e-11;
    Me = 5.9742e24;
    dY = [Y(2); Y(1).*Y(4).^2 - G*Me/(Y(1).^2); Y(4); -2*Y(2)*Y(4)./Y(1)];
end