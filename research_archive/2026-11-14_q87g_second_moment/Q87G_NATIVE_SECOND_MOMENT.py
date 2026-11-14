#!/usr/bin/env python3
"""Q87G: exact second spectral moment of Q77's original 64-history bridge support.
This uses the original URT successor support, not a block-diagonal surrogate.
"""
import sympy as sp
T = sp.symbols('t0:32', real=True)
B = sp.zeros(64)
for x,t in enumerate(T):
    B[x,2*x], B[x,2*x+1] = t, 1-t
    B[x+32,2*x], B[x+32,2*x+1] = 1-t, t
A = (sp.eye(64)-B).T*(sp.eye(64)-B)
p = lambda t: 8*t**4-16*t**3+20*t**2-12*t
formula = (384 + 4*T[10]*T[21] + 2*sum(p(t) for t in T)
           -16*(T[0]**3+T[31]**3)
           +26*(T[0]**2+T[31]**2)
           -16*(T[0]+T[31]))
actual = sp.expand(sum(A[i,j]**2 for i in range(64) for j in range(64)))
assert sp.expand(actual-formula)==0, 'second moment mismatch'
assert sp.expand(actual.subs({t:sp.Rational(1,2) for t in T})-218)==0, 'uniform-bridge regression'
print('Q87G_EXACT_NATIVE_SECOND_MOMENT_PASS')
print('tr(A^2) = 384 + 4*t10*t21 + 2*sum_x(8*t_x^4-16*t_x^3+20*t_x^2-12*t_x)')
print('          -16*(t0^3+t31^3)+26*(t0^2+t31^2)-16*(t0+t31)')
