#!/usr/bin/env python3
"""Q97 independent all-five 50-vertex degree-1/2 portal hidden-source rank."""
import numpy as np
from scipy.linalg import eigh
from itertools import product,combinations
from math import sqrt
phi=(1+sqrt(5))/2;pm=list(product((-1,1),repeat=2))
solids={
 'tetrahedron':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octahedron':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodecahedron':list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in pm]+[(a/phi,b*phi,0) for a,b in pm]+[(a*phi,0,b/phi) for a,b in pm],
 'icosahedron':[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]+[(a*phi,0,b) for a,b in pm]}
def moments(vs):
    p=np.array(vs,float);p/=np.linalg.norm(p,axis=1)[:,None];x,y,z=p.T
    return np.stack([x,y,z,(x*x-y*y)/sqrt(2),(x*x+y*y-2*z*z)/sqrt(6),sqrt(2)*x*y,sqrt(2)*x*z,sqrt(2)*y*z],axis=1)
def whiten(M):
    vals,U=eigh(M.T@M);assert np.min(vals)>0
    return M@((U/np.sqrt(vals))@U.T)
all50=np.concatenate([moments(solids[s]) for s in solids])
I=whiten(moments(solids['icosahedron']));E=whiten(all50)
Plinear=I@E.T
assert Plinear.shape==(12,50) and np.linalg.matrix_rank(Plinear)==8
assert np.linalg.norm(Plinear@E-I)<1e-12
V=np.array(solids['icosahedron'],float)
faces=sorted(f for f in combinations(range(12),3) if all(abs(sum((V[i]-V[j])**2)-4)<1e-9 for i,j in combinations(f,2)))
assert len(faces)==20
C=np.array([[int(i in f) for i in range(12)] for f in faces],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
adj=np.array([[int(i!=j and len(set(faces[i])&set(faces[j]))==2) for j in range(20)] for i in range(20)])
L=3*np.eye(20)-adj
P3=Ph@(5*np.eye(20)-L)/2;P5=Ph@(L-3*np.eye(20))/2
S=np.stack([(C@I[:,i])*(C@I[:,j]) for i in range(8) for j in range(i,8)],axis=1)
for label,P,rank in [('hidden',Ph,8),('quartet3',P3,4),('quartet5',P5,4)]:
    val=np.linalg.svd(P@S,compute_uv=False)
    assert np.linalg.matrix_rank(P@S,tol=1e-10)==rank,(label,val)
    print(label,'rank',rank,'minimum nonzero singular value',val[rank-1])
print('Q97 ORIGINAL ALL-FIVE 50-VERTEX NONLINEAR PORTAL: PASS')
