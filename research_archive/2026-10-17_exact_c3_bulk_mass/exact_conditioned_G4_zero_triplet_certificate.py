#!/usr/bin/env python3
"""Exact rational-arithmetic certification of a face-conditioned A4 chiral triplet."""
import sys
from pathlib import Path
from itertools import product
import sympy as s
import numpy as np
from numpy.linalg import norm
sys.path.insert(0,str(Path(__file__).resolve().parent))
import cathedral_strict_64_closure as c
v,vc,edges,faces,ds,inc=c.icosahedron()
L=s.Matrix(np.rint(ds[2].T@ds[2]).astype(int).tolist());I=s.eye(20);Z=L-3*I
P3=L*(L-2*I)*(L-5*I)*(Z*Z-5*I)/30
P5=-L*(L-2*I)*(L-3*I)*(Z*Z-5*I)/30
assert P3*P3==P3 and P5*P5==P5
cent=np.array([v[list(f)].sum(axis=0) for f in faces])
W=s.zeros(20)
for i in range(20):
 for j in range(20):
  t=sum(v[k]@np.cross(cent[i],cent[j]) for k in set(faces[i])&set(faces[j]))
  if abs(t)>1e-8:W[i,j]=int(np.sign(t))
assert W*W==-15*(P3+P5)
cycle=np.roll(np.eye(3),1,axis=0)
rots=[np.diag(sign)@np.linalg.matrix_power(cycle,k) for sign in product((-1,1),repeat=3) if np.prod(sign)>0 for k in range(3)]
face_sets=[frozenset(f) for f in faces]
A4=s.zeros(20)
for R in rots:
 vm=[]
 for x in v:
  j=np.flatnonzero(norm(v-R@x,axis=1)<1e-8)
  assert len(j)==1
  vm.append(int(j[0]))
 M=s.zeros(20)
 for col,f in enumerate(faces):M[face_sets.index(frozenset(vm[k] for k in f)),col]=1
 A4+=M
A4/=12
# Project chiral-zero P0=(5P3+3P5-iW)/8 to A4 triplet, arithmetic in Q[i].
R=I-A4
X=((5*P3+3*P5)/8)*R
Y=(-W/8)*R
assert X*X-Y*Y==X and X*Y+Y*X==Y
assert s.trace(X)==3 and s.trace(Y)==0
f=None
for ff in faces:
 mapped=[]
 for k in ff:
  j=np.flatnonzero(norm(v-cycle@v[k],axis=1)<1e-8)
  mapped.append(int(j[0]))
 if frozenset(mapped)==frozenset(ff):f=ff;break
assert f is not None
int_inc=np.rint(inc).astype(int)
E=s.diag(*[s.Rational(int(int_inc[i,list(f)].sum()),9) for i in range(20)])
A=X*E;B=Y*E
q1=s.trace(A)
q2=s.trace(A*A-B*B)
# Trace cyclic property collapses the 3 cross terms to 3 Tr(A B²)
q3=s.trace(A*A*A)-3*s.trace(A*B*B)
assert q1==s.Rational(1,4),(q1,q2,q3)
assert q2==s.Rational(11,432),(q1,q2,q3)
assert q3==s.Rational(5,1728),(q1,q2,q3)
print('EXACT PASS tetrahedral A4 zero triplet, selected face',f)
print('Projector Tr',s.trace(X),'and P_gen²=P_gen over Q[i]')
print('Exact spectral trace powers',q1,q2,q3)
print('Three nonzero eigenvalues: (3-sqrt(3))/36, 1/12, (3+sqrt(3))/36')
print('Candidate normalized Q=',s.factor(q2/q1**2),'=11/27')

# Exact second connected moment (native Lüders/measurement fluctuation):
# V=Pgen E (I-Pgen) E Pgen = Pgen E² Pgen-(Pgen E Pgen)^2.
BE_r=X*E*X-Y*E*Y
BE_i=X*E*Y+Y*E*X
V_r=(X*(E*E)*X-Y*(E*E)*Y)-(BE_r*BE_r-BE_i*BE_i)
V_i=(X*(E*E)*Y+Y*(E*E)*X)-(BE_r*BE_i+BE_i*BE_r)
assert V_r.T==V_r and V_i.T==-V_i
v1=s.trace(V_r)
v2=s.trace(V_r*V_r-V_i*V_i)
v3=s.trace(V_r*V_r*V_r)-3*s.trace(V_r*V_i*V_i)
assert v1==s.Rational(5,216),(v1,v2,v3)
assert v2==s.Rational(29,139968),(v1,v2,v3)
assert v3==s.Rational(181,90699264),(v1,v2,v3)
print('EXACT connected E-face variance trace powers',v1,v2,v3)
print('EXACT variance triplet eigenvalues (4-sqrt(3))/648,(4+sqrt(3))/648,7/648')
print('EXACT connected fluctuation Q=',s.factor(v2/v1**2),'=29/75')
print('In C3 convention a=5/648, b=1/648, |c|=1/648 (orientation chooses sign)')
