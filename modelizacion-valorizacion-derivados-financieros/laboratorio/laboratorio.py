# -*- coding: utf-8 -*-
"""
Created on Tue May 28 19:39:26 2024

@author: pablo
"""

import numpy as np
from alpha_vantage.timeseries import TimeSeries
from pprint import pprint
import matplotlib.pyplot as plt

"""
a) Obtención de los datos
"""
# Configuración de la librería. Api Key, formato de salida e indexación de los datos.
ts = TimeSeries(key='DSBDBXO1OZSC32HM', output_format='pandas', indexing_type='integer')

# Petición a la API de los datos de Microsoft en intervalos de 1 hora.
data, meta_data = ts.get_intraday(symbol='MSFT',interval='60min', outputsize='full')
# Invierto la serie de datos para ordenarlos de más antiguos a más modernos.
data = data.iloc[::-1].reset_index(drop=True)
# Establezco la serie de datos en S.
S = data['4. close'] 

# Debug de los datos obtenidos.
pprint(data.head(3))
plt.figure(figsize=(16, 10))
S.plot()
plt.title('Intraday Times Series for the MSFT stock (60min)')
plt.xlabel('Index')  # Agregar etiqueta al eje X
plt.ylabel('Close Price')  # Agregar etiqueta al eje Y
plt.grid(True)  # Agregar cuadrícula
plt.show()



"""
b)	Estimación de parámetros con el método de momentos estadísticos (MME)
"""
# Calculo el valor de U.
U = np.log(S[1:].values/S[:-1].values)

# Estimación de parámetros.
sigmaMME=np.std(U,ddof=1)
muMME=np.mean(U)+sigmaMME**2/2

# Mostrar estimaciones
print(f'muMME={muMME:0.10f} y sigmaMME={sigmaMME:0.10f}')

"""
c)	Estimación de parámetros con el método de máxima verosimilitud (MMV)
"""
# Calculo el valor de R.
R = S[1:].values/S[:-1].values-1

# Estimación de parámetros.
muMMV = np.mean(R)
sigmaMMV = np.std(R,ddof=0)

# Mostrar estimaciones
print(f'muMMV={muMMV:0.10f} y sigmaMMV={sigmaMMV:0.10f}')


"""
d)	Estimación de parámetros con el método de momentos no paramétrico (MMNP)
"""
# Calculo el valor de R.
R = S[1:].values-S[:-1].values

# Estimación de parámetros.
muMMNP=np.sum(R)/np.sum(S[:-1])
sigmaMMNP=np.sqrt(np.sum(R**2)/np.sum(S[:-1]**2))

# Mostrar estimaciones
print(f'muMMNP={muMMNP:0.10f} y sigmaMMNP={sigmaMMNP:0.10f}\n')


"""
e)	Evaluación de las estimaciones y comparativa de los errores.
"""

#modelo Log-Normal
def St(t, mu, sigma, s0):
    n = len(t)
    
    # Wiener
    w = np.zeros(n)
    for i in range(1, n):
        w[i] = w[i - 1] + np.sqrt(t[i] - t[i-1])*np.random.normal(0,1)
    return s0*np.exp((mu-sigma**2/2)*t+sigma*w)

#mu_S(t) de Log-Normal
def ELN(t,mu,s0):
    return s0*np.exp(mu*t)

#sigma^2_S(t) de Log-Normal
def VLN(t,mu,sigma,s0):
    return s0**2*np.exp(2*mu*t)*(np.exp(sigma**2*t)-1)


n = len(S)
t = np.arange(0, n)

#Estimación MME
SMME = St(t, muMME, sigmaMME, S[0])

#Estimación MMV
SMMV=St(t,muMMV,sigmaMMV,S[0])

#Estimación MMNP
SMMNP = St(t, muMMNP, sigmaMMNP, S[0])

SMEAN = (SMME + SMMV + SMMNP)/3

# Crear el gráfico
plt.figure(figsize=(16, 10))
plt.plot(t, S, 'b', label='S(t)', linewidth=2)
plt.plot(t, SMME, 'r', label='SMME', linewidth=2)
plt.plot(t, SMMV, 'g', label='SMMV', linewidth=2)
plt.plot(t, SMMNP, 'm', label='SMMNP', linewidth=2)
plt.plot(t, SMEAN, 'k', label='SMMNP', linewidth=3)
plt.xlabel('t')
plt.ylabel('Valor')
plt.title('Predicciones MME, MMV y MMNP')
plt.legend()
plt.grid(True)
plt.show()


# Crear el gráfico
plt.figure(figsize=(16, 10))
plt.plot(t, SMME - S, 'r', label='SMME', linewidth=2)
plt.plot(t, SMMV - S, 'g', label='SMMV', linewidth=2)
plt.plot(t, SMMNP - S, 'm', label='SMMNP', linewidth=2)
plt.xlabel('t')
plt.ylabel('Valor')
plt.title('Predicciones MME, MMV y MMNP')
plt.legend()
plt.grid(True)
plt.show()

print(f'Errores de la estimación ||S-SMME||={np.linalg.norm(S-SMME):.2e}, ||S-SMMV||={np.linalg.norm(S-SMMV):.2e} y ||S-SMMNP||={np.linalg.norm(S-SMMNP):.2e}')


### ERRORES ###

#ERROR MME
ELNMME = ELN(t, muMME, S[0])
ECMMME = np.sqrt(np.mean((np.log(S[1:]) - np.log(ELNMME[1:]))**2))
EPAMMME = 100*np.mean(abs(1-np.log(ELNMME[1:])/np.log(S[1:])))

#ERROR MMV
ELNMMV = ELN(t, muMMV, S[0])
ECMMMV = np.sqrt(np.mean((np.log(S[1:]) - np.log(ELNMMV[1:]))**2))
EPAMMMV = 100*np.mean(abs(1-np.log(ELNMMV[1:])/np.log(S[1:])))

#ERROR MMNP
ELNMMNP = ELN(t, muMMNP, S[0])
ECMMMNP = np.sqrt(np.mean((np.log(S[1:]) - np.log(ELNMMNP[1:]))**2))
EPAMMMNP = 100*np.mean(abs(1-np.log(ELNMMNP[1:])/np.log(S[1:])))

# Resultados
print(f'ECMMME={ECMMME:.5f} y EPAMMME(%)={EPAMMME:.3f}%')
print(f'ECMMMV={ECMMMV:.5f} y EPAMMMV(%)={EPAMMMV:.3f}%')
print(f'ECMMMNP={ECMMMNP:.5f} y EPAMMMNP(%)={EPAMMMNP:.3f}%')



"""
Intervalos de confianza
"""

#IC 95% MME
ELNMME = ELN(t, muMME, S[0])
SMME = np.sqrt(VLN(t, muMME, sigmaMME, S[0]))

# Crear el gráfico
fig, ax = plt.subplots(figsize=(12, 10))
ax.plot(t, ELNMME - 1.96 * SMME, '--r', label='IC inf')
ax.plot(t, ELNMME, 'g', label=r'$\mu_S(t)$')
ax.plot(t, ELNMME + 1.96 * SMME, 'r', label='IC sup')
ax.plot(t, S, 'b', label='S(t)')
ax.set_xlabel('t')
ax.set_title(r'IC 95% MME')
ax.legend()
plt.show()


#IC 95% MMV
ELNMMV = ELN(t, muMMV, S[0])
SMMV = np.sqrt(VLN(t, muMMV, sigmaMMV, S[0]))

# Crear el gráfico
fig, ax = plt.subplots(figsize=(12, 10))
ax.plot(t, ELNMMV - 1.96 * SMMV, '--r', label='IC inf')
ax.plot(t, ELNMMV, 'g', label=r'$\mu_S(t)$')
ax.plot(t, ELNMMV + 1.96 * SMMV, 'r', label='IC sup')
ax.plot(t, S, 'b', label='S(t)')
ax.set_xlabel('t')
ax.set_title(r'IC 95% MMV')
ax.legend()
plt.show()


#IC 95% MMV
ELNMMNP = ELN(t, muMMNP, S[0])
SMMNP = np.sqrt(VLN(t, muMMNP, sigmaMMNP, S[0]))

# Crear el gráfico
fig, ax = plt.subplots(figsize=(12, 10))
ax.plot(t, ELNMMNP - 1.96 * SMMNP, '--r', label='IC inf')
ax.plot(t, ELNMMNP, 'g', label=r'$\mu_S(t)$')
ax.plot(t, ELNMMNP + 1.96 * SMMNP, 'r', label='IC sup')
ax.plot(t, S, 'b', label='S(t)')
ax.set_xlabel('t')
ax.set_title(r'IC 95% MMNP')
ax.legend()
plt.show()
















