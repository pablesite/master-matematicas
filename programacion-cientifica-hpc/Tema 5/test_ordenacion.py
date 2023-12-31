""" Módulo de test para probar los diferentes métodos de ordenación """

from time import time
from algoritmos_ordenacion import ordenacion_burbuja, ordenacion_seleccion, ordenacion_insercion, ordenacion_mergesort

# Ordenación de burbuja.
lista = [35, 36, 16, 17, 73, 8, 0, 27, 49, 50, 62, 15, 4, 3, 47, 24, 12, 67, 324, 10, 1, 45, 7, 9, 5, 2]
NUM_COMPARACIONES = 0
t0 = time()
NUM_COMPARACIONES = ordenacion_burbuja(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación de la burbuja")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)

# Ordenación por selección.
lista = [35, 36, 16, 17, 73, 8, 0, 27, 49, 50, 62, 15, 4, 3, 47, 24, 12, 67, 324, 10, 1, 45, 7, 9, 5, 2]
NUM_COMPARACIONES = 0
t0 = time()
NUM_COMPARACIONES = ordenacion_seleccion(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación de selección")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)

# Ordenación de insercción.
lista = [35, 36, 16, 17, 73, 8, 0, 27, 49, 50, 62, 15, 4, 3, 47, 24, 12, 67, 324, 10, 1, 45, 7, 9, 5, 2]
NUM_COMPARACIONES = 0
t0 = time()
NUM_COMPARACIONES = ordenacion_insercion(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación por inserción")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)

# Ordenación por mezcla (recursivo).
lista = [35, 36, 16, 17, 73, 8, 0, 27, 49, 50, 62, 15, 4, 3, 47, 24, 12, 67, 324, 10, 1, 45, 7, 9, 5, 2]
NUM_COMPARACIONES = 0
t0 = time()
lista, NUM_COMPARACIONES = ordenacion_mergesort(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación por mezcla")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)