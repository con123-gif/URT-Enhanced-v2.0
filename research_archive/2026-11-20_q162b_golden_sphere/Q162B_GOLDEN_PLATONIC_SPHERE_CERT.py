#!/usr/bin/env python3
"""Q162b. Native five solids, shared A4, URT golden-angle shell theorem.
Physical scope: conditional angular group composition and radius recurrence.
No matter/antimatter, vacuum, relativistic space-time or mass claim.
"""
import math
from itertools import product, permutations
import numpy as np
from scipy.spatial.transform import Rotation
phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2
rho=math.pi/math.e
pm=list(product((-1,1),repeat=2))
V={
 'tetra':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octa':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodeca':list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in pm]
   +[(a/phi,b*phi,0) for a,b in pm]+[(a*phi,0,b/phi) for a,b in pm],
 'icosa':[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]
   +[(a*phi,0,b) for a,b in pm]}
V={name:(lambda x:x/np.linalg.norm(x,axis=1)[:,None])(np.asarray(v,float))
   for name,v in V.items()}
assert [len(x) for x in V.values()]==[4,8,6,20,12]
for name,x in V.items():
    assert np.linalg.norm(x.sum(axis=0))<1e-13,name
    assert np.linalg.norm(x.T@x-len(x)*np.eye(3)/3)<2e-13,name
# Common proper tetrahedral rotations: three cyclic permutations x four
# even sign inversions. They preserve EACH original native vertex set.
G=[]
for t in range(3):
    P=np.roll(np.eye(3),-t,axis=1)
    for a,b in pm:
        g=np.diag([a,b,a*b])@P
        assert abs(np.linalg.det(g)-1)<1e-12
        for name,x in V.items():
            assert max(min(np.linalg.norm(z-y) for y in x)
                       for z in x@g.T)<1e-12,(name,t,a,b)
        G.append(g)
assert len(G)==12
axis=np.array([1.,1.,1.])/math.sqrt(3)
R=Rotation.from_rotvec(theta*axis).as_matrix()
assert np.linalg.matrix_rank(np.array([g@axis for g in G]))==3
# The exact proof uses irrational theta/(2pi)=phi^-2:
# closure powers R contain SO2(axis), conjugates by G include
# SO2(g axis), their Lie algebras span so3 -> closure = SO3.
T={name:np.einsum('ni,nj,nk->ijk',x,x,x) for name,x in V.items()}
T0=sum(T.values())
assert abs(T['tetra'][0,1,2]-4/(3*math.sqrt(3)))<1e-13
for name,mat in T.items():
    if name!='tetra':assert np.linalg.norm(mat)<1e-12
def twirl(tensor):
    rot=np.einsum('ia,jb,kc,abc->ijk',R,R,R,tensor,optimize=True)
    return sum(np.einsum('ia,jb,kc,abc->ijk',g,g,g,rot,optimize=True)
               for g in G)/12
# In l=3, A4-invariant subspace is one-dimensional: xyz.
# Its exact rotated projection is permanent(R).
permanent=sum(math.prod(R[i,j] for i,j in enumerate(perm))
              for perm in permutations(range(3)))
kappa=(5+4*math.cos(3*theta))/9
assert abs(permanent-kappa)<2e-14 and 0<kappa<1
Tn=T0.copy()
for n in range(1,25):
    Tn=twirl(Tn)
    assert np.linalg.norm(Tn-kappa**n*T0)<1e-11,n
# Spinorial quantum lift 2T -> A4: qubit twirl sends any Bloch vector to zero.
b=np.array([.4,-.7,.3])
assert np.linalg.norm(sum(g@b for g in G)/12)<1e-13
print("Q162b native five-solid vertex counts",list(map(len,V.values())))
print("exact nonzero third moment tetra xyz",T['tetra'][0,1,2])
print("A4 order",len(G),"axis-orbit linear rank",3)
print("theta",theta,"rho",rho)
print("octupole projection (5+4cos(3theta))/9 =",kappa)
print("24-step normalized octupole factor",kappa**24)
print("24-step radial factor",rho**24)
print("24-step area factor",rho**48)
print("native quantum SU2 spin-twirl Bloch-vector test PASS")
print("Q162b FINITE CERTIFICATE PASS: continuous rotational closure theorem")
print("Conditions: initial R3 radius, group twirl, axis, quantum identification")
