""" Módulo que provee la clase ArbolBinarioOrdenado mejorado. """

from cola import Cola

def busca_frecs_min(dicc):
    """ Método que busca los dos valores mínimos en un diccionario """
    item_ordenados = sorted(dicc.items(), key=lambda x: x[1])
    return [item[0] for item in item_ordenados[:2]]

def busca_nodo_con_raiz(lista_nodos, simbolo):
    """ Método que busca un nodo concreto dentro de una lista de nodos """ 
    for i in lista_nodos:
        for key in i.raiz().keys():
            if key == simbolo:
                return i
    return None

class ArbolHuffman:
    """ Clase que representa a un TAD de tipo árbol Huffman """   
    def __init__(self) :
        # Quizá el tipo debe ser siempre Dict.
        self.__tipo = dict
        self.__raiz = None
        self.__padre_izdo = None
        self.__padre_dcho = None
        self.__arbol_izdo = None
        self.__arbol_dcho = None

    def tipo(self):
        """ Método que devuelve el tipo del árbol """ 
        return self.__tipo

    def raiz(self):
        """ Método que devuelve la raiz del árbol """ 
        return self.__raiz
    
    def set_raiz(self, raiz):
        """ Método que establece la raiz del árbol """ 
        self.__raiz = raiz

    def padre_izdo(self):
        """ Método que devuelve el padre del árbol que se encuentra a la izquierda mirando desde el hijo""" 
        return self.__padre_izdo
    
    def padre_dcho(self):
        """ Método que devuelve el padre del árbol que se encuentra a la derecha mirando desde el hijo""" 
        return self.__padre_dcho
    
    def set_padre_izdo(self, padre):
        """ Método que establece la padre del árbol que se encuentra a la izquierda mirando desde el hijo """ 
        self.__padre_izdo = padre

    def set_padre_dcho(self, padre):
        """ Método que establece la padre del árbol que se encuentra a la derecha mirando desde el hijo """ 
        self.__padre_dcho = padre

    def arbol_izdo(self):
        """ Método que devuelve el sub-árbol izquierdo """ 
        return self.__arbol_izdo
    
    def set_arbol_izdo(self, arbol_izdo):
        """ Método que establece árbol izquierdo """ 
        self.__arbol_izdo = arbol_izdo

    def arbol_dcho(self):
        """ Método que devuelve el sub-árbol derecho """ 
        return self.__arbol_dcho
    
    def set_arbol_dcho(self, arbol_dcho):
        """ Método que establece árbol izquierdo """ 
        self.__arbol_dcho = arbol_dcho

    def esta_vacio(self):
        """ Método que indica si un árbol está vacío """  
        return self.__raiz is None
    
    def copy(self, nodo):
        """ Método para copiar un nodo en profundidad """
        self.__tipo = dict
        self.__raiz = nodo.raiz()
        self.__padre_izdo = nodo.padre_izdo()
        self.__padre_dcho = nodo.padre_dcho()
        self.__arbol_izdo = nodo.arbol_izdo()
        self.__arbol_dcho = nodo.arbol_dcho()

    def crear_arbol_huffman(self, dicc):
        """ Método que genera un árbol huffman a partir de un diccionario de símbolos con frecuencias asociadas """  
        if not isinstance(dicc, self.__tipo):
            raise TypeError
        dicc_temp = dicc.copy()
        # Se crea una lista con los nodos hoja principales
        lista_nodos = []
        for i in dicc_temp:
            nodo_hoja = ArbolHuffman()
            nodo_hoja.set_raiz({i : dicc_temp[i]})
            nodo_hoja.set_arbol_izdo(ArbolHuffman())
            nodo_hoja.set_arbol_dcho(ArbolHuffman())
            nodo_hoja.set_padre_izdo(ArbolHuffman())
            nodo_hoja.set_padre_dcho(ArbolHuffman())
            lista_nodos.append(nodo_hoja)
        # Se crean los nodos internos del árbol y se intercoenctan con las hojas
        counter = 0
        while len(dicc_temp) > 1:
            # Se buscan las dos frecs_min más pequeñas
            frecs_min = busca_frecs_min(dicc_temp)
            # Se crea un nodo padre y se añade a la lista
            clave = f"int_{counter}"
            valor = dicc_temp[frecs_min[0]] + dicc_temp[frecs_min[1]]
            arbol_izdo = busca_nodo_con_raiz(lista_nodos, frecs_min[0])
            arbol_dcho = busca_nodo_con_raiz(lista_nodos, frecs_min[1])
            new_nodo = ArbolHuffman()
            new_nodo.set_raiz({clave : valor})
            arbol_izdo.set_padre_dcho(new_nodo)
            arbol_izdo.set_padre_izdo(ArbolHuffman())
            arbol_dcho.set_padre_izdo(new_nodo)
            arbol_dcho.set_padre_dcho(ArbolHuffman())
            new_nodo.set_arbol_izdo(arbol_izdo)
            new_nodo.set_arbol_dcho(arbol_dcho)
            lista_nodos.append(new_nodo)

            # Se añade la nueva {clave : valor} al diccionario 
            dicc_temp[clave] = valor
            # Se limpia la lista de nodos y el diccionario con los valores ya usados
            dicc_temp.pop(frecs_min[0])
            dicc_temp.pop(frecs_min[1])
            lista_nodos.remove(arbol_izdo)
            lista_nodos.remove(arbol_dcho)
            # El contador sirve para generar claves dinámicas a los nodos internos
            counter += 1
        # Se establece el nodo raiz como el árbol Huffman
        self.copy(lista_nodos[0])

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
        if isinstance(self.padre_dcho(), ArbolHuffman): 
            mi_arbol += "El padre derecho es: " + str(self.padre_dcho().raiz()) + "\n"
        if isinstance(self.padre_izdo(), ArbolHuffman): 
            mi_arbol += "El padre izquierdo es: " + str(self.padre_izdo().raiz()) + "\n"
        return mi_arbol
    
    def amplitud_iterativo(self):
        """ Tarea 2: Método que recorre el árbol de manera iterativa en amplitud. """ 
        l = []
        arbol_temp = self
        cola = Cola(ArbolHuffman)
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
    
    def nodo_simbolo(self, simbolo):
        """ Método para obtener el nodo desde un símbolo del código Huffman. """ 
        arbol_temp = self
        nodo = ArbolHuffman()
        cola = Cola(ArbolHuffman)
        while not arbol_temp.esta_vacio():
            nodo = busca_nodo_con_raiz([arbol_temp], simbolo)
            if isinstance(nodo, ArbolHuffman):
                return arbol_temp
            if not arbol_temp.arbol_izdo().esta_vacio():
                cola.encolar(arbol_temp.arbol_izdo())
            if not arbol_temp.arbol_dcho().esta_vacio():
                cola.encolar(arbol_temp.arbol_dcho())
            if not cola.esta_vacia():
                arbol_temp = cola.desencolar()
            else:
                break
        return None


    def codificacion_simbolo(self, simbolo):
        """ Método para codificar un símbolo del código Huffman. """
        l = []
        arbol_temp = self.nodo_simbolo(simbolo)
        while not 1.0 in arbol_temp.raiz().values():
            if not arbol_temp.padre_dcho().esta_vacio():
                arbol_temp = arbol_temp.padre_dcho()
                l.append(False)
            elif not arbol_temp.padre_izdo().esta_vacio():
                arbol_temp = arbol_temp.padre_izdo()
                l.append(True)
            else:
                break
        return l[::-1]
        
    def decodificacion_codigo(self, codigo):
        """ Método para decodificar un código Huffman y obtener el símbolo asociado. """
        arbol_temp = self
        for i in codigo:
            if not isinstance(i, bool):
                raise TypeError
            if i is True:
                arbol_temp = arbol_temp.arbol_dcho()
            else:
                arbol_temp = arbol_temp.arbol_izdo()
        return arbol_temp.raiz()
        