import threading
import time
import random

class LectorEscritoresPrioridadEscritor():

    def __init__(self):
        # Se crea un semáforo para garantizar que el contador de lectores se modifica en exclusión mutua
        self.semaforoExclusionMutuaLectores = threading.Semaphore()
        # Se crea un semáforo para garantizar que el contador de escritores se modifica en exclusión mutua  
        self.semaforoExclusionMutuaEscritores = threading.Semaphore()
        # Garantiza que a la zona para control inicial sólo accede un lector
        self.semaforoPrioridadEscritores = threading.Semaphore()
        # Semáforo que bloquea el acceso a más de un escritor
        self.semaforoEscritores = threading.Semaphore()
        # Semáforo que bloquea el acceso a lectores para dar prioridad a los escritores
        self.semaforoLectores = threading.Semaphore()

        self.numLectores = 0
        self.numEscritores = 0
        self.dato = None
        self.condicionVacio = threading.Condition()

    def lectorPrioridad(self, dato):
        while True:
            with self.condicionVacio:
                if self.dato == None:
                    self.condicionVacio.wait() # El hilo no avanza si el dato está vacío
            self.semaforoPrioridadEscritores.acquire()
            self.semaforoLectores.acquire()
            self.semaforoExclusionMutuaLectores.acquire()

            # Espera a leer en el semáforo
            self.numLectores += 1 # Incrementa el contador de lectores
            if self.numLectores == 1: # Se toma el semáforo de los escritores para que no entre ninguno
                self.semaforoEscritores.acquire()

            # Se libera el semáforo para dar paso a más lectores
            self.semaforoExclusionMutuaLectores.release()
            self.semaforoLectores.release()
            self.semaforoPrioridadEscritores.release()

            dato = self.dato
            print(f"El {threading.current_thread().name} está leyendo.\n")
            print(f"Hay {self.numLectores} leyendo {dato}.\n")
            time.sleep(2)

            # Se vuelve a adquirir el semáforo para decrementar los lectores
            self.semaforoExclusionMutuaLectores.acquire()
            # Se decrementa el contador de lectores
            self.numLectores -= 1
            print(f"Hay {self.numLectores} leyendo. \n")
            if(self.numLectores == 0): # Si no quedan lectores se libera el semáforo de los escritores
                self.semaforoEscritores.release()
            # Se libera el semáforo de los lectores
            self.semaforoExclusionMutuaLectores.release() 

    def escritorPrioridad(self):
        while True:
            # Adquiere el semáforo y ejecuta las acciones en exclusión mutua
            self.semaforoExclusionMutuaEscritores.acquire()
            self.numEscritores += 1
            if self.numEscritores == 1:
                self.semaforoLectores.acquire()
            self.semaforoExclusionMutuaEscritores.release()
            self.semaforoEscritores.acquire()

            dato = random.random()
            print(f"El {threading.current_thread().name} está escribiendo. \n")
            print("Escribiendo datos " + str(dato))
            with self.condicionVacio:
                if self.dato == None:
                    self.condicionVacio.notify_all()
            self.dato = dato
            time.sleep(3)

            # Se libera el semáforo
            self.semaforoEscritores.release()
            self.semaforoExclusionMutuaEscritores.acquire()
            self.numEscritores -= 1
            if self.numEscritores == 0:
                self.semaforoLectores.release()
            self.semaforoExclusionMutuaEscritores.release()
            time.sleep(4)

if __name__ == "__main__":
    lecEscPrioridad = LectorEscritoresPrioridadEscritor()
    dato = 0

    t1 = threading.Thread(target = lecEscPrioridad.lectorPrioridad, args = (dato, ), name = "Lector 1" )
    t1.start()

    t2 = threading.Thread(target = lecEscPrioridad.escritorPrioridad, name = "Escritor 1" )
    t2.start()

    t3 = threading.Thread(target = lecEscPrioridad.lectorPrioridad, args = (dato, ), name = "Lector 2" )
    t3.start()

    t4 = threading.Thread(target = lecEscPrioridad.lectorPrioridad, args = (dato, ), name = "Lector 3" )
    t4.start()

    t5 = threading.Thread(target = lecEscPrioridad.escritorPrioridad, name = "Escritor 2" )
    t5.start()

    t6 = threading.Thread(target = lecEscPrioridad.lectorPrioridad, args = (dato, ), name = "Lector 4" )
    t6.start()





