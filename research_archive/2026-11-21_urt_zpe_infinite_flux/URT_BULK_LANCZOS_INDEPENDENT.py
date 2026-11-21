#!/usr/bin/env python3
"""Independent infinite-volume ZPE: local Harper Lanczos plus Gauss/Radau bounds.

Finite Krylov moments reproduce the *infinite* lattice: every Lanczos vector at step k
is supported in graph distance <=k; no numerical finite-volume extrapolation is used.
Rigorous sign is certified separately by exact rational script.
"""
import math
import numpy as np
from scipy.linalg import eigh_tridiagonal

phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2

def lanczos(F,n):
    R=n+3
    v=np.zeros((2*R+1,2*R+1),dtype=np.complex128)
    v[R,R]=1
    prev=np.zeros_like(v)
    prior=0.0
    phase=np.exp(1j*F*np.arange(-R,R+1))[:,None]
    alpha=[];beta=[]
    for j in range(n):
        A=np.zeros_like(v)
        A[1:,:]+=v[:-1,:]
        A[:-1,:]+=v[1:,:]
        A[:,1:]+=phase*v[:,:-1]
        A[:,:-1]+=np.conj(phase)*v[:,1:]
        w=4*v-A
        aj=float(np.vdot(v,w).real)
        assert abs(np.vdot(v,w).imag)<1e-11
        w-=aj*v+prior*prev
        bj=float(np.linalg.norm(w))
        alpha.append(aj)
        if j<n-1:beta.append(bj)
        prev,v=v,w/bj
        prior=bj
    return np.array(alpha),np.array(beta)

def quadrature(F,n):
    a,b=lanczos(F,n)
    assert np.max(np.abs(a-4))<3e-10
    assert abs(b[0]**2-4)<1e-10
    assert abs(b[1]**2-(3+2*math.cos(F)))<1e-9
    ev,vec=eigh_tridiagonal(a,b)
    upper=float(np.dot(vec[0]**2,np.sqrt(ev)))
    g=4*(1-math.cos(F/4))
    # Radau lower: replace last diagonal to force a spectral node at endpoint g.
    gamma=1/(a[0]-g)
    for j in range(1,n-1):
        gamma=1/(a[j]-g-b[j-1]**2*gamma)
    ar=a.copy()
    ar[-1]=g+b[-1]**2*gamma
    evr,vecr=eigh_tridiagonal(ar,b)
    assert abs(evr[0]-g)<1e-10
    lower=float(np.dot(vecr[0]**2,np.sqrt(np.maximum(evr,0))))
    assert lower<=upper+3e-12
    return lower,upper

def main():
    last=None
    for n in (3,4,5,6,8,10,12):
        plus=quadrature(theta,n)
        minus=quadrature(math.pi-theta,n)
        lo=plus[0]-minus[1]
        hi=plus[1]-minus[0]
        assert lo>0 and lo<=hi+1e-12
        last=(lo,hi)
        print(f'Krylov n={n:2d}: u+ in [{plus[0]:.15f},{plus[1]:.15f}], '
              f'u- in [{minus[0]:.15f},{minus[1]:.15f}], '
              f'Delta in [{lo:.15f},{hi:.15f}]')
    assert abs((last[0]+last[1])/2-0.00827785286373)<1e-10
    print('PASS: independent infinite-volume local spectral quadrature; no finite-size extrapolation')
    print('Sign theorem additionally certified by standalone exact Fraction certificate')
if __name__=='__main__':main()
