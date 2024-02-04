import threading
import time

class HiloEjemplo(threading.Thread):
    def __init__(self, id, nombre, tiempo):
        threading.Thread.__init__(self)
        self.id = id
        self.name = nombre
        self.tiempo = tiempo

    def run(self):
            print("Comiendo de la ejecución del %s \n" %self.name)
            i = 5
            while i:
                time.sleep(self.tiempo)
                print("Ejectutando %s \n" %self.name)
                i = i - 1
            print("%s terminado \n" %self.name)


if __name__ == "__main__":
    hilo1 = HiloEjemplo(1, "Hilo Uno", 5)
    hilo2 = HiloEjemplo(2, "Hilo Dos", 2)
    hilo3 = HiloEjemplo(3, "Hilo Tres", 3)

    hilo1.start()
    hilo2.start()
    hilo3.start()

    hilo1.join()
    hilo2.join()
    hilo3.join()