#!/usr/bin/env python3
"""Two-prime URT connected magnetic lattice: common Gaussian ZPE and area-law check."""
import math
import numpy as np
from scipy.linalg import eigh
PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/PHI**2

def lattice(N,eps):
    assert N>=2 and eps in (-1,1)
    f=np.angle(eps*np.exp(-1j*THETA))
    L=np.zeros((N*N,N*N),dtype=complex)
    for y in range(N):
        for x in range(N):
            i=x+N*y
            for xx,yy,z in ((x+1,y,1.0),(x,y+1,np.exp(1j*x*f))):
                if xx>=N or yy>=N:continue
                j=xx+N*yy
                L[i,i]+=1; L[j,j]+=1
                L[i,j]=-z; L[j,i]=-np.conj(z)
    assert np.allclose(L,L.conj().T)
    return L,1-math.cos(abs(f)/4),f

def entropy(nus):
    out=0.
    for nu in nus:
        n=max(float(nu)-.5,0.)
        if n>1e-12:
            out+=(n+1)*math.log1p(n)-n*math.log(n)
    return 2*out

def calc(N,eps):
    L,g,f=lattice(N,eps)
    eig,U=eigh(L)
    assert eig[0]>0 and eig[0]>=g-1e-11 and eig[-1]<8+1e-11
    W=(U*np.sqrt(eig))@U.conj().T
    V=(U/np.sqrt(eig))@U.conj().T
    assert np.linalg.norm(W@V-np.eye(N*N))<1e-9
    A=[x+N*y for y in range(N) for x in range(N//2)]
    va=V[np.ix_(A,A)];wa=W[np.ix_(A,A)]
    vl,Q=eigh(va)
    sv=(Q*np.sqrt(vl))@Q.conj().T
    nu=np.sqrt(np.maximum(eigh(sv@wa@sv,eigvals_only=True),1))/2
    S=entropy(nu)
    if N<=5:
        D=np.exp(1j*THETA*np.array([(i%N+2*(i//N))/13 for i in range(N*N)]))
        L2=D[:,None]*L*np.conj(D)[None,:]
        e2,Q2=eigh(L2)
        assert np.max(np.abs(e2-eig))<1e-11
        W2=(Q2*np.sqrt(e2))@Q2.conj().T
        V2=(Q2/np.sqrt(e2))@Q2.conj().T
        va2=V2[np.ix_(A,A)];wa2=W2[np.ix_(A,A)]
        ev2,T2=eigh(va2)
        sv2=(T2*np.sqrt(ev2))@T2.conj().T
        S2=entropy(np.sqrt(np.maximum(eigh(sv2@wa2@sv2,eigvals_only=True),1))/2)
        assert abs(S2-S)<1e-9
    if N==2:
        F=abs(f)
        target=sorted([2-2*math.cos(F/4),2+2*math.cos(F/4),
                       2-2*math.sin(F/4),2+2*math.sin(F/4)])
        assert np.max(np.abs(eig-target))<1e-12
    q=1-g/8
    area_bound=(2*math.sqrt(8)/math.sqrt(g))*q*(1+q)/(1-q)**4
    assert 0<=S<=area_bound*N*(1+1e-9)
    return float(np.sqrt(eig).sum()),S,float(eig[0]),g

def main():
    for N in (2,3,4,5,6,8,10,12):
        result={}
        for eps in (1,-1):
            E,S,gap,lower=calc(N,eps)
            result[eps]=(E,S)
            print("N",N,"eps",eps,"E/N^2",f"{E/N**2:.12f}",
                  "S/N",f"{S/N:.12f}","gap",f"{gap:.12f}",
                  "gap_bound",f"{lower:.12f}")
        assert result[1][0]>result[-1][0]
        assert result[1][1]<result[-1][1]
    print("PASS: graph 2x2 recovery, uniform gap tests, same-Gaussian-state ZPE and site entropy,")
    print("      local gauge invariance, size-independent area-law inequality.")
    print("Conditional model: oscillator quantisation and physical scale remain assumptions.")

if __name__=="__main__":main()
