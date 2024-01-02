""" Algoritmos de ordenación"""
import math

def ordenacion_burbuja(lista, num_comparaciones):
    """ Algoritmo que ordena valores en una lista con el método de la burbuja """
    n = len(lista)
    for i in range(1, n):
        for j in range(n - i):
            num_comparaciones += 1
            if lista[j] > lista[j + 1]:
                lista[j], lista[j + 1] = lista [j + 1], lista[j]
    return num_comparaciones

def ordenacion_seleccion(lista, num_comparaciones):
    """ Algoritmo que ordena valores en una lista con el método de selección """
    n = len(lista)
    for i in range(n - 1):
        minimo = i
        for j in range(i + 1, n):
            num_comparaciones += 1
            if lista[j] < lista[minimo]:
                minimo = j
        lista[i], lista[minimo] = lista [minimo], lista[i]
    return num_comparaciones

def ordenacion_insercion(lista, num_comparaciones):
    """ Algoritmo que ordena valores en una lista con el método de inserción """
    n = len(lista)
    for i in range(1, n):
        val = lista[i]
        j = i
        while j > 0 and lista[j - 1] > val:
            lista[j] = lista[j - 1]
            j -= 1
            num_comparaciones += 1
        lista[j] = val
    return num_comparaciones

def ordenacion_insercion_viajante(lista, comparar_terna):
    """ Algoritmo que ordena valores en una lista con el método de inserción """
    n = len(lista)
    for i in range(1, n):
        val = lista[i]
        j = i
        while j > 0 and comparar_terna(lista[j - 1], val):
            lista[j] = lista[j - 1]
            j -= 1
        lista[j] = val
    return lista

def ordenacion_mergesort(lista, num_comparaciones):
    """ Algoritmo que ordena valores con la estrategia de ordenación por mezcla """
    if len(lista) <= 1:
        return lista, num_comparaciones

    medio = len(lista) // 2
    izquierda = lista[:medio]
    derecha = lista[medio:]

    izquierda, num_comparaciones = ordenacion_mergesort(izquierda, num_comparaciones)
    derecha, num_comparaciones = ordenacion_mergesort(derecha, num_comparaciones)

    lista, num_comparaciones = merge(izquierda, derecha, num_comparaciones)
    return lista , num_comparaciones

def merge(lista_a, lista_b, num_comparaciones):
    """ Mecla del algoritmo de ordenación por mezcla """
    lista = [math.inf for _ in range (len(lista_a) + len(lista_b))]

    lista_a.append(math.inf)
    lista_b.append(math.inf)

    i = 0
    j = 0

    for k in range(0, len(lista)):
        num_comparaciones += 1
        if lista_a[i] < lista_b[j]:
            lista[k] = lista_a[i]
            i += 1
        else:
            lista[k] = lista_b[j]
            j += 1
    return lista, num_comparaciones
