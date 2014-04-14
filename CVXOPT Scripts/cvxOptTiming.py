from cvxopt import *
from l1regls import *

#Gen some random data
m, n = 100, 1000
A = normal(m, n)
b = normal(m, 1)
lam = 1

###
#Convert problem to standard form
###
P = spdiag( [2 * A.T * A] + [0] * n)

ones = matrix([1.] * n)
c = matrix([-2 * A.T * b, lam * ones])

eye_n = spdiag([1.0] * n)
G = matrix([ [eye_n, -1 * eye_n], [-1 * eye_n, -1 * eye_n] ])

h = matrix(0., (2*n, 1) )

def run():
    for i in range(10):
        sol=solvers.qp(P, c, G, h)
#        l1regls(A, b)

run()

        
        