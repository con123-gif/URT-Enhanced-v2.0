#!/usr/bin/env python3
"""Q161j: exact two-vertex Jacobian rank orbits of native icosahedral hidden source."""
from itertools import product, combinations
import numpy as np
from scipy.spatial import ConvexHull
from sympy import Matrix, eye, diag
phi=(1+5**0.5)/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
faces=sorted(tuple(sorted(map(int,t))) for t in ConvexHull(points).simplices)
assert len(faces)==20 and len(set(faces))==20
C=Matrix(20,12,lambda f,v:int(v in faces[f]))
L=Matrix(20,20,lambda i,j:3 if i==j else -int(len(set(faces[i])&set(faces[j]))==2))
Ph=eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert (C.rank(),Ph.rank(),P3.rank(),P5.rank())==(12,8,4,4)
assert Ph*C==Matrix.zeros(20,12)
A={(i,j) for i,j in combinations(range(12),2) if any(i in f and j in f for f in faces)}
assert len(A)==30
counts={}
for i,j in combinations(range(12),2):
    v=Matrix([int(k==i or k==j) for k in range(12)])
    J=2*Ph*diag(*(C*v))*C
    r=J.rank(); r3=(P3*J).rank(); r5=(P5*J).rank()
    key=('edge' if (i,j) in A else 'nonedge',r,r3,r5)
    counts[key]=counts.get(key,0)+1
assert counts == {('edge',6,4,4):30,('nonedge',7,4,4):30,('nonedge',8,4,4):6}
print('Q161j exact native two-vertex Jacobian rank orbit counts:',sorted(counts.items()))
