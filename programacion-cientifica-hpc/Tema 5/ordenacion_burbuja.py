""" Algoritmo de ordenación de burbuja """

def ordenacion_burbuja(lista, num_comparaciones):
    """ Algoritmo que ordena valores en una lista con el método de la burbuja """
    n = len(lista)
    for i in range(1, n):
        for j in range(n - i):
            num_comparaciones += 1
            if lista[j] > lista[j + 1]:
                lista[j], lista[j + 1] = lista [j + 1], lista[j]
    return num_comparaciones