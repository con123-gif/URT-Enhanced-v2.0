#!/usr/bin/env python3
"""Exact original Q/P six-axis chronology conjugacy certificate."""
from fractions import Fraction as F
N=64
Q=[[F(0) for _ in range(N)] for _ in range(N)]
P=[[F(0) for _ in range(N)] for _ in range(N)]
for x in range(N):
    Q[x][(2*x)%N]+=F(1,2);Q[x][(2*x+1)%N]+=F(1,2)
    for i in range(6):
        for j in range(i+1,6):P[x][x^(1<<i)^(1<<j)]+=F(1,15)
def mul(A,v):return [sum((a*b for a,b in zip(row,v)),F(0)) for row in A]
def bitperm(x,axis):
    b0=x&1;ba=(x>>axis)&1
    return x if b0==ba else x^(1<<0)^(1<<axis)
def parity(s,x):return F(-1 if (s&x).bit_count()%2 else 1)
for s in range(N):
    v=[parity(s,x) for x in range(N)]
    p=F((6-2*s.bit_count())**2-6,30)
    assert p!=0 and mul(P,v)==[p*z for z in v]
for s in range(N):
    v=[parity(s,x) for x in range(N)]
    a=mul(P,v);q=mul(Q,a)
    qtq=[sum((Q[y][x]*q[y] for y in range(N)),F(0)) for x in range(N)]
    p=F((6-2*s.bit_count())**2-6,30)
    assert qtq==([p*v[x] for x in range(N)] if not (s&1) else [F(0)]*N)
for m in range(1,7):
    survivors=0
    for s in range(N):
        visible=False
        for axis in range(m):
            v=[parity(s,bitperm(x,axis)) for x in range(N)]
            if any(mul(Q,mul(P,v))):visible=True
        survivors+=visible
    expected=64-2**(6-m)
    assert survivors==expected,(m,survivors,expected)
assert survivors==63
print('Q161l native six-axis QP stack ranks: 32,48,56,60,62,63; common nullity 1, Walsh parity (-1)^popcount(x); exact rational PASS')
