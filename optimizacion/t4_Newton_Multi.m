%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                  ALGORITMO DE NEWTON - DOS VARIABLES                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROF. MARLON MOSCOSO %%
%% Considere la función: f(X1,X2)=(X1-2)^4+(X1-2)^2*X2^2+(X2+1)^2      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculo del Gradiente de f - Vector de Derivadas Parciales
Df = @(x) [(4*(x(1)-2)^3 + 2*(x(1)-2)*x(2)^2);
             (2*x(2)*(x(1)-2)^2+2*(x(2)+1))];
%% Cálculo de la Matriz Hessiana - Matriz xe segunda derivadas parciales
DDf = @(x) [(12*(x(1)-2)^2+2*x(2)^2)  (4*(x(1)-2)*x(2)); 
            (4*(x(1)-2)*x(2))  (2*(x(1)-2)^2+2)];
%% Parámetros de Inicio del Algoritmo
x0 =[1,1];                       % Iterado Inicial - Punto de Inicio
maxiter=10;                      % Número máximo de iteraciones 
tol =1E-12;                      % Tolerancia pedida - Criterio de Parada
x=x0;                            % Inicio de las Variables
iter =0;                         % Contador de iteraciones

%% Ciclo para generar los iterados
while iter < maxiter
    D = Df(x);                  % Vector Gradiente
    n1 = sqrt(D'*D);            % Norma del Vector Gradiente - Criterio de Parada

    % Se imprime cada iterado y el error que se comete en la iteración
    sprintf (" Iterado %d, aprox=( %f, %f), error= %e \n", iter , x, n1)
    h  = DDf(x)\D;              % Cálculo del p correspondiente          
    n2 = sqrt(h'*h);            % Norma de p - Segundo Criterio de Parada
    x  = x-h';                  % Actualización del punto x=(x(1),x(2))
    
    if (n1 < tol) || (n2 < tol) % Pregunta para Criterio de Parada
        iter = maxiter ;
        break;
    end

    iter = iter +1;         % Actualización del Contador
end
