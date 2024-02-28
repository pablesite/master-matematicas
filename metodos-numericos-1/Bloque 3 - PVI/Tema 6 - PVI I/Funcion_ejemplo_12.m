function [dZ] = Funcion_ejemplo_12(t, Z)
    dZ = [3*Z(1) + 2*Z(2) - (2*t^2 + 1)*exp(2*t); 4*Z(1) + Z(2) + (t^2 +2*t - 4)*exp(2*t)];
end