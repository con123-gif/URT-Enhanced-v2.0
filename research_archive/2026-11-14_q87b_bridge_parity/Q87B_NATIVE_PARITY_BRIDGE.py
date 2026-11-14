#!/usr/bin/env python3
"""Q87B: exact parity Rayleigh identity on Q77's native 32 URT bridge blocks.

Original URT Q2 support: rows (x,x+32), columns (2x,2x+1).
Q77 certifies the selected joint bridge's doubly-stochastic 2x2 blocks
[[t_x,1-t_x],[1-t_x,t_x]] with 0<t_x<1/2 for all 32 x.
No measured or fitted values enter this certificate.
"""
import sympy as sp
N=64
w=sp.Matrix([(-1)**h.bit_count() for h in range(N)])
t=sp.symbols("t0:32", real=True)
B=sp.zeros(N)
for x in range(32):
    B[x,2*x]=t[x]
    B[x,2*x+1]=1-t[x]
    B[x+32,2*x]=1-t[x]
    B[x+32,2*x+1]=t[x]
assert all(sp.expand(sum(B[i,j] for j in range(N))-1)==0 for i in range(N))
assert all(sp.expand(sum(B[i,j] for i in range(N))-1)==0 for j in range(N))
y=(sp.eye(N)-B)*w
for x in range(32):
    assert sp.expand(y[x]-2*(1-t[x])*w[x])==0
    assert sp.expand(y[x+32]-2*(1-t[x])*w[x+32])==0
rayleigh=sp.expand(y.dot(y)/w.dot(w))
expected=sp.Rational(1,8)*sum((1-z)**2 for z in t)
assert sp.expand(rayleigh-expected)==0
assert sp.simplify(expected.subs({z:sp.Rational(1,2) for z in t}))==1
z=sp.symbols("z",positive=True)
assert sp.expand(4*(1-z)**2-1-(1-2*z)*(3-2*z))==0
assert sp.expand(4-4*(1-z)**2-4*z*(2-z))==0
print("Q87B_NATIVE_PARITY_RAYLEIGH_PASS")
print("exact Rayleigh = (1/8)*sum_{x=0}^{31}(1-t_x)^2")
print("Q2 t_x=1/2: Rayleigh=1; Q77 0<t_x<1/2: 1<Rayleigh<4")
