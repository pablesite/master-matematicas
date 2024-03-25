function [dY] = PVI_examen(t, Y)
    dY = [Y(2); Y(3); -Y(1) + Y(2) + 2*exp(t)*(2 + t)];
end