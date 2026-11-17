#!/usr/bin/env python3
"""Exact Fibonacci golden closure certificate; phase choice remains conditional."""
import sympy as sp
phi=(1+sp.sqrt(5))/2
alpha=sp.simplify(phi**-2)
for n in range(3,40):
    d=sp.simplify(sp.fibonacci(n)*alpha-sp.fibonacci(n-2))
    assert sp.simplify(d-(-1)**n*phi**(-n))==0
assert sp.simplify(8*alpha-3-phi**-6)==0
assert sp.simplify(24*alpha-9-3*phi**-6)==0
print('EXACT phi^-2 Fibonacci closure; 24-track residual = 3 phi^-6 revolutions')
