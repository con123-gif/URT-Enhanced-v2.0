"""URT-ZPE standalone connection response (2026-11-22).
Parent f31d24008c22ffb89195815ce85cb4c65a8d45e5; native incidence of d58dd09.
Status CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for fixed graph,
free link phase variations, Gaussian oscillator. No ARFs.

E(A)=Tr sqrt L(A), L=D^dag D, W=sqrt L, V=W^-1. On each flux sector
L>0. j_e=Tr(V partial_e L)/2. B is the real oriented edge incidence.
Gauge conjugation L(A+B lambda)=G L(A) G^dag implies B^T j=0 and Hess(E)B=0,
including at nonstationary phases. For A+s v write L+s K+s² Q. The vacuum
pair vertex in L eigenbasis is T_mn=K_mn/sqrt(w_m w_n). The Euclidean
quadratic coefficient for prescribed time-varying spatial-link s (temporal
gauge, no external factor 1/2) is C(nu)=Tr(V Q)/2 -
sum |T_mn|²(w_m+w_n)/(4*((w_m+w_n)²+nu²)). This follows from complex
Gaussian log determinant or oscillator pairs plus the second-order
contact term. C(0) matches static energy; inertia=sum |T|²/[4(w_m+w_n)^3].
Nonzero-frequency longitudinal variations are not pure spacetime gauge
unless accompanied by the temporal connection. No full dynamical gauge
action or gravitational exchange asserted. Uniform spatial dilation at
fixed carriers gives E(s,A)=exp(-s) E(0,A), so its mixed scale/phase
derivative is -j, not an independent force.

Exact strict global flux energy ordering: take c >= max degree and
M_A=c I-L_A. Its entrywise absolute values equal M_0>=0. Each closed
walk in Tr M_A^k has a nonnegative weight times a unit holonomy. Pair
reversed walks; Tr M_A^k <= Tr M_0^k for all k. If there is any
nontrivial cycle holonomy the inequality is strict at its length.
Therefore Tr exp(-t L_A)<Tr exp(-t L_0) for all t>0. Using
sqrt(x)=1/(2 sqrt(pi)) integral_0^infty (1-exp(-tx)) t^-3/2 dt
proves E(A)>E(0) for every non-flat connection on this finite connected
graph. Equality iff all cycle holonomies trivial (pure gauge). Zero
frequency mode at flat connection is handled by continuity of sqrt;
no assertion of a normalizable flat Gaussian ground state. This is
a theorem of the bare oscillator, NOT a theorem about full URT with
a constraint or connection self-energy. Fixed nonzero plaquette flux
on a simply connected open cube admits only gauge differences when
all plaquette fluxes are held fixed mod 2pi; allowing independent
plaquette fluctuations is a different model. Both native fluxes
are nonstationary in the tested finite cubes under free link variation.

Local actual execution: /mnt/data/urt_connection_20261122/cert.py,
OPENBLAS_NUM_THREADS=1 python cert.py (exit 0). Eight cases, four
directional FD checks per case; max static response FD error 2.219e-8.
N=2,3,4,5 energy densities (f=-theta,+pi-theta,flat):
1.6481345552 1.6190400027 1.5865163072
1.9195530022 1.9090358102 1.8949915189
2.0454328219 2.0372373859 2.0295773379
2.1185366692 2.1112378214 2.1058879736
Corresponding gradient norms:
.0441900876 .2201773794
.0187046909 .0709452382
.0237734172 .0596309187
.0262198814 .0654221194
Positive transverse inertia all eight; negative static transverse
curvature in all tested flux-scaling directions. A nonzero gradient
already establishes nonstationarity, independent of curvature.
Prior remote summary checkpoint 305 PASS d58dd09 at 06:37 UTC;
f31d240 and this certificate remote verification not yet confirmed.

RESUME HERE: preserve primitive nonzero holonomy as a declared
constraint while investigating a native source/carrier action that
provides its reaction force and energy ledger. Derive temporal
connection/shift and the coupled current-stress response for that
action; do not add a fitted stabilization potential or claim that
the unconstrained oscillator yields a cosmological constant.
"""
import numpy as np
from math import sqrt,pi
from itertools import product

def native(n,f):
    xyz=list(product(range(n),repeat=3)); idx={x:i for i,x in enumerate(xyz)}
    src=[];dst=[];phase=[]
    for x in xyz:
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y not in idx:continue
            src.append(idx[x]);dst.append(idx[y]);phase.append(f*x[(a-1)%3])
    return len(xyz),np.array(src),np.array(dst),np.array(phase)

def make(m,i,j,a):
    D=np.zeros((len(i),m),complex);r=np.arange(len(i));D[r,i]=1;D[r,j]=-np.exp(1j*a)
    return D.conj().T@D

def check(n,f):
    m,i,j,a=native(n,f);ne=len(i);L=make(m,i,j,a);lam,U=np.linalg.eigh(L);assert lam.min()>0
    w=np.sqrt(lam);V=(U/w)@U.conj().T;sp=w[:,None]+w[None,:];wp=w[:,None]*w[None,:]
    u=np.exp(1j*a);r=np.arange(ne)
    grad=np.real(-1j*u*V[j,i]);B=np.zeros((ne,m));B[r,i]=1;B[r,j]=-1
    assert np.max(abs(B.T@grad))<2e-12
    def vertices(v):
        K=np.zeros_like(L);Q=np.zeros_like(L)
        K[i,j]=-1j*u*v;K[j,i]=K[i,j].conj()
        Q[i,j]=u*v*v/2;Q[j,i]=Q[i,j].conj()
        return K,Q
    def energy(a):return np.sqrt(np.maximum(np.linalg.eigvalsh(make(m,i,j,a)),0)).sum()
    def eval_mode(v):
        K,Q=vertices(v);T=(U.conj().T@K@U)/np.sqrt(wp)
        tad=np.trace(V@Q).real/2
        c=tad-np.sum(abs(T)**2/sp)/4
        inertia=np.sum(abs(T)**2/sp**3)/4
        h=.003;ep=energy(a+h*v);em=energy(a-h*v);e0=w.sum()
        d1=(ep-em)/(2*h);d2=(ep+em-2*e0)/(2*h*h)
        assert abs(d1-grad@v)<3e-6 and abs(d2-c)<3e-6
        return c,inertia,abs(d2-c)
    g=B@np.cos(np.arange(m)*.71);g/=np.linalg.norm(g)
    cg,kg,eg=eval_mode(g);assert abs(cg)<2e-12
    v=a/f;v/=np.linalg.norm(v);cv,kv,ev=eval_mode(v)
    cm,km,em=eval_mode(v+g);assert abs(cm-cv)<2e-12
    ng=np.linalg.norm(grad);assert ng>1e-8
    E=w.sum();Eflat=energy(np.zeros_like(a));Edown=energy(a-.01*grad/ng)
    assert Eflat<E and Edown<E
    proj=v-B@np.linalg.lstsq(B,v,rcond=None)[0];proj/=np.linalg.norm(proj)
    ct,kt,et=eval_mode(proj);assert kt>0
    print(f'N={n} f={f:+.9f} E/M={E/m:.10f} flat/M={Eflat/m:.10f} |grad|={ng:.10f} flux_slope={grad@v:+.10f} gauge_static={cg:+.3e} transverse_C={ct:+.10f} transverse_inertia={kt:.10f} descent={E-Edown:.10f} max_fd_err={max(eg,ev,em,et):.3e}')

if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,3,4,5):
        for f in (-theta,pi-theta):check(n,f)
    print('PASS: eight native cases, static gauge Ward and mixed Ward, phase gradient/Hessian, positive transverse inertia, strict native energy descent')
