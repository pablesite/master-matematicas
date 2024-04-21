function F = sistema1(x,y)
    % Inicialización de matriz de salida
    F = zeros (4,1);
    % Sistema de ecuaciones diferenciales de primer orden.(PVI_1 + PVI_2)
    F(1) = y(2); % yp1
    F(2) = -y(2).*y(1)+2*x.*y(1)+2; % yp2
    F(3) = y(4); % zp1
    F(4) = (-y(2)+2*x)*y(3)-y(1)*y(4); % zp2
end