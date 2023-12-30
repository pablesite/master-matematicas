""" Algoritmos de ordenación"""

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