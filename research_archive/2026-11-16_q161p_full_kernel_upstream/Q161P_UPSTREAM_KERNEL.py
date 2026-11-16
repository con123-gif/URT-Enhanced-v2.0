#!/usr/bin/env python3
"""Exact original Q161a Q/P kernel response under conditional upstream bit-0 character."""
from fractions import Fraction as F
from collections import Counter
N=64
P=[[F(0)]*N for _ in range(N)]
Q=[[F(0)]*N for _ in range(N)]
for x in range(N):
    Q[x][2*x%N]+=F(1,2)
    Q[x][(2*x+1)%N]+=F(1,2)
    for i in range(6):
        for j in range(i+1,6):
            P[x][x^(1<<i)^(1<<j)]+=F(1,15)
def apply(A,v):
    return [sum((a*b for a,b in zip(row,v)),F(0)) for row in A]
def w(s):
    return [F(-1 if (x&s).bit_count()%2 else 1) for x in range(N)]
def dot(a,b):
    return sum((x*y for x,y in zip(a,b)),F(0))
counts=Counter()
for s in range(1,64,2):
    v=w(s)
    assert apply(Q,apply(P,v))==[F(0)]*64
    d=[(-v[x] if x&1 else v[x]) for x in range(N)]
    t=s^1
    assert d==w(t)
    k=t.bit_count()
    lam=F((6-2*k)**2-6,30)
    y=apply(Q,apply(P,d))
    assert y==[lam*a for a in w(t>>1)]
    assert dot(y,y)==64*lam*lam
    assert lam!=0
    counts[lam*lam]+=1
assert counts==Counter({F(1):1,F(1,9):6,F(1,25):10,F(1,225):15}),counts
print('Q161p exact native Q P D0 on QP kernel: rank=32, nullity=0, squared singular values',dict(sorted(counts.items())))
