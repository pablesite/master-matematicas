import logging
import random
import threading
import time

logging.basicConfig(level = logging.DEBUG, format = ' (%(threadName)-2s) %(message)s', )


class GestorConexiones(object):
    def __init__(self):
        threading.Thread.__init__(self)
        self.activas = []
        self.cerrojo = threading.Lock()

    def activar(self, name):
            with self.cerrojo:
                 self.activas.append(name)
                 logging.debug('Conexiones activas: %s', self.activas)

    def desactivar(self, name):
            with self.cerrojo:
                 self.activas.remove(name)
                 logging.debug('Conexiones activas: %s', self.activas)
 

def conexion(s, gestor):
     logging.debug('Esperando para unirse al gestor')
     with s:
          nombre = threading.current_thread().name
          gestor.activar(nombre)
          time.sleep(0.1)
          gestor.desactivar(nombre)

gestor = GestorConexiones()
semaforo = threading.Semaphore(3)

for i in range(7):
     t = threading.Thread(target = conexion, name = "Hilo " + str(i), args = (semaforo, gestor))
     t.start()