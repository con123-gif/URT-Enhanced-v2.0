#!/usr/bin/env python3
"""Q95 independent numeric reconstruction of original all-five Eglobal(e0+e3).

No observed physics in inputs. Q81 norms are regression targets, not fitted data.
"""
from itertools import combinations, product
from math import sqrt, cos, e, pi, isclose
import numpy as np
phi=(1+sqrt(5))/2
pm=list(product((-1,1),repeat=2))
solids={
 'tetrahedron':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octahedron':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodecahedron':list(product((-1,1),repeat=3))+[(0,a*(phi-1),b*phi) for a,b in pm]+[(a*(phi-1),b*phi,0) for a,b in pm]+[(a*phi,0,b*(phi-1)) for a,b in pm],
 'icosahedron':[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]+[(a*phi,0,b) for a,b in pm]
}
def moments(verts):
    v=np.array(verts,float);v/=np.linalg.norm(v,axis=1)[:,None]
    x,y,z=v.T
    return np.stack([x,y,z,(x*x-y*y)/sqrt(2),(x*x+y*y-2*z*z)/sqrt(6),sqrt(2)*x*y,sqrt(2)*x*z,sqrt(2)*y*z],axis=1)
def whiten(X):
    vals,V=np.linalg.eigh(X.T@X)
    assert min(vals)>0
    return X@((V/np.sqrt(vals))@V.T)
Eraw=np.concatenate([moments(solids[s]) for s in solids])
assert Eraw.shape==(50,8)
Ii=whiten(moments(solids['icosahedron']))
Eg=whiten(Eraw)
v50=np.zeros(50);v50[0]=v50[3]=1
x=Ii@Eg.T@v50
V=np.array(solids['icosahedron'],float)
faces=sorted(t for t in combinations(range(12),3) if all(isclose(np.sum((V[i]-V[j])**2),4,abs_tol=1e-10) for i,j in combinations(t,2)))
assert len(faces)==20
C=np.array([[int(i in f) for i in range(12)] for f in faces],float)
L=np.array([[(3 if i==j else (-1 if len(set(faces[i])&set(faces[j]))==2 else 0)) for j in range(20)] for i in range(20)],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2
P5=Ph@(L-3*np.eye(20))/2
f=(C@x)**2;h3=P3@f;h5=P5@f
n3=h3@h3;n5=h5@h5
assert abs(n3-0.03219454482236522169)<1e-12
assert abs(n5-0.00182617943481378943)<1e-12
unit=V/np.linalg.norm(V,axis=1)[:,None]
B=np.stack([unit[:,2],unit[:,0]*unit[:,1]],axis=1)
ab=np.linalg.lstsq(B,x,rcond=None)[0]
assert np.linalg.norm(x-B@ab)<1e-12
pairs=[];rem=set(range(12))
while rem:
    i=min(rem);j=next(j for j in sorted(rem-{i}) if np.allclose(V[i]+V[j],0))
    pairs.append((i,j));rem-={i,j}
M=np.array([[int(set(face)<=set(pair[(s>>i)&1] for i,pair in enumerate(pairs))) for face in faces] for s in range(64)],float)
y3=M@h3/sqrt(2);y5=M@h5/sqrt(2);y=y3+y5
assert abs(y3@y5)<1e-13
Q=np.zeros((64,64));P=np.ones((64,64))/64
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=.5
R=[np.linalg.matrix_power(Q,j)-P for j in range(6)]
def cvec(yy):
    Z=np.stack([r.T@yy for r in R])
    G=Z@Z.T
    return np.array([np.diag(G,d).sum() for d in range(6)])
c3=cvec(y3);c5=cvec(y5);call=cvec(y)
assert np.allclose(c3/n3,[3/2,0,0,0,0,0],atol=1e-12)
assert np.allclose(c5/n5,[17/6,1/2,17/30,1/12,-4/15,0],atol=1e-12)
assert np.allclose(call,c3+c5,atol=1e-12)
for w in (0.1,1.2,2.5):
    A=np.exp(1j*w)*np.eye(64)-Q;Ai=np.linalg.inv(A)
    direct=(y@Ai@Ai.conj().T@y).real
    pred=call[0]+2*sum(call[d]*cos(d*w) for d in range(1,6))
    assert isclose(direct,pred,abs_tol=1e-12,rel_tol=1e-12)
full=24*(3*n3/2+17*n5/6)
assert isclose(full,24*call[0],abs_tol=1e-12)
print('ORIGINAL FIVE-SOLID 50-VERTEX SOURCE: PASS')
print('n3',format(n3,'.17f'),'n5',format(n5,'.17f'),'Q89 span residual',np.linalg.norm(x-B@ab))
print('24-mode trace unscaled',format(full,'.15f'))
print('24-mode conditional r-scaled',format(full*(e/pi)**2,'.15f'))
print('Q95 FIVE-SOLID NUMERIC REGRESSION + THREE DENSE INVERSES: PASS')
