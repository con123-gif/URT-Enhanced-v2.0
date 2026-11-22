#!/usr/bin/env python3
"""Native URT-ZPE local seam / normal-mode commutator certificate.
Run: OPENBLAS_NUM_THREADS=1 python cert.py
No source Hamiltonian or physical joining is claimed.
"""
from math import pi,sqrt
from itertools import product,permutations
import numpy as np
phi=(1+sqrt(5))/2
theta=2*pi/phi**2
for eps in (1,-1):
    f=float(np.angle(eps*np.exp(-1j*theta)))
    xyz=list(product(range(2),range(2),range(3)))
    ix={x:i for i,x in enumerate(xyz)}
    L=np.zeros((12,12),complex)
    seam=[]
    for i,r in enumerate(xyz):
        for d in range(3):
            t=list(r);t[d]+=1;t=tuple(t)
            if t not in ix:continue
            v=np.zeros(12,complex)
            v[i]=1
            v[ix[t]]=-np.exp(-1j*f*r[(d-1)%3])
            B=np.outer(v,v.conj())
            if d==2 and r[2]==1:seam.append(B)
            else:L+=B
    assert len(seam)==4 and np.linalg.eigvalsh(L)[0]>0
    results=[]
    for order in permutations(range(4)):
        A=L.copy()
        for j in order:
            B=seam[j]
            C=A@B-B@A
            norm2=float(np.linalg.norm(C,'fro')**2)
            assert np.linalg.norm(C+C.conj().T)<1e-12
            assert abs(norm2-22)<1e-10,(eps,order,j,norm2)
            # For a complex field, realification duplicates the two real
            # polarizations: ||[R(A),R(B)]||_F^2 = 2 ||[A,B]||_F^2.
            def real(H):return np.block([[H.real,-H.imag],[H.imag,H.real]])
            RC=real(A)@real(B)-real(B)@real(A)
            assert abs(np.linalg.norm(RC,'fro')**2-44)<1e-10
            results.append(norm2)
            A+=B
    print(f'eps={eps:+d} paths=24 transitions={len(results)} complex_norm_squared={min(results):.12f} real_two_polarization_norm_squared=44.000000000000')
print('CERTIFICATE PASS: 192 original local transitions; exact numerical sqrt(22) commutator norm in each complex sector.')
