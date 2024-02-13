from multiprocessing import Process, Pipe
import random

def enviar(conn):
    conn.send(["num_contadores", 1000, 2000])
    conn.close()

def recibir(conn):
    print(conn.recv())
    conn.close()

if __name__ == "__main__":
    conexion_receptor, conexion_emisor = Pipe()

    emisor = Process(target = enviar, args = (conexion_emisor, ))
    receptor = Process(target = recibir, args = (conexion_receptor, ))
    receptor.start()
    emisor.start()

    emisor.join()
    receptor.join()