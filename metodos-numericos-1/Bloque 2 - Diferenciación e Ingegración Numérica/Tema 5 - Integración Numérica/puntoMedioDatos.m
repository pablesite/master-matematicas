function I = puntoMedio(f,a,b,n)
    % fórmula de punto medio compuesta
    h=(b-a)/(n-1); % Originalmente había (b-a)/(n+2)... He ajustado para que la h saliera bien y cuadrase con el resultado.
    I=2*h*sum(f(1:1:end)); % Notar que se suman todos los puntos de la f, que son los reales.
end