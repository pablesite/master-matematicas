""" Este script testea todas las funciones del TAD Árbol Huffman """
import random
from arbol_huffman import ArbolHuffman
from line_profile import eval_tiempo
from memory_profile import eval_memoria

""" Test de la creación de un árbol """
# Instancio un objeto de la clase ArbolBinarioOrdenado de tipo ints
print("\nInstancio un nuevo arbol huffman de tipo int en la variable 'miArbol'.")
miArbol = ArbolHuffman()

""" Test de la comprobación de arbol vacío """
print("\n¿Está mi árbol vació? --> " + str(miArbol.esta_vacio()) + ".")
print("Como el árbol acaba de ser creado, no tiene ningún elemento.")

""" Test de crear árbol huffman """
# Creo diccionario
miDicc = {'A' : 0.15,
          'B' : 0.30,
          'C' : 0.20,
          'D' : 0.05,
          'E' : 0.15,
          'F' : 0.05,
          'G' : 0.10}

# Creo árbol Huffman
miArbol.crear_arbol_huffman(miDicc)
print("\nCreo un árbol de Huffman con el la siguiente tabla de símbolos y frecuencias: ")
print(miDicc)
print("¿Está mi árbol vació? --> " + str(miArbol.esta_vacio()) + ".")

""" Test de obtención de atributos privados: tipo, raiz, arbol_izdo, arbol_dcho """
print("\nEl tipo del árbol es " + str(miArbol.tipo()) + ".")
print("La raiz del árbol es " + str(miArbol.raiz()) + ".")
print("La raiz del árbol izq es " + str(miArbol.arbol_izdo().raiz()) + ".")
print("La raiz del árbol izq es " + str(miArbol.arbol_izdo().arbol_izdo().raiz()) + ".")
print("La raiz del árbol dcho es " + str(miArbol.arbol_dcho().raiz()) + ".")

""" Test de obtener el número de elementos """
print("\nEl árbol tiene " + str(miArbol.num_elementos()) + " elementos.")

""" Test de "print" del objeto árbol """
print("\nPor último, pruebo la función print del árbol y obtengo: ")
print(miArbol)

""" Test del recorrido iterativo en amplitud de un árbol binario """
print("Recorro el árbol en amplitud de manera iterativa: " + str(miArbol.amplitud_iterativo()))

print("\n*** Evaluación en tiempo de ejecución: ***")
eval_tiempo(miArbol, "eval_amplitud_iterativo")

print("\n*** Evaluación del uso de la memoria: *** ")
eval_memoria(miArbol, "eval_amplitud_iterativo")

""" Test de codificación de un símbolo """
simbolo = "F"
print("El símbolo a codificar es: " + simbolo)
print("El código Huffman obtenido es " + str(miArbol.codificacion_simbolo(simbolo)))

""" Test de decodificación de un código correspondiente a un símbolo. """
codigo = [False, True, True, True]
print("El código a decodificar es: " + str(codigo))
print("El símbolo decodificado es " + str(miArbol.decodificacion_codigo(codigo)))

""" Test de codificación de una cadena de caracteres usando la clase. """
cadena_a_codificar = "BAECGDF"
print("La cadena a codificar es: " + cadena_a_codificar)
print("Nótese que la cadena es ininteligible porque uso los símbolos con los que he creado el árbol Huffman.")

print("El código Huffman obtenido es: ")
for i in cadena_a_codificar:
    print(miArbol.codificacion_simbolo(i))
