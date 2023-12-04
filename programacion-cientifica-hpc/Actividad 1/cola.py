""" Módulo que provee un TAD de tipo COLA (FIFO). """

class Cola:
    """ Clase que representa a un TAD de tipo Cola (LIFO) """ 
    def __init__(self, tipo):
        self.tipo = tipo
        self.__cola = []
    
    def esta_vacia(self):
        """ Método que indica si la Cola está vacía """
        return not self.__cola
    
    def primero(self):
        """ Método que indica el primer valor de la Cola """
        try:
            return self.__cola[0]
        except:
            return None
        
    def encolar(self,elemento):
        """ Método para encolar un nuevo valor en la Cola """
        if isinstance(elemento, self.tipo):
            self.__cola.append(elemento)
            return
        else:
            raise TypeError
            
    def desencolar(self):
        """ Método para desencolar un valor de la Cola """
        try:
            return self.__cola.pop(0)
        except:
            return None