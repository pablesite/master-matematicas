function dy = sistema(x,y)
    % Inicialización de matriz de salida
    dy = zeros(2,1);
    % Sistema de ecuaciones diferenciales de primer orden.
    dy(1) = y(2);
    dy(2) = -y(2).*y(1)+2*x.*y(1)+2;
end