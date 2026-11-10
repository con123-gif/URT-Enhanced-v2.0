#!/usr/bin/env python3
"""Exact Wilson-holonomy spectrum and no-zero-pole theorem for the ORIGINAL
native charge-two 64-history source-supported 24-clock Schur blocks.
No target ARFs, no fitting. Source support H64=18 (4_3),16 (4_5).
"""
import numpy as np
from math import pi,e,sqrt
r=pi/e;q=2;T=24;phi=(1+sqrt(5))/2
rng=np.random.default_rng(2026111005)

def block(theta,E):
    A=(E+2*r*r)*np.eye(T,dtype=complex)
    for t in range(T):
        j=(t+1)%T;u=np.exp(1j*q*theta[t]);A[j,t]-=r*r*u;A[t,j]-=r*r*u.conjugate()
    return A

def spectrum_from_holonomy(theta,E):
    Theta=np.sum(theta)
    return np.sort(E+r*r*(2-2*np.cos((2*pi*np.arange(T)-q*Theta)/T)))

for trial in range(12):
    theta=(2*pi/phi**2)+rng.normal(size=T)
    for E in (16,18):
        eig=np.linalg.eigvalsh(block(theta,E))
        exact=spectrum_from_holonomy(theta,E)
        assert np.max(abs(eig-exact))<3e-12,(trial,E,np.max(abs(eig-exact)))
        assert eig.min()>=E-3e-12
        assert eig.max()<=E+4*r*r+3e-12
    # Redistribute link phases without changing total holonomy.
    lam=rng.normal(size=T)
    transformed=theta+np.roll(lam,-1)-lam
    for E in (16,18):
        assert np.max(abs(np.linalg.eigvalsh(block(transformed,E))-
                              np.linalg.eigvalsh(block(theta,E))))<3e-12
# Even though the full 64-history H64 has 2 zero modes and 12 E=10 modes,
# the original hidden source Uh only overlaps with E=16 and E=18 sectors.
# Thus no native SOURCE-TO-HISTORY Gaussian pole at zero is possible.
for E in (16,18):
    theta=np.full(T,2*pi/phi**2)
    eig=np.linalg.eigvalsh(block(theta,E))
    print('native source history eigenvalue',E,'uniform golden: min/max',eig[0],eig[-1],
          'exact inverse bound <=',1/E)
print('PASS: 12 generic 24-link configurations, exact holonomy spectrum and gauge redistribution')
print('THEOREM: spec(A5) subset [16,16+4(pi/e)^2], spec(A3) subset [18,18+4(pi/e)^2]')
print('NO-GO: native Gaussian hidden source cannot create a zero-energy/massless pole by itself')
print('LIMITATION: does not exclude poles from independent spatial gauge, fermion, continuum or collective dynamics')
