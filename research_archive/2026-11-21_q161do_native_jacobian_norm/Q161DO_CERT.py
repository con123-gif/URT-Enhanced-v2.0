#!/usr/bin/env python3
"""Q161do: native Q101 face-square Jacobian Hilbert-Schmidt norm over all 60 ground words."""
from itertools import product, combinations
import sympy as S
phi=(1+S.sqrt(5))/2
v=S.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
dist=lambda i,j:S.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))
edges=sorted((i,j) for i,j in combinations(range(12),2) if dist(i,j)==4)
faces=sorted(f for f in combinations(range(12),3) if all((i,j) in edges for i,j in combinations(f,2)))
assert len(edges)==30 and len(faces)==20
C=S.Matrix(20,12,lambda i,j:int(j in faces[i]))
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=S.Matrix(12,12,lambda i,j:int(i==opp[j]))
P3=v*(v.T*v).inv()*v.T
P5=(S.eye(12)+Kv)/2-S.ones(12,12)/12
Pl=S.simplify(P3+P5)
assert S.simplify(Pl*Pl-Pl)==S.zeros(12) and Pl.rank()==8
L=S.simplify(C*Pl)
G=S.simplify(L*L.T)
target=72+S.Rational(72,5)*S.sqrt(5)
count=0
for mask in range(4096):
 w=S.Matrix([1-2*((mask>>i)&1) for i in range(12)])
 if sum(w[i]*w[j] for i,j in edges)!=-6 or abs(sum(w))!=4:continue
 z=L*w
 trace=S.simplify(4*sum(z[i]**2*G[i,i] for i in range(20)))
 assert S.simplify(trace-target)==0,(mask,trace)
 count+=1
assert count==60
print("Q161do EXACT PASS: all 60 native ground words, Tr(J_s^T J_s) =",target)
print("sum =",60*target,"; rank-8 Q161db is separate; charged embedding B_x remains OPEN")
