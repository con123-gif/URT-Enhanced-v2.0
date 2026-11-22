#!/usr/bin/env python3
"""Native URT–ZPE local seam-force two-phonon spectral leakage, 22 Nov 2026.
STATUS: new exact Gaussian-sector spectral diagnostic; NOT autonomous joining.
All 24 seam orders and both golden-flux sectors, two real field polarizations.
Run: OPENBLAS_NUM_THREADS=1 python cert.py (requires numpy).
No fitted parameters, no source coupling or cosmological assumptions.
"""
from math import pi,sqrt
from itertools import product,permutations
import numpy as np
phi=(1+sqrt(5))/2
theta=2*pi/phi**2

def native(f):
    xyz=list(product(range(2),range(2),range(3)))
    im={x:i for i,x in enumerate(xyz)}
    L=np.zeros((12,12),complex); seam=[]
    for i,r in enumerate(xyz):
        for d in range(3):
            t=list(r);t[d]+=1;t=tuple(t)
            if t not in im:continue
            j=im[t];u=np.exp(1j*f*r[(d-1)%3])
            v=np.zeros(12,complex);v[i]=1;v[j]=-np.conj(u)
            B=np.outer(v,v.conj())
            if d==2 and r[2]==1:seam.append((r,B))
            else:L+=B
    assert len(seam)==4 and np.linalg.eigvalsh(L)[0]>0
    return L,seam

def real(H):
    return np.block([[H.real,-H.imag],[H.imag,H.real]])

def spectral(L,B):
    # Original charged oscillator has TWO real canonical coordinates per site.
    lam,U=np.linalg.eigh(real(L));w=np.sqrt(lam)
    assert min(w)>0
    C=U.T@real(B)@U
    # Excited component of V|0> consists of two phonons, at w_i+w_j.
    # Ordered-pair weights include identical-boson normalization.
    weights=(C*C)/(w[:,None]*w[None,:])
    freq=w[:,None]+w[None,:]
    norm=weights.sum()
    mu=(weights*freq).sum()/norm
    sd=np.sqrt((weights*(freq-mu)**2).sum()/norm)
    # Independent Wick/trace check on squared excited-state amplitude.
    Wm=(U*(1/w))@U.T
    expected=np.trace((real(B)@Wm)@(real(B)@Wm))/8
    assert np.isclose(norm/8,expected,rtol=1e-11,atol=1e-11)
    assert norm>0 and sd>0
    return mu,sd,float(freq[weights>1e-11].min()),float(freq[weights>1e-11].max())

for label,f in [('minus',-theta),('plus',pi-theta)]:
    L0,seams=native(f);rows=[]
    for order in permutations(range(4)):
        L=L0.copy()
        for k in order:
            rows.append(spectral(L,seams[k][1]))
            L+=seams[k][1]
    a=np.array(rows)
    assert len(rows)==96
    print(label,'channels',len(rows),
          'two_phonon_mean_range',a[:,0].min(),a[:,0].max(),
          'std_range',a[:,1].min(),a[:,1].max(),
          'min_freq',a[:,2].min(),'max_freq',a[:,3].max())
print('PASS: native local force has nonzero two-phonon excited-channel bandwidth.')
print('LIMIT: not a powered joining, source/idler Hamiltonian, or physical gravity test.')
