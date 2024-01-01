""" Módulo de test para probar los diferentes algoritmos de búsqueda """

from time import time
from algoritmos_busqueda import busqueda_secuencial, busqueda_recursiva

# Búsqueda secuencial
lista = [35, 36, 16, 17, 73, 8, 0, 27, 49, 50, 62, 15, 4, 3, 47, 24, 12, 67, 324, 10, 1, 45, 7, 9, 5, 2]
print("\n Método de búsqueda secuencial")
t0 = time()
indice = busqueda_secuencial(lista, 49)
t1 = time()

print("Índice encontrado: " + str(indice))
print("Tiempo: {0:f} segundos" .format(t1 - t0))


# Búsqueda recursiva
lista = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 12, 15, 16, 17, 24, 27, 35, 36, 45, 47, 49, 50, 62, 67, 73, 324]
#lista = [0,  1, 2, 3, 4]
print("\n Método de búsqueda recursiva")
t0 = time()
indice = busqueda_recursiva(lista, 73)
t1 = time()

print("Índice encontrado: " + str(indice))
print("Tiempo: {0:f} segundos" .format(t1 - t0))
