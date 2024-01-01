""" Algoritmos de búsqueda"""

def busqueda_secuencial(lista, x):
    """ Algoritmo que busca un elemento de manera secuencial """
    for i in range(len(lista)):
        if lista[i] == x:
            return i
    return -1


def busqueda_recursiva(lista, x):
    """ Algoritmo que busca un elemento de manera recursiva en una lista ordenada """
    if len(lista) == 0:
        return -1
    else:
        return busqueda_binaria_rec(lista, x, 0, len(lista) - 1)
    
def busqueda_binaria_rec(lista, x, primero, ultimo):
    print(lista)
    if primero > ultimo:
        return -1
    medio = (primero + ultimo) // 2
    print(medio)
    if lista[medio] < x:
        return busqueda_binaria_rec(lista, x, medio + 1, ultimo)
    elif lista[medio] > x:
        return busqueda_binaria_rec(lista, x, primero, medio - 1)
    else:
        return medio
