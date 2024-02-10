import pandas as pd
import multiprocessing as mp
import numpy as np
import time
#modulo para usar expresiones regulares
import re
from multiprocessing import Pool
#importación del corpus brown
"""
# La primera vez hay que descargar brown
import nltk
nltk.download('brown')
"""
from nltk.corpus import brown

"""
pip install nltk
"""

#funcion que construye el DataFrame para su procesamiento, con una frase por fila
def construye_textos():
    return [" ".join(np.random.permutation(sents)) for sents in brown.sents()]

#funcion que reemplaza comillas dobles
def reemplazar_comillas(texto):
    return texto.apply(lambda text: text.replace("``",'"'))

"""
#funcion que convierte todas las palabras a minúsculas
#la función que pasa a minusculas es text.lower()
def a_minusculas(texto):
    ###INSERTA TU CODIGO###

#funcion que cuenta palabras de cada fila del dataframae
#separa las palabras en el texto de cada fila con split y devuelve la longitud de la lista de palabras
#la función que devuelve la lista de palabras es re.split(r"(?:\s+)|(?:,)|(?:\-)",text)
def contar_palabras(texto):
    ###INSERTA TU CODIGO###


#funcion que se aplica
def procesar_df(df):
    #se hace copia del dataframe para no modificarlo
    ###INSERTA TU CODIGO###
    salida_df = 

    # reemplaza las comillas
    salida_df['text']      = reemplazar_comillas(salida_df['text'])

    # pasa el texto a minusculas
    ###INSERTA TU CODIGO###
    salida_df['text']      =


    # cuenta el número de palabras y construye columna nueva con nombre num_palabras
    ###INSERTA TU CODIGO###
        

    # elimina los textos demasiado largos
    texto_largo_para_eliminar = salida_df[salida_df['num_palabras'] > 50]
    salida_df.drop(texto_largo_para_eliminar.index, inplace=True)

    # elimina los textos demasiado cortos
    texto_corto_para_eliminar = salida_df[salida_df['num_palabras'] < 10]
    salida_df.drop(texto_corto_para_eliminar.index, inplace=True)    

    #reinicializa los indices
    salida_df.reset_index(drop=True, inplace=True)

    return salida_df

"""


if __name__=="__main__":
    
    dataframe_brown = pd.DataFrame({
    'text': construye_textos() + construye_textos() + construye_textos() + construye_textos()
    })
    print(dataframe_brown)

    
    # se  toma tiempo inicial
    ###INSERTA TU CODIGO###
    ###########################################################################
    
    """ejecución secuencial"""

    """
    #se llama a la funcion procesar_df() con dataframe_brown
    ###INSERTA TU CODIGO###
    ###########################################################################
    
    print(df_procesado)
    
    # se muestra tiempo total
    ###INSERTA TU CODIGO###
    ###########################################################################
    
    #muestra fila 0
    print(df_procesado.loc()[0])
    
    #retorna el numero de núcleos en el sistema, te puede servir para decidir el número de procesos
    print(mp.cpu_count())
    
    """

    """ejecución paralela"""

    """
    #divide en trozos el dataframe, decide el numero de trozos y haz comparaciones de rendimientos
    trozos_df = np.array_split(dataframe_brown,12)
    
    # se  toma tiempo inicial
    ###INSERTA TU CODIGO###
    ###########################################################################
    
    #se crea el pool de procesos, decide cuantos procesos crear
    ###INSERTA TU CODIGO###
    ###########################################################################
    
    #se invoca a la función y se concatenan los resultados de cada trozo con pd.concat(resultados del map)
    ###INSERTA TU CODIGO###
    ###########################################################################
    # se muestra tiempo total
    ###INSERTA TU CODIGO###
    ###########################################################################   
    
    # se muestra la fila 0
    print(df_procesado)
    print(df_procesado.loc()[0])
    """