#!/usr/bin/env python3
"""Q161h exact native icosahedral hidden quadratic shift invariance."""
from itertools import product
import numpy as np
from scipy.spatial import ConvexHull
from sympy import Matrix, eye, diag
phi=(1+5**0.5)/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
faces=sorted(tuple(sorted(map(int,t))) for t in ConvexHull(points).simplices)
assert len(faces)==20
C=Matrix(20,12,lambda i,j:int(j in faces[i]))
L=Matrix(20,20,lambda i,j:3 if i==j else -int(len(set(faces[i])&set(faces[j]))==2))
Ph=eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
one12=Matrix.ones(12,1);one20=Matrix.ones(20,1)
assert C.rank()==12 and C*one12==3*one20
assert Ph*C==Matrix.zeros(20,12) and Ph*one20==Matrix.zeros(20,1)
assert P3.rank()==P5.rank()==4 and P3+P5==Ph
def source(v):
    w=C*v
    return Ph*Matrix([x*x for x in w])
def jac(v):
    return 2*Ph*diag(*(C*v))*C
v=Matrix(range(1,13));u=Matrix([2**i for i in range(12)])
for x in (v,u):
    assert source(x+7*one12)==source(x)
    assert jac(x)*one12==Matrix.zeros(20,1)
    assert jac(x).rank()==8
assert jac(one12)==Matrix.zeros(20,12)
assert jac(Matrix([int(i==0) for i in range(12)])).rank()==4
print('Q161h EXACT: C/P3/P5 hidden quadratic source invariant under v -> v+c*1')
print('Nonuniform Jacobian rank 8; uniform rank 0; one-hot rank 4')
print('Full H64/24 Jacobian and Q96 Ward remain open')
