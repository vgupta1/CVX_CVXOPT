from cvxpy import *
import numpy

#gen some data
m, n = 100, 20
A, y = randn(m, n), randn(m, 1)

#Build the lasso program
#Note the similarity to a CVX style program
lam = parameter(attribute='nonnegative')
x = variable(n, 1, name="x")
obj = minimize( norm2( y - A * x) + norm1(x))
cnsts = []
p = program(obj, cnsts)   
p.solve()

####
# Timing test.  
# Only run once... bc it's dense
for i in range(10):
    lam.value = 1
    p.solve()


