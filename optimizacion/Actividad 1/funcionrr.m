function f = funcionrr(x_vec)
    % Inicializa un vector de salida
    f = zeros(size(x_vec));
    
    % Recorre cada valor del vector de entrada
    for i = 1:length(x_vec)
        x = x_vec(i); % Toma el valor actual
        xini=[x 0];
        t=[0 2*pi];
    
        options=odeset('RelTol',1e-13,'AbsTol',1e-13);
    
        [ts,xs]=ode45(@campo_pendulo,t,xini,options);
    
        f(i)=xs(end,1);
    end

end


function px = campo_pendulo(t,x)

    px(1)= x(2);
    px(2)=sin(x(1))+0.5*sin(t);
    px=px';
end