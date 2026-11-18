#!/usr/bin/env python3
"""Q161bi: native Q101 face-source scalar certificate; no seam assumed."""
import sympy as s
from itertools import product, combinations
r=s.sqrt(5); phi=(1+r)/2
v=s.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2) if s.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert len(edges)==30 and len(faces)==20
C=s.Matrix(20,12,lambda i,j:int(j in faces[i]))
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=s.Matrix(12,12,lambda i,j:int(i==opp[j]))
Pl=s.simplify(v*(v.T*v).inv()*v.T+(s.eye(12)+Kv)/2-s.ones(12,12)/12)
assert (Pl*Pl-Pl).applyfunc(s.simplify)==s.zeros(12)  # exact Q(sqrt(5)) entrywise projector identity
A=s.Matrix(12,12,lambda i,j:int((min(i,j),max(i,j)) in edges))
assert C.T*C==5*s.eye(12)+2*A
count=0
for bits in range(1<<12):
 x=s.Matrix([1-2*((bits>>i)&1) for i in range(12)])
 if sum(x)!=4 or sum(x[i]*x[j] for i,j in edges)!=-6: continue
 flux=s.simplify(((C*Pl*x).T*(C*Pl*x))[0])
 assert flux==12,(bits,flux)
 count+=1
assert count==30,count
print("Q161bi EXACT: C^T C=5I+2A_ico; 30 original Q101 ground words; ||C Pl x||^2=12 each.")
