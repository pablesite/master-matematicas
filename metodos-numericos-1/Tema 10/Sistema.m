function [F, dF] = Sistema(x)
    x = X(1); y = X(2);
    F = [exp(x).* exp(y) + x.*cos(y); x + y - 1];
    % 23' en el vídeo
    dF = [ ; ];
end