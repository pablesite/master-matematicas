""" Implementación de la clase Grafo No Dirigido"""

class GrafoNoDirigido:
    """ Clase Grafo No Dirigido"""

    def __init__(self, num_nodos):
        self.num_nodos = num_nodos
        self.matrizady = [0]*num_nodos

    def get_num_nodos(self):
        """ Devuelve el número de nodos"""
        return self.num_nodos
    
    def get_matrizady(self, x, y):
        """ Devuelve la terna con origen en x, destino en y su valor de distancia."""
        return self.matrizady[x][y]