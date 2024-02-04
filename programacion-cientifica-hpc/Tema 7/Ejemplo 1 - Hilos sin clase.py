import threading
import time
import logging

def tareaHilo(tiempo):
    print("Comiendo de la ejecución del %s \n" %threading.current_thread().name)
    i = 5
    while i:
        time.sleep(tiempo)
        print("Ejectutando %s \n" %threading.current_thread().name)
        i = i - 1
    print("%s terminado \n" %threading.current_thread().name)

if __name__ == "__main__":
    hilo1 = threading.Thread(name = "Hilo Uno", target = tareaHilo, args = (3,))
    hilo2 = threading.Thread(name = "Hilo Dos", target = tareaHilo, args = (2,))
    hilo3 = threading.Thread(name = "Hilo Tres", target = tareaHilo, args = (5,))
    hilo1.start()
    hilo2.start()
    hilo3.start()

    hilo1.join()
    hilo2.join()
    hilo3.join()