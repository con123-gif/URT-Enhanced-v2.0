#!/usr/bin/env python3
"""Q96: independently compare the actual Hbits quadratic operator with Q93's Markov residual.
Original native definitions reconstructed exactly; not a physical ARF.
"""
from itertools import combinations
from math import pi, e, cos, sqrt
import numpy as np
N=64
Q2=np.zeros((N,N),dtype=np.int64)
for h in range(N):
    Q2[h,2*h%N]=Q2[h,(2*h+1)%N]=1
H=15*np.eye(N,dtype=np.int64)
for h in range(N):
    for i,j in combinations(range(6),2):
        H[h,h^(1<<i)^(1<<j)]-=1
u=np.ones(N,dtype=np.int64)
p=np.array([(-1)**h.bit_count() for h in range(N)],dtype=np.int64)
assert np.array_equal(H@u,np.zeros(N,dtype=np.int64))
assert np.array_equal(H@p,np.zeros(N,dtype=np.int64))
assert np.array_equal(Q2@u,2*u)
assert np.array_equal(Q2@p,np.zeros(N,dtype=np.int64))
assert np.array_equal(Q2.T@p,np.zeros(N,dtype=np.int64))
Q=Q2/2
K0=(np.eye(N)-Q).T@(np.eye(N)-Q)
assert np.array_equal(K0@p,p)
assert np.linalg.matrix_rank(H)==62
assert np.linalg.matrix_rank(K0)==63
multiplicities={0:0,10:0,16:0,18:0}
for mask in range(N):
    v=np.array([(-1)**(mask&h).bit_count() for h in range(N)],dtype=np.int64)
    w=mask.bit_count()
    lam=15-(((6-2*w)**2-6)//2)
    assert np.array_equal(H@v,lam*v)
    multiplicities[lam]+=1
assert multiplicities=={0:2,10:12,16:30,18:20}
phi=(1+sqrt(5))/2
r=pi/e
theta=2*pi/phi**2
clock=[r*r*(2-2*cos(2*theta-2*pi*m/24)) for m in range(24)]
assert max(clock)-min(clock)>.01 and min(clock)<.02
print('Native Hbits spectrum:',multiplicities)
print('Native parity minimum/maximum 24-clock energies:',min(clock),max(clock))
print('Markov residual parity energy: exactly 1 for every phase')
print('Untwisted kernel dimensions: original 2, Markov residual 1')
print('Q96 ORIGINAL-ACTION INEQUIVALENCE: PASS')
