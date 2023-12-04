""" Módulo que provee la evaluación del uso de la memoria de diferentes algoritmos iterativos. """

from memory_profiler import profile 

@profile
def eval_pre_orden_prof_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método pre_orden_prof_iterativo(). """
    return mi_arbol.pre_orden_prof_iterativo()

@profile
def eval_in_orden_prof_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método in_orden_prof_iterativo(). """
    return mi_arbol.in_orden_prof_iterativo()

@profile
def eval_amplitud_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método amplitud_iterativo(). """
    return mi_arbol.amplitud_iterativo()

def eval_memoria(mi_arbol, eval_func):
    """ Método genérico para evaluar las prestaciones del uso de memoria de diferentes algoritmos iterativos. """
    if eval_func == "eval_pre_orden_prof_iterativo":
        eval_pre_orden_prof_iterativo(mi_arbol)
    elif eval_func == "eval_in_orden_prof_iterativo":
        eval_in_orden_prof_iterativo(mi_arbol)
    elif eval_func == "eval_amplitud_iterativo":
        eval_amplitud_iterativo(mi_arbol)
    else:
        print("\nHay un error con la función a evaluar")
        return None

