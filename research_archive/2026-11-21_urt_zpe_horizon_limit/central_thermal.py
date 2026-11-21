#!/usr/bin/env python3
"""Central transverse trace estimator, native irrational URT flux, no extrapolation to target."""
import math,sys
import numpy as np
from scipy.linalg import eigh
THETA=2*math.pi/((1+math.sqrt(5))/2)**2
BETA=2*math.pi

def one(nx,nz,f,k):
    x=np.tile(np.arange(nx),nz); z=np.repeat(np.arange(nz),nx)
    pot=2-2*np.cos(k+f*(x-z))
    L=np.diag(pot).astype(complex)
    for i,(xx,zz) in enumerate(zip(x,z)):
        for j,w in ((i+1,np.exp(1j*f*zz)) if xx<nx-1 else (-1,0),(i+nx,1) if zz<nz-1 else (-1,0)):
            if j<0:continue
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=w;L[j,i]-=np.conj(w)
    ev,U=eigh(L); assert ev[0]>0
    a=np.flatnonzero(x<nx//2); idx=np.ix_(a,a); Ua=U[a,:]
    P=(Ua*np.sqrt(ev))@Ua.conj().T;Q=(Ua/np.sqrt(ev))@Ua.conj().T
    qe,qu=eigh(Q); qs=(qu*np.sqrt(qe))@qu.conj().T
    v,T=eigh(qs@P@qs);occ=(np.sqrt(np.maximum(v,1))-1)/2
    h=2*((1+occ)*np.log1p(occ)-occ*np.log(np.maximum(occ,1e-300)))
    sloc=(abs(T)**2)@h
    dist=nx/2-.5-x[a]; sd=np.sqrt(dist)
    M=L[idx].copy();M[np.diag_indices_from(M)]=0
    M*=.5*(dist[:,None]+dist[None,:]);M[np.diag_indices_from(M)]=np.sum(abs(M),axis=1)+dist*pot[a]
    lam,H=eigh(sd[:,None]*M*sd[None,:]);assert lam[0]>0
    freq=np.sqrt(lam)
    # Exact total trace; diagonal decomposition is an estimator, not a local observable.
    eloc=.5*(dist*np.diag(P).real+np.einsum('ij,ji->i',M,Q).real)-(abs(H)**2)@freq
    zloc=(abs(H)**2)@(-2*np.log(-np.expm1(-BETA*freq)))
    thermal_eloc=(abs(H)**2)@(2*freq*np.exp(-BETA*freq)/(-np.expm1(-BETA*freq)))
    thermal_sloc=BETA*thermal_eloc+zloc
    dloc=BETA*eloc+zloc-sloc
    assert dloc.sum()>=-1e-8
    assert abs(eloc.sum()-(.5*np.trace(dist[:,None]*P+M@Q).real-freq.sum()))<1e-8
    return np.stack([sloc,eloc,zloc,dloc,thermal_eloc,thermal_sloc]).reshape(6,nz,nx//2).sum(axis=2)

def run(nx,nz,eps,m):
    f=float(np.angle(eps*np.exp(-1j*THETA)))
    a=np.mean([one(nx,nz,f,2*math.pi*k/m) for k in range(m)],axis=0)
    mid=nz//2; full=a.mean(axis=1); core=a[:,mid-2:mid+2].mean(axis=1)
    center=a[:,mid-1:mid+1].mean(axis=1)
    for name,v in [('full',full),('core4',core),('core2',center)]:
        S,X,Z,D,XT,ST=v
        print(f'nx={nx} nz={nz} eps={eps:+d} k={m} {name} S={S:.12f} X={X:.12f} lnZ={Z:.12f} D={D:.12f} ratio={BETA*X/S:.12f} Xt={XT:.12f} St={ST:.12f} thermal_ratio={BETA*XT/ST:.12f} D/S={D/S:.12f} logZ/S={Z/S:.12f}',flush=True)
    return full,core,center
if __name__=='__main__':
    sizes=[(12,16,12),(16,24,12),(24,20,16),(40,16,12),(64,14,12),(96,12,12),(40,16,24)] if "--full" in sys.argv else [(12,16,12),(16,24,12)]
    for nx,nz,m in sizes:
        for eps in (1,-1):
            full,core,center=run(nx,nz,eps,m)
            for S,X,Z,D,XT,ST in (full,core,center):
                assert abs(BETA*(X-XT)-(S-ST)-D)<1e-10
                assert abs(BETA*XT+Z-ST)<1e-10
    print("PASS: native central trace and thermal identities; finite estimates, not a certified infinite limit.")
