#!/usr/bin/env python3
"""Q81: original all-five Gram radical source and native hidden quadratic form."""
import itertools
import sympy as s
from itertools import combinations
from mpmath import mp
mp.dps=65
phi=(1+s.sqrt(5))/2
verts=[[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],list(itertools.product((-1,1),repeat=3)),[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],list(itertools.product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a/phi,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b/phi) for a,b in itertools.product((-1,1),repeat=2)],[(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)]]
def moments(v):
 out=[]
 for X,Y,Z in v:
  n=s.sqrt(X*X+Y*Y+Z*Z);x,y,z=X/n,Y/n,Z/n
  out.append([x,y,z,(x*x-y*y)/s.sqrt(2),(x*x+y*y-2*z*z)/s.sqrt(6),s.sqrt(2)*x*y,s.sqrt(2)*x*z,s.sqrt(2)*y*z])
 return s.Matrix(out)
E=s.Matrix.vstack(*(moments(v) for v in verts));I=moments(verts[-1]);G=s.simplify(E.T*E);H=s.simplify(I.T*I)
blocks=[[0,7],[1,6],[2,5],[3],[4]]
for b in blocks:
 for i in b:
  for j in range(8):
   if j not in b:assert s.simplify(G[i,j])==0,(i,j,G[i,j])
def invroot(A,blocks):
 R=s.zeros(A.rows)
 for b in blocks:
  if len(b)==1:R[b[0],b[0]]=1/s.sqrt(A[b[0],b[0]])
  else:
   B=A.extract(b,b);d=s.sqrt(s.det(B));T=(B+d*s.eye(2)).inv()*s.sqrt(s.trace(B)+2*d)
   for i in range(2):
    for j in range(2):R[b[i],b[j]]=T[i,j]
 return R
for b in blocks:
 if len(b)==2:
  B=G.extract(b,b);d=s.sqrt(s.det(B))
  identity=(B+d*s.eye(2))**2-(s.trace(B)+2*d)*B
  assert all(s.simplify(v)==0 for v in identity)
R=invroot(G,blocks)
assert all(s.simplify(H[i,j])==0 for i in range(8) for j in range(8) if i!=j)
J=s.diag(*[1/s.sqrt(H[i,i]) for i in range(8)])
u=s.zeros(50,1);u[0]=u[3]=1
x=I*J*R*E.T*u
V=verts[-1]
def d2(i,j):return s.simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
faces=[f for f in combinations(range(12),3) if all(d2(i,j)==4 for i,j in combinations(f,2))]
assert len(faces)==20
C=s.zeros(20,12)
for k,f in enumerate(faces):
 for i in f:C[k,i]=1
L=s.zeros(20)
for i in range(20):
 L[i,i]=3
 for j in range(20):
  if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
Ph=s.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*s.eye(20)-L)/2;P5=Ph*(L-3*s.eye(20))/2
assert P3*P3==P3 and P5*P5==P5 and s.trace(P3)==s.trace(P5)==4
import numpy as np
xn=np.array([mp.mpf(str(z)) for z in s.matrix2numpy(x.evalf(55),dtype=object).flat],dtype=object)
cn=np.array([[mp.mpf(int(C[i,j])) for j in range(12)] for i in range(20)],dtype=object)
p3=np.array([[mp.mpf(str(P3[i,j].evalf(55))) for j in range(20)] for i in range(20)],dtype=object)
p5=np.array([[mp.mpf(str(P5[i,j].evalf(55))) for j in range(20)] for i in range(20)],dtype=object)
f=(cn@xn)**2;h3=p3@f;h5=p5@f
n3=sum(z*z for z in h3);n5=sum(z*z for z in h5)
assert n3>mp.mpf('1e-20') and n5>=0
print('Q81_ORIGINAL_ALL_FIVE_SOURCE_NORM3',mp.nstr(n3,35))
print('Q81_ORIGINAL_ALL_FIVE_SOURCE_NORM5',mp.nstr(n5,35))
print('Q81_GRAM_BLOCKS',blocks)
print('Q81_SOURCE_RADICAL_FORMULA: x=I H^(-1/2) G^(-1/2) E.T (e0+e3); norm3^2=[(Cx)^2].T P3 [(Cx)^2]')
print('Q81_NATIVE_SOURCE_PASS_NUMERICAL_RADICAL_EVALUATION')
