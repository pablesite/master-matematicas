function [x_min, iter] = new(f, intervalo, delta)
    % Método de Newton
    % Entradas:
    %   f: función objetivo
    %   intervalo: intervalo objetivo
    %   delta: tolerancia para la convergencia
    %
    % Salidas:
    %   x_min: punto donde se alcanza el mínimo
    %   iter: número de iteraciones realizadas

    % Implementación del método

    % valores iniciales
    iter = 0;
    max_iter = 100;  % Número máximo de iteraciones
    error1 = delta + 1;
    error2 = delta + 1;
    h = 1/1000; % Cada función está muestreada con 1000 muestras.
    x_n = intervalo(1) + (intervalo(2) - intervalo(1))/2; % x inicial = Punto medio del intervalo

    while (error1 > delta || error2 > delta) && iter < max_iter
        iter = iter + 1;

        % Se evaluan las derivadas usando aproximación de diferencias
        % finitas centrales
        fx_2h = f(x_n + 2*h);
        fx_h = f(x_n + h);
        fx_nh = f(x_n - h);
        fx_2nh = f(x_n - 2*h);
        
        %f_p= -f(x+2h) + 8*f(x+h) - 8*f(x-h) + f(x-2h)/12h
        f_p = (-fx_2h + 8*fx_h - 8*fx_nh + fx_2nh)/(12*h);
        %f_pp= -f(x+2h) + 16*f(x+h) - 30*f(x) + 16f(x-h) - f(x-2h)/12h^2
        f_pp = (-fx_2h + 16*fx_h - 30*f(x_n) + 16*fx_nh - fx_2nh)/(12*(h^2));

        % Se actualiza el valor de x_n + 1
        x_n_1 = x_n - f_p/f_pp;

        % Se evaluan los errores
        error1 = abs(x_n_1 - x_n);
        f_p = (-f(x_n_1 + 2*h) + 8*f(x_n_1 + h) - 8*f(x_n_1 - h) + f(x_n_1 - 2*h))/(12*h);
        error2 = abs(f_p);
        
        % Se actualiza x_n, que será el mínimo si no hay más iteraciones
        x_n = x_n_1;
        x_min = x_n;
    end
end
