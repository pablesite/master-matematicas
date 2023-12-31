""" Algoritmos de búsqueda"""

def busqueda_secuencial(lista, x):
    """ Algoritmo que busca un elemento de manera secuencial """
    for i in range(len(lista)):
        if lista[i] == x:
            return i
    return -1
