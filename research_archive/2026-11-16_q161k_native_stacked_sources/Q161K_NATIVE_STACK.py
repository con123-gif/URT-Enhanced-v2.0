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
# Exact native one-vertex backgrounds, no fitted inputs.
J=[]
for k in range(12):
    v=Matrix([int(t==k) for t in range(12)])
    J.append(2*Ph*diag(*(C*v))*C)
    assert J[-1]*Matrix.ones(12,1)==Matrix.zeros(20,1)
assert [j.rank() for j in J]==[4]*12
ranks=[Matrix.vstack(*J[:k]).rank() for k in range(1,13)]
assert ranks==[4,7,10,11,11,11,11,11,11,11,11,11]
stack=Matrix.vstack(*J)
assert stack.rank()==11 and stack.nullspace()==[Matrix.ones(12,1)]
print("Q161k native hidden Jacobian source stack ranks",ranks,"nullspace span{ones_12}; exact PASS")
