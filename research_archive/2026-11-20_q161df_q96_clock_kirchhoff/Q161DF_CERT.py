#!/usr/bin/env python3
"""Exact original Q96 charged 24-clock effective resistance."""
from fractions import Fraction as F
from collections import Counter
q8=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(q8*2)*3
q += [-x for x in q]
assert len(q)==96
counts=Counter(x*x for x in q)
assert counts=={F(4,9):36,F(1,9):36,F(1):12,F(0):12}
N=24
G=lambda d:F(N*N-1,12*N)-F((d%N)*(N-(d%N)),2*N)
assert sum((G(d) for d in range(N)),F(0))==0
for d in range(N):
    assert 2*G(d)-G((d-1)%N)-G((d+1)%N)==(F(1)-F(1,N) if d==0 else -F(1,N))
w=sum((m/F(c) for c,m in counts.items() if c),F(0))
assert w==417
profile=[w*2*(G(0)-G(d)) for d in range(N)]
assert profile==[F(417*d*(N-d),N) for d in range(N)]
assert profile[6]==F(3753,2)
assert profile[12]==2502
kirchhoff=sum((N-d)*profile[d] for d in range(1,N))
assert kirchhoff==F(417*N*(N*N-1),12)
assert kirchhoff==F(479550)
for c,m in counts.items():
    if not c: continue
    sector=sum((F(m,c)*F(d*(N-d),N)*(N-d) for d in range(1,N)),F(0))
    assert sector==F(m,c)*F(N*(N*N-1),12)
print('Q161df exact Q96/24 clock Kirchhoff index',kirchhoff)
print('separation 6 aggregate resistance',profile[6])
print('all 24 separations exact; Q161da B_x still OPEN')
