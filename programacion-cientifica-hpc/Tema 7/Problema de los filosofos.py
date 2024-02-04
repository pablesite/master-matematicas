import threading
import time

camarero = threading.Semaphore(4)

class PalilloCamarero:
     def __init__(self, numero):
          self.numero = numero
          self.cerrojo = threading.Lock()
          
     def obtenerPalillo(self):
          self.cerrojo.acquire()
          print("El palillo " + str(self.numero) + " lo tiene el " + str(threading.current_thread().name) + "\n")

     def soltarPalillo(self):
          print("El palillo " + str(threading.current_thread().name) + " suelta el palillo " + str(self.numero) + "\n")
          self.cerrojo.release()
          
class FilosofoCamarero(threading.Thread):
     
     def __init__(self, nombre, id, izdo, dcho):
          threading.Thread.__init__(self)
          self.name = nombre
          self.id = id
          self.izdo = izdo
          self.dcho = dcho

     def run(self):
          for i in range(2):
               camarero.acquire()
               print("El " + str(threading.current_thread().name) + " ha entrado a comer \n")
               self.izdo.obtenerPalillo()
               self.dcho.obtenerPalillo()
          
               print("El  " + str(threading.current_thread().name) + " está comiendo \n")
               time.sleep(2)
               self.izdo.soltarPalillo()
               self.dcho.soltarPalillo()
               camarero.release()
               print("El " + str(threading.current_thread().name) + " está pensando \n")
               time.sleep(2)


if __name__ == "__main__":
     # Limita el acceso a 4 filósofos
     palillosCamarero = []
     for i in range(5):
          palillo = PalilloCamarero(i)
          palillosCamarero.append(palillo)
     
     filosofosCamarero = []
     for i in range(5):
          nombre = "Filosofo " + str(i)
          filosofo = FilosofoCamarero(nombre, i, palillosCamarero[i], palillosCamarero[(i + 1)%5])
          filosofosCamarero.append(filosofo)

     for i in range(5):
          filosofosCamarero[i].start()

     for i in range(5):
          filosofosCamarero[i].join()
