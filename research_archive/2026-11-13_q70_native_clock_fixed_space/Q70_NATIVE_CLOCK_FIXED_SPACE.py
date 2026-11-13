#!/usr/bin/env python3
"""Native Q2 successor and sigma1 24-clock fixed-space exact certificate."""
from fractions import Fraction as F
N=64
sigma=[None]*N
for x in range(32):
    sigma[x]=(2*x+1)%64
    sigma[x+32]=(2*x)%64
assert sorted(sigma)==list(range(N))
cycles=[]; seen=set()
for x in range(N):
    if x in seen:continue
    c=[];y=x
    while y not in seen:
        seen.add(y);c.append(y);y=sigma[y]
    assert y==x
    cycles.append(c)
assert sorted(map(len,cycles))==[4,12,12,12,12,12]
# 24-step clock average: each sigma orbit is fully sampled because all lengths divide 24.
C=[[F(0) for _ in range(N)] for _ in range(N)]
for c in cycles:
    for i in c:
        for j in c:C[i][j]=F(1,len(c))
J=F(1,N)
assert all(sum(row)==1 for row in C)
assert all(sum(C[i][j] for i in range(N))==1 for j in range(N))
assert all(sum(C[i][k]*C[k][j] for k in range(N))==C[i][j] for i in range(N) for j in range(N))
assert sum(C[i][i] for i in range(N))==6
assert sum((C[i][j]-J)**2 for i in range(N) for j in range(N))==5
# Native Q2 has successors 2h and 2h+1, each with weight 1/2.
Q=[[F(int(j in ((2*i)%64,(2*i+1)%64)),2) for j in range(N)] for i in range(N)]
# Q^6 = uniform rank-one, because each 6-bit output has exactly one length-6 path.
for i in range(N):
    states={i:F(1)}
    for _ in range(6):
        nxt={}
        for h,p in states.items():
            for j in ((2*h)%64,(2*h+1)%64):nxt[j]=nxt.get(j,F(0))+p/2
        states=nxt
    assert len(states)==64 and all(p==J for p in states.values())
# Clock fixed projection is not the Q2 invariant projection.
assert any(C[i][j]!=J for i in range(N) for j in range(N))
print('native_Q2_Q6_uniform=True')
print('sigma1_cycles=',sorted(map(len,cycles)))
print('24_clock_fixed_rank=6; Q2_fixed_rank=1')
print('squared_Hilbert_Schmidt_distance=5')
print('Q70_EXACT_NATIVE_CERTIFICATE_PASS')
