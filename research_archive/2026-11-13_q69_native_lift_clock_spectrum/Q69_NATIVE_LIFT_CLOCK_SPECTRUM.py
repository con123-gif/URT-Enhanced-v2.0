#!/usr/bin/env python3
"""Exact 24-clock character of the original Q2 successor-supported sigma_1 lift."""
N=64
sigma=[None]*N
for x in range(32):
    sigma[x]=(2*x+1)%64
    sigma[x+32]=(2*x)%64
assert sorted(sigma)==list(range(N))
assert all(sigma[h] in ((2*h)%64,(2*h+1)%64) for h in range(N))
seen=set(); cycles=[]
for x in range(N):
    if x in seen: continue
    c=[]; y=x
    while y not in seen:
        seen.add(y); c.append(y); y=sigma[y]
    assert y==x
    cycles.append(c)
assert sorted(map(len,cycles))==[4]+[12]*5
multiplicities={k:sum((k*len(c))%24==0 for c in cycles) for k in range(24)}
assert sum(multiplicities.values())==64
assert all(multiplicities[k]==(6 if k%6==0 else 5 if k%2==0 else 0) for k in range(24))
for n in range(24):
    fixed=0
    for h in range(N):
        y=h
        for _ in range(n): y=sigma[y]
        fixed+=(y==h)
    assert fixed==sum(len(c) for c in cycles if n%len(c)==0)
assert sum(v*v for v in multiplicities.values())==344
print('NATIVE_Q2_SIGMA1_CYCLES',sorted(map(len,cycles)))
print('24_CLOCK_MULTIPLICITIES',multiplicities)
print('COMMUTANT_DIMENSION_OVER_COMPLEX',344)
print('Q69_NATIVE_LIFT_CLOCK_SPECTRUM_PASS')
