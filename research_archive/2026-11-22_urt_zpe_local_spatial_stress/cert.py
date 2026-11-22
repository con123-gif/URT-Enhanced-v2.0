"""Standalone URT-ZPE local symmetric spatial metric response, 22 Nov 2026.
Parent 5a2a2fce9faa7dca3d69d9cb5ba589a3a2e53eb4.
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, for declared metric coupling.

At site i use signed forward/backward covariant differences d_ia^±, missing
edges zero. Average independently over the eight choices of signs to define
G_i^{ab}=mean(d_ia^† d_ib); diagonal gets half of each incident edge, off
diagonal uses mean gradient products. This is a positive metric extension
and transforms covariantly with site gauge phases. At flat metric exactly
K=L, the original magnetic oscillator, not a new spectrum.
For g_i=exp(2sB_i), B_i real symmetric, t_i=tr B_i, F_i=t_i I-2B_i,
P=diag(exp(-s t_i)); K=sum_iab [exp(s F_i)]_ab G_i^{ab}.
H=(p^T R(P)p+q^T R(K)q)/2. Stress variation
E1=Tr(W P1+V K1)/2, W=sqrt L, V=W^-1;
K1=stiffness(F), K2=stiffness(F²/2), P1=-diag(t), P2=diag(t²/2).
The stress operator contracted with B is minus dH/ds in unit site volumes.
In L eigenbasis with w=sqrt(lambda), T_mn=K1_mn/sqrt(w_m w_n)
-P1_mn sqrt(w_m w_n). By Gaussian pair matrix elements and the seagull,
C(nu)=Tr(W P2+V K2)/2-sum |T_mn|² (w_m+w_n)/
[4((w_m+w_n)²+nu²)]. Static energy coefficient C(0); inertia coefficient
sum |T|²/[4(w_m+w_n)^3]>=0. Polarization gives mixed spatial vertices.
For homogeneous isotropic B=b I, exact E(s)=exp(-sb)E0, pressure=rho/3,
not the cosmological-constant pressure. This is a frozen-carrier result.
Metric extension is declared, not uniquely derived; no shift constraint,
dynamical connection or local diffeomorphism Ward identity follows yet.
Executed locally in /mnt/data/urt_stress/cert.py using
OPENBLAS_NUM_THREADS=1 python cert.py: all 32 probes pass; maximum Hessian
absolute discrepancy 1.241e-8. N=5 negative phase local xy C=.64162971740,
inertia=.00073751859458; positive phase C=.62890603281, inertia=.0017440778596.
RESUME HERE: derive coupled connection/current and constrained metric shift,
then test total stress conservation and scale selection; no fitted constants,
no Cathedral ARFs. Remote CI not yet verified.
"""
import numpy as np
from itertools import product
from math import pi,sqrt

def native(n,f):
    xyz=list(product(range(n),repeat=3)); m=len(xyz); idx={x:i for i,x in enumerate(xyz)}
    d=np.zeros((m,3,2,m),complex)
    for i,x in enumerate(xyz):
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y not in idx:continue
            j=idx[y]; u=np.exp(1j*f*x[(a-1)%3])
            d[i,a,0,i]=-1;d[i,a,0,j]=u
            d[j,a,1,i]=-u.conjugate();d[j,a,1,j]=1
    return np.array(xyz),d

def stiffness(d,metric):
    avg=d.mean(axis=2); m=d.shape[0]; K=np.zeros((m,m),complex)
    for a in range(3):
        for b in range(3):
            if a==b:
                for k in range(2):
                    z=d[:,a,k,:];K+=z.conj().T@(metric[:,a,b,None]*z)/2
            else:
                K+=avg[:,a,:].conj().T@(metric[:,a,b,None]*avg[:,b,:])
    return (K+K.conj().T)/2

def test(n,f):
    xyz,d=native(n,f);m=len(xyz); I=np.broadcast_to(np.eye(3),(m,3,3));L=stiffness(d,I)
    D=d[:,:,0,:].reshape(-1,m);assert np.max(abs(L-D.conj().T@D))<1e-12
    lam,U=np.linalg.eigh(L);assert lam.min()>0;w=np.sqrt(lam);sp=w[:,None]+w[None,:];wp=w[:,None]*w[None,:]
    v=np.cos(pi*(xyz[:,0]+.5)/n);v/=np.linalg.norm(v)
    modes=[]
    for typ in ('uniform_volume','local_xy','local_diagonal','mixed'):
        B=np.zeros_like(I)
        if typ=='uniform_volume':B=I/np.sqrt(3*m)
        elif typ=='local_xy':B[:,0,1]=B[:,1,0]=v/sqrt(2)
        elif typ=='local_diagonal':B[:,0,0]=v/sqrt(2);B[:,1,1]=-v/sqrt(2)
        else:B[:,0,0]=v/2;B[:,1,2]=B[:,2,1]=v/2;B[:,2,2]=v/2
        t=np.trace(B,axis1=1,axis2=2);F=t[:,None,None]*I-2*B
        K1=stiffness(d,F);K2=stiffness(d,(F@F)/2);P1=np.diag(-t);P2=np.diag(t*t/2)
        def eigen(A):return U.conj().T@A@U
        T=eigen(K1)/np.sqrt(wp)-eigen(P1)*np.sqrt(wp)
        e1=(np.sum(eigen(K1).diagonal().real/w)+np.sum(eigen(P1).diagonal().real*w))/2
        tad=(np.sum(eigen(K2).diagonal().real/w)+np.sum(eigen(P2).diagonal().real*w))/2
        def response(nu):return tad-np.sum(abs(T)**2*sp/(sp**2+nu**2))/4
        e2=response(0); k=np.sum(abs(T)**2/sp**3)/4
        assert k>0 and response(1)>=e2
        ev,R=np.linalg.eigh(F)
        def energy(s):
            coeff=(R*np.exp(s*ev)[:,None,:])@R.transpose(0,2,1)
            a=np.exp(-s*t/2);K=stiffness(d,coeff)*a[:,None]*a[None,:]
            return np.sqrt(np.linalg.eigvalsh(K)).sum()
        h=.003;em,e0,ep=energy(-h),energy(0),energy(h)
        fd1=(ep-em)/(2*h); fd2=(ep+em-2*e0)/(2*h*h)
        assert abs(fd1-e1)<2e-6 and abs(fd2-e2)<2e-6
        if typ=='uniform_volume':assert abs(e2-e0/(6*m))<1e-12
        if n==2 and typ=='local_xy':
            z=np.exp(1j*np.arange(m)*.731); dg=z[:,None,None,None]*d*z.conj()[None,None,None,:]
            assert np.max(abs(stiffness(dg,F)-z[:,None]*K1*z.conj()[None,:]))<1e-12
        print(f'N={n} f={f:+.9f} {typ:14s} E1={e1:+.10e} E2={e2:+.10e} inertia={k:.10e} fd2_error={abs(fd2-e2):.3e}',flush=True)
if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,3,4,5):
        for f in (-theta,pi-theta):test(n,f)
    print('PASS: 32 local metric derivatives and Hessians; native incidence, gauge covariance, uniform scaling, positive spectral inertia')
