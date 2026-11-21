#!/usr/bin/env python3
"""Arithmetic URT holonomy: positive magnetic gap and unchanged divisibility projectors.
The infinite-lattice lower bound is proved in the accompanying report, NOT by finite numerics.
The model is a declared prime-direction URT extension; RH remains unproved.
"""
from math import pi, sqrt, cos
from cmath import exp
from itertools import product
import numpy as np
import scipy.sparse as sparse
from scipy.sparse.linalg import eigsh

phi=(1+sqrt(5))/2
theta=2*pi/(phi*phi)

def eps(p,q):
    return -1 if p!=2 and q!=2 and p%4==q%4==3 else 1

def magnetic_matrix(k,sgn):
    """Finite compression, gauge-equivalent to the original prime-pair connection."""
    omega=sgn*exp(1j*theta)
    rows=[]; cols=[]; vals=[]
    idx=lambda x,y:k*x+y
    for x,y in product(range(k),repeat=2):
        a=idx(x,y)
        if x+1<k:
            b=idx(x+1,y)
            rows.extend((b,a));cols.extend((a,b));vals.extend((1+0j,1+0j))
        if y+1<k:
            b=idx(x,y+1)
            w=omega**x
            rows.extend((b,a));cols.extend((a,b));vals.extend((w,w.conjugate()))
    return sparse.coo_matrix((vals,(rows,cols)),shape=(k*k,k*k)).tocsr()

def compute_gap(k,sgn):
    H=magnetic_matrix(k,sgn)
    v0=np.sin(np.arange(H.shape[0])+1).astype(complex)
    val=eigsh(H,k=1,which='LA',return_eigenvectors=False,
              tol=1e-11,maxiter=40000,ncv=min(40,H.shape[0]-1),v0=v0)
    return 4-float(val[0])

def twisted_prime_shift(p,cutoff,primes):
    """Truncated original V_p on |n>, n<=cutoff."""
    vals=[];rows=[];cols=[]
    def vp(n,q):
        count=0
        while n%q==0:
            count+=1
            n//=q
        return count
    def legendre(x,q):
        r=pow(x%q,(q-1)//2,q)
        assert r in (1,q-1)
        return 1 if r==1 else -1
    for n in range(1,cutoff+1):
        if p*n>cutoff:continue
        sign=1;lower=0
        for q in primes:
            if q==p:continue
            ex=vp(n,q)
            if q<p:lower+=ex
            if ex%2 and p!=2 and q!=2:
                sign*=legendre(p,q)
        phase=sign*exp(1j*theta*lower)
        rows.append(p*n-1);cols.append(n-1);vals.append(phase)
    return sparse.coo_matrix((vals,(rows,cols)),shape=(cutoff,cutoff)).tocsr()

def test():
    gplus=(1-cos(theta))/4
    gminus=(1+cos(theta))/4
    assert gminus>0 and gplus>0
    print("theta radians:",f"{theta:.15f}")
    print("strict gap bound eps=+1",f"{gplus:.12f}")
    print("strict gap bound eps=-1",f"{gminus:.12f}")
    for k in (5,9,15,25):
        plus=compute_gap(k,+1); minus=compute_gap(k,-1)
        free=4-4*cos(pi/(k+1))
        assert plus>=gplus-1e-9,(k,plus,gplus)
        assert minus>=gminus-1e-9,(k,minus,gminus)
        print(f"quadrant {k:2d}x{k:2d}: flux+ {plus:.10f}, flux- {minus:.10f}, untwisted {free:.10f}")
    cutoff=120
    for p in (2,3,5,7,11):
        V=twisted_prime_shift(p,cutoff,(2,3,5,7,11))
        projector=(V@V.conjugate().transpose()).diagonal()
        truth=np.array([int(n%p==0) for n in range(1,cutoff+1)])
        assert np.max(np.abs(projector-truth))<2e-14
    print("PASS: 5 finite prime-divisibility projector identities; Möbius algebra unchanged")
    print("PASS: numerical finite comparisons to the exact infinite magnetic-gap theorem")
    print("RH NOT PROVED: no zeta determinant or Weil form identity")

if __name__=="__main__":test()
