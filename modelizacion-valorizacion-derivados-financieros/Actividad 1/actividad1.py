import numpy as np
import matplotlib.pyplot as plt


def bp(S, E, C, P):
    """
    Calcula el valor de una opción combinada basado en los parámetros dados.

    Parámetros:
    S (float): Precio actual del activo subyacente.
    E (float): Precio de ejercicio de la opción.
    C (float): Prima de la opción de compra (Call).
    P (float): Prima de la opción de venta (Put).
    
    Retorna:
    float: El valor de la opción combinada o cero si S es negativo.
    """
    if (S <= E and S >= 0):
        return -S + E - C - P
    elif(S > E):
        return S - E - C - P
    else:
        return 0

# Valores random para representar la figura.
S = np.arange(0, 21, 1)
E = 10
C = 2.5
P = 2.5
n = len(S)
BenPer = np.zeros(n)
y = (-C -P) + np.zeros(n)

# Calcular  los posibles valores de B/P para todos los posibles valores de ST
for i in range(n):
   BenPer[i] = bp(S[i], E, C, P)
   

# Graficar la función principal y las líneas punteadas
fig, ax = plt.subplots(figsize=(13, 8))
plt.title("B/P de una Call con C y una Put con P, ambas con un precio de ejercicio E, y con un periodo de vencimiento T.")  # Título de la gráfica
plt.grid(True)  # Añade una cuadrícula para mejor visualización

ax.plot(BenPer, color='b')  # Grafica el array
ax.plot(S[0:int(np.floor(n/2))+1], y[0:int(np.floor(n/2))+1], linestyle=':', color='k', label='- C - P')
ax.vlines(x = E, ymin = -C-P, ymax = 0, color='k', linestyle=':', label='Línea vertical en x=0')

# Dibujar los ejes en el centro
ax.spines['left'].set_position('zero')
ax.spines['left'].set_color('black')
ax.spines['bottom'].set_position('zero')
ax.spines['bottom'].set_color('black')

# Eliminar los bordes superiores y derechos
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')

# Añadir etiquetas a los ejes
xlabel = ax.set_ylabel('B/P')
ylabel = ax.set_xlabel('ST')

xlabel.set_position((-1, 1))
ylabel.set_position((1, 0))

# Quitar las etiquetas de los ejes
ax.set_xticklabels([])
ax.set_yticklabels([])

ax.text(-1, 5, 'E-C-P', fontsize=10, color='blue', ha='right', va='bottom')
ax.text(-1, -5, '-C-P', fontsize=10, color='blue', ha='right', va='bottom')
ax.text(6, 0.5, 'E-C-P', fontsize=10, color='black', ha='right', va='bottom')
ax.text(10.2, 0.5, 'E', fontsize=10, color='black', ha='right', va='bottom')
ax.text(16, 0.5, 'E+C+P', fontsize=10, color='black', ha='right', va='bottom')

# Agregar flechas: creando un 'FancyArrowPatch', que es más flexible que 'annotate'
from matplotlib.patches import FancyArrowPatch

# Flecha para el eje X
ax.add_patch(FancyArrowPatch((0, 0), (21.1, 0),
                             arrowstyle='->', mutation_scale=20,
                             color='black', linewidth=1))
# Flecha para el eje Y
ax.add_patch(FancyArrowPatch((0, 0), (0, 5.5),
                             arrowstyle='->', mutation_scale=20,
                             color='black', linewidth=1))

# Mostrar la gráfica
plt.show()


    
