#!/usr/bin/env python3
"""Q161i: exact second-order native icosahedral hidden source span."""
from itertools import product, combinations
import numpy as np
from scipy.spatial import ConvexHull
from sympy import Matrix, eye
phi=(1+5**.5)/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
faces=sorted(tuple(sorted(map(int,t))) for t in ConvexHull(points).simplices)
assert len(faces)==20
C=Matrix(20,12,lambda i,j:int(j in faces[i]))
L=Matrix(20,20,lambda i,j:3 if i==j else -int(len(set(faces[i])&set(faces[j]))==2))
Ph=eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert C.rank()==12 and Ph.rank()==8 and P3.rank()==P5.rank()==4
assert Ph*C==Matrix.zeros(20,12) and P3+P5==Ph
H=[]; nonzero_pairs=[]
for i,j in combinations(range(12),2):
    overlap=Matrix([C[f,i]*C[f,j] for f in range(20)])
    if overlap!=Matrix.zeros(20,1):nonzero_pairs.append((i,j))
    H.append(2*Ph*overlap)
M=Matrix.hstack(*H)
assert len(nonzero_pairs)==30
assert M.rank()==8
assert (P3*M).rank()==4 and (P5*M).rank()==4
assert all(Ph*Matrix([C[f,i]*C[f,i] for f in range(20)])==Matrix.zeros(20,1) for i in range(12))
assert Ph*M==M
print('Q161i exact: 30 edge-mixed Hessian columns span rank 8 = 4_3 + 4_5; 12 diagonal Hessian columns vanish')
print('Second-order hidden response at uniform sources is nonzero, despite zero first derivative; full 24/H64 lift and Q96 Ward remain open')
