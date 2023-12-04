""" Script para probar el método que recorre de manera iterativa en amplitud un árbol binario. """

import random
from arbol_binario_ordenado import ArbolBinarioOrdenado
from line_profile import eval_tiempo
from memory_profile import eval_memoria

print("\nInstancio un nuevo arbol binario ordenado de tipo int en la variable 'miArbol'.")
miArbol = ArbolBinarioOrdenado(int)

print("\nCreo una lista predefinida de 12 elementos.")
# Creo una lista con los 12 valores de mi árbol binario de test.
lista = [6, 10, 4, 9, 2, 15, 7, 1, 3, 12, 5, 8]

print("\nInserto la lista en el árbol.\n")
miArbol.insertar_lista(lista)
print(miArbol)

""" Test del recorrido iterativo en amplitud de un árbol binario """
print("Recorro el árbol en amplitud de manera iterativa: " + str(miArbol.amplitud_iterativo()))

print("\n*** Evaluación en tiempo de ejecución: ***")
eval_tiempo(miArbol, "eval_amplitud_iterativo")

print("\n*** Evaluación del uso de la memoria: *** ")
eval_memoria(miArbol, "eval_amplitud_iterativo")


""" Test intensivo """
print("\nCreo una lista con 12000 elementos con valores enteros del 1 al 100: ")
# Creo una lista de valores random
lista2 = []
for i in range(12000):
    lista2.append(random.randint(1,100))

miArbol2 = ArbolBinarioOrdenado(int)
miArbol2.insertar_lista(lista2)

print("\n*** Evaluación en tiempo de ejecución: ***")
eval_tiempo(miArbol2, "eval_amplitud_iterativo")

print("\n*** Evaluación del uso de la memoria: *** ")
eval_memoria(miArbol2, "eval_amplitud_iterativo")
