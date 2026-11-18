#!/usr/bin/env python3
"""Q161br: exact original Q101 edge and canonical 24-track reversal certificate."""
from itertools import combinations,product
import sympy as s
r=s.sqrt(5);phi=(1+r)/2
v=[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]
edges=[(i,j) for i,j in combinations(range(12),2) if s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
D=s.zeros(30,20)
for k,(a,b) in enumerate(edges):
 fs=[i for i,t in enumerate(faces) if a in t and b in t];assert len(fs)==2
 D[k,fs[0]]=1;D[k,fs[1]]=-1
anti=[next(j for j,w in enumerate(v) if all(s.simplify(w[k]+u[k])==0 for k in range(3))) for u in v]
P=s.zeros(20)
for i,f in enumerate(faces):P[faces.index(tuple(sorted(anti[j] for j in f))),i]=1
E=s.zeros(30)
for i,(a,b) in enumerate(edges):
 j=edges.index(tuple(sorted((anti[a],anti[b]))))
 sign=1 if D.row(j)*P==D.row(i) else -1
 assert D.row(j)*P==sign*D.row(i)
 E[j,i]=sign
assert E*D==D*P and E*E==s.eye(30)
n=24;S=s.zeros(n);R=s.zeros(n)
for k in range(n):S[(k+1)%n,k]=1;R[(-k)%n,k]=1
assert S**24==s.eye(n) and R*R==s.eye(n) and R*S*R==S.T
A=S-S.T;L=2*s.eye(n)-S-S.T
assert R*A*R==-A and R*L*R==L
assert A.rank()==22 and L.rank()==23
assert E*D==D*P and R*A==-A*R
assert D.rank()==19
rank=19*22;nullity=20*24-rank
assert (rank,nullity)==(418,62)
assert (n+s.trace(R))//2==13 and (n-s.trace(R))//2==11
print('Q161br EXACT PASS: RSR=S^-1; RAR=-A; RLR=L; rank(D tensor A)=418; nullity=62')
