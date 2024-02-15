# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 22:19:58 2024

@author: Pablo Ruiz
"""

# Instalación:
# Asegúrate de tener isntalado Celery en tu entorno Python. Puedes instalarlo usando pip:
"""
pip install celery
"""

# Configuración:
# Crea un archivo de configuración celeryconfig.py para definir la configuración de Celery. Por ejemplo:
    
#celeryconfig.py
broker_url = 'amqp://guest:guest@localhost:5672//' # URL del broker (RabbitMQ)
result_backend = 'redis://localhost:6379/0' #. URL del backend de resultados (Redis)

# Creación de tareas:
# Define las tareas que deseas ejecutar de forma distribuida en un archivo trask.py
# Por ejemplo, vamos a crear una tarea que calcula la suma de dos números:
    
#task.py
from celery import Celery

app = Celery('myapp')
app.config_from_object('celeryconfig')

@app.task
def suma(a, b):
    return a + b


# Lanzamiento de tareas:
# En otro archivo o en la consola interactiva de Python, puedes lanzar las tareas utilizando Celery. Por ejemplo:
from tasks import suma

# Lanza la tarea de suma de forma distribuida
result = suma.delay(4, 6)
#result = app.send_task('my_task', args = [arg1, arg2]) # De un ejemplo anterior

# Espera a que la tarea se complete y obtén el resultado
print(result.get())



