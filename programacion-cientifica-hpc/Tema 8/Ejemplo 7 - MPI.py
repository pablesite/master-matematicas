# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 18:57:44 2024

@author: Pablo Ruiz
"""

from mpi4py import MPI

comunicador = MPI.COMM_WORLD

print ("El identificador es %d de %d en ejecución ..." % (comunicador.rank, comunicador.size))