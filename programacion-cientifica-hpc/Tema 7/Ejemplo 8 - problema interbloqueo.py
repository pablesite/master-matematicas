import threading
import time

class Celda:
     def __init__(self, valor, cerrojo):
          self.valor = valor
          self.cerrojo = cerrojo

     def obtenerValor(self):
          self.cerrojo.acquire()
          valor = self.valor
          print (threading.current_thread().name + " obtiene valor " + str(self.valor))
          return valor

     def ponerValor(self, valor):
          self.cerrojo.acquire()
          self.valor = valor
          self.cerrojo.release()
          print (threading.current_thread().name + " pone valor " + str(valor))
          return valor
     
     def intercambiaValor(self, celda):
          self.cerrojo.acquire()
          print (threading.current_thread().name + " cojo el cerrojo " + str(self.cerrojo))
          val1 = self.obtenerValor()
          val2 = celda.obtenerValor()
          time.sleep(3)
          self.ponerValor(val2)
          celda.ponerValor(val1)
          self.cerrojo.release()


if __name__ == "__main__":
     cerrojo1 = threading.RLock()
     cerrojo2 = threading.RLock()
     celda1 = Celda(2, cerrojo1)
     celda2 = Celda(3, cerrojo2)
     print(" Inicio del programa ")
     thread1 = threading.Thread(target = celda1.intercambiaValor, args = (celda2, ))
     thread2 = threading.Thread(target = celda2.intercambiaValor, args = (celda1, ))

     thread1.start()
     thread2.start()
     thread1.join()
     thread2.join()

     print("Final del programa " + str(celda1.obtenerValor()) + " " + str(celda2.obtenerValor()))

     