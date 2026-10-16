#!/usr/bin/env python3
"""Newton's Cathedral/URT: hidden-to-flavour bridge regression audit.

Run:
  python research_archive/2026-10-16_hidden_flavour_bridge/koide_hidden_flavour_corrected_audit.py

Exact finite-matrix tests only. No charged-lepton mass identification assumed.
"""
from __future__ import annotations
import sys
from pathlib import Path
from itertools import combinations
import numpy as np
from numpy.linalg import eigh, norm

archive = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(archive / '2026-10-15_icosahedral_125_DEC_H64'))
import cathedral_strict_64_closure as c64

TOL = 1e-10
v, vc, edges, faces, ds, incid = c64.icosahedron()
_, _, d2, _ = ds
U0, _, _, U3 = c64.bases(v, vc, faces, ds[1], d2)
L = d2.T @ d2
spec, Q = eigh(L)
H = np.column_stack((Q[:, abs(spec-3)<TOL], Q[:,abs(spec-5)<TOL]))
assert H.shape == (20,8) and norm(incid.T@H)<TOL

# The union of lambda=3,5 spectral projectors is a rational polynomial in L.
I = np.eye(20)
Ph = -L@(L-2*I)@((L-3*I)@(L-3*I)-5*I)/15
assert norm(Ph@Ph-Ph)<TOL and norm(Ph-H@H.T)<TOL
E = [H.T@np.diag(incid[:,i])@H/3 for i in range(12)]
assert norm(sum(E)-np.eye(8))<TOL
ant = {i:next(j for j in range(12) if norm(v[i]+v[j])<TOL)
       for i in range(12)}
assert all(ant[ant[i]]==i and ant[i]!=i for i in range(12))
R = np.diag([-1.]*4+[1.]*4)
inversion_err=max(norm(E[ant[i]]-R@E[i]@R) for i in range(12))
assert inversion_err<TOL
ant_difference=[norm(E[i]-E[ant[i]]) for i in range(12)]
assert max(abs(x-2/(3*np.sqrt(3))) for x in ant_difference)<TOL
ant_curvature=[]
for i in range(12):
    F=-9*(E[i]@E[ant[i]]-E[ant[i]]@E[i])
    ant_curvature.append(-np.trace(F@F))
assert max(abs(x-16/135) for x in ant_curvature)<TOL

K = [sum(U0[i,a]*E[i] for i in range(12)) for a in range(6)]
assert max(norm(R@x@R+x) for x in K)<TOL
assert max(norm(x[:4,:4])+norm(x[4:,4:]) for x in K)<TOL
gram=np.array([[np.trace(A@B) for B in K] for A in K])
gp=(10+4*np.sqrt(5))/135
gm=(10-4*np.sqrt(5))/135
assert norm(gram-np.diag([gp]*3+[gm]*3))<TOL
cross_strength=sum(norm(x[:4,4:])**2 for x in K)
assert abs(cross_strength-2/9)<TOL
assert abs(sum(np.trace(x@x) for x in K)-4/9)<TOL
assert norm(K[0]@K[1]-K[1]@K[0])>0.09

# The real symmetric rho makes traces of single real commutators zero.
d,eta=c64.DELTA,c64.ETA
a=1/(4*(1+d*d));b=d*d*a
rho=np.diag([a]*4+[b]*4)
wedge=np.zeros((3,3),dtype=complex)
for i,j in combinations(range(12),2):
    F=-9*(E[i]@E[j]-E[j]@E[i])
    wij=np.outer(U0[i,:3],U0[j,:3])-np.outer(U0[j,:3],U0[i,:3])
    wedge+=1j*np.trace(rho@F)*wij
assert norm(wedge)<TOL

# The canonical BKM metric is strictly positive on these density-orbit vectors.
chi=(np.log(a)-np.log(b))/(a-b)
bkm=chi*(a-b)**2*sum(np.trace(x@x) for x in K)
assert abs(bkm-(2/9)*eta*np.tanh(eta))<TOL

# Correct the shell oriented-face basis before comparing with sorted cone faces.
_,_,_,outer,_=c64.real_tetrahedral_complex(faces)
_,res,lam,_,L2,lift=c64.full_hidden_lift(faces,ds,incid)
assert res<TOL and tuple(sorted(set(lam)))==(4.,6.)
naive=np.zeros((50,6));naive[outer,:]=U3
bad_cross=norm(lift.T@L2@naive)
signs=np.array([(-1)**sum(f[i]>f[j] for i in range(3)
                 for j in range(i+1,3)) for f in faces])
fixed=np.zeros((50,6));fixed[outer,:]=signs[:,None]*U3
good_cross=norm(lift.T@L2@fixed)
assert bad_cross>1 and good_cross<TOL

empirical_delta=.2222220470731
print('PASS: NONZERO parameter-free 4_3 <-> 4_5 triplet bridge')
print(f'Antipodal E difference: {ant_difference[0]:.12f} = 2/(3 sqrt(3))')
print(f'Antipodal Berry strength: {ant_curvature[0]:.12f} = 16/135')
print(f'Gram g+: {gp:.12f} = (10+4sqrt(5))/135')
print(f'Gram g-: {gm:.12f} = (10-4sqrt(5))/135')
print(f'Sum ||K_35||_F^2: {cross_strength:.12f} = 2/9')
print(f'Gibbs Berry wedge: {norm(wedge):.3e} = 0')
print(f'BKM orbit sum: {bkm:.12f} = (2/9) eta tanh(eta)')
print(f'Cone cross naive/signed: {bad_cross:.9f} / {good_cross:.3e}')
print(f'2/9 minus empirical phase: {2/9-empirical_delta:.12e}')
print('PHYSICAL STATUS: exact bridge; Koide phase identification remains open')
