"""Entropy-normalized physical consistency test, 22 Nov 2026.
Native fixed-carrier action of 467e8dc; entropy law bbfb2d5 and 0898eadd.
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for conditional dictionary.
No fitted inputs. ell0=hbar=c=1. Set G=1/(4 sigma0) with sigma0
the actual initial state seam entropy divided by N². Use that constant G
in the already-declared minimal Einstein-Gaussian action; integrate in ln a.
The entropy dictionary would require sigma(a)/a²=sigma0 to maintain G.
At initial instantaneous ground state the covariance has zero time
derivative, so dot sigma=0 and d ln G_inferred/dt=2H initially,
provided differentiable reduced entropy (finite faithful cut; zero
occupation entropy has vanishing first derivative for smooth physical
two-sided occupation evolution). Thus fixed G and the chosen evolving
fixed-comoving cut dictionary are inconsistent already at first order.
For bare bulk density rho=hbar c u/ell^4, initial Friedmann constraint
and entropy G give (H ell/c)^2=2pi u/(3 sigma0).
Numerical H ell/c >1 means the macroscopic horizon identification is
outside its validity regime; the subsequent evolution is a formal
finite-action diagnostic, not a prediction of observed varying G.
Boundary alternative: rho=3 chi hbar c/(ell² R²), entropy G then implies
Friedmann iff 2pi chi/sigma=1, with R cancelling identically. Even exact
matching does not select R or Lambda. Existing core2 96x12 values from
871d8bc give ratios 1.1730705804 and 1.0484081009, not certified limits.
The local causal-horizon Clausius equation determines Einstein coupling
but not Lambda: T_ab -> T_ab - delta rho g_ab leaves all null contractions
unchanged. Do not claim a new fundamental theory or fit either ratio.
The entropy principle is retained; do not duplicate previous bare
vacuum extensions. A genuinely independent global entropy-evolution
law or physical vacuum normalization is necessary for a Lambda prediction.

Executed actual local container /mnt/data/urt_entropy_physical/cert.py,
OPENBLAS_NUM_THREADS=1 python; exit 0. Four cases N=2,4 both phases.
N=2 negative: H0 ell/c=5.4823635724, a4 G_inferred/G0=1.4705264735,
a4 q=.1021292633.
N=2 positive: 3.5094884105, 2.2196804295, .2631417569.
N=4 negative: 9.4833967129, 1.6554129010, .0520905152.
N=4 positive: 7.9380902493, 1.7561567184, .0721141141.
Max sampled Wronskian error 2.599e-10. No remote CI claimed.
"""
import numpy as np
from scipy.integrate import solve_ivp
from itertools import product
from math import pi,sqrt,log

def native(n,f):
    xyz=list(product(range(n),repeat=3)); lookup={x:i for i,x in enumerate(xyz)}; m=len(xyz); D=[]
    for i,x in enumerate(xyz):
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y not in lookup:continue
            row=np.zeros(m,complex);row[i]=1;row[lookup[y]]=-np.exp(1j*f*x[(a-1)%3]);D.append(row)
    D=np.array(D); L=D.conj().T@D
    return np.linalg.eigh(L),np.array([i for i,x in enumerate(xyz) if x[0]<n//2])

def entropy(U,u,v,cut):
    U=U[cut,:]
    def real(H):return np.block([[H.real,-H.imag],[H.imag,H.real]])
    Q=real((U*abs(u)**2)@U.conj().T);P=real((U*abs(v)**2)@U.conj().T);C=real((U*np.real(u*v.conj()))@U.conj().T)
    Z=np.zeros_like(Q);I=np.eye(len(Q));Omega=np.block([[Z,I],[-I,Z]])
    gamma=np.block([[Q,C],[C.T,P]])
    eig=np.linalg.eigvals(1j*Omega@gamma); assert max(abs(eig.imag))<1e-6
    nu=np.sort(eig.real)[len(Q):]; assert min(nu)>.5-1e-7
    occ=np.maximum(nu-.5,0);mask=occ>0
    return np.sum((1+occ)*np.log1p(occ))-np.sum(occ[mask]*np.log(occ[mask]))

def run(n,f):
    (lam,U),cut=native(n,f);m=len(lam);w=np.sqrt(lam);assert min(w)>0
    u0=1/np.sqrt(2*w);v0=-1j*np.sqrt(w/2);state=np.r_[u0,v0];sigma0=entropy(U,u0,v0,cut)/n**2
    G=1/(4*sigma0);e=w.mean();H0=sqrt(8*pi*G*e/3)
    assert abs(H0**2-2*pi*e/(3*sigma0))<1e-10
    def quantities(x,y):
        a=np.exp(x);u,v=y[:m],y[m:];K=sum(abs(v)**2)/a**3;W=a*sum(lam*abs(u)**2);rho=(K+W)/(m*a**3);H=sqrt(8*pi*G*rho/3);return a,u,v,K,W,H
    def rhs(x,y):
        a,u,v,K,W,H=quantities(x,y);return np.r_[v/a**3,-a*lam*u]/H
    xs=np.linspace(0,log(4),17);sol=solve_ivp(rhs,(0,xs[-1]),state,t_eval=xs,method='DOP853',rtol=1e-10,atol=1e-12);assert sol.success
    for k in [0,1,8,16]:
        x=xs[k];a,u,v,K,W,H=quantities(x,sol.y[:,k]);sigma=entropy(U,u,v,cut)/n**2;ratio=a*a*sigma0/sigma;q=2*K/(K+W);wrerr=max(abs(2*np.imag(u.conj()*v)+1));assert wrerr<1e-7 and q>=0
        print(f'N={n} f={f:+.9f} a={a:.6f} sigma={sigma:.10f} G_entropy/G_initial={ratio:.10f} H*ell/c={H*a:.10f} q={q:.10f} wrerr={wrerr:.3e}')
    assert H0>1
if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,4):
        for f in (-theta,pi-theta):run(n,f)
    print('PASS: four native entropy-normalized dynamical diagnostics; initial horizon below one cell, no acceleration in minimal action')
