import threading
import time

def incrementar():
    global contador
    for i in range(10000000):
        contador += 1

def decrementar():
    global contador
    for i in range(10000000):
        contador -= 1      


if __name__ == "__main__":
    contador = 1525400
    hilo1 = threading.Thread(target = incrementar)
    hilo2 = threading.Thread(target = decrementar)

    hilo1.start()
    hilo2.start()


    hilo1.join()
    hilo2.join()

    print(contador)
