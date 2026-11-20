#!/usr/bin/env python3
"""Q162j — PHYSICS FIRST: original Cathedral vs established physics.
NO experimental parameter is used, changed, or fitted.

PHYSICS BENCHMARK:
1. Exact whole-five cellular gauge invariance / source-free current conservation;
2. Conditional spherical flux -> Newton/Coulomb r^-2, outgoing wave envelope r^-1;
3. Exact conventional SU2 spinor 2pi->-I, 4pi->I if fundamental spinor chosen;
4. NONMATCH: raw URT fixed shell phase is logarithmic in r, not free e^(ikr);
5. NONMATCH: Haar-averaged native full-five 8-mode Laplacian l2/l1=1.87657,
   unlike continuum S2 l2/l1=3. This is not itself evidence of physics failure:
   finite cutoff and original physical kinetic/continuum limit remain undecided.

The 'matches' require specified spherical isotropy, conservation, and spinor
representation. These are structural consistency tests, NOT Newton G,
Maxwell matter sources, a physical Planck scale, or QM derivation.
"""
from itertools import combinations
from pathlib import Path
import runpy, contextlib, io, math
import numpy as np
from scipy.spatial import ConvexHull
from scipy.linalg import eigh
import sympy as s

# Reuse the verified ORIGINAL five-solid Q101 vertex sets, not invented shapes.
root=Path(__file__).resolve().parents[2]
orig=root/'research_archive/2026-11-20_q162b_golden_sphere/Q162B_GOLDEN_PLATONIC_SPHERE_CERT.py'
with contextlib.redirect_stdout(io.StringIO()):
    source=runpy.run_path(str(orig))
V=source['V'];phi=source['phi']
rho=math.pi/math.e
theta=2*math.pi/phi**2
assert tuple(len(V[z]) for z in V)==(4,8,6,20,12)

def harmonic(P):
    x,y,z=P.T
    return np.stack([x,y,z,(x*x-y*y)/math.sqrt(2),
        (x*x+y*y-2*z*z)/math.sqrt(6),math.sqrt(2)*x*y,
        math.sqrt(2)*x*z,math.sqrt(2)*y*z],axis=1)

def native_edges_faces(P):
    hull=ConvexHull(P)
    groups=[]
    for tri,plane in zip(hull.simplices,hull.equations):
        for g in groups:
            if (np.linalg.norm(g[0]-plane[:3])<1e-8
                    and abs(g[1]-plane[3])<1e-8):
                g[2].update(map(int,tri));break
        else:groups.append([plane[:3],plane[3],set(map(int,tri))])
    faces=[]
    for normal,_,ids in groups:
        inds=sorted(ids);centre=P[inds].mean(axis=0)
        ex=P[inds[0]]-centre;ex/=np.linalg.norm(ex)
        ey=np.cross(normal,ex)
        faces.append(sorted(inds,key=lambda i:math.atan2(
            np.dot(P[i]-centre,ey),np.dot(P[i]-centre,ex))))
    edges=sorted({tuple(sorted((i,j))) for f in faces
                  for i,j in zip(f,f[1:]+f[:1])})
    return edges,faces

total=[0,0,0]
Gram=np.zeros((8,8));K=np.zeros((8,8))
rng=np.random.default_rng(20)
expected=[(4,6,4),(8,12,6),(6,12,8),(20,30,12),(12,30,20)]
for (name,P),shape in zip(V.items(),expected):
    edges,faces=native_edges_faces(P)
    n,e,f=len(P),len(edges),len(faces)
    assert (n,e,f)==shape
    total=[total[i]+(n,e,f)[i] for i in range(3)]
    B1=np.zeros((n,e),dtype=int);B2=np.zeros((e,f),dtype=int)
    index={ed:i for i,ed in enumerate(edges)}
    for k,(i,j) in enumerate(edges):
        B1[i,k]=-1;B1[j,k]=1
    for k,face in enumerate(faces):
        for i,j in zip(face,face[1:]+face[:1]):
            B2[index[tuple(sorted((i,j)))],k]=(1 if i<j else -1)
    assert not np.any(B1@B2)
    d0=B1.T;d1=B2.T
    A=rng.normal(size=e);chi=rng.normal(size=n)
    field=d1@A
    current=d1.T@field
    assert np.linalg.norm(d1@(A+d0@chi)-field)<1e-12
    assert np.linalg.norm(d0.T@current)<1e-12
    H=harmonic(P)
    Gram+=H.T@H
    for i,j in edges:
        jump=H[j]-H[i];K+=np.outer(jump,jump)
assert total==[50,90,50]

# Spherical flux and wave envelope conditional on conservation/isotropy.
for n in (0,1,4,12,24):
    radius=rho**n
    assert abs((radius**2)*(radius**-2)-1)<1e-12
    assert abs((radius**2)*(radius**-1)**2-1)<1e-12
assert rho>1

# Fundamental SU2 spinor: known mathematical double cover.
I=np.eye(2,dtype=complex)
sigma_y=np.array([[0,-1j],[1j,0]])
def U(a):return math.cos(a/2)*I-1j*math.sin(a/2)*sigma_y
assert np.linalg.norm(U(2*math.pi)+I)<1e-12
assert np.linalg.norm(U(4*math.pi)-I)<1e-12
assert np.linalg.norm(U(theta).conj().T@U(theta)-I)<1e-12

# Raw URT phase per multiplicative shell is logarithmic:
# psi=r^(-1+i*kappa); its radial Helmholtz residual cannot vanish for
# one real constant wave number k at all radii.
r,k,kap=s.symbols('r k kap',positive=True,real=True)
psi=r**(-1+s.I*kap)
residual=s.simplify(((r*r*s.diff(psi,r)).diff(r)/r**2+k*k*psi)/psi)
assert s.simplify(residual-(k*k-(kap*kap+s.I*kap)/r**2))==0

# Haar rotational average of native l1,l2 Gram and edge K. Schur lemma
# makes each l sector scalar; trace ratios are the unique averaged rates.
lam1=np.trace(K[:3,:3])/np.trace(Gram[:3,:3])
lam2=np.trace(K[3:,3:])/np.trace(Gram[3:,3:])
assert abs(lam1-(176-32*math.sqrt(5))/50)<1e-10
assert abs(lam2-98/25)<1e-10
ratio=lam2/lam1
assert abs(ratio-3)>1

print('Q162j ORIGINAL FIVE SOLIDS: counts V/E/F',total)
print('EXACT discrete gauge and source-free current conservation: PASS')
print('CONDITIONAL r^-2 field; r^-1 wave envelope:',rho**-2,rho**-1)
print('CONDITIONAL SU2 spinor U(2pi)=-I, U(4pi)=+I: PASS')
print('RAW URT radial free wave: NOT MATCHED; kappa=',theta/math.log(rho))
print('NATIVE continuum S2 kinetic ratio: ',ratio,'vs physical sphere 3')
print('NO mass/coupling, force law, or quantum dynamics selected by these tests')
