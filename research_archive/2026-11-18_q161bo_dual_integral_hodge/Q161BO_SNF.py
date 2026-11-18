#!/usr/bin/env python3
"""Q161bo: native Q101 dual-face Hodge Laplacian integral Smith certificate."""
from itertools import combinations, product
import sympy as s
from sympy.matrices.normalforms import smith_normal_form
from sympy.polys.domains import ZZ
r=s.sqrt(5); p=(1+r)/2
v=[(0,a,b*p) for a,b in product((-1,1),repeat=2)]+[(a,b*p,0) for a,b in product((-1,1),repeat=2)]+[(a*p,0,b) for a,b in product((-1,1),repeat=2)]
edges=[(i,j) for i,j in combinations(range(12),2) if s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
D=s.zeros(30,20)
for k,(a,b) in enumerate(edges):
 f=[i for i,t in enumerate(faces) if a in t and b in t]
 assert len(f)==2
 D[k,f[0]]=1;D[k,f[1]]=-1
L=D.T*D
assert all(L[i,i]==3 for i in range(20))
assert L*s.ones(20,1)==s.zeros(20,1)
assert L.rank()==19
snf=smith_normal_form(L,domain=ZZ)
diag=[abs(int(snf[i,i])) for i in range(20)]
assert diag==[1]*14+[2,12,60,60,60,0]
assert all(diag[i+1]%diag[i]==0 for i in range(18))
tree=L[:19,:19].det(method='domain-ge')
assert tree==s.prod(diag[:-1])==5184000
print('Q161bo EXACT PASS: native dual-face Laplacian Smith diagonal',diag,'spanning trees',tree)
