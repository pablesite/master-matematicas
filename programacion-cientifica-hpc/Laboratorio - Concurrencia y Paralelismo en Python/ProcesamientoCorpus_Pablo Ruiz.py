import pandas as pd
import multiprocessing as mp
import numpy as np
import time
import matplotlib.pyplot as plt
#modulo para usar expresiones regulares
import re
from multiprocessing import Pool
#importación del corpus brown
"""
# La primera vez hay que instalar el módulo nltk y descargar brown
[pip install nltk]
import nltk
nltk.download('brown')
"""
from nltk.corpus import brown


### Función que construye el DataFrame para su procesamiento, con una frase por fila ###
def construye_textos():
    return [" ".join(np.random.permutation(sents)) for sents in brown.sents()]

### Función que reemplaza comillas dobles ###
def reemplazar_comillas(texto):
    return texto.apply(lambda text: text.replace("``",'"'))

### Función que convierte todas las palabras a minúsculas ###
# De la misma manera que en la función reemplazar_comillas, se usa el método apply, 
# que permite realizar operaciones a lo largo de toda la fila del DataFrame
# Se usa la propiedad lower() para convertir a minúsculas.
def a_minusculas(texto):
    return texto.apply(lambda text: text.lower())

### Función que cuenta palabras de cada fila del DataFrame ###
# Se vuelve a usar el método apply() para trabajar fila a fila.
# se usa split con una expresión regular para separar las palabras en el texto. 
# Además se usa la función len() para contar y devolver el número de palabras de cada frase.
def contar_palabras(texto):
    return texto.apply(lambda text: len(re.split(r"(?:\s+)|(?:,)|(?:\-)",text))) 



### Función para procesar un DataFrame (o un trozo de un DataFrame) ###
def procesar_df(df):
    # Se hace una copia profunda del dataframe para no modificarlo, con copy()
    # De esta manera el DataFrame de entrada puedo usarlo para las diferentes
    # pruebas de cómputo, secuencial y paralelo.
    salida_df = df.copy()
    
    # Se reemplazan las comillas. Notar que entre corchetes se indica la columna
    # del DataFrame sobre la que se hace la transformación.
    salida_df['text'] = reemplazar_comillas(salida_df['text'])
    
    # Se pasa el texto a minúsculas.
    salida_df['text'] = a_minusculas(salida_df['text'])
    
    # Se cuenta el número de palabras y se construye columna nueva con el nombre 
    # num_palabras. Para añadir una nueva columna al DataFrame basta con incluir
    # entre corchetes el nombre de la nueva columna.
    num_palabras = contar_palabras(salida_df['text'])
    salida_df['num_palabras'] = num_palabras
  
    # Se eliminan los textos demasiado largos. "salida_df['num_palabras'] > 50"
    # es el filtro que se usa en el DataFrame para devolver, en este caso,
    # aquellas frases más largas de 50 palabras.
    # Posteriormente, con el método drop del DataFrame se eliminan las frases
    # seleccionadas anteriomente, seleccionadas a través de su índice.
    # Con inplace = True lo que se permite es eliminar las frases en el propio
    # DataFrame y no devolver nada.
    texto_largo_para_eliminar = salida_df[salida_df['num_palabras'] > 50]
    salida_df.drop(texto_largo_para_eliminar.index, inplace=True)

    # Se eliminan los textos demasiado cortos. Fragmento es similar al anterior.
    texto_corto_para_eliminar = salida_df[salida_df['num_palabras'] < 10]
    salida_df.drop(texto_corto_para_eliminar.index, inplace=True)    
    
    # Se reinicializan los indices. Con reset_index se reindexan los índices
    # de cada frase para que las frases que han quedado, se indexen en orden.
    salida_df.reset_index(drop=True, inplace=True)
    
    return salida_df

### Función para procesar en paralelo un DataFrame ###
# Esta función usa la función Pool del módulo multiprocessing, 
# para crear un grupo de procesos paralelos. Se puede elegir el número de núcleos
# con el que se va a realizar la paralelización pasándole el argumento nucleos.
# pool.map() recoge los resultados de la función ejecutada en paralelo (procesar_df)
# y los retorna en una lista. Finalmente se concatena esa lista y se reindexan
# los índices.
def procesar_paralelo(nucleos, procesar_df, df):
    with Pool(nucleos) as pool:
        res = pool.map(procesar_df, df)
    
    df_procesado = pd.concat(res)
    df_procesado.reset_index(drop=True, inplace=True)
    
    return df_procesado


if __name__=="__main__":
    
    """ Construcción del DataFrame """
    
    tiempo_inicial = time.time()
    
    df_brown = pd.DataFrame({
    'text': construye_textos() + construye_textos() + construye_textos()
          + construye_textos() + construye_textos() + construye_textos() 
          + construye_textos() + construye_textos() + construye_textos()
          + construye_textos() + construye_textos() + construye_textos()
    })
    
    
    tiempo_final = time.time()
    tiempo_total_construccion_DF = tiempo_final - tiempo_inicial
    print("La construcción del DataFrame ha tardado " + str(tiempo_total_construccion_DF) + " segundos.\n")
    
    print("DF original: Primeras 3 frases del DF:", df_brown.head(3), "\n")
    print("DF original: Últimas 3 frases del DF:", df_brown.tail(3), "\n")
    
    
    ###########################################################################
    
    """ejecución secuencial"""

    # Se toma tiempo inicial
    tiempo_inicial = time.time()
    
    # Se llama a la funcion procesar_df() con dataframe_brown. En este caso
    # todo el DataFrame construido se procesa de golpe en un sólo procesador.
    df_procesado = procesar_df(df_brown)

    # Se toma el tiempo final y se muestra tiempo total
    tiempo_final = time.time()
    tiempo_total_secuencial = tiempo_final - tiempo_inicial
    print("La ejecución SECUENCIAL ha tardado " + str(tiempo_total_secuencial) + " segundos.\n")
    
    # Se muestran las primeros 3 frases y las 3 últimas.
    print("Ejecución secuencial: Primeras 3 frases del DF:", df_procesado.head(3), "\n")
    print("Ejecución secuencial: Últimas 3 frases del DF:", df_procesado.tail(3), "\n")
 
    
    ###########################################################################

    """ejecución paralela"""

    ### Funcionalidad que muestra el tiempo en base a la cantidad de particiones y el 
    ### número de núcleos elegido ###
    
    # En primer lugar, se imprime el número de núcleos disponible en la CPU
    print("El sistema cuenta con ", mp.cpu_count(), "núcleos.\n")
    
    # Se inicializan las variables en forma de lista, para testear todas las posibilidades.
    # Lista de particiones
    trozos = list([1, 20, 40, 60, 80, 100, 200, 300, 400, 500]) 
    # Lista de núcleos
    nucleos = list(range(1, mp.cpu_count() + 1 )) 
    # Matriz para el vector de tiempos (trozos x núcleos)
    tiempos = [[0] * len(trozos) for i in range(len(nucleos))] 
    # Lista con el tamaño total del eje x. Para comparar.
    tiempo_total_secuencial = [tiempo_total_secuencial] * len(nucleos)

    # Se recorre cada núcleo, y para núcleo, cada partición definida en "trozos". 
    # Para cada caso se ejecuta la función "procesar_paralelo" y se obtiene 
    # la medida del tiempo consumido. Finalmente se almacenan todos los resultados
    # en tiempos y se representan en una gráfica que incluye de un vistazo todas
    # las posibilidades.
    for i in nucleos:
        k = 0
        for j in trozos:
            
            trozos_df = np.array_split(df_brown, j)
            
            tiempo_inicial = time.time()
            df_procesado_paralelo = procesar_paralelo(i, procesar_df, trozos_df)
            if (i == 6 and k == 4):
                print("Ejecución paralela: Primeras 3 frases del DF:", df_procesado_paralelo.head(3), "\n")
                print("Ejecución paralela: Últimas 3 frases del DF:", df_procesado_paralelo.tail(3), "\n")
            tiempo_final = time.time()
            
            tiempos[i - 1][k] = tiempo_final - tiempo_inicial
            k = k + 1
            
            print("La ejecución paralela con", i,  "núcleos y", j,"trozos, ha tardado " + str(tiempo_final - tiempo_inicial), "segundos.")
        
    fig, ax = plt.subplots()
    fig.set_size_inches(16,10)
    ax.plot(nucleos, tiempos)
    ax.plot(nucleos, tiempos,  "o")
    ax.plot(nucleos, tiempo_total_secuencial)
    plt.legend(trozos)
    plt.grid(True)
    ax.set_xticks(nucleos)
    ax.set_title("Tiempo para cada número de núcleos. Cada gráfica corresponde a un número de particiones", fontsize=12)
    ax.tick_params(labelsize=12)
    plt.show()
   