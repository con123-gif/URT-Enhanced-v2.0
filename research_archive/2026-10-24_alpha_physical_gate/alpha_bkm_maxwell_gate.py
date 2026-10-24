#!/usr/bin/env python3
"""Unfitted 24-Oct-2026 Cathedral BKM/icosahedral Maxwell alpha gate."""
from math import pi,sqrt,log
import numpy as np
from scipy.spatial import ConvexHull
phi=(1+sqrt(5))/2
d=3/20-80*pi/(1053*phi)
eta=-log(d)
p=d*d/(1+d*d)
a=1/(4*(1+d*d)); b=d*d*a
chi=8*eta*(1+d*d)/(1-d*d)
Y=np.block([[np.zeros((4,4)),np.eye(4)],[np.eye(4),np.zeros((4,4))]])/sqrt(8)
V=np.diag([-1/4]*4+[1/4]*4)
r=np.array([a]*4+[b]*4)
L=np.array([[(log(x)-log(y))/(x-y) if x!=y else 1/x for y in r] for x in r])
def BKM(X,Z): return float(np.real(np.sum(X.conj()*L*Z)))
assert abs(BKM(Y,Y)-chi)<1e-11
assert BKM(Y,V)==0.0
assert abs(BKM(V,V)-1/(p*(1-p)))<1e-7
verts=[]
for s in (-1,1):
 for t in (-1,1):
  verts += [(0,s,t*phi),(s,t*phi,0),(s*phi,0,t)]
verts=np.array(verts,float)
faces=[]
for tri in ConvexHull(verts).simplices:
 v0,v1,v2=verts[tri]
 if np.dot(np.cross(v1-v0,v2-v0),(v0+v1+v2)/3)<0: tri=[tri[0],tri[2],tri[1]]
 faces.append(tuple(tri))
edges=sorted(set(tuple(sorted((u,v))) for f in faces for u,v in ((f[0],f[1]),(f[1],f[2]),(f[2],f[0]))))
assert (len(verts),len(edges),len(faces))==(12,30,20)
ed={e:i for i,e in enumerate(edges)}
D=np.zeros((30,20))
for col,f in enumerate(faces):
 for u,v in ((f[0],f[1]),(f[1],f[2]),(f[2],f[0])):
  e=tuple(sorted((u,v))); D[ed[e],col]=1 if (u,v)==e else -1
assert np.linalg.matrix_rank(D)==19
P=D.T@np.linalg.pinv(D@D.T,hermitian=True)@D
err=np.max(np.abs(P-(np.eye(20)-np.ones((20,20))/20)))
assert err<1e-12
# Historical alpha polynomial is used here ONLY in a POSTHOC diagnostic;
# it was not used to choose Y, V, D, K or chi.
alpha_inv=137+(17572/1215)*d-(9/65)*d*d
needed=alpha_inv/(4*pi*chi)
print(f'Delta={d:.17g}; chi35={chi:.14g}')
print(f'BKM(Y,Y)={BKM(Y,Y):.14g}; BKM(Y,V)={BKM(Y,V):.1g}')
print(f'BKM(V,V)={BKM(V,V):.14g}')
print(f'20-face projector residual={err:.3g}; diagonal={P[0,0]:.14g}')
print(f'Historical target required current norm squared={needed:.14g}; native Y norm squared={np.trace(Y@Y):.1f}')
print('RESULT: finite identities PASS; physical photon coupling remains OPEN')
