#!/usr/bin/env python3
"""A new exact 24-fold Berry/Wilson monodromy theorem on the original
URT 64-history / 24-bin source. No historical ARF data or fitted parameters.

Theorem: for any fixed full-column-rank 64x8 source H and exact overlap
B(a)_{j,h} of circular clock arc [j/24+a,(j+1)/24+a) with history arc
[h/64,(h+1)/64), normalized by sqrt(24*64),
B(a+1/24) = R B(a), R the cyclic clock row permutation.
So U(a+1/24)=R U(a) for the unique polar isometry U(a)=polar[B(a)H],
A(a)=U(a)^T U'(a) is 1/24 periodic (away from bin-boundary kinks), and
the canonical polar-link Wilson loop over a in [0,1] is W_full=W_seg^24.
Finite meshes with N=24*m steps satisfy the identity to rounding.

This is a geometrical property of clock *readout*, not a derived physical
U(1) electromagnetic charge or the four historical ARF coefficients.
"""
from pathlib import Path
import contextlib,io,runpy,sys
import numpy as np
p=Path(__file__).resolve().parent
source=next(q for q in (p.parent/'forward',p.parent/'urt_arf_forward_2026_11_09') if (q/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(source/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
P=d['P3']+d['P5']; ew,ex=np.linalg.eigh(P); H=d['H']@ex[:,ew>.5]
assert H.shape==(64,8)

J=np.arange(24)[:,None]; K=np.arange(64)[None,:]

def B(a):
    lo=J/24+a; hi=(J+1)/24+a
    left=K/64; right=(K+1)/64
    z=np.zeros((24,64))
    for shift in (0,1,2):
        z+=np.maximum(0,np.minimum(hi,right+shift)-np.maximum(lo,left+shift))
    return np.sqrt(24*64)*z

def polar(x):
    u,s,v=np.linalg.svd(x,full_matrices=False)
    assert s.min()>1e-7
    return u@v

# Clock permutation R takes next row j+1 modulo24 to row j.
R=np.roll(np.eye(24),-1,axis=0)
for a in (0,0.00001,1/256,1/99,1/24,0.123456,1-1e-5):
    err=np.linalg.norm(B(a+1/24)-R@B(a))
    assert err<5e-12,(a,err)
    u=polar(B(a)@H);unext=polar(B(a+1/24)@H)
    errU=np.linalg.norm(unext-R@u)
    assert errU<1e-9,(a,errU)

# Compute the canonical Wilson link product only on 1 of 24 intervals.
def segment(m):
    u0=polar(B(0)@H);prev=u0;W=np.eye(8)
    for k in range(1,m+1):
        u=polar(B(k/(24*m))@H)
        W=W@polar(prev.T@u)
        prev=u
    return W

def full(m):
    prev=polar(B(0)@H);W=np.eye(8)
    for k in range(1,24*m+1):
        u=polar(B(k/(24*m))@H)
        W=W@polar(prev.T@u)
        prev=u
    return W

def angles(W):
    return np.sort(np.angle(np.linalg.eigvals(W)))[4:]
for m in (8,16,32):
    U=segment(m)
    actual=full(m)
    predicted=np.linalg.matrix_power(U,24)
    err=np.linalg.norm(actual-predicted)
    assert err<2e-9,(m,err)
    print('m=',m,'N=',24*m,'factorization error=',err,'eigphases=',angles(predicted).tolist())

# Convergence on the short fundamental segment, not full 24-fold loop.
for m in (64,128,256,512,1024):
    U=segment(m)
    W=np.linalg.matrix_power(U,24)
    eig=np.linalg.eigvals(W)
    print('fundamental steps',m,'total-equivalent steps',24*m,
          'eigenphases rad',angles(W).tolist(),
          'distance from identity',np.linalg.norm(W-np.eye(8)),
          'orthogonality residual',np.linalg.norm(W.T@W-np.eye(8)),
          'det',np.linalg.det(W))
print('PASS: exact 24-fold source-information holonomy factorization; no ARF matching')
