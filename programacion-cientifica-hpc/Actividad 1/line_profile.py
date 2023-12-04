""" Módulo que provee la evaluación del tiempo de ejecución de diferentes algoritmos iterativos. """

from line_profiler import LineProfiler

def eval_pre_orden_prof_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método pre_orden_prof_iterativo(). """
    return mi_arbol.pre_orden_prof_iterativo()

def eval_in_orden_prof_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método in_orden_prof_iterativo(). """
    return mi_arbol.in_orden_prof_iterativo()

def eval_amplitud_iterativo(mi_arbol):
    """ Método para evaluar las prestaciones del método amplitud_iterativo(). """
    return mi_arbol.amplitud_iterativo()

def eval_tiempo(mi_arbol, eval_func):
    """ Método genérico para evaluar las prestaciones del tiempo de ejecución de diferentes algoritmos iterativos. """
    lp = LineProfiler()
    if eval_func == "eval_pre_orden_prof_iterativo":
        lp_wrapper = lp(eval_pre_orden_prof_iterativo)
    elif eval_func == "eval_in_orden_prof_iterativo":
        lp_wrapper = lp(eval_in_orden_prof_iterativo)
    elif eval_func == "eval_amplitud_iterativo":
        lp_wrapper = lp(eval_amplitud_iterativo)
    else:
        print("\nHay un error con la función a evaluar")
        return None
    lp_wrapper(mi_arbol)
    lp.print_stats()

