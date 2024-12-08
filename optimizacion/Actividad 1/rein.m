function [x_min, iter] = rein(f, x0, alpha, beta, eps)
    % METODO_RECTAS_GOLDSTEIN
    % Método de las rectas inexactas con las condiciones de Armijo y Goldstein.
    %
    % Entradas:
    %   f        - Función objetivo (handle)
    %   x0       - Punto inicial (escalar o vector)
    %   alpha    - Parámetro para las condiciones (0 < alpha < 0.5)
    %   beta     - Factor de reducción del paso (0 < beta < 1)
    %   eps      - Tolerancia para la convergencia
    %
    % Salidas:
    %   x_min    - Punto aproximado donde se alcanza el mínimo
    %   iter     - Número de iteraciones realizadas

    % Inicialización
    iter = 0;
    xk = x0; % Punto inicial
    h = 1/1000;
    max_iter = 100;
    grad = 1; % para empezar

    while abs(grad) > eps && iter < max_iter
     
        % Calculo de grad(f(xk))
        fx_2h = f(xk + 2*h); fx_h = f(xk + h); fx_nh = f(xk - h); fx_2nh = f(xk - 2*h);
        grad = (-fx_2h + 8*fx_h - 8*fx_nh + fx_2nh)/(12*h);

        % Calculo dirección
        d = -grad;

        % Para cada salto, empiezo considerando lambda = 1
        lambda = 1;

        % Evalúo la función en xk y xk + lambda_d
        fxk = f(xk);
        fxk_lambda_d = f(xk + lambda*d);
        
        % Calculo grad(f(xk + lambda*d))
        fx_2h_lambda_d = f(xk + lambda*d + 2*h); fx_h_lambda_d = f(xk + lambda*d + h); fx_nh_lambda_d = f(xk + lambda*d - h); fx_2nh_lambda_d = f(xk + lambda*d - 2*h);
        grad_lambda_d = (-fx_2h_lambda_d + 8*fx_h_lambda_d - 8*fx_nh_lambda_d + fx_2nh_lambda_d)/(12*h);

   
        while (fxk_lambda_d > fxk + alpha*lambda*grad*d) || beta*grad*d > grad_lambda_d*d
            % Actualizo lambda
            lambda = 0.5*lambda;
            
            % Actualizo grad(f(xk)) y grad(f(xk + lambda*d))
            fx_2h_lambda_d = f(xk + lambda*d + 2*h); fx_h_lambda_d = f(xk + lambda*d + h); fx_nh_lambda_d = f(xk + lambda*d - h); fx_2nh_lambda_d = f(xk + lambda*d - 2*h);
            grad_lambda_d = (-fx_2h_lambda_d + 8*fx_h_lambda_d - 8*fx_nh_lambda_d + fx_2nh_lambda_d)/(12*h);
            
            % Actualizo la evaluación de la función en lambda
            fxk_lambda_d = f(xk + lambda*d);

            % Prevenir bucles infinitos.
            if lambda < 0.00001
                break;
            end
        end 
        
        % Actualizo xk con el lambda obtenido
        xk = xk + lambda*d;
        iter = iter + 1;

        % Evalúo gradiente de f(xk) para revisar condición de parada
        fx_2h = f(xk + 2*h); fx_h = f(xk + h); fx_nh = f(xk - h);fx_2nh = f(xk - 2*h);
        grad = (-fx_2h + 8*fx_h - 8*fx_nh + fx_2nh)/(12*h);

    end
    
    % Resultados
    x_min = xk;
    %f_min = f(xk);
end