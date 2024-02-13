function [dX] = Funcion_pregunta_test_10(t, X)
    dX = [X(2); (2*t*X(2) - 2*X(1) + t^3*log(t))/t^2];
end
