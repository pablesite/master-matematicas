import random
import threading
import time


class RecursoMonitor:
     def __init__(self, cerrojo):
          self.valor = None
          self.cerrojo = cerrojo


     def consumir(self):
          with self.cerrojo:
               print("El " + threading.current_thread().name + " espera a que haya un valor de consulta ")
               if self.valor == None:
                    self.cerrojo.wait()

               texto = "El {hilo} ha obtenido el valor {valor}. \n"
               print (texto.format(hilo = threading.current_thread().name, valor = self.valor))
               return self.valor

     def producir(self, valor):
          with self.cerrojo:
               self.valor = valor
               texto = "El {hilo} ha producido el valor {valor}. \n"
               print (texto.format(hilo = threading.current_thread().name, valor = self.valor))
               self.cerrojo.notify_all()
               
class Consumidor(threading.Thread):
     def __init__(self, nombre, num_consultas, recurso):
          threading.Thread.__init__(self)
          self.name = nombre
          self.valor = None
          self.num_consultas = num_consultas
          self.recurso = recurso

     def run(self):
          print("Comienza " + self.name)
          for i in range(self.num_consultas):
               self.valor = self.recurso.consumir()
               time.sleep(1)

class Productor(threading.Thread):
     def __init__(self, nombre, num_consultas, recurso):
          threading.Thread.__init__(self)
          self.name = nombre
          self.valor = None
          self.num_consultas = num_consultas
          self.recurso = recurso

     def run(self):
          print("Comienza " + self.name)
          for i in range(self.num_consultas):
               valor = random.random()
               self.recurso.producir(valor)
               time.sleep(2)

if __name__ == "__main__":
     condicion = threading.Condition()
     monitor = RecursoMonitor(condicion)
     consumidor1 = Consumidor('Consumidor 1', 5, monitor)
     consumidor2 = Consumidor('Consumidor 2', 5, monitor)
     productor = Productor('Productor', 5, monitor)

     consumidor1.start()
     time.sleep(3)
     consumidor2.start()
     time.sleep(2)

     productor.start()