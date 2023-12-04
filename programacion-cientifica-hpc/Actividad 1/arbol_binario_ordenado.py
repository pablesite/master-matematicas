""" Módulo que provee la clase ArbolBinarioOrdenado mejorado. """

from pila import Pila
from cola import Cola

class ArbolBinarioOrdenado:
    """ Clase que representa a un TAD de tipo árbol binario ordenado """   
    def __init__(self, tipo) :
        self.__tipo = tipo
        self.__raiz = None
        self.__arbol_izdo = None
        self.__arbol_dcho = None

    def tipo(self):
        """ Método que devuelve el tipo del árbol """ 
        return self.__tipo

    def raiz(self):
        """ Método que devuelve la raiz del árbol """ 
        return self.__raiz

    def arbol_izdo(self):
        """ Método que devuelve el sub-árbol izquierdo """ 
        return self.__arbol_izdo

    def arbol_dcho(self):
        """ Método que devuelve el sub-árbol derecho """ 
        return self.__arbol_dcho

    def esta_vacio(self):
        """ Método que indica si un árbol está vacío. """  
        return self.__raiz is None

    def insertar_elemento(self, elemento):
        """ Método que permite incluir un elemento al árbol de manera ordenada. """  
        try:
            if isinstance(elemento, self.__tipo):
                if self.esta_vacio():
                    self.__raiz = elemento
                    self.__arbol_izdo = ArbolBinarioOrdenado(self.__tipo)
                    self.__arbol_dcho = ArbolBinarioOrdenado(self.__tipo)
                elif elemento <= self.__raiz:
                    self.__arbol_izdo.insertar_elemento(elemento)
                elif elemento > self.__raiz:
                    self.__arbol_dcho.insertar_elemento(elemento)
                else:
                    self.__raiz = None
            else:
                raise TypeError
        except TypeError:
            raise TypeError from TypeError

    def insertar_lista(self, lista):
        """ Método que permite incluir una lista al árbol de manera ordenada. """  
        for i in lista:
            self.insertar_elemento(i)

    def tiene_elemento(self, elemento):
        """ Método que devuelve si un elemento se encuentra en el árbol. """  
        if self.esta_vacio():
            return False
        elif self.__raiz == elemento:
            return True
        elif elemento < self.__raiz:
            return self.__arbol_izdo.tiene_elemento(elemento)
        else:
            return self.__arbol_dcho.tiene_elemento(elemento)

    def num_elementos(self):
        """ Método que devuelve el número de elementos del árbol. """ 
        if self.esta_vacio():
            return 0
        else:
            return 1 + self.__arbol_izdo.num_elementos() + self.__arbol_dcho.num_elementos()

    def __str__(self):
        mi_arbol = []
        mi_arbol = "El árbol es de tipo " + str(self.tipo())
        mi_arbol += " y tiene " + str(self.num_elementos()) + " elementos.\n"
        mi_arbol += "La raiz del árbol es: " + str(self.raiz()) + "\n"
        mi_arbol += "El recorrido del árbol en preOrden (recursivo) es: " + str(self.pre_orden()) + "\n"
        mi_arbol += "El recorrido del árbol en inOrden (recursivo) es: " + str(self.in_orden()) + "\n"
        return mi_arbol

    def pre_orden(self):
        """ Método que recorre el árbol de manera recursiva en pre-orden. """ 
        l = []
        l.append(self.__raiz)
        if not self.__arbol_izdo.esta_vacio():
            l += self.__arbol_izdo.pre_orden()
        if not self.__arbol_dcho.esta_vacio():
            l += self.__arbol_dcho.pre_orden()
        return l

    def in_orden(self):
        """ Método que recorre el árbol de manera recursiva en orden. """ 
        l=[]
        if not self.__arbol_izdo.esta_vacio():
            l += self.__arbol_izdo.in_orden()
        l.append(self.__raiz)
        if not self.__arbol_dcho.esta_vacio():
            l += self.__arbol_dcho.in_orden()
        return l

    def pre_orden_prof_iterativo(self):
        """ Tarea 1: Método que recorre el árbol de manera iterativa en pre-orden. """ 
        # Primera versión del algoritmo para recorrer el árbol en profundidad de manera iterativa.
        l=[]
        pila = Pila(ArbolBinarioOrdenado)
        arbol_temp = self
        while not arbol_temp.esta_vacio():
            l.append(arbol_temp.raiz())
            if not arbol_temp.arbol_dcho().esta_vacio():
                pila.apilar(arbol_temp.arbol_dcho())
            if not arbol_temp.arbol_izdo().esta_vacio():
                arbol_temp = arbol_temp.arbol_izdo()
            elif not pila.esta_vacia():
                arbol_temp = pila.desapilar()
            else:
                break
        return l

    def in_orden_prof_iterativo(self):
        """ Tarea 1: Método que recorre el árbol de manera iterativa en orden. """ 
        l=[]
        pila = Pila(ArbolBinarioOrdenado)
        arbol_temp = self
        nodo_visitado = False
        pila.apilar(arbol_temp)
        while not arbol_temp.esta_vacio():
            if arbol_temp.arbol_izdo().esta_vacio() or nodo_visitado:
                arbol_temp = pila.desapilar()
                l.append(arbol_temp.raiz())
                if arbol_temp.arbol_dcho().esta_vacio():
                    if not pila.esta_vacia():
                        nodo_visitado = True
                    else:
                        break
                else:
                    pila.apilar(arbol_temp.arbol_dcho())
                    arbol_temp = arbol_temp.arbol_dcho()
                    nodo_visitado = False
            else:
                pila.apilar(arbol_temp.arbol_izdo())
                arbol_temp = arbol_temp.arbol_izdo()
        return l

    def amplitud_iterativo(self):
        """ Tarea 2: Método que recorre el árbol de manera iterativa en amplitud. """ 
        l = []
        arbol_temp = self
        cola = Cola(ArbolBinarioOrdenado)
        while not arbol_temp.esta_vacio():
            l.append(arbol_temp.raiz())
            if not arbol_temp.arbol_izdo().esta_vacio():
                cola.encolar(arbol_temp.arbol_izdo())
            if not arbol_temp.arbol_dcho().esta_vacio():
                cola.encolar(arbol_temp.arbol_dcho())
            if not cola.esta_vacia():
                arbol_temp = cola.desencolar()
            else:
                break
        return l