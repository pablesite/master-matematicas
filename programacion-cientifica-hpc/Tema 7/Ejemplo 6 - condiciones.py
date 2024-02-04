import logging
import threading
import time

logging.basicConfig(level = logging.DEBUG, format = ' (%(threadName)-2s) %(message)s', )


def consumir(cond):
     """ Consumirá el recurso si se cumplen las condiciones de uso """
     logging.debug('Espera para consumir')
     t = threading.current_thread()
     
     with cond:
          cond.wait()
          logging.debug('Empieza a consumir')

def producir(cond):
     """ Actualiza el recurso para que sea usado por el consumidor """
     logging.debug('Comienza a producir')

     with cond:
          logging.debug('Pone disponible el recurso')
          cond.notify_all()

condicion = threading.Condition()
consumidor1 = threading.Thread(name = ' Consumidor 1', target = consumir, args = (condicion, ))
consumidor2 = threading.Thread(name = ' Consumidor 2', target = consumir, args = (condicion, ))
productor1 = threading.Thread(name = ' Productor 1', target = producir, args = (condicion, ))

consumidor1.start()
time.sleep(3)
consumidor2.start()
time.sleep(2)

productor1.start()