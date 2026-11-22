"""Native cubic flux Gaussian FLRW dynamics, finite comoving lattice, natural units.
No fit: two dimensionless test couplings, not cosmological measurements.
"""
import numpy as np
from scipy.integrate import solve_ivp
from math import pi,sqrt
from itertools import product
phi=(1+sqrt(5))/2
theta=2*pi/phi**2

def native(n,f):
    L=np.zeros((n**3,n**3),complex)
    for x,y,z in product(range(n),repeat=3):
        i=x+n*(y+n*z)
        for X,Y,Z,pow in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(X,Y,Z)>=n:continue
            j=X+n*(Y+n*Z);u=np.exp(1j*f*pow)
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=u;L[j,i]=L[i,j].conjugate()
    return np.linalg.eigh(L)

def run(n,f,ratio):
    lam,U=native(n,f);w=np.sqrt(lam);m=len(w);V0=float(m)
    assert lam[0]>0
    # Initially a=1, two real polarizations for every complex lattice eigenmode.
    q0=1/np.sqrt(2*w);p0=-1j*np.sqrt(w/2)
    rho0=w.sum()/V0
    H0=ratio*w.min()
    G=3*H0**2/(8*pi*rho0) # diagnostic choice for dimensionless H0/gap, not fitted G
    def quantities(y):
        a,H=y[:2].real;q=y[2:2+m];p=y[2+m:]
        K=np.sum(abs(p)**2)/a**3;W=a*np.sum(lam*abs(q)**2)
        rho=(K+W)/(V0*a**3);pres=(K-W/3)/(V0*a**3)
        return a,H,q,p,K,W,rho,pres
    def rhs(t,y):
        a,H,q,p,K,W,rho,pres=quantities(y)
        return np.r_[a*H,-4*pi*G*(rho+pres),p/a**3,-a*lam*q]
    def target(t,y):return y[0].real-4
    target.terminal=True;target.direction=1
    sol=solve_ivp(rhs,(0,100/H0),np.r_[1.,H0,q0,p0],rtol=2e-9,atol=1e-10,method='DOP853',events=target,max_step=.35/w.max())
    assert sol.success and len(sol.t_events[0])==1
    constraint=0.;wronsk=0.;qlo=1e9;qhi=-1e9;wlo=1e9;whi=-1e9
    for y in sol.y.T:
        a,H,q,p,K,W,rho,pres=quantities(y)
        constraint=max(constraint,abs(H**2-8*pi*G*rho/3)/H**2)
        wronsk=max(wronsk,np.max(abs(2*np.imag(q.conj()*p)+1)))
        dec=4*pi*G*(rho+3*pres)/(3*H**2)
        assert dec>=0 and abs((rho+3*pres)-4*K/(V0*a**3))<1e-12
        qlo=min(qlo,dec);qhi=max(qhi,dec);wlo=min(wlo,pres/rho);whi=max(whi,pres/rho)
    assert constraint<5e-7 and wronsk<5e-7
    a,H,q,p,K,W,rho,pres=quantities(sol.y[:,-1]);instant_w=w/a
    # Entanglement across the original physical x cut at both times.
    sites=np.array([i for i in range(m) if i%n<n//2]); UA=U[sites,:]
    def entropy(q,p):
        def block(d):
            M=(UA*d)@UA.conj().T
            return np.block([[M.real,-M.imag],[M.imag,M.real]])
        Q=block(abs(q)**2);P=block(abs(p)**2);C=block((q*p.conj()).real)
        cov=np.block([[Q,C],[C.T,P]]);d=len(Q);eye=np.eye(d)
        O=np.block([[np.zeros((d,d)),eye],[-eye,np.zeros((d,d))]])
        nu=np.linalg.eigvals(1j*O@cov)
        assert max(abs(nu.imag))<1e-8
        nu=np.sort(nu.real)[d:]
        assert nu.min()>=.5-5e-7
        occ=np.maximum(nu-.5,0);pos=occ>1e-14
        return np.sum((1+occ[pos])*np.log1p(occ[pos])-occ[pos]*np.log(occ[pos]))
    S0=entropy(q0,p0);Sf=entropy(q,p)
    # Bogoliubov occupation relative to instantaneous Hamiltonian (per real mode).
    occ=(abs(p)**2/a**3+a*lam*abs(q)**2)/(2*instant_w)-.5
    assert min(occ)>-5e-7
    print(f'N={n} f={f:+.8f} H0/gap={ratio:g} a={a:.4f} w_range=[{wlo:.8f},{whi:.8f}] q_dec_range=[{qlo:.8f},{qhi:.8f}] H/H0={H/H0:.9f} a4rho/rho0={a**4*rho/rho0:.9f} mean_n={occ.mean():.7g} S0/cut={S0/n**2:.9f} Sf/cut={Sf/n**2:.9f} Friedmann_err={constraint:.2e} CCR_err={wronsk:.2e}',flush=True)
if __name__=='__main__':
    for n in (2,4):
        for f in (-theta,pi-theta):
            for ratio in (.1,1.):run(n,f,ratio)
    print('PASS finite lapse-constrained dynamical Gaussian FLRW tests; no acceleration in minimal action')
