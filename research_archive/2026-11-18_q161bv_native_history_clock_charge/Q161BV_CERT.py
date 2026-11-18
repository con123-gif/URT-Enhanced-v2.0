#!/usr/bin/env python3
"""Exact native URT sigma_1 / 24-clock / Q96 charge obstruction.
Source: cathedral_engine/histories.py sigma_lift(SIGMA1_BETA),
Q104_CLOCK_TRANSPORT.py, Q161BU_CERT.py. No fitted inputs.
"""
from collections import Counter
import sympy as sp
N, NT = 64, 24
beta = (1 << 32) - 1
sigma = tuple(((2*h) % N) | (((h >> 5) & 1) ^ ((beta >> (h & 31)) & 1)) for h in range(N))
assert sorted(sigma) == list(range(N))
assert all(sigma[h] in ((2*h)%N, (2*h)%N+1) for h in range(N))
seen = set(); cycles=[]
for h in range(N):
    if h in seen: continue
    x=h; cyc=[]
    while x not in seen:
        seen.add(x); cyc.append(x); x=sigma[x]
    assert x==h
    cycles.append(tuple(cyc))
assert Counter(map(len, cycles)) == Counter({12:5,4:1})
assert all(NT%len(c)==0 for c in cycles)
phi=(1+sp.sqrt(5))/2
omega=sp.simplify(phi**-2)
assert sp.simplify(omega-(3-sp.sqrt(5))/2)==0
charges=tuple(map(sp.Rational, ['-1','-2/3','-1/3','0','1/3','2/3','1']))
assert len(set(charges))==7
# D_q y(t,h)=y(t+1,h)-exp(2*pi*i*q/phi**2)y(t,sigma(h)).
# Since sigma**24=I, det D_q=(1-z**24)**64; kernel iff z**24=1.
for q in charges:
    if q: assert (24*q*omega).is_irrational is True
    else: assert sp.simplify(24*q*omega)==0
# Independent full 1536-state permutation-orbit certificate.
seen=set(); orbit_lengths=[]
for t in range(NT):
    for h in range(N):
        if (t,h) in seen: continue
        cur=(t,h); length=0
        while cur not in seen:
            seen.add(cur); length+=1
            cur=((cur[0]+1)%NT,sigma[cur[1]])
        assert cur==(t,h)
        orbit_lengths.append(length)
assert len(seen)==NT*N
assert Counter(orbit_lengths)==Counter({24:64})
print('Q161bv EXACT PASS: native sigma1 cycles 12x5,4x1; joint clock cycles 24x64')
print('det D_q=(1-exp(2*pi*i*24*q/phi**2))**64; q=0 rank1472/nullity64; six nonzero rational Q96 charges rank1536/nullity0')
print('CONDITIONAL clock/history charge coupling; source-derived 190/H64-to-clock J and physical Ward remain OPEN')
