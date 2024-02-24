function [b, p_n] = polinomioNewton(x_i, f_i)
    % Esta función se emplea para calcular el polinomio de Newton
    % Pn(x) = b0 + b1 * (x - x0) + b2 * (x - x0) * (x - x1) + ...
    % Partiendo de una matriz de puntos xi e imágenes f(xi)
    % pn(x) = f(x0) + f[x1, x0] * (x - x0) + ... + f[xn, ..., x0] * (x - x0) *
    % ... * (x - xn-1)
    % xi --> x0,..., xn
    % f_i --> f(x0),..., f(xn)
    % vx --> parte derecha del polinomio (x - x0) *
    % ... * (x - xn-1)
    % col --> columna de la matriz f_i a construir
    
    % Entrada: (xi, f_i) nodos
    % Salida:
    %   b = Coeficientes polinomio de Newton
    %   p = Polinomio de Newton
    
    x_i = x_i(:);
    f_i = f_i(:);
    
    n = length(x_i);
    syms x
    
    col = 2;
    p_n = f_i(1);
    v_x = 1;
    
    while col <= n
        % Se calculan las diferencias divididas por columnas, de golpe.
        % Primero todas las de orden 1 (2 coeficientes), para lo cual se
        % usan los fi originales. Después las de orden cuadrático 
        % (3 coeficientes), usando para ello las diferencias divididas de
        % orden 1 y almacenándolas en la columna siguiente... y así
        % sucesivamente. Los coeficientes saldrán de la primera fila de la
        % matriz fi resultante
        num = f_i(2 : (n - col + 2), col -1) - f_i(1 : (n - col + 1), col -1);
        den = (x_i(col : n) - x_i(1 : (n - col + 1)));
        f_i(1 : n - col + 1, col) = num ./ den;
    
        % De manera recursiva se construye la parte derecha de cada parte
        % del polinomio (x - x0) *... * (x - xn-1). A continuación se
        % construye el polinomio también de manera recursiva, sumando en
        % cada iteración un nuevo término de un órden superior.
        v_x = v_x * (x - x_i(col - 1));
        p_n = p_n + f_i(1, col) * v_x;

        % Se incrementa la columna, hasta que sea mayor al número de
        % valores. Notar que el orden es n-1 valores, y equivale a los
        % coeficientes. Es decir: x orden corresponde con x+1 coeficientes.
        col = col + 1;
    end
    
    b = f_i(1, :);

end