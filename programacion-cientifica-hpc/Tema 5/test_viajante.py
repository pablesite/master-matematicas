""" Script de test del problema del viajante """

from viajante import Viajante

listad = [[0, 3, 10, 11, 7, 25], [0, 0, 6, 12, 8, 26], [0, 0, 0, 9, 4, 20], [0, 0, 0, 0, 5, 15], [0, 0, 0, 0, 0, 18]]
viajante = Viajante(6, listad)
viajante.heuristica()
print("\nLas aristas seleccionadas son: ", viajante.recorrido)
print("El viaje es: ", viajante.viaje)
print("La distancia recorrida es: ", viajante.distancia)