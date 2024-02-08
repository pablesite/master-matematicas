import os
import time
import threading
import multiprocessing

NUMERO_ACTIVIDADES = 6

def dormir():
    """ Sólo espera a que pase el tiempo """
    print(" IDProceso: %s, Nombre Proceso: %s, Nombre Hilo: %s \n" % (
        os.getpid(),
        multiprocessing.current_process().name,
        threading.current_thread().name)
        )
    " se obtiene el identificador del proceso actual, el nombre del proceso "
    "que se ejecuta y el nombre del hilo "
    time.sleep(1)

if __name__=='__main__':
    multiprocessing.freeze_support()
    tiempo_inicial = time.time()
    for _ in range(NUMERO_ACTIVIDADES):
        dormir()
    tiempo_final = time.time()
    print("Tiempo de ejecución secuencial = ", tiempo_final - tiempo_inicial)

    tiempo_inicial = time.time()
    threads = [threading.Thread(target = dormir) for _ in range(NUMERO_ACTIVIDADES)]
    [thread.start() for thread in threads]
    [thread.join() for thread in threads]
    tiempo_final = time.time()
    print("Tiempo de ejecución concurrente = ", tiempo_final - tiempo_inicial)

    tiempo_inicial = time.time()
    processes = [multiprocessing.Process(target = dormir) for _ in range(NUMERO_ACTIVIDADES)]
    [process.start() for process in processes]
    [process.join() for process in processes]
    tiempo_final = time.time()
    print("Tiempo de ejecución paralela = ", tiempo_final - tiempo_inicial)