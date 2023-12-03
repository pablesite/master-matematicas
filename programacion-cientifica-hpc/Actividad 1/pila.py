""" Módulo que provee un TAD de tipo PILA (LIFO). """

class Pila:
    """ Clase que representa a un TAD de tipo Pila (LIFO) """ 
    def __init__(self, tipo):
        self.tipo = tipo
        self.__pila = []
    
    def esta_vacia(self):
        """ Método que indica si la Pila está vacía """
        return not self.__pila
    
    def cima(self):
        """ Método que indica el último valor de la Pila """
        try:
            return self.__pila[-1]
        except:
            return None
        
    def apilar(self,elemento):
        """ Método para apilar un nuevo valor en la Pila """
        if isinstance(elemento, self.tipo):
            self.__pila.append(elemento)
            return
        else:
            raise TypeError
            
    def desapilar(self):
        """ Método para desapilar un valor de la Pila """
        try:
            return self.__pila.pop()
        except:
            return None