import cvxopt
import l1regls as l1

def run():
    for i in range(100):
        l1.l1regls(A, b)

m, n = 300, 30
A = cvxopt.normal(300, 30)
b = cvxopt.normal(300, 1)

run()

        
        