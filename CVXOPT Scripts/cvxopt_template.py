from cvxopt import *

#Gen some random data
m, n = 100, 1000
A = normal(m, n)
b = normal(m, 1)
lam = 1

###
#Convert problem to standard form
###





#####
def run():
    for i in range(10):
        sol=solvers.qp(P, c, G, h)

run()

        
        