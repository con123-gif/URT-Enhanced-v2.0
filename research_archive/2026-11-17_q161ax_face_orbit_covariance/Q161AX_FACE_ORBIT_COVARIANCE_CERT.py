#!/usr/bin/env python3
"""Exact original icosahedral Q101 ground-orbit nonlinear face covariance."""
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
assert all(s.simplify(z)==0 for z in (Pl*Pl-Pl))
words=[]
for bits in range(1<<12):
 x=s.Matrix([1-2*((bits>>i)&1) for i in range(12)])
 if sum(x)!=4 or sum(x[i]*x[j] for i,j in edges)!=-6:continue
 words.append(x)
assert len(words)==30
F=[]
for x in words:
 q=C*Pl*x
 F.append(s.Matrix([s.expand(z*z) for z in q]))
mean=s.simplify(sum(F,s.zeros(20,1))/30)
assert all(s.simplify(z-s.Rational(3,5))==0 for z in mean)
Cov=s.zeros(20)
for f in F:
 d=f-mean
 Cov+=d*d.T
Cov=Cov/30
assert Cov==Cov.T
assert all(s.simplify(sum(Cov.row(i)))==0 for i in range(20))
tr=s.simplify(s.trace(Cov)); norm=s.simplify(sum((f.T*f)[0] for f in F)/30)
assert s.simplify(norm-s.Rational(596,25))==0
assert s.simplify(tr-(s.Rational(596,25)-s.Rational(36,5)))==0
print('Q161AX ORIGINAL 30-GROUND EXACT FACE COVARIANCE')
print('mean=3/5 each of 20 faces; E||f||²=596/25; trace Cov=',tr)
print('Cov*1=0, covariance symmetric; no physical H64/24/Q96 identification')
