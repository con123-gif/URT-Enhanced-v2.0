#!/usr/bin/env python3
"""Q162c finite-native harmonic Gram mismatch and candidate positive transfer.
Eight columns: ORIGINAL Q101 l=1 plus traceless l=2 harmonics on all 50
five-solid vertices. D(R) is the true SO3 action on these polynomials.
A=G^(1/2)D(R)G^(-1/2), T=A.T A. No fitted numbers.

Physical caveat: T describes harmonics moving RELATIVE TO fixed finite
sampling vertices. Co-rotating the whole source leaves its norm unchanged.
T is a canonical positive mismatch candidate, not a selected Hamiltonian.
"""
import math
from itertools import product
import numpy as np
from scipy.linalg import eigh, svdvals
from scipy.spatial.transform import Rotation
phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2
axis=np.array((1.,1.,1.))/math.sqrt(3)
R=Rotation.from_rotvec(theta*axis).as_matrix()
pairs=list(product((-1,1),repeat=2))
solids={
 'tetrahedron':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octahedron':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodecahedron':list(product((-1,1),repeat=3))
    +[(0,a/phi,b*phi) for a,b in pairs]
    +[(a/phi,b*phi,0) for a,b in pairs]
    +[(a*phi,0,b/phi) for a,b in pairs],
 'icosahedron':[(0,a,b*phi) for a,b in pairs]
    +[(a,b*phi,0) for a,b in pairs]
    +[(a*phi,0,b) for a,b in pairs]}
def unit(pts):
    x=np.asarray(pts,float)
    return x/np.linalg.norm(x,axis=1)[:,None]
def h(x):
    x,y,z=np.asarray(x).T
    return np.stack([x,y,z,(x*x-y*y)/math.sqrt(2),
        (x*x+y*y-2*z*z)/math.sqrt(6),math.sqrt(2)*x*y,
        math.sqrt(2)*x*z,math.sqrt(2)*y*z],axis=1)
# SO3 rotates l1 and l2 separately and orthogonally in the continuum.
sample=unit(np.random.default_rng(123).normal(size=(100,3)))
D=np.linalg.lstsq(h(sample),h(sample@R),rcond=None)[0]
assert np.linalg.norm(D.T@D-np.eye(8))<3e-13
assert np.linalg.norm(D[:3,3:])+np.linalg.norm(D[3:,:3])<1e-12
def native_transfer(pts):
    X=h(unit(pts));G=X.T@X
    ew,V=eigh(G)
    if min(ew)<1e-10: return None
    root=(V*np.sqrt(ew))@V.T
    inv=(V/np.sqrt(ew))@V.T
    A=root@D@inv
    T=A.T@A
    return np.linalg.eigvalsh(T),svdvals(A),np.linalg.norm(T-np.eye(8)),G
all50=sum((list(x) for x in solids.values()),[])
res=native_transfer(all50)
assert res is not None
ev,sv,rel,G=res
expected=np.array([.91966799,.91966799,1,1,1,1,1.08734893,1.08734893])
assert np.max(abs(ev-expected))<1e-7,ev
assert abs(np.linalg.det(np.linalg.inv(G)@D.T@G@D)-1)<1e-10
assert np.max(abs(sv*sv[::-1]-1))<1e-11
assert min(ev)>0 and np.linalg.norm(ev-1)>0.05
# Native dodecahedron and icosahedron alone have an SO3-invariant
# finite Gram on degree <=2 (spherical 5-design property).
for nm in ('dodecahedron','icosahedron'):
    x=native_transfer(solids[nm])
    assert x is not None and x[2]<1e-12,(nm,x[2])
# Removing tetra does NOT eliminate all strain: cube/octahedral
# quadrupole mismatch remains. Tetra uniquely supplies odd-even mixing.
without_tetra=native_transfer(sum((list(solids[k]) for k in solids if k!='tetrahedron'),[]))
assert without_tetra is not None and without_tetra[2]>0.02
print('Q162c native whole-five positive T spectrum:',ev)
print('Q162c singulars:',sv)
print('Q162c Gram/rotation mismatch Frobenius:',rel)
print('Q162c dodeca+icosa individually rotation-isometric to l<=2')
print('Q162c PASS: geometry-fixed relative-rotation transfer, physical model OPEN')
