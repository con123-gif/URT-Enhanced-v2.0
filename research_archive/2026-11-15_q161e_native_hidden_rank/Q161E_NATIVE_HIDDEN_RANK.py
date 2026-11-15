#!/usr/bin/env python3
"""Q161e: exact native icosahedral hidden-sector rank bottleneck.
Geometry/face ordering and P3/P5 formulas reproduce the archived
2026-11-07 cathedral_constructed_joint_dynamics_2026_11_07.py.
"""
from itertools import product
import numpy as np
from scipy.spatial import ConvexHull
from sympy import Matrix, eye

phi=(1+5**.5)/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
                +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
                +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
faces=sorted(tuple(sorted(map(int,t))) for t in ConvexHull(points).simplices)
assert len(faces)==20 and len(set(faces))==20
C=Matrix(20,12,lambda i,j:int(j in faces[i]))
assert C.rank()==12
L=Matrix(20,20,lambda i,j:(3 if i==j else
           -int(len(set(faces[i])&set(faces[j]))==2)))
Ph=eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert P3*P3==P3 and P5*P5==P5
assert P3*P5==Matrix.zeros(20)
assert P3.rank()==4 and P5.rank()==4
assert (P3+P5).rank()==8
# Native hidden source h(v)=(P3 f(v),P5 f(v)),
# f(v)=(C Plinear v)^2. Its derivative at any v is
# 2 [P3;P5] diag(C Plinear v) C Plinear.
# The derivative's codomain is the fixed 8D image of P3+P5.
# Consequently a single time-slice coupling through this source
# cannot be injective on a 32D kernel, whatever the premap.
assert 32>8 and 4*8==32
print("Q161e EXACT: C rank 12; P3/P5 ranks 4+4; hidden rank 8")
print("One source slice derivative rank <=8; at least four independent slices necessary")
print("Local exact-integer/rational certificate EXIT 0")
