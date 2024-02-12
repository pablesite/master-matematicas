import pandas as pd
import multiprocessing as mp
import numpy as np
import time
import matplotlib.pyplot as plt
import plotly.graph_objects as go
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


def procesar_paralelo(nucleos, procesar_df, data):
    with Pool(nucleos) as pool:
        res = pool.map(procesar_df, data)
    
    df_procesado = pd.concat(res)
    df_procesado.reset_index(drop=True, inplace=True)
    
    return df_procesado


if __name__=="__main__":
    
    tiempo_inicial = time.time()
    
    dataframe_brown = pd.DataFrame({
    'text': construye_textos() + construye_textos() + construye_textos()
          + construye_textos() + construye_textos() + construye_textos() 
          + construye_textos() + construye_textos() + construye_textos()
          + construye_textos() + construye_textos() + construye_textos()
    })
    
    """
    dataframe_brown = pd.DataFrame({
    'text': construye_textos()
    })
    """
    
    tiempo_final = time.time()
    print("La construcción del dataframe ha tardado " + str(tiempo_final - tiempo_inicial) + " segundos.\n")

    print("df ORIGINAL:", dataframe_brown.head(5),"\n")
    
    # se  toma tiempo inicial
    ###INSERTA TU CODIGO###
    tiempo_inicial = time.time()
    ###########################################################################
    
    """ejecución secuencial"""

    
    #se llama a la funcion procesar_df() con dataframe_brown
    ###INSERTA TU CODIGO###
    df_procesado = procesar_df(dataframe_brown)
    ###########################################################################
    
 
    # se muestra tiempo total
    ###INSERTA TU CODIGO###
    tiempo_final = time.time()
    tiempo_secuencial = tiempo_final - tiempo_inicial
    print("La ejecución SECUENCIAL ha tardado " + str(tiempo_secuencial) + " segundos.\n")
    ###########################################################################
    
    #muestra fila 0
    #print(df_procesado.loc()[0])
    #print(df_procesado)
    #print("df PROCESADO - text: \n", df_procesado['text'], "\n")
    #print("df PROCESADO - numPalabras: \n", df_procesado['num_palabras'], "\n")
    print("df PROCESADO SECUENCIAL:", df_procesado.head(5), "\n")
    #print(df_procesado.tail(1))
    
    #retorna el numero de núcleos en el sistema, te puede servir para decidir el número de procesos
    print("El sistema cuenta con ", mp.cpu_count(), "núcleos.\n")
    
   

    """ejecución paralela"""

    """
    #divide en trozos el dataframe, decide el numero de trozos y haz comparaciones de rendimientos
    trozos_df = np.array_split(dataframe_brown,50)
    
    # se  toma tiempo inicial
    ###INSERTA TU CODIGO###
    tiempo_inicial = time.time()
    ###########################################################################
    
    #se crea el pool de procesos, decide cuantos procesos crear
    ###INSERTA TU CODIGO###
    
    ###########################################################################
    
    #se invoca a la función y se concatenan los resultados de cada trozo con pd.concat(resultados del map)
    ###INSERTA TU CODIGO###
    with Pool(10) as pool:
        res = pool.map(procesar_df, trozos_df)
    
    df_procesado = pd.concat(res)
    df_procesado.reset_index(drop=True, inplace=True)


    ###########################################################################
    # se muestra tiempo total
    ###INSERTA TU CODIGO###
    tiempo_final = time.time()
    print("La ejecución PARALELA ha tardado " + str(tiempo_final - tiempo_inicial) + " segundos.\n")
    ###########################################################################   
    
    # se muestra la fila 0
    #print(df_procesado)
    #print(df_procesado.loc()[0])
    #print("df PROCESADO PARALELO:", df_procesado, "\n")

    """
    ###########################################################################

    """ Funcion que muestra el tiempo en base a la cantidad de trozos """
    

    trozos = list([1, 20, 40, 60, 80, 100, 200, 300, 400, 500])
    nucleos = list(range(1, mp.cpu_count() + 1 ))
    tiempos = [[0] * len(trozos) for i in range(len(nucleos))]
    tiempo_secuencial = [tiempo_secuencial] * len(nucleos)

    for i in nucleos:
        k = 0
        for j in trozos:
            
            trozos_df = np.array_split(dataframe_brown, j)
            
            tiempo_inicial = time.time()
            df_procesado_paralelo = procesar_paralelo(i, procesar_df, trozos_df)
            if (i == 6 and k == 4):
                print("df PROCESADO PARALELO:", df_procesado_paralelo.head(5), "\n")
            tiempo_final = time.time()
            
            tiempos[i - 1][k] = tiempo_final - tiempo_inicial
            k = k + 1
            
            print("La ejecución paralela con", i,  "núcleos y", j,"trozos, ha tardado " + str(tiempo_final - tiempo_inicial), "segundos.")
        
    fig, ax = plt.subplots()
    fig.set_size_inches(16,10)
    ax.plot(nucleos, tiempos)
    ax.plot(nucleos, tiempos,  "o")
    ax.plot(nucleos, tiempo_secuencial)
    plt.legend(trozos)
    plt.grid(True)
    ax.tick_params(labelsize=12)
    ax.set_xticks(nucleos)
    ax.set_title("Tiempo para cada número de núcleos. Cada gráfica corresponde a un número de trozos", fontsize=12)
    plt.show()
   