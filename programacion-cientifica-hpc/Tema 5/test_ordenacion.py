""" Módulo de test para probar los diferentes métodos de ordenación """

from time import time
from algoritmos_ordenacion import ordenacion_burbuja, ordenacion_seleccion

# Ordenación de burbuja.
lista = [35, 36, 17, 73, 8, 0]
NUM_COMPARACIONES = 0
t0 = time()
NUM_COMPARACIONES = ordenacion_burbuja(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación de la burbuja")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)


# Ordenación de burbuja.
lista = [35, 36, 16, 17, 73, 8, 0, 50, 62, 4]
NUM_COMPARACIONES = 0
t0 = time()
NUM_COMPARACIONES = ordenacion_seleccion(lista, NUM_COMPARACIONES)
t1 = time()
print("\n Método de ordenación de selección")
print("Lista ordenada: " + str(lista))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
print("Comparaciones:", NUM_COMPARACIONES)