clear all; clc

dmatrix=[inf 3 3 4 inf 4;
         3 inf 2 inf 3 6;
         3 2 inf 1 2 inf;
         4 inf 1 inf 6 inf;
         inf 3 2 6 inf 2;
         4 6 inf inf 2 inf];

%dmatrix=[0 2 9 10;1 0 6 4; 15 7 0 8; 6 3 12 0];

indS=0;
numCiudades=size(dmatrix(:,1));


%almacenaje de datos: identificamos cada conjunto S con el producto de los
%primeros primos, por ejemplo S={3,4,6}, cojerá el producto del tercer,
%cuarto y sexto primo (i.e. 5*7*13) como índice del conjunto S.

%inicializamos matrices de cada conjunto
numPrim=primes(6*10);
numPrim=numPrim(1:numCiudades);
maxConj=prod(numPrim); 

%d(conjunto, ultima) contine el costo de el circuito que empieza en 1, pasa por las ciudades
%del conjunto y termina en ultima.
d(maxConj,numCiudades)=0;

%predecesor(conjunto, ultima) contiene la penúltima ciudad del circuito
%que empieza en 1, pasa por el conjunto y termina en ultima.
predecesor(maxConj,numCiudades)=0;

%caso k=0
for c=2:numCiudades
    d(numPrim(c), c)= dmatrix(c,1);
end

%caso general
for s=2:numCiudades

    %S contiene todas las combinaciones de s elementos de las ciudades que
    %nos quedan.
    restantes=2:numCiudades;
    S=nchoosek(restantes,s);%devuelve combinaciones de s elementos de restantes

    %recorremos todos los conjuntos S de s elementos
    for ind=1:size(S(:,1))

        %para cada conjunto S, calculamos el coste asociado al conjunto que
        %termina en k
        for k=1:s
            minval=inf;
            
            sconj=S(ind,:);
            sMenosk=S(ind,:);
            sMenosk(k)=[];
            indc=indexConj(sMenosk,numPrim);

            %buscamos el mínimo de los posibles caminos que acaban en k y
            %tienen m como penúltima ciudad
            for m=1:s
                if m==k
                    continue
                end
                %al costo calculado de ir de 1 hasta m siguiendo los
                %elementos del conjunto (valor almacenado en d(indc,sconj(m)) )
                %le sumamos el valor de ir de m a k.
                dm=dmatrix(sconj(k),sconj(m))+d(indc,sconj(m));
                if(dm< minval)
                    minval=dm;
                    indmin=m;
                end
            end

            indcM=indexConj(S(ind,:),numPrim);
            d(indcM,sconj(k))=minval;
            predecesor(indcM,sconj(k))=sconj(indmin);
            %sconj(indmin)
        end
    end
end

%reproducimos el último paso, para volver a 1
optim=inf;
for k=2:numCiudades
    sconj=2:numCiudades;
    indc=indexConj(sconj,numPrim);
    dm=dmatrix(k,1)+d(indc,k);
    if(dm< optim)
        optim=dm;
        indmin=k;
    end
end


%Extracción del camino final
%resultado contiene el vector del camino
resultado(numCiudades+1)=0;
resultado(1)=1;

%novistadas nos dice que ciudades todavía no hemos visitado:
% 1-> no visitada
% 0-> visitada
novisitadas=ones([1,numCiudades]);
novisitadas=logical(novisitadas);
novisitadas(1)=0;

%lista de ciudades a eliminar.
identidad=1:numCiudades;
for i= 2:numCiudades
        %la siguiente ciudad a visitar se almacena en indmin.
        resultado(i)=indmin;
        %Miramos el conjunto de ciudades no visitadas
        conjS=identidad(novisitadas);
        %elimina ciudad que visitamos
        novisitadas(indmin)=0;

        %devuelve el penúltimo elemento del camino, esto es, la siguiente
        %ciudad que visitiaremos.
        indS=indexConj(conjS,numPrim);
        indmin=predecesor(indS,indmin);

end

resultado(end)=1
optim


%indexConj calcula el índice del conjunto Conj.
%Emplea numPrim para no recalcularlo
function indc=indexConj(Conj,numPrim)
    indc=prod(numPrim(Conj));
end
