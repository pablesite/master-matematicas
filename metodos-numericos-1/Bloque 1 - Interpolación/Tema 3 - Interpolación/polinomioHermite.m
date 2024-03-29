function [p_n] = polinomioHermite(x_i, f_i, df_i)
    % Esta función se emplea para calcular el polinomio de Hermite

    % REVISAR
    % Pn(x) = b0 + b1 * (x - x0) + b2 * (x - x0) * (x - x1) + ...
    % Partiendo de una matriz de puntos xi e imágenes f(xi)
    % pn(x) = f(x0) + f[x1, x0] * (x - x0) + ... + f[xn, ..., x0] * (x - x0) *
    % ... * (x - xn-1)
    % xi --> x0,..., xn
    % f_i --> f(x0),..., f(xn)
    % vx --> parte derecha del polinomio (x - x0) *
    % ... * (x - xn-1)
    % col --> columna de la matriz f_i a construir
    %%%%%%%%%%%%%%%

    % Entrada: (xi, f_i, df_i) nodos
    % Salida:
    %   p_n = Polinomio de Newton
    
    x_i = x_i(:);
    f_i = f_i(:);
    df_i = df_i(:);
    
    n = 2 * length(x_i);
    syms x
    
    col = 2;
    p_n = f_i(1);
    vx = 1;

    z = repelem(x_i, 2);
    F = repelem(f_i, 2);
    
    %J = zeros(2,2);
    while col <= n
        if col == 2
            m = n/2;
            num = f_i(2 : (m - col + 2), col -1) - f_i(1 : (m - col + 1), col -1);
            den = (x_i(col : m) - x_i(1 : (m - col + 1)));
            J(1 : m - col + 1, 1) = num ./ den;

            for i = 1 : m -1
                F(2 * i - 1, col) = df_i(i);
                F(2 * i, col) = J(i);
            end
            F(2*m - 1, col) = df_i(m);
        
        else
        % Se calculan las diferencias divididas por columnas, de golpe.
        % Primero todas las de orden 1 (2 coeficientes), para lo cual se
        % usan los fi originales. Después las de orden cuadrático 
        % (3 coeficientes), usando para ello las diferencias divididas de
        % orden 1 y almacenándolas en la columna siguiente... y así
        % sucesivamente. Los coeficientes saldrán de la primera fila de la
        % matriz fi resultante
        num = F(2 : (n - col + 2), col -1) - F(1 : (n - col + 1), col -1);
        den = (z(col : n) - z(1 : (n - col + 1)));
        F(1 : n - col + 1, col) = num ./ den;

        end
    
        % De manera recursiva se construye la parte derecha de cada parte
        % del polinomio (x - x0) *... * (x - xn-1). A continuación se
        % construye el polinomio también de manera recursiva, sumando en
        % cada iteración un nuevo término de un órden superior.
        vx = vx * (x - z(col - 1));
        p_n = p_n + F(1, col) * vx;

        % Se incrementa la columna, hasta que sea mayor al número de
        % valores. Notar que el orden es n-1 valores, y equivale a los
        % coeficientes. Es decir: x orden corresponde con x+1 coeficientes.
        col = col + 1;
    end

end