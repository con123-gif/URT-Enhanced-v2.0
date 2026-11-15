#!/usr/bin/env python3
"""Q161a: exact full spectrum of original URT six-bit Q/P Gram transfer."""
from fractions import Fraction as F
from itertools import combinations
from math import comb
N=64
Q=[[F(0) for _ in range(N)] for _ in range(N)]
P=[[F(0) for _ in range(N)] for _ in range(N)]
for a in range(N):
    Q[a][(2*a)%N]+=F(1,2)
    Q[a][(2*a+1)%N]+=F(1,2)
    for i,j in combinations(range(6),2):
        P[a][a^(1<<i)^(1<<j)]+=F(1,15)
def walsh(a,s):
    return -1 if ((a&s).bit_count()%2) else 1
for s in range(N):
    k=s.bit_count()
    p=F((6-2*k)**2-6,30)
    for a in range(N):
        assert sum(P[a][b]*walsh(b,s) for b in range(N))==p*walsh(a,s)
QTQ=[[sum(Q[c][a]*Q[c][b] for c in range(N)) for b in range(N)] for a in range(N)]
for a in range(N):
    for b in range(N):
        assert QTQ[a][b]==(F(1,2) if b==a or b==(a^1) else F(0))
spectrum={F(0):32}
for k in range(6):
    lam=F(((6-2*k)**2-6)**2,900)
    spectrum[lam]=spectrum.get(lam,0)+comb(5,k)
assert spectrum=={F(0):32,F(1):1,F(1,9):6,F(1,25):10,F(1,225):15}
assert sum(spectrum.values())==64
assert sum(v*k for k,v in spectrum.items())==F(32,15)
for s in range(N):
    eig=F(0) if s&1 else F(((6-2*s.bit_count())**2-6)**2,900)
    w=[walsh(a,s) for a in range(N)]
    pw=[sum(P[a][b]*w[b] for b in range(N)) for a in range(N)]
    piw=[(pw[a]+pw[a^1])/2 for a in range(N)]
    tp=[sum(P[a][b]*piw[b] for b in range(N)) for a in range(N)]
    assert all(tp[a]==eig*w[a] for a in range(N))
print("Q161a original six-bit Q/P Gram spectrum:",sorted((str(k),v) for k,v in spectrum.items()))
print("rank 32; kernel 32; trace 32/15; EXACT CERTIFICATE EXIT 0")
