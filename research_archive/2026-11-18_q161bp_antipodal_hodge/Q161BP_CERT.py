#!/usr/bin/env python3
"""Q161bp: original Q101 face-edge Hodge Laplacian under native antipodal involution."""
from itertools import combinations, product
import sympy as s
from sympy.matrices.normalforms import smith_normal_form
from sympy.polys.domains import ZZ
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
L=D.T*D
anti=[next(j for j,w in enumerate(v) if all(s.simplify(w[k]+u[k])==0 for k in range(3))) for u in v]
fmap=[faces.index(tuple(sorted(anti[i] for i in f))) for f in faces]
assert all(fmap[fmap[i]]==i and fmap[i]!=i for i in range(20))
P=s.zeros(20)
for i,j in enumerate(fmap): P[j,i]=1
assert P*L==L*P
pairs=sorted((i,j) for i,j in enumerate(fmap) if i<j)
assert len(pairs)==10
Bp=s.zeros(20,10);Bm=s.zeros(20,10)
for k,(i,j) in enumerate(pairs):
    Bp[i,k]=Bp[j,k]=1;Bm[i,k]=1;Bm[j,k]=-1
assert Bp.T*Bm==s.zeros(10)
Mp=s.Matrix([[(L*Bp)[i,j] for j in range(10)] for i,_ in pairs])
Mm=s.Matrix([[(L*Bm)[i,j] for j in range(10)] for i,_ in pairs])
assert L*Bp==Bp*Mp and L*Bm==Bm*Mm
assert Mp==Mp.T and Mm==Mm.T
def snf(M):
    S=smith_normal_form(M,domain=ZZ)
    return [abs(int(S[i,i])) for i in range(M.rows)]
assert snf(Mp)==[1]*5+[2,10,10,10,0]
assert snf(Mm)==[1]*5+[2,6,6,6,12]
x=s.Symbol('lambda')
assert s.factor(Mp.charpoly(x).as_expr())==x*(x-5)**4*(x-2)**5
assert s.factor(Mm.charpoly(x).as_expr())==(x-3)**4*(x*x-6*x+4)**3
assert Mm.det()==5184
assert s.prod(snf(Mp)[:-1])==2000
assert s.expand(Mp.charpoly(x).as_expr()*Mm.charpoly(x).as_expr()-L.charpoly(x).as_expr())==0
print('Q161bp EXACT PASS: native antipodal Hodge even/odd Smith and spectra; odd determinant 5184')
