#!/usr/bin/env python3
"""Q161cx: exact tight-frame certificate for native Q101 frustrated axes."""
from itertools import product, combinations
from sympy import Matrix, sqrt, simplify, zeros, eye
phi=(1+sqrt(5))/2
V=[Matrix(x) for x in ([(0,a,b*phi) for a,b in product((-1,1),repeat=2)] + [(a,b*phi,0) for a,b in product((-1,1),repeat=2)] + [(a*phi,0,b) for a,b in product((-1,1),repeat=2)])]
assert len(V)==12
edges=[(i,j) for i,j in combinations(range(12),2) if simplify((V[i]-V[j]).dot(V[i]-V[j])-4)==0]
assert len(edges)==30
A=[]; mags={-4:0,4:0}
for bits in range(1<<12):
    s=[1-2*((bits>>i)&1) for i in range(12)]
    E=sum(s[i]*s[j] for i,j in edges); M=sum(s)
    if E != -6 or abs(M) != 4: continue
    a=sum((s[i]*V[i] for i in range(12)),zeros(3,1))
    assert simplify(a.dot(a)-(24-8*sqrt(5)))==0
    A.append(a);mags[M]+=1
assert len(A)==60 and mags=={-4:30,4:30}
F=sum((a*a.T for a in A),zeros(3))
F=F.applyfunc(simplify)
assert F==(480-160*sqrt(5))*eye(3)
assert sum(A,zeros(3,1))==zeros(3,1)
assert (F/(24-8*sqrt(5))).applyfunc(simplify)==20*eye(3)
print('Q161CX EXACT PASS: 60 original frustrated Q101 sources, 30 per M sign')
print('unnormalized Gram:',F)
print('normalized frame operator: 20 I_3; first moment zero')
print('Q96 source-to-charge B_x and physical Ward leakage remain OPEN')
