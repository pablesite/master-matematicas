from viajante import Viajante

listad = [[0, 3, 10, 11, 7, 25], [0, 0, 6, 12, 8, 26], [0, 0, 0, 9, 4, 20], [0, 0, 0, 0, 5, 15], [0, 0, 0, 0, 0, 18]]
viajante = Viajante(6, listad)
viajante.heuristica()
print("Las aristas seleccionadas son: ")
print(viajante.recorrido)
print("El viaje es: ")
print(viajante.viaje)
print("La distancia recorrida es: ")
print(viajante.distancia)