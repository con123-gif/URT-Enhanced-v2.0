#!/usr/bin/env python3
"""Exact fixed-point and basin-boundary audit for the archived URTF operator."""
import math
import numpy as np
from scipy.optimize import brentq

phi = (1 + math.sqrt(5)) / 2
kappa = math.pi / phi

def A(delta):
    return 1 + kappa*delta**2

def T(x, delta):
    return (x - delta*math.tanh(x/delta))*A(delta)

def x_c(delta):
    c = (A(delta)-1)/A(delta)
    f = lambda y: math.tanh(y)-c*y
    grid = np.geomspace(1e-5, max(4.0, 2.0/c), 2000)
    py, pf = grid[0], f(grid[0])
    for y in grid[1:]:
        fy = f(y)
        if pf > 0 and fy < 0:
            return delta*brentq(f, py, y)
        py, pf = y, fy
    raise RuntimeError("No positive nonzero fixed point")

def derivative(x, delta):
    return A(delta)*math.tanh(x/delta)**2

if __name__ == "__main__":
    ds = (80/81)*math.pi/(13*phi)
    dc = 3/20
    for name, d in [("delta_star", ds), ("delta_classic", dc)]:
        xc = x_c(d)
        print(name, d)
        print("  A =", A(d))
        print("  x_c =", xc)
        print("  T'(0) =", derivative(0, d))
        print("  T'(x_c) =", derivative(xc, d))