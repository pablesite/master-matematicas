import threading
import time

cerrojo = threading.Lock()

def incrementar():
    global contador
    for i in range(10000000):
        cerrojo.acquire()
        contador += 1
        cerrojo.release()

def decrementar():
    global contador
    for i in range(10000000):
        cerrojo.acquire()
        contador -= 1
        cerrojo.release()  


if __name__ == "__main__":
    contador = 0
    hilo1 = threading.Thread(target = incrementar)
    hilo2 = threading.Thread(target = decrementar)

    hilo1.start()
    hilo2.start()

    hilo1.join()
    hilo2.join()

    print(contador)
