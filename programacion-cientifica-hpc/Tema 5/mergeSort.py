from time import time
import math

def mergeSort(lista):
    if len(lista) <= 1:
        return lista
    print("lista: ", str(lista))
    medio = len(lista) // 2
    izquierda = lista[:medio]
    derecha = lista[medio:]
    
    print("izquierda: ", str(izquierda))
    print("derecha: ", str(derecha))
    izquierda = mergeSort(izquierda)
    derecha = mergeSort(derecha)

    return merge(izquierda, derecha)

def merge(listaA, listaB):
    global numComparaciones
    
    lista = [math.inf for _ in range(len(listaA)+len(listaB))]

    print("lista_a: ", str(listaA))
    print("lista_b: ", str(listaB))
    listaA.append(math.inf)
    listaB.append(math.inf)
    
    i=0
    j=0
   
    for k in range(0,len(lista)):
        numComparaciones+=1

        if listaA[i]<listaB[j]:
            lista[k]=listaA[i]
            i+=1
        else:
            lista[k]=listaB[j]
            j+=1

    return lista


lista = [35, 36, 17, 73, 8, 0]
numComparaciones = 0

t0 = time()
lista = mergeSort(lista)
t1 = time()

print ("Lista ordenada:")
print(lista)
print ("Tiempo: {0:f} segundos".format(t1 - t0))
print ("Comparaciones:", numComparaciones)