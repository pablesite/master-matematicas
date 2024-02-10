from multiprocessing import Process, Value, Array

def calcular_longitudes(pi, valores):
    pi.value = 3.1415927
    for i in range(len(valores)):
        valores[i] = 2*pi.value*valores[i]

def calcular_areas(pi, valores):
    pi.value = 3.1415927
    for i in range(len(valores)):
        valores[i] = pi.value*valores[i]**2

if __name__ == '__main__':
    valor_cte = Value('d', 0.0)
    array_valores = Array('d', range(1, 10))
    print(array_valores[:])
    p1 = Process(target = calcular_longitudes, args = (valor_cte, array_valores))
    p2 = Process(target = calcular_areas, args = (valor_cte, array_valores))
    
    p2.start()
    p1.start()
    p2.join()
    p1.join()
    
    
    print(valor_cte.value)
    print(array_valores[:])