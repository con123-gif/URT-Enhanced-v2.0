#!/usr/bin/env python3
"""Q161f exact native hidden-projector x 24-cycle difference rank.
Factorized channel only; NOT the full unlocated five-solid-to-H64 Jacobian.
"""
from itertools import product
import numpy as np
from scipy.spatial import ConvexHull
from sympy import Matrix, eye
phi=(1+5**0.5)/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
faces=sorted(tuple(sorted(map(int,t))) for t in ConvexHull(points).simplices)
assert len(faces)==20
C=Matrix(20,12,lambda i,j:int(j in faces[i]))
L=Matrix(20,20,lambda i,j:3 if i==j else -int(len(set(faces[i])&set(faces[j]))==2))
Ph=eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert C.rank()==12 and P3.rank()==4 and P5.rank()==4
assert P3*P5==Matrix.zeros(20) and P3+P5==Ph
D=Matrix(24,24,lambda i,j:int(j==(i+1)%24)-int(i==j))
assert D.rank()==23 and D*Matrix.ones(24,1)==Matrix.zeros(24,1)
assert Ph.rank()*D.rank()==184
assert 20*24-184==296
assert 8*24-184==8
print('Q161f EXACT: native hidden rank=8, 24-cycle difference rank=23')
print('Factorized channel on face x clock: rank=184, nullity=296 of 480')
print('On hidden x clock: rank=184, nullity=8 of 192')
print('Constant-clock hidden modes remain invisible; no claim for full Q161b Jacobian')
