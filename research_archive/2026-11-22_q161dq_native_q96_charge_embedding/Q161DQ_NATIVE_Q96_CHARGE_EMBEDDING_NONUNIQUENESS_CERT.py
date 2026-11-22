#!/usr/bin/env python3
"""Native Q124/Q96 charge spectrum and explicit inequivalent four-channel embeddings.
This proves Ward compatibility is insufficient to select a physical H64->Q96 map.
"""
from itertools import combinations, product
from fractions import Fraction as F
import numpy as np
from math import sqrt

phi=(1+sqrt(5))/2
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
ed=[(i,j) for i,j in combinations(range(12),2) if abs(np.dot(v[i]-v[j],v[i]-v[j])-4)<1e-10]
assert len(ed)==30
sigma=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
y=[F(1,6)]*6+[F(-1,2)]*2+[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
assert len(y)==16
qleft=[]
for k in range(4):
 for spin in (+1,-1):qleft.append(y[2*k]+F(spin,2))
q16=qleft+y[8:]
q96=q16*3+[-z for z in q16]*3
assert len(q96)==96
from collections import Counter
counts=Counter(q96)
expected={F(2,3):18,F(-2,3):18,F(1,3):18,F(-1,3):18,F(1):6,F(-1):6,F(0):12}
assert counts==expected,(counts,expected)
indices=[i for i,q in enumerate(q96) if q==F(2,3)]
E=np.eye(96,dtype=complex)
B1=E[:,indices[:4]];B2=E[:,indices[4:8]]
Q=np.diag(np.array([float(q) for q in q96]))
for B in (B1,B2):
 assert np.array_equal(B.conj().T@B,np.eye(4))
 assert np.linalg.norm(Q@B-F(2,3)*B)<1e-14
 assert np.linalg.norm((np.eye(96)-B@B.conj().T)@Q@B)<1e-14
assert np.linalg.norm(B1.conj().T@B2)==0
contact=0;maxerr=0.
for mask in range(1<<13):
 s=np.array([1-2*((mask>>i)&1) for i in range(12)])
 c=1-2*((mask>>12)&1)
 if sum(s[i]*s[j] for i,j in ed)+phi*c*sum(s)>-10+1e-11:continue
 contact+=1
 x=s@v;x=x/np.linalg.norm(x)
 S=np.einsum('i,ijk->jk',x,sigma)
 local=np.diag(np.array([float(t) for t in y],complex))
 for k in range(4):local[2*k:2*k+2,2*k:2*k+2]+=S/2
 actual=np.linalg.eigvalsh(local)
 expected16=np.sort(np.array([float(z) for z in q16]))
 maxerr=max(maxerr,float(np.max(abs(actual-expected16))))
assert contact==444 and maxerr<1e-12,(contact,maxerr)
print('Q161dq exact native Q96 charge multiplicities:',dict(sorted(counts.items())))
print('Native Q124 contact histories:',contact,'max local charge-spectrum residual:',maxerr)
print('Two orthogonal rank-4 complex charged isometries with exact zero Ward leakage')
print('RESULT: OBSTRUCTION to selecting B_x by electric Ward compatibility alone; physical gate OPEN')
