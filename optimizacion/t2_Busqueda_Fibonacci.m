function salida = fibo(f, intervalo, tol)
% Está función aplica el método de la búesqueda de fibonacci a una función
% para hayar un mínimo en un intervalo.
% f: función unimodal en el intervalo, debe introducirse como función
% anónima
% intervalo: vector de dos componentes con los extremos del intervalo.
% tol: tolerancia o error permitido, debe ser positivo
%
% Salidas: El método devuelve un vector [min, fval, iterados]
% min: punto donde se alncanza el minimo local de la función en el intervalo
% fval: valor de la función en ese punto
% iterados: número de iteraciones utilizadas para converger.

% Calculamos los valores de la sucesión de Finonacci necesarios.
fi = [1,1];
b = intervalo(2);
a = intervalo(1);
w1 = b-a;
n = 2;
while w1 >= tol*fi(n)
    fi(n+1) = fi(n)+fi(n-1);
    n = n+1;
end
%Realizamos el primer paso a parte pues es el único con dos evaluaciones de f
% y así después solo realizar una evaluación de f en cada paso.
w1 = w1/fi(n)*fi(n-1);
xa = b - w1;
xb = a + w1;
fa = f(xa);
fb = f(xb);
k=2; % Número de pasos
while and(k<= n-2, xa < xb) %La segunda condición es para evitar errores en caso de muchas iteraciones
    w1 = w1/fi(n-k+1)*fi(n-k);
    if fa > fb % Actualizamos los valores según el valor de la función
        a = xa;
        xa = xb;
        fa = fb;
        xb = a + w1;
        fb = f(xb);
    else
        b = xb;
        xb = xa;
        fb = fa;
        xa = b-w1;
        fa = f(xa);
    end
    k = k+1;
end
salida = [xa, fa, n-2];
end