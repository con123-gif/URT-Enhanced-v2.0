#!/usr/bin/env python3
"""Synchronized 64-history/24-clock mode selection; no fitted constants."""
import numpy as np
from math import sqrt,pi
Q=np.zeros((64,64))
for h in range(64):Q[h,2*h%64]=.5;Q[h,(2*h+1)%64]=.5
S=np.roll(np.eye(24),1,axis=1)
U=np.kron(Q,S)
P=np.ones((64,64))/64
assert np.array_equal(np.linalg.matrix_power(Q,6),P)
assert np.array_equal(np.linalg.matrix_power(U,6),np.kron(P,np.linalg.matrix_power(S,6)))
assert np.array_equal(np.linalg.matrix_power(U,24),np.kron(P,np.eye(24)))
assert np.linalg.matrix_rank(U)==768
assert np.linalg.matrix_rank(np.eye(1536)-U)==1535
labels='2002122002210110120100122010120110210102210010210110122002212002'
levels=[0,(56-24*sqrt(5))/5,(56+24*sqrt(5))/5]
n5=np.array([levels[int(c)] for c in labels])
d=np.array([-(-1)**h.bit_count() if n5[h]==0 else 0 for h in range(64)])
coeff=[];v=n5-7
for k in range(6):
    coeff.append(d@v/64)
    v=Q@v
assert np.max(abs(v))<1e-12
for m in range(24):
    z=np.exp(2j*pi*m/24)
    clock=np.exp(2j*pi*m*np.arange(24)/24)
    assert np.max(abs(U@np.kron(n5-7,clock)-np.kron(Q@(n5-7),np.roll(clock,-1))))<1e-12
    direct=sum(c*z**k for k,c in enumerate(coeff))
    formula=-3*sqrt(5)/40*z*(z+1)*(z*z-2*z+2)
    assert abs(direct-formula)<1e-11
    assert (abs(direct)<1e-11)==(m==12)
print('PASS synchronized U^24, rank, 24 Fourier responses; only clock mode 12 vanishes')
