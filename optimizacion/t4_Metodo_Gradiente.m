%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%            METODO DEL GRADIENTE ÓPTIMO MULTIDIMENSIONAL              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                 PROF. MARLON MOSCOSO %%
clear all
clc
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%         PARAMETROS Y DATOS PARA SER AGREGADOS POR EL USUSARIO        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Max=0;     % Si se va a maximizar se inicia en Max=1, si se va a minimizar 
           % se coloca o se define Max=0
f=@(x,y) x^2-24*x + y^2-10*y;                   % Función Multidimensional
grad={@(x,y) 2*x-24, ...
      @(x,y) 2*y-10};                            % Gradiente de la función
x0=[8;7];                      % Punto inicial: debe ser un vector columna
Tol=0.001;                                       % Tolerancia del algoritmo
MaxIter=100;                               % Número de iteraciones máximas
bk=5;                  % Límite superior para la búsqueda unidimensional 
t=0.08;                                           % alpha del algoritmo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                          INICIO DEL ALGORITMO                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fgrad=[grad{1}(x0(1,1),x0(2,1))
       grad{2}(x0(1,1),x0(2,1))];                 % Se evalua el gradiente 
                                                  % en el punto inicial
if Max==1
    Fgrad=Fgrad;                   % Si se maximiza se escoge el gradiente
else
    Fgrad=-Fgrad;  % Si se minimiza entonces, se escoge menos el gradiente
end

iter=1;                                        % Inicio de las iteraciones

while norm(Fgrad)>=Tol && iter<=MaxIter
    % [t]=BusquedaDicotomica(f,x0,Fgrad,bk,Max)
    % [t]=BusquedaSecuencial(f,x0,Fgrad,bk,Max)
    % [t]=MetodoFibonacci(f,x0,Fgrad,bk,Max)
    % [t]=Seccion_Aurea(f,x0,Fgrad,bk,Max) % Método Unidimensional
      
    D(iter, :)={iter,x0,Fgrad,t};
      
    x0=x0+t*Fgrad;                 % Se actualiza el elemento para evaluar

      Fgrad=[grad{1}(x0(1,1),x0(2,1))
       grad{2}(x0(1,1),x0(2,1))];                 % Se evalua el gradiente 
                                                  % en la actualización
      if Max==1
          Fgrad=Fgrad;             % Si se maximiza se escoge el gradiente
      else
          Fgrad=-Fgrad;      % Si se minimiza se escoge menos el gradiente
      end

      iter=iter+1;                              % Se actualiza el contador
      
     D(iter,:)={iter, x0, Fgrad, t}
     x0
end
toc
