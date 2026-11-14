#!/usr/bin/env python3
"""Q87E: exact quantitative central-inversion witness on the original Q77 64-history bridge graph.
Native support h=x,x+32 -> 2x,2x+1. Symbolic t_x are the actual Q77 bridge slots;
no synthetic matrix, fitted coefficient, or measured physical data.
"""
import sympy as sp
T=sp.symbols('t0:32',real=True)
B=sp.zeros(64)
for x,t in enumerate(T):
    B[x,2*x]=t; B[x,2*x+1]=1-t
    B[x+32,2*x]=1-t; B[x+32,2*x+1]=t
C=sp.zeros(64)
for h in range(64): C[h,h^63]=1
A=(sp.eye(64)-B).T*(sp.eye(64)-B)
assert C*C==sp.eye(64)
for x in range(16):
    y=31-x
    witness=sp.factor(A[2*x,2*x+1]-A[2*y+1,2*y])
    predicted=((T[x]-T[y])*(3-2*T[x]-2*T[y]) if x==0
               else 2*(T[x]-T[y])*(1-T[x]-T[y]))
    assert sp.simplify(witness-predicted)==0,(x,witness)
# 16 disjoint witnesses and their transposes occur in A-CAC. Consequently
# ||[A,C]||_F^2 = ||A-CAC||_F^2 >= 4 sum_x witness_x^2.
# In (0,1/2), each witness vanishes exactly when t_x=t_(31-x).
u,v,z=sp.symbols('u v z',real=True)
subs={t:z for t in T};subs[T[0]]=u;subs[T[31]]=v
D=(A-C*A*C).subs(subs)
energy=sp.factor(sum(q*q for q in D if q!=0))
expected=4*(u-v)**2*(8*(u+v)**2-24*(u+v)+21)
assert sp.simplify(energy-expected)==0
assert sp.simplify(expected-12*(u-v)**2-32*(u-v)**2*(u+v-sp.Rational(3,2))**2)==0
print('Q87E_EXACT_PARITY_ENERGY_PASS')
print('native mirror witnesses:',16)
print('single-pair squared commutator:',energy)
print('single-pair lower bound: >=12*(u-v)^2')
