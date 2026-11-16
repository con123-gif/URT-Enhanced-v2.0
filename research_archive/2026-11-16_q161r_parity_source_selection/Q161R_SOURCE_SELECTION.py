#!/usr/bin/env python3
"""Exact native Q161a P,Q source-character selection on global parity."""
from fractions import Fraction as F
from collections import Counter
N=64
def walsh(s): return [(-1 if (x&s).bit_count()%2 else 1) for x in range(N)]
def P(v): return [sum((F(v[x^(1<<i)^(1<<j)],15) for i in range(6) for j in range(i+1,6)),F(0)) for x in range(N)]
def Q(v): return [F(v[2*x%N]+v[(2*x+1)%N],2) for x in range(N)]
parity=walsh(63)
assert Q(P(parity))==[0]*N
counts=Counter()
for t in range(64):
    f=walsh(t)
    z=Q(P([a*b for a,b in zip(f,parity)]))
    k=(63^t).bit_count()
    lam=F((6-2*k)**2-6,30)
    expected=F(0) if not (t&1) else 64*lam*lam
    norm=sum((v*v for v in z),F(0))
    assert norm==expected,(t,norm,expected)
    if t&1:
        assert norm>0
        counts[norm]+=1
    else: assert not any(z)
assert sum(counts.values())==32
assert counts==Counter({F(64):1,F(64,9):6,F(64,25):10,F(64,225):15})
outputs=[Q(P([a*b for a,b in zip(walsh(t),parity)])) for t in range(1,64,2)]
for i,u in enumerate(outputs):
    for j in range(i):
        assert sum((a*b for a,b in zip(u,outputs[j])),F(0))==0
print('Q161r native P/Q exact parity-source selection: 32 odd-bit0 channels, 32 zero channels; squared norms',dict(sorted(counts.items())))
print('Injective on bit0-odd Walsh source subspace; all tests exact; exit 0')
