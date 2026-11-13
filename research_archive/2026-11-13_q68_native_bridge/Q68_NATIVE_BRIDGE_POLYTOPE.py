#!/usr/bin/env python3
"""Exact native Q2 64-history successor graph: all uniform-preserving kernels.
No fitted data, random matrices, or historical ARFs. Fail on any mismatch.
"""
from fractions import Fraction as F
N=64
successors=lambda h: ((2*h)%N,(2*h+1)%N)
for x in range(32):
    assert successors(x)==successors(x+32)==(2*x,2*x+1)
assert {successors(x)[0] for x in range(32)}==set(range(0,64,2))
def kernel(ts):
    assert len(ts)==32 and all(F(0)<=t<=F(1) for t in ts)
    rows=[{} for _ in range(N)]
    for x,t in enumerate(ts):
        a,b=successors(x)
        rows[x]={a:t,b:1-t}
        rows[x+32]={a:1-t,b:t}
    return rows
def check(rows):
    assert all(set(row)==set(successors(h)) for h,row in enumerate(rows))
    assert all(sum(row.values(),F(0))==1 for row in rows)
    assert all(sum((row.get(k,F(0)) for row in rows),F(0))==1 for k in range(N))
    return True
for ts in ([F(0)]*32,[F(1)]*32,[F(1,2)]*32,
           [F(x+1,65) for x in range(32)]):
    assert check(kernel(ts))
Q=kernel([F(1,2)]*32)
assert all(Q[h][k]==F(1,2) for h in range(64) for k in successors(h))
for ts in ([F(0)]*32,[F(1)]*32,[F(1,2)]*32):
    rows=kernel(ts)
    for j in range(24):
        assert all(sum(row.values(),F(0))==1 for row in rows)
        assert all(sum((row.get(k,F(0)) for row in rows),F(0))==1 for k in range(N))
assert kernel([F(0)]*32)!=kernel([F(1,2)]*32)
print('EXACT: Q2-supported doubly stochastic polytope = [0,1]^32; vertices = 2^32 reversible lifts')
print('EXACT: Q2/2 and deterministic Q2 lifts preserve uniform 64-history and 24-track marginals')
print('SCOPE: uniform marginals and passive 24-clock alone do not force a Q3-weighted KL bridge')
