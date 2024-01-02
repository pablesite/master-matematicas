""" Implementación de la clase del viajante, usando heurística voraz"""

from algoritmos_ordenacion import ordenacion_insercion_viajante
from grafo_no_dirigido import GrafoNoDirigido

class Viajante:
    """ Definición de la clase Viajante """
    def __init__(self, num_nodos, lista_distancias = None):
        """ Constructor de la clase Viajante"""
        if lista_distancias is None:
            lista_distancias = []
        
        # Grafo no dirigido. En su matriz de adyacencia almacena ternas, origen, destino, distancia. 
        # Es una matriz triangular
        self.grafo = GrafoNoDirigido(num_nodos)

        for i in range(num_nodos - 1):
            for j in range(i + 1, num_nodos):
                self.grafo.matrizady[i][j] = [i, j, lista_distancias[i][j]]
        self.visitas = [0]*num_nodos # Indica las veces que se ha visitado un vértice
        self.recorrido = list() # Almacena las ternas de recorrido
        self.distancia = 0 # Distancia recorrida
        self.viaje = list() # Almacena el ciclo sin datos adicionales

    @staticmethod
    def comparar_terna(terna1, terna2):
        """ Método de comparación de distancias que permite ordenadr de menor a mayor """
        return terna1[2] > terna2[2]
    
    def ordenar_aristas(self):
        """ Método que ordena la lista de ternas creada. A partir de la matriz ordena por inserción.
        Algoritmo al que se le pasa el método de comparación"""
        lista_aux = list()
        for i in range(self.grafo.num_nodos):
            for j in range(i + 1, self.grafo.num_nodos):
                lista_aux.append(self.grafo.matrizady[i][j])

        ordenacion_insercion_viajante(lista_aux, Viajante.comparar_terna)
        return lista_aux
    
    def comprobar_tercera(self, arista):
        """ Comprueba si los vértices de la arista ya han sido visitados dos veces """
        return self.visitas[arista[0]] == 2 or self.visitas[arista[1]] == 2
    
    def genera_ciclo(self, arista):
        """ Comprueba si una arista cierra ciclo """
        return arista[0] == 0 or arista[1] == 0

    def buscar_siguiente(self, nodo):
        """ Devuelve siguiente arista cuando se construye ciclo final """
        for arista in self.recorrido:
            if arista[0] == nodo:
                self.recorrido.remove(arista)
                return arista
            elif arista[1] == nodo:
                self.recorrido.remove(arista)
                arista[0], arista[1] = arista[1], arista[0]
                return arista
        return -1
    
    def es_ultimo(self, arista):
        """ Busca la última arista que cierra el ciclo """
        ultimo_destino = self.recorrido[-1][1]
        return (arista[0] == ultimo_destino or arista[1] == ultimo_destino) and (arista[0] == 0 or arista[1] == 0)
    
    def generar_ciclo(self):
        """ Construye el ciclo final ordenado de aristas seleccionadas """
        recorrido_aux = list()
        recorrido_aux.append(self.recorrido[0])
        self.viaje.append(0)
        self.recorrido.pop(0)

        while len(self.recorrido) > 0:
            nodo_orig = recorrido_aux[-1][1]
            arista_sig = self.buscar_siguiente(nodo_orig)
            recorrido_aux.append(arista_sig)
            self.viaje.append(arista_sig[0])
        
        self.recorrido = recorrido_aux

    def heuristica(self):
        """ Método heurístico aplicado """
        primera = self.grafo.matrizady[0][1] # Primera arista desde el origen conocido
        self.recorrido.append(primera)
        self.visitas[0] += 1
        self.visitas[1] += 1
        lista_aristas = self.ordenar_aristas()
        self.distancia += primera[2]

        # For que selecciona las aristas
        for arista in lista_aristas:
            if not arista in self.recorrido and not self.genera_ciclo(arista) and not self.comprobar_tercera(arista):
                primero = arista[0]
                segundo = arista[1]
                self.recorrido.append(arista)
                self.visitas[primero] += 1
                self.visitas[segundo] += 1
                self.distancia += arista[2]

        self.generar_ciclo()

        # Añade la última arista para cerrar
        for arista in lista_aristas:
            if not arista in self.recorrido and self.es_ultimo(arista):
                if arista[0] == self.recorrido[-1][1]:
                    self.recorrido.append(arista)
                    break
                else:
                    arista[0], arista[1] = arista[1], arista[0]
                    self.recorrido.append(arista)
                    break
        self.distancia += arista[2]
        self.viaje.append(arista[0])
        self.viaje.append(0)