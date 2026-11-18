#!/usr/bin/env python3
"""Q161bw: exact native Q104 sigma1 spectral multiplicities; no physical seam assumed."""
from collections import Counter
import sympy as sp
N=64
beta=(1<<32)-1
sigma=tuple(((2*h)%N)|(((h>>5)&1)^((beta>>(h&31))&1)) for h in range(N))
assert sorted(sigma)==list(range(N))
def step(h,k):
    for _ in range(k): h=sigma[h]
    return h
seen=set(); lengths=[]
for h in range(N):
    if h in seen: continue
    x=h; length=0
    while x not in seen:
        seen.add(x);length+=1;x=sigma[x]
    assert x==h
    lengths.append(length)
assert Counter(lengths)==Counter({12:5,4:1})
fixed={k:sum(step(h,k)==h for h in range(N)) for k in range(12)}
assert [fixed[k] for k in (1,2,3,4,6)]==[0,0,0,4,0]
assert sum(fixed.values())==72
assert all(step(h,12)==h for h in range(N))
assert any(step(h,4)!=h for h in range(N))
x=sp.symbols('x')
char=sp.Poly((x**12-1)**5*(x**4-1),x)
assert char.degree()==64
assert sp.rem(char,sp.Poly(x**12-1,x))==0
# Native joint (sigma1, S24) permutation: all orbits have length 24.
seen=set(); lengths=[]
for t in range(24):
    for h in range(N):
        if (t,h) in seen:continue
        cur=(t,h);n=0
        while cur not in seen:
            seen.add(cur);n+=1
            cur=((cur[0]+1)%24,sigma[cur[1]])
        assert cur==(t,h)
        lengths.append(n)
assert Counter(lengths)==Counter({24:64})
print('Q161bw EXACT PASS: sigma1 char=(x^12-1)^5(x^4-1), minimal=x^12-1; trace orbit sum=72')
print('joint sigma1 x S24 char=(x^24-1)^64, minimal=x^24-1')
print('Conditional clock product only; original 190/H64 source J and Q96 Ward OPEN')
