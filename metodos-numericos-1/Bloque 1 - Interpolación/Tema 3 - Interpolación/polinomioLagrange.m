function [p_n] = polinomioLagrange(x_i, f_i)
    % Esta función se emplea para calcular el polinomio de Lagrange
    % Pn(x) = Ln,0 * fx0 + Ln,1 * fx1 + .... + Ln,n * fxn
    % Donde Ln,i = PROD(x - xj)/(xi - xj) para toda i distinta de j.
    % Partiendo de un vector de puntos xi y otro vector de imágenes f(xi)
    % x_i --> x0,..., xn
    % f_i --> f(x0),..., f(xn)
    % xt --> x temporal donde se elimina el elemento donde i = j
    % num --> numerador del productorio (x - xj)
    % den --> denominador del productorio (xi - xj)
    % k --> iteración del bucle para construir cada Ln,i
    
    % Entrada: (x_i, f_i) nodos
    % Salida:
    %   b = Coeficientes polinomio de Newton
    %   p_n = Polinomio de Newton

    % Inicialización de variables
    x_i = x_i(:);
    f_i = f_i(:);

    syms x
    n = length(x_i);
    k = 1;
    p_n = 0;
    
    while k <= n
        % Elimino x_k de [x_i]
        x_k = x_i;
        x_k(k) = [];

        % Calculo el productorio del numerador, y almaceno en vector
        % columna num
        prod_num_k = prod(x - x_k);

        % Calculo el productorio del denominador, y almaceno en vector
        % columna den
        prod_den_k = prod(x_i(k) - x_k);

        % Calculo el lagrangiano k-esimo.
        L_n_k = prod_num_k./prod_den_k;

        % Se construye el polinomio de manera recursiva.
        p_n = p_n + L_n_k * f_i(k);

        % Se incrementa el iterador, hasta que sea mayor al número de
        % valores xi. Notar que el orden del polinomio es n-1 valores, 
        % y equivale a los coeficientes de Lagrange.
        k = k + 1;
    end
end