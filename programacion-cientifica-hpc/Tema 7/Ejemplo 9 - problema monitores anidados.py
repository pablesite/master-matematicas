import threading

class Interna:
     def __init__(self, condicion):
          self.condicion = condicion

     def esperarCondicion(self):
          with self.condicion:
               self.condicion.wait()

     def liberarCondicion(self):
          with self.condicion:
               self.condicion.notify_all()

class Externa:
     def __init__(self, cerrojo, objetoInterno):
          self.objetoInterno = objetoInterno
          self.cerrojo = cerrojo

     def esperar(self):
          with self.cerrojo:
               self.objetoInterno.esperarCondicion()

     def liberar(self):
          with self.cerrojo:
               self.objetoInterno.liberarCondicion()


if __name__ == "__main__":
     cerrojo = threading.Lock()
     condicion = threading.Condition()
     objInterno = Interna(condicion)
     objExterno = Externa(cerrojo, objInterno)
     print(" Inicio del programa ")

     thread1 = threading.Thread(target = objExterno.esperar)
     thread2 = threading.Thread(target = objExterno.liberar)

     thread1.start()
     thread2.start()
     thread1.join()
     thread2.join()

     print("Final del programa " + str(celda1.obtenerValor()) + " " + str(celda2.obtenerValor()))

     