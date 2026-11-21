#!/usr/bin/env python3
"""Same uniform 3D flux in a gauge independent of y. Infinite y via Fourier, finite x,z.
No extrapolated value is certified. Periodic transverse boundary alternative is explicit.
"""
import math
import numpy as np
from scipy.linalg import eigh
THETA=2*math.pi/((1+math.sqrt(5))/2)**2
def one(nx,nz,f,k):
    x=np.tile(np.arange(nx),nz); z=np.repeat(np.arange(nz),nx)
    L=np.diag(2-2*np.cos(k+f*(x-z))).astype(complex)
    for i,(xx,zz) in enumerate(zip(x,z)):
        for j,w in ((i+1,np.exp(1j*f*zz)) if xx<nx-1 else (-1,0), (i+nx,1) if zz<nz-1 else (-1,0)):
            if j<0:continue
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=w;L[j,i]-=np.conj(w)
    ev,U=eigh(L); assert ev[0]>0
    W=(U*np.sqrt(ev))@U.conj().T;V=(U/np.sqrt(ev))@U.conj().T
    a=np.flatnonzero(x<nx//2); idx=np.ix_(a,a);P=W[idx];Q=V[idx]
    qe,qu=eigh(Q);qs=(qu*np.sqrt(qe))@qu.conj().T
    occ=(np.sqrt(np.maximum(eigh(qs@P@qs,eigvals_only=True),1))-1)/2
    S=2*np.sum((1+occ)*np.log1p(occ)-occ*np.log(np.maximum(occ,1e-300)))
    dist=nx/2-.5-x[a]; D=np.diag(dist); sd=np.sqrt(dist)
    M=L[idx].copy();M[np.diag_indices_from(M)]=0
    M*=.5*(dist[:,None]+dist[None,:]); M[np.diag_indices_from(M)]=np.sum(abs(M),axis=1)+dist*(2-2*np.cos(k+f*(x[a]-z[a])))
    lam=eigh(sd[:,None]*M*sd[None,:],eigvals_only=True); freq=np.sqrt(lam)
    X=.5*np.trace(D@P+M@Q).real-freq.sum()
    Z=-2*np.log(-np.expm1(-2*np.pi*freq)).sum();Rel=2*np.pi*X+Z-S
    assert Rel>=-1e-9
    return np.array([S,X,Z,Rel])
def run(nx,nz,eps,m=12):
    f=float(np.angle(eps*np.exp(-1j*THETA)))
    out=np.mean([one(nx,nz,f,2*np.pi*k/m) for k in range(m)],axis=0)/nz
    print(f'nx={nx} nz={nz} {eps:+d} k={m}, S/A={out[0]:.9f}, X/A={out[1]:.9f}, R={2*np.pi*out[1]/out[0]:.9f}, D/A={out[3]:.9f}, logZ/A={out[2]:.9f}',flush=True)
    return out
if __name__=='__main__':
    for nx,nz in ((8,8),(12,12),(16,16),(24,24)):
        for e in (1,-1):run(nx,nz,e)
    for eps in (1,-1):
        a=run(12,12,eps,12);b=run(12,12,eps,24)
        assert np.max(np.abs(a-b))<1e-5
    print('PASS: finite transverse strip quadrature, positive relative entropy; no limiting equality asserted.')
