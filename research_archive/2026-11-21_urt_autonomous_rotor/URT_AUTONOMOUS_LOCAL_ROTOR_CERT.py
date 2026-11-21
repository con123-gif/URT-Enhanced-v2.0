#!/usr/bin/env python3
"""Original native golden-flux 3D signal+conjugate-idler+rotor stability."""
import math
import numpy as np
from scipy.linalg import eigh
PHI=(1+math.sqrt(5))/2; THETA=2*math.pi/PHI**2

def graph(dims,eps):
    nx,ny,nz=dims
    f=float(np.angle(eps*np.exp(-1j*THETA)))
    L=np.zeros((nx*ny*nz,nx*ny*nz),complex)
    idx=lambda x,y,z:x+nx*(y+ny*z)
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                i=idx(x,y,z)
                for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                    if xx>=nx or yy>=ny or zz>=nz: continue
                    j=idx(xx,yy,zz);w=np.exp(1j*f*power)
                    L[i,i]+=1;L[j,j]+=1;L[i,j]-=w;L[j,i]-=w.conjugate()
    return L

def realify(M):
    return np.block([[M.real,-M.imag],[M.imag,M.real]])

for eps in (+1,-1):
    L=graph((2,2,3),eps)
    m=L.shape[0]; Ks=realify(L);Ki=realify(L.conj())
    C=np.diag(np.r_[np.ones(m),-np.ones(m)])
    assert np.linalg.norm(Ki-C@Ks@C)<1e-10
    f=abs(float(np.angle(eps*np.exp(-1j*THETA))))
    g2=1-math.cos(f/4)
    assert min(eigh(Ks,eigvals_only=True))>=g2-1e-10
    assert min(eigh(Ki,eigvals_only=True))>=g2-1e-10
    g=.5*math.sqrt(g2)
    chi=THETA*(np.arange(m)+1)/7
    A=np.diag(np.r_[g*np.sin(chi),-g*np.sin(chi)])
    X=np.block([[np.zeros_like(A),A],[A,np.zeros_like(A)]])
    K=np.block([[Ks,np.zeros_like(Ks)],[np.zeros_like(Ki),Ki]])
    I=np.eye(4*m)
    Schur=K-X@X.T
    assert min(eigh(Schur,eigvals_only=True))>=.75*g2-1e-10
    Hmat=np.block([[K,X],[X.T,I]])
    assert min(eigh(Hmat,eigvals_only=True))>0
    D=np.diag(np.exp(1j*THETA*(np.arange(m)+1)/19))
    Gs=realify(D); Gi=realify(D.conj())
    G=np.block([[Gs,np.zeros_like(Gs)],[np.zeros_like(Gi),Gi]])
    assert np.linalg.norm(G@X-X@G)<1e-10
    Kp=G@K@G.T;Xp=G@X@G.T
    assert np.linalg.norm(X-Xp)<1e-10
    assert np.linalg.norm(Kp-X@X.T-G@Schur@G.T)<1e-10
    print(f'eps={eps:+d}: magnetic_gap_lower={g2:.12f}, safe_g={g:.12f}, '
          f'actual_static_Schur_min={min(eigh(Schur,eigvals_only=True)):.12f}, '
          f'certified_bound={.75*g2:.12f}')
import sympy as sp
p,q,a,k=sp.symbols('p q a k',real=True)
assert sp.simplify((p*p/2+k*q*q/2+a*p*q)-((p+a*q)**2/2+(k-a*a)*q*q/2))==0
print('PASS: nonnegative time-independent original native signal+conjugate idler+rotor Hamiltonian,')
print('      exact completing square, site-local gauge invariance, rigorous g²<gap stability')
print('OPEN: rotor initial state, inertia/coupling and dynamics selecting r=acosh(pi/e), carrier birth and GR')
