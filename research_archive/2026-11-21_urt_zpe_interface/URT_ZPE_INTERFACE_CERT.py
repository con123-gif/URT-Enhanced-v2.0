#!/usr/bin/env python3
"""Exact-bound + numerical checks for a connected prime-flux Gaussian vacuum.

Same finite magnetic graph as the existing standalone URT ZPE branch.
Two-sided energy/entropy interface theorem. No horizon, fit, or 4.38% input.
"""
import math
import numpy as np
from scipy.linalg import eigh

PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/PHI**2

def graph(N, eps):
    assert N%2==0 and N>=4 and eps in (1,-1)
    f=float(np.angle(eps*np.exp(-1j*THETA)))
    L=np.zeros((N*N,N*N),complex)
    for y in range(N):
        for x in range(N):
            i=x+N*y
            for xx,yy,link in ((x+1,y,1),(x,y+1,np.exp(1j*x*f))):
                if xx>=N or yy>=N:continue
                j=xx+N*yy
                L[i,i]+=1;L[j,j]+=1
                L[i,j]-=link;L[j,i]-=np.conj(link)
    B=np.zeros_like(L)
    for y in range(N):
        i=N//2-1+N*y;j=i+1
        B[i,i]+=1;B[j,j]+=1;B[i,j]-=1;B[j,i]-=1
    return L,L-B,B,1-math.cos(abs(f)/4)

def spectral_entropy(eig,U,A):
    W=(U*np.sqrt(eig))@U.conj().T
    V=(U/np.sqrt(eig))@U.conj().T
    va=V[np.ix_(A,A)];wa=W[np.ix_(A,A)]
    v,Q=eigh(va); sv=(Q*np.sqrt(v))@Q.conj().T
    t=eigh(sv@wa@sv,eigvals_only=True)-1
    assert min(t)>-1e-9
    t=np.maximum(t,0)
    n=(np.sqrt(1+t)-1)/2
    h=(1+n)*np.log1p(n)-np.where(n>1e-15,n*np.log(np.maximum(n,1e-300)),0)
    return 2*sum(h),float(np.sum(t)),W,V

def check(N,eps):
    L,L0,B,g=graph(N,eps)
    ev,U=eigh(L);e0,U0=eigh(L0)
    assert ev[0]>=g-1e-10 and e0[0]>=g-1e-10
    assert ev[-1]<=8+1e-10 and e0[-1]<=8+1e-10
    cut=[x+N*y for y in range(N) for x in range(N//2)]
    E=np.sqrt(ev).sum();E0=np.sqrt(e0).sum()
    I=E-E0
    S,T,W,V=spectral_entropy(ev,U,cut)
    clo=1/(128*(math.sqrt(1+8/g)+1)**2)
    q=1-g/8
    chi=2*math.sqrt(8)/math.sqrt(g)*q*(1+q)/(1-q)**4
    assert I>=N/math.sqrt(8)-1e-8
    assert I<=N/math.sqrt(g)+1e-8
    assert clo*N<=S+1e-8<=chi*N+1e-8
    assert S>=clo*math.sqrt(g)*I-1e-8
    assert S<=chi*math.sqrt(8)*I+1e-8
    assert abs(float(np.trace(B).real)-2*N)<1e-8
    assert np.linalg.norm(B@B-2*B)<1e-8
    assert T>=N/256-1e-8
    # Interface interpolation derivative: d/dt Tr sqrt(L0+tB)=1/2 Tr(B(L0+tB)^-1/2)
    for t in (0.125,0.5,0.875):
        et,Ut=eigh(L0+t*B)
        der=0.5*sum(np.diag(Ut.conj().T@B@Ut).real/np.sqrt(et))
        assert N/math.sqrt(8)-1e-8 <= der <= N/math.sqrt(g)+1e-8
        h=1e-4
        ep=np.sqrt(eigh(L0+(t+h)*B,eigvals_only=True)).sum()
        em=np.sqrt(eigh(L0+(t-h)*B,eigvals_only=True)).sum()
        assert abs((ep-em)/(2*h)-der)<4e-5
    return (N,eps,g,float(I/N),float(S/N),float((S/I)),float(T/N),clo)

if __name__=='__main__':
    for n in (4,6,8,10,12):
        for eps in (1,-1):
            out=check(n,eps)
            print('N=%02d eps=%+d g=%.10f excess_E/cut=%.12f S/cut=%.12f S/excess_E=%.12f trXX/cut=%.12f lower_S/cut=%.12g'%out)
    print('PASS: joint-vacuum interface energy / area-entropy two-sided theorem; same flux graph; no fitting')
