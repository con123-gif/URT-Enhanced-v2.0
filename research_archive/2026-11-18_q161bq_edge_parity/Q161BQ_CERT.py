#!/usr/bin/env python3
"""Q161bq: exact antipodal intertwining on original Q101 oriented edge boundary."""
from itertools import combinations, product
import sympy as s
r=s.sqrt(5); phi=(1+r)/2
v=[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]
edges=[(i,j) for i,j in combinations(range(12),2) if s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
D=s.zeros(30,20)
for k,(a,b) in enumerate(edges):
 fs=[i for i,t in enumerate(faces) if a in t and b in t]
 assert len(fs)==2
 D[k,fs[0]]=1;D[k,fs[1]]=-1
anti=[next(j for j,w in enumerate(v) if all(s.simplify(w[k]+u[k])==0 for k in range(3))) for u in v]
fmap=[faces.index(tuple(sorted(anti[i] for i in f))) for f in faces]
P=s.zeros(20)
for i,j in enumerate(fmap):P[j,i]=1
E=s.zeros(30)
for i,(a,b) in enumerate(edges):
 j=edges.index(tuple(sorted((anti[a],anti[b]))))
 sign=1 if D.row(j)*P==D.row(i) else -1
 assert D.row(j)*P==sign*D.row(i)
 E[j,i]=sign
assert E*E==s.eye(30) and E*D==D*P and E.T==E
Fp=(s.eye(20)+P)/2;Fm=(s.eye(20)-P)/2
Ep=(s.eye(30)+E)/2;Em=(s.eye(30)-E)/2
assert Ep*D==D*Fp and Em*D==D*Fm
rp=(D*Fp).rank();rm=(D*Fm).rank()
cp=Ep.rank()-rp;cm=Em.rank()-rm
assert (Ep.rank(),Em.rank(),rp,rm,cp,cm,s.trace(E))==(15,15,9,10,6,5,0)
print('Q161bq EXACT PASS: native edge parity 15+15, image 9+10, cycles 6+5; ED=DP')
