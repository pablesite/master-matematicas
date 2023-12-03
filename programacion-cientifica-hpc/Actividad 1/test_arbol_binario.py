""" Este script testea todas las funciones del TAD Árbol Binario Ordenado"""
import random
from arbol_binario_ordenado import ArbolBinarioOrdenado

""" Test de la creación de un árbol """
# Instancio un objeto de la clase ArbolBinarioOrdenado de tipo ints
print("\nInstancio un nuevo arbol binario ordenado de tipo int en la variable 'miArbol'.")
miArbol = ArbolBinarioOrdenado(int)

""" Test de la comprobación de arbol vacío """
print("\n¿Está mi árbol vació? --> " + str(miArbol.esta_vacio()) + ".")
print("Como el árbol acaba de ser creado, no tiene ningún elemento.")

""" Test de insertar elementos """
print("\nA continuación inserto los elementos 6, 3, 5, 1 y 2.")
miArbol.insertar_elemento(6)
miArbol.insertar_elemento(3)
miArbol.insertar_elemento(5)
miArbol.insertar_elemento(8)
miArbol.insertar_elemento(2)

# Inserción de elementos con error.
#miArbol.insertar_elemento("a")
#miArbol.insertar_elemento("3.5")
print("Nótese que si hubiese intentado introducir por ejemplo, un string o un float habría saltado una excepción de tipo.")

""" Test de insertar una lista de elementos """
print("\nCreo una lista con 5 elementos con valores enteros del 1 al 10: ")
# Creo una lista de valores random
lista = []
for i in range(5):
    lista.append(random.randint(1,10))
print (lista)

print("\nInserto los nuevos 5 elementos al árbol: ")
miArbol.insertar_lista(lista)

""" Test de obtener el número de elementos """
print("\nEl árbol tiene " + str(miArbol.num_elementos()) + " elementos.")

""" Test de obtener cierto elemento """
print("\n¿Tiene el árbol el elemento 3? --> " + str(miArbol.tiene_elemento(3)) + ".")
print("¿Tiene el árbol el elemento 11? --> " + str(miArbol.tiene_elemento(11)) + ".")

""" Test de obtención de atributos privados: tipo, raiz, arbol_izdo, arbol_dcho """
print("\nEl tipo del árbol es " + str(miArbol.tipo()) + ".")
print("La raiz del árbol es " + str(miArbol.raiz()) + ".")
print("La raiz del árbol izq es " + str(miArbol.arbol_izdo().raiz()) + ".")
print("La raiz del árbol dcho es " + str(miArbol.arbol_dcho().raiz()) + ".")

#raiz = miArbol.__raiz
print("Nótese que si hubiese intentado obtener cualquier atributo privado directamente, habría dado error por no encontrarlo.")

""" Test de recorrer el árbol en pre-orden y en orden de manera recursiva """
print("\nEl recorrido del árbol en pre-Orden (recursivo) es: " + str(miArbol.pre_orden()) + ".")
print("El recorrido del árbol en Orden (recursivo) es: " + str(miArbol.in_orden()) + ".")

""" Test de "print" del objeto árbol """
print("\nPor último, pruebo la función print del árbol y obtengo: ")
print(miArbol)
