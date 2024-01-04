""" Test de la librería Numpy """
import numpy as np

def es_par(x):
    """Función que devuelve si un número es par"""
    if x%2 == 0:
        return True
    else:
        return False

es_par_vec = np.vectorize(es_par)
x = np.array([1, 2, 3, 4, 5])
print(es_par_vec(x))
