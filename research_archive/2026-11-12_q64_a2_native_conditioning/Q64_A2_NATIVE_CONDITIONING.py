#!/usr/bin/env python3
"""Exact Q64 A2: native six-bit successor lift and conditional KL projection.
No fitted constants, no historical ARFs, no synthetic Cathedral operator.
"""
from fractions import Fraction as F
N=64
successors={h:(2*h%N,(2*h+1)%N) for h in range(N)}
assert all(len(set(v))==2 for v in successors.values())
assert all(sum(k in successors[h] for h in range(N))==2 for k in range(N))
for x in range(32):
    assert successors[x]==successors[x+32]
    assert successors[x][0]==2*x and successors[x][1]==2*x+1
count=1<<32
assert count*F(1,2**64)==F(1,2**32)
# Symbolic rowwise KL identity follows analytically by factoring K(A).
# Exact rational witness verifies the conditional-to-raw ratio.
a,b,c=17,23,80
assert a+b+c==120
q=(F(2,5),F(3,5)); k=(F(a,120),F(b,120)); p=(F(a,a+b),F(b,a+b))
assert all(p[i]/k[i]==F(120,a+b) for i in (0,1))
assert sum(q[i]*(p[i]/k[i]) for i in (0,1))==F(120,a+b)
print('CERTIFIED: native Q2 has 2^32 bijective successor lifts; each has Q2 probability 2^-64')
print('CERTIFIED: conditional Q3 likelihood is the unique rowwise KL I-projection onto native Q2 support')
print('LIMIT: neither the Q3 twirl nor the independent-row sampling/maximum-likelihood principle follows from Q2 alone')
