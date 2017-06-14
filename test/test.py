import numpy as np
from scipy.optimize import minimize
from multiprocessing import Pool

def rosen_der(x):
    xm = x[1:-1]
    xm_m1 = x[:-2]
    xm_p1 = x[2:]
    der = np.zeros_like(x)
    der[1:-1] = 200*(xm-xm_m1**2) - 400*(xm_p1 - xm**2)*xm - 2*(1-xm)
    der[0] = -400*x[0]*(x[1]-x[0]**2) - 2*(1-x[0])
    der[-1] = 200*(x[-1]-x[-2]**2)
    return der

def rosen(x):
    """The Rosenbrock function"""
    return sum(100.0*(x[1:]-x[:-1]**2.0)**2.0 + (1-x[:-1])**2.0)

def func(n):
    x0 = np.random.rand(5)
    res = minimize(rosen, x0, method='BFGS', jac=rosen_der)
    return res.x

if __name__ == '__main__':
    p = Pool(16)
    ret = p.map(func, list(range(16)))
    for i in ret:
        print(i)
