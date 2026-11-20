#!/usr/bin/env python3
"""Q161db: exact full-rank native Q101 face-square Jacobian on all 60 ground words."""
from itertools import product, combinations
import sympy as S
import numpy as np
from scipy.linalg import qr
phi=(1+S.sqrt(5))/2
v=S.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
dist=lambda i,j:S.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))
edges=sorted((i,j) for i,j in combinations(range(12),2) if dist(i,j)==4)
faces=sorted(f for f in combinations(range(12),3) if all((i,j) in edges for i,j in combinations(f,2)))
assert (len(edges),len(faces))==(30,20)
C=S.Matrix(20,12,lambda i,j:int(j in faces[i]))
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=S.Matrix(12,12,lambda i,j:int(i==opp[j]))
P3=v*(v.T*v).inv()*v.T
P5=(S.eye(12)+Kv)/2-S.ones(12,12)/12
Pl=S.simplify(P3+P5)
assert Pl.rank()==8
assert S.simplify(Pl*Pl-Pl)==S.zeros(12)
L=C*Pl
cols=list(Pl.rref()[1])
assert len(cols)==8
masks=[]
for mask in range(4096):
    w=S.Matrix([1-2*((mask>>i)&1) for i in range(12)])
    if sum(w[i]*w[j] for i,j in edges)==-6 and abs(sum(w))==4:
        masks.append(mask)
assert len(masks)==60
determinants=set()
for mask in masks:
    w=S.Matrix([1-2*((mask>>i)&1) for i in range(12)])
    J=2*S.diag(*(L*w))*L
    approx=np.array(J[:,cols].evalf(),dtype=float)
    rows=list(qr(approx.T,pivoting=True)[2][:8])
    det=S.simplify(J.extract(rows,cols).det(method="domain-ge"))
    assert det!=0,(mask,rows)
    determinants.add(str(det))
print("Q161db EXACT: all 60 native ground Jacobians rank 8; full hidden rank survives face-square linearization")
print("ground_count",len(masks),"determinant_classes",len(determinants))
print("Q96 charge Ward and H64/24 embedding: NOT ESTABLISHED")
