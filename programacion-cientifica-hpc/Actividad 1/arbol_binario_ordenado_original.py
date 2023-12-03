""" Módulo que provee la clase ArbolBinarioOrdenado original, propuesta por la actividad. """

class ArbolBinarioOrdenadoOriginal:
    """ Clase que representa a un TAD de tipo árbol binario ordenado """   
    def __init__(self) :
        self._raiz = None
        self._arbol_izdo = None
        self._arbol_dcho = None

    def raiz(self):
        """ Método que devuelve la raiz del árbol """ 
        return self._raiz

    def arbol_izdo(self):
        """ Método que devuelve el sub-árbol izquierdo """ 
        return self._arbol_izdo

    def arbol_dcho(self):
        """ Método que devuelve el sub-árbol derecho """ 
        return self._arbol_dcho

    def esta_vacio(self):
        """ Método que indica si un árbol está vacío. """  
        return self._raiz is None

    def insertar_elemento(self, elemento):
        """ Método que permite incluir un elemento al árbol de manera ordenada. """  
        if self.esta_vacio():
            self._raiz = elemento
            self._arbol_izdo = ArbolBinarioOrdenadoOriginal()
            self._arbol_dcho = ArbolBinarioOrdenadoOriginal()
        elif elemento <= self._raiz:
            self._arbol_izdo.insertar_elemento(elemento)
        elif elemento > self._raiz:
            self._arbol_dcho.insertar_elemento(elemento)
        else:
            self._raiz = None

    def tiene_elemento(self, elemento):
        """ Método que devuelve si un elemento se encuentra en el árbol. """  
        if self.esta_vacio():
            return False
        elif self._raiz == elemento:
            return True
        elif elemento < self._raiz:
            return self._arbol_izdo.tiene_elemento(elemento)
        else:
            return self._arbol_dcho.tiene_elemento(elemento)

    def num_elementos(self):
        """ Método que devuelve el número de elementos del árbol. """ 
        if self.esta_vacio():
            return 0
        else:
            return 1 + self._arbol_izdo.num_elementos() + self._arbol_dcho.num_elementos()

    def pre_orden(self):
        """ Método que recorre el árbol de manera recursiva en pre-orden. """ 
        l = []
        l.append(self._raiz)

        if not self._arbol_izdo.esta_vacio():
            l += self._arbol_izdo.pre_orden()

        if not self._arbol_dcho.esta_vacio():
            l += self._arbol_dcho.pre_orden()

        return l

    def in_orden(self):
        """ Método que recorre el árbol de manera recursiva en orden. """ 
        l=[]

        if not self._arbol_izdo.esta_vacio():
            l += self._arbol_izdo.in_orden()

        l.append(self._raiz)

        if not self._arbol_dcho.esta_vacio():
            l += self._arbol_dcho.in_orden()

        return l
        