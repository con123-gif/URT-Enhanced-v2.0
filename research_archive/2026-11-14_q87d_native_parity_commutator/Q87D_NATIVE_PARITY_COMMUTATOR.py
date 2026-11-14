#!/usr/bin/env python3
"""Q87D exact C-commutator criterion for the original Q77 32-block history bridge.
The variables t_x are Q77's certified bridge entries, not fitted replacements.
This is a conditional algebraic reduction, NOT an evaluation of Q77's t_x.
"""
import sympy as s
u,v=s.symbols("u v",real=True)
def bridge(t):
 B=s.zeros(64)
 for x in range(32):
  z=t[x]
  B[x,2*x]=z; B[x,2*x+1]=1-z
  B[x+32,2*x]=1-z; B[x+32,2*x+1]=z
 return B
C=s.zeros(64)
for h in range(64): C[h,h^63]=1
assert C*C==s.eye(64)
# The Q77 support, evaluated at a common symbolic block value, commutes with C.
z=s.symbols("z")
B=bridge([z]*32)
assert C*B*C==B
A=(s.eye(64)-B).T*(s.eye(64)-B)
assert C*A==A*C
# For two arbitrary mirror blocks x=0 and x=31, derive an exact witness.
t=[z]*32; t[0]=u; t[31]=v
B=bridge(t)
A=(s.eye(64)-B).T*(s.eye(64)-B)
f=lambda q:(1-q)*(2*q-1)
assert s.simplify(A[0,1]-f(u))==0
assert s.simplify(A[63,62]-f(v))==0
assert s.simplify(A[0,1]-A[63,62]-(u-v)*(3-2*u-2*v))==0
assert s.diff(f(u),u)==3-4*u
# For 0<u,v<1/2, 3-2(u+v)>1, so the witness is nonzero iff u!=v.
# Relabel x->31-x for every mirror pair. The converse follows from
# C B C = B for pairwise mirror equality, hence C A C = A.
print("Q87D_NATIVE_PARITY_COMMUTATOR_PASS: (u-v)*(3-2u-2v)")
