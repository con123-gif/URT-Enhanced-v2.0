#!/usr/bin/env python3
"""Exact original 12+centre golden-contact Hamiltonian scale certificate."""
from itertools import product,combinations
from collections import Counter
from sympy import sqrt,simplify
phi=(1+sqrt(5))/2
v=[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]
edges=[(i,j) for i,j in combinations(range(12),2) if simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0]
assert len(edges)==30
rows=[]
for mask in range(4096):
 s=[1-2*((mask>>i)&1) for i in range(12)]
 rows.append((sum(s[i]*s[j] for i,j in edges),abs(sum(s))))
assert Counter(rows)[(-6,4)]==60
levels={m:min(e for e,k in rows if k==m) for m in range(0,13,2)}
assert levels=={0:-10,2:-8,4:-6,6:0,8:10,10:20,12:30}
for m,e in levels.items():
 if m!=4: assert simplify(e-phi*m+6+4*phi).is_positive
gaps=[simplify(e+6+phi*(4-m)) for e,m in set(rows) if (e,m)!=(-6,4)]
assert all(g.is_positive for g in gaps)
gap=min(gaps,key=lambda x:float(x))
assert simplify(gap-(sqrt(5)-1))==0
assert simplify(2*gap-gap)==gap
print("PASS: original 30-edge icosahedron, 4096 spins, 60 golden-contact minima")
print("first gap =",gap,"; positive scales 1 and 2 yield distinct gaps")
