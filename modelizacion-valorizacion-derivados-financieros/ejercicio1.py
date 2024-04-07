import numpy as np

def VI(s, K, text):
    op = int(text == 'call')
    return np.maximum((1 - 2 * op) * (K - s), 0)

def comp(s, K, text):
    op = (1 - 2 * (text == 'call')) * (K - s)
    return np.where(op > 0, 'ITM', np.where(op < 0, 'OTM', 'ATM'))



text = 'call'
s = 100
K = np.array([90, 95, 100, 105, 110])
C = np.array([12, 10, 8, 6, 4]) # call
n = len(K)
print(text)
print('\nClas | K | VI | C | VE\n')
for i in range(n):
    print(comp(s, K[i], text), '|', K[i], '|',
    VI(s, K[i], text), '|', C[i], '|', C[i] - VI(s, K[i], text))
