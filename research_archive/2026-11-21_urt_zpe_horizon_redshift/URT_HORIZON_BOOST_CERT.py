#!/usr/bin/env python3
"""Rindler-leading horizon energy test with existing native 3D vacuum.
Weights dictated by midpoint lattice approximation to lapse x/R. This is a
specified gravitational coupling test, not an identification forced by URT.
"""
import numpy as np
from scipy.linalg import eigh
import math
from URT_BOUNDARY_ENERGY_CERT import graph,THETA,BETA
def horizon(n,eps):
    f=float(np.angle(eps*np.exp(-1j*THETA)))
    L,B,a,b=graph(n,f); L0=L-B
    ev,U=eigh(L);W=(U*np.sqrt(ev))@U.conj().T;V=(U/np.sqrt(ev))@U.conj().T
    idx=np.ix_(a,a); A=L0[idx]; PA=W[idx]; QA=V[idx]
    eQ,UQ=eigh(QA);sqrtQ=(UQ*np.sqrt(eQ))@UQ.conj().T
    nu=np.sqrt(np.maximum(eigh(sqrtQ@PA@sqrtQ,eigvals_only=True),1))/2
    p=nu-.5;S=2*np.sum((1+p)*np.log1p(p)-p*np.log(np.maximum(p,1e-300)))
    distances=n/2-.5-(a%n)
    assert np.min(distances)==.5
    D=np.diag(distances);sqrtD=np.diag(np.sqrt(distances))
    Aw=A.copy();Aw[np.diag_indices_from(Aw)]=0
    weights=(distances[:,None]+distances[None,:])/2
    Aw*=weights
    Aw[np.diag_indices_from(Aw)]=np.sum(abs(Aw),axis=1)
    K=sqrtD@Aw@sqrtD;lam=eigh(K,eigvals_only=True);assert lam[0]>0
    root=np.sqrt(lam);E0=root.sum()
    E=.5*np.trace(D@PA+Aw@QA).real;X=E-E0
    logZ=-2*np.log(-np.expm1(-BETA*root)).sum()
    Rel=BETA*X+logZ-S
    assert X>=-1e-10 and Rel>=-1e-9
    phase=np.exp(1j*np.arange(len(a))*THETA/29)
    G=lambda x:phase[:,None]*x*phase.conj()[None,:]
    assert np.max(abs(eigh(sqrtD@G(Aw)@sqrtD,eigvals_only=True)-lam))<1e-10
    assert abs(.5*np.trace(D@G(PA)+G(Aw)@G(QA)).real-E)<1e-9
    v,Uk=eigh(K);freq=np.sqrt(v);coth=1/np.tanh(BETA*freq/2)
    Cq=sqrtD@((Uk*(coth/freq))@Uk.conj().T)@sqrtD
    Ct=np.diag(1/np.sqrt(distances));Cp=Ct@((Uk*(coth*freq))@Uk.conj().T)@Ct
    errq=np.linalg.norm(Cq-QA,'fro')/np.linalg.norm(QA,'fro')
    errp=np.linalg.norm(Cp-PA,'fro')/np.linalg.norm(PA,'fro')
    assert max(errq,errp)>1e-4
    print(f'{n:2d} {eps:+d} S/A={S/n**2:.12f} X_R/A={X/n**2:.12f} 2piX_R/S={BETA*X/S:.12f} D/A={Rel/n**2:.12f} logZ/A={logZ/n**2:.12f} cov_mismatch={errq:.6g},{errp:.6g}')
    return S,X,Rel,logZ
if __name__=='__main__':
    for n in (2,4,6,8,10,12):
        for eps in (+1,-1):horizon(n,eps)
    print('PASS: native midpoint-lapse boost Hamiltonian positivity, physical energy, entanglement entropy, Gibbs relative entropy and gauge invariance.')
