#!/usr/bin/env python3
"""Recovered 11-Nov icosahedral frustration and chiral hidden mismatch.

Actual original face geometry and orientation; conditional modified Hamiltonian.
NOT a proof of baryogenesis, charged matter, or physical ARFs.
"""
from itertools import combinations, product
from math import pi, log, tanh, sqrt
import numpy as np
import sympy as sp

phi=(1+sp.sqrt(5))/2
coords=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
       +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
       +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
v=[sp.Matrix(p) for p in coords]
d=lambda i,j:sp.simplify((v[i]-v[j]).dot(v[i]-v[j]))
edges=[(i,j) for i,j in combinations(range(12),2) if d(i,j)==4]
faces=sorted(f for f in combinations(range(12),3)
             if all((i,j) in edges for i,j in combinations(f,2)))
assert len(edges)==30 and len(faces)==20

# Exactly enumerate all 4096 icosahedral shell Ising configurations.
scores=[]
for state in range(1<<12):
    spin=[1-2*((state>>i)&1) for i in range(12)]
    scores.append((sum(spin[i]*spin[j] for i,j in edges),sum(spin)))
e0=min(a for a,m in scores)
assert e0==-10 and sum(a==e0 for a,m in scores)==72
central=[(float(a)-float(phi)*abs(m),m) for a,m in scores]
m0=min(t for t,m in central)
ground=[m for t,m in central if abs(t-m0)<1e-9]
assert len(ground)==60 and all(abs(m)==4 for m in ground)
print("ICOSAHEDRON: 72 frustrated minima; phi-weighted centre: 60 (not unique)")

# Rebuild native face Laplacian and parity-odd hidden W from oriented faces.
C=sp.Matrix(20,12,lambda i,j:int(j in faces[i]))
L=sp.Matrix(20,20,lambda i,j:
    3 if i==j else (-1 if len(set(faces[i])&set(faces[j]))==2 else 0))
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-L)/2
P5=Ph*(L-3*sp.eye(20))/2
assert P3.rank()==P5.rank()==4
centres=[sum((v[k] for k in f),sp.zeros(3,1)) for f in faces]
W=sp.zeros(20,20)
for i in range(20):
    for j in range(20):
        chir=sp.simplify(sum(
            (v[k].dot(centres[i].cross(centres[j]))
             for k in set(faces[i])&set(faces[j])),sp.S.Zero))
        if chir:
            W[i,j]=int(sp.sign(chir))
assert W.T==-W and W*W==-15*Ph
assert L*W+W*L==8*W
opp={i:next(j for j in range(12)
           if v[i]+v[j]==sp.zeros(3,1)) for i in range(12)}
lookup={frozenset(f):i for i,f in enumerate(faces)}
K=sp.zeros(20,20)
for i,f in enumerate(faces):
    K[lookup[frozenset(opp[j] for j in f)],i]=1
assert K*K==sp.eye(20) and K*W*K==-W
assert K*P3==-P3 and K*P5==P5

# Exact golden 24-track mismatch: this reference winding is a selected chart.
eps=sp.pi/(3*phi**12)
assert sp.simplify(48*sp.pi/phi**2
    -(18+sp.Rational(1,3))*sp.pi-eps)==0
X=P5-P3
chi=sp.I*W/sp.sqrt(15)
assert X*X==Ph and chi*chi==Ph
assert X*chi+chi*X==sp.zeros(20,20)
assert K*chi*K==-chi
assert sp.simplify((X+eps*chi)**2-(1+eps**2)*Ph)==sp.zeros(20,20)

# NEW CONDITIONAL MODEL: H_eps=4Ph+X+eps chi. Unit coefficient is
# a modelling rule, NOT a uniquely derived URT/matter coupling.
ep=float(eps)
Delta=float(sp.Rational(3,20)-80*sp.pi/(1053*phi))
eta=-log(Delta)
He=np.array(4*Ph+X+eps*chi,complex)
chi_np=np.array(chi,complex)
spec,U=np.linalg.eigh(He)
active=spec>1e-7
assert sum(active)==8
expected=sorted([4-sqrt(1+ep**2)]*4+[4+sqrt(1+ep**2)]*4)
assert np.allclose(sorted(spec[active]),expected,atol=1e-12)
Ua=U[:,active]
p=np.exp(-eta*spec[active]);p/=sum(p)
rho=Ua@np.diag(p)@Ua.conj().T
obs=np.trace(rho@chi_np).real
analytic=-ep/sqrt(1+ep**2)*tanh(eta*sqrt(1+ep**2))
assert abs(obs-analytic)<1e-12
print("golden winding residual:",format(ep,".16f"))
print("conditional orientation-odd expectation:",format(obs,".16f"))
print("exact formula checked to:",abs(obs-analytic))
print("WARNING: spectra are identical at +/- eps; no unique branch is selected")
print("WARNING: physical ARFs and baryogenesis are NOT DERIVED")
print("RECOVERY / CONDITIONAL NATIVE CHIRAL CERTIFICATE: PASS")
