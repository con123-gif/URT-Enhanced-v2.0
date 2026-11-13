#!/usr/bin/env python3
"""Native Q2 and Q64 sigma_1: exact distinction between trajectory and ensemble likelihood."""
from fractions import Fraction as F
from collections import Counter
N=64
succ=lambda h: ((2*h)%N,(2*h+1)%N)
sigma=lambda h: (2*h+1)%N if h<32 else (2*(h-32))%N
assert all(sigma(h) in succ(h) for h in range(N))
assert len({sigma(h) for h in range(N)})==N
cycles=[]; unseen=set(range(N))
while unseen:
    x=min(unseen); c=[]; h=x
    while h not in c:
        assert h in unseen
        c.append(h);unseen.remove(h);h=sigma(h)
    assert h==x
    cycles.append(c)
assert Counter(map(len,cycles))==Counter({4:1,12:5}),Counter(map(len,cycles))
assert all(sum(F(1,2) for h in range(N) if k in succ(h))==1 for k in range(N))
assert max(map(len,cycles))<64
single_cycle={len(c):F(1,64)*F(1,2)**len(c) for c in cycles}
ensemble=F(1,2)**64
assert ensemble==F(1,2**64)
assert sum(F(1,64)*F(1,2)**64 for _ in range(N))==ensemble
assert all(len(set(sigma(h) for h in c))==len(c) for c in cycles)
print('PASS native Q2 + sigma1: cycles',sorted(map(len,cycles)))
print('PASS stationary Q2 uniform; 64 independent one-step row choices probability',ensemble)
print('PASS a single sigma1 trajectory cannot traverse all 64 rows; max orbit length',max(map(len,cycles)))
print('CONCLUSION: A1 full-row product requires a 64-start ensemble or extra path sampling rule; natural extension alone does not derive it')
