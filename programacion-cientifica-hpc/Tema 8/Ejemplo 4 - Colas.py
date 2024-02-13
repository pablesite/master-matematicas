import multiprocessing
from multiprocessing import Process, Queue
import random

def insertar_valor(cola):
    valor = random.random()
    cola.put(valor)
    print("Proceso " + multiprocessing.current_process().name + " inserta valor " + str(valor))

if __name__ == "__main__":
    cola = Queue()

    procesos = [Process(target = insertar_valor, args = (cola, )) for _ in range(5)]

    for p in procesos:
        p.start()

    for p in procesos:
        p.join()

    resultado = [cola.get() for _ in procesos]
    print(resultado)