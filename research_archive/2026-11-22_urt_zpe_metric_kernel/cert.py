#!/usr/bin/env python3
"""URT native 3D flux: Euclidean metric determinant, quadratic kernel.
Natural units, ell0=1; finite comoving lattice, canonical conformal-time measure.
No fitted constants; amplitude and frequencies are derivative test probes.
"""
import numpy as np
from scipy.integrate import solve_ivp
from itertools import product
from math import pi, sqrt, ceil

phi=(1+sqrt(5))/2; theta=2*pi/phi**2

def spectrum(N,f):
    L=np.zeros((N**3,N**3),complex)
    for x,y,z in product(range(N),repeat=3):
        i=x+N*(y+N*z)
        for X,Y,Z,pow in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(X,Y,Z)>=N:continue
            j=X+N*(Y+N*Z);u=np.exp(1j*f*pow)
            L[i,i]+=1; L[j,j]+=1;L[i,j]-=u;L[j,i]-=np.conj(u)
    lam=np.linalg.eigvalsh(L)
    assert lam[0]>=1.5*(1-np.cos(abs(f)/4))-1e-12
    return np.sqrt(lam)

def kernel(omega,nu,b=1.):
    return .5*np.sum(b*nu**2/omega-b*b*nu**4/(omega*(nu**2+4*omega**2)))

def determinant(omega,nu,amp,b):
    # Monodromy for periodic sigma=amp*cos(nu*t). Evaluate exact continuum
    # time determinant (up to a sigma-independent factor) via trace(M)-2.
    # Remove exp(omega*t) analytically to avoid overflow.
    T=(2*pi/nu)*ceil(24*nu/(2*pi*omega.min()))
    w=omega[:,None,None]; m=len(omega)
    def rhs(t,flat):
        Y=flat.reshape(m,2,2);d=np.empty_like(Y)
        V=b*nu**2*(-amp*np.cos(nu*t)+amp**2*np.sin(nu*t)**2)
        d[:,0,:]=Y[:,1,:]-omega[:,None]*Y[:,0,:]
        d[:,1,:]=(omega**2+V)[:,None]*Y[:,0,:]-omega[:,None]*Y[:,1,:]
        return d.ravel()
    Y=np.tile(np.eye(2),(m,1,1)).ravel()
    sol=solve_ivp(rhs,(0,T),Y,method='DOP853',rtol=2e-11,atol=2e-12,max_step=min(.45/omega.max(),.3/nu))
    assert sol.success
    trace=np.trace(sol.y[:,-1].reshape(m,2,2),axis1=1,axis2=2)
    e=np.exp(-T*omega)
    assert np.min(trace-2*e)>0
    return np.sum(np.log(trace-2*e)-2*np.log1p(-e))/T

if __name__=='__main__':
    for N in (2,4,8,12):
        for f in (-theta,pi-theta):
            w=spectrum(N,f);s=w.sum();k=.5*np.sum(1/w)
            print(f'N={N} f={f:+.9f} E0/site={s/len(w):.12f} kappa/site={k/len(w):.12f} gap={w.min():.12f} kappa/E0={k/s:.12f}',flush=True)
            for nu in (.25,1.,4.):
                pred=kernel(w,nu);alternate=np.sum(2*w*nu**2/(nu**2+4*w*w))
                assert abs(pred-alternate)<1e-11*max(1.,pred)
                assert 0<pred<=min(k*nu**2,2*s)
            if N in (2,4):
                for nu in (.5,2.):
                    eps=.003
                    base=determinant(w,nu,0.,1.)
                    assert abs(base)<1e-10
                    exact=kernel(w,nu)
                    num=2*(determinant(w,nu,eps,1.)-base)/eps**2
                    rel=abs(num/exact-1)
                    assert rel<5e-4,(N,f,nu,num,exact,rel)
                    print(f'  nu={nu:.1f} exact kernel/site={exact/len(w):.12f} monodromy/site={num/len(w):.12f} relerr={rel:.3e}',flush=True)
                assert abs(determinant(w,1.,.02,0.))<1e-10
    print('PASS native spectrum, exact positive kernel, eight continuum-time determinant comparisons, conformal cancellation')

def pulse(omega,tau,amp,b=1.):
    # Lorentzian conformal metric a=exp(sigma), sigma=amp exp(-eta^2/(2 tau^2)).
    # chi''+(omega^2-b*a''/a)chi=0. Start/end in asymptotically flat vacuum.
    w=omega; t0=-10*tau; t1=-t0; m=len(w)
    u0=1/np.sqrt(2*w); v0=-1j*w*u0
    def rhs(t,y):
        s=amp*np.exp(-t*t/(2*tau*tau)); sd=-t*s/tau**2; sdd=(t*t/tau**4-1/tau**2)*s
        return np.r_[y[m:],-(w*w-b*(sdd+sd*sd))*y[:m]]
    sol=solve_ivp(rhs,(t0,t1),np.r_[u0,v0],method='DOP853',rtol=5e-12,atol=1e-13,max_step=min(.25/w.max(),.15*tau))
    assert sol.success
    u,v=sol.y[:m,-1],sol.y[m:,-1]
    assert np.max(abs(2*np.imag(u.conj()*v)+1))<1e-9
    # Negative-frequency amplitude, avoiding subtraction of two O(1) energies.
    beta=np.sqrt(w/2)*(u+v/(1j*w))
    actual=np.sum(2*w*abs(beta)**2)
    pred=np.sum(2*w*(8*pi*amp*amp*b*b*w*w*tau*tau*np.exp(-4*w*w*tau*tau)))
    return actual,pred

if __name__=='__main__':
    for f in (-theta,pi-theta):
        w=spectrum(4,f)
        for tau in (.25,.5,1.):
            amp=1e-3;actual,pred=pulse(w,tau,amp)
            rel=abs(actual/pred-1);assert rel<.006
            print(f'PULSE f={f:+.9f} tau={tau:g} absorbed/site/amp^2={actual/(len(w)*amp**2):.12g} Born={pred/(len(w)*amp**2):.12g} relerr={rel:.3e}',flush=True)
        actual,_=pulse(w,.5,.01,b=0);assert actual<1e-20
    print('PASS six real-time metric-pulse excitation tests and conformal control')
