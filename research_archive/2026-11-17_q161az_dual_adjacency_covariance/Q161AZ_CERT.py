#!/usr/bin/env python3
"""Q161az: original Q101 face-source covariance commutes with native dual-face adjacency."""
import sympy as s
from itertools import product,combinations
r=s.sqrt(5); phi=(1+r)/2
v=s.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2) if s.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert len(edges)==30 and len(faces)==20
C=s.Matrix(20,12,lambda i,j:int(j in faces[i]))
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=s.Matrix(12,12,lambda i,j:int(i==opp[j]))
Pl=s.simplify(v*(v.T*v).inv()*v.T+(s.eye(12)+Kv)/2-s.ones(12,12)/12)
F=[]
for bits in range(1<<12):
 x=s.Matrix([1-2*((bits>>i)&1) for i in range(12)])
 if sum(x)!=4 or sum(x[i]*x[j] for i,j in edges)!=-6:continue
 q=C*Pl*x; F.append(s.Matrix([s.expand(z*z) for z in q]))
assert len(F)==30
mu=sum(F,s.zeros(20,1))/30
Sigma=sum(((f-mu)*(f-mu).T for f in F),s.zeros(20))/30
A=s.Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
assert A==A.T and all(sum(A.row(i))==3 for i in range(20))
assert A.eigenvals()=={s.Integer(3):1,s.Integer(-2):4,s.Integer(1):5,-s.sqrt(5):3,s.sqrt(5):3,s.Integer(0):4}
assert s.simplify(A*Sigma-Sigma*A)==s.zeros(20)
assert s.simplify(s.trace(Sigma)-s.Rational(416,25))==0
print("Q161AZ EXACT PASS: [A_dual,Sigma_Q101]=0; spectrum A=(3:1,-2:4,1:5,-sqrt5:3,sqrt5:3,0:4)")
