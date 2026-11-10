#!/usr/bin/env python3
"""Original Cathedral Hodge relative operator -> exact nonnegative
five-solid bridge graph, local compact U(1)^5 Stueckelberg Ward closure,
and harmonic-only screening on the native 24-clock.

No physical ARF targets, fitted coefficients or third-party YM work.
The intersolid bridge fields are an explicit extension, not present in
bare original URT chronology. The final four response values are candidate
mathematical traces, not gauge or fermion observables.
"""
from itertools import combinations
import sympy as sp
import numpy as np
import mpmath as mp

E=[6,12,12,30,30]  # native five Platonic edge counts = Tr D_s^2/8
N=5; T=24
P=sp.eye(N)-sp.ones(N)/N
M=P*sp.diag(*E)*P
B=sp.zeros(N,N*(N-1)//2)
pairs=list(combinations(range(N),2))
weights=[]
for k,(i,j) in enumerate(pairs):
    B[i,k]=-1; B[j,k]=1
    w=sp.Rational(E[i]+E[j]-sum(E)/N,N)
    weights.append(w)
    assert w>=0
W=sp.diag(*weights)
assert B*W*B.T==M
assert len([w for w in weights if w>0])==8
assert M*sp.ones(N,1)==sp.zeros(N,1)
assert M.trace()==72
x=sp.symbols('x')
assert sp.factor(M.charpoly(x).as_expr()-x*(x-12)*(x-30)*(5*x*x-150*x+864)/5)==0
assert all(sp.simplify(v)>0 for v in [12,30,15-3*sp.sqrt(145)/5,15+3*sp.sqrt(145)/5])

# Native 24 periodic difference (Df)_t=f_{t+1}-f_t.
D=sp.zeros(T,T)
for t in range(T):
    D[t,t]=-1
    D[t,(t+1)%T]=1
assert D*sp.ones(T,1)==sp.zeros(T,1)
# Real exact gauge invariant covariant bridge curvature
# C = (B^T tensor I) A - (I_edges tensor D) chi
C=sp.kronecker_product(B.T,sp.eye(T)).row_join(
    -sp.kronecker_product(sp.eye(len(pairs)),D))
G=sp.kronecker_product(sp.eye(N),D).col_join(sp.kronecker_product(B.T,sp.eye(T)))
assert C*G==sp.zeros(len(pairs)*T,N*T)

# Local compact Wilson action: S = sum_{e,t} w_e [1-cos(C_e,t)].
# The exact current and diamagnetic contact Ward identities follow from CG=0.
Cf=np.array(C,dtype=float); Gf=np.array(G,dtype=float)
wvec=np.repeat(np.array([float(w) for w in weights]),T)
rng=np.random.default_rng(20261110)
A=rng.normal(scale=.2,size=(N,T)); chi=rng.normal(scale=.2,size=(len(pairs),T))
lam=rng.normal(scale=.5,size=(N,T))
fields=np.r_[A.ravel(),chi.ravel()]
curv=Cf@fields
fields2=fields+Gf@lam.ravel()
assert np.max(np.abs(Cf@fields2-curv))<1e-13
S=lambda z:np.sum(wvec*(1-np.cos(Cf@z)))
assert abs(S(fields2)-S(fields))<1e-12
J=Cf.T@(wvec*np.sin(curv))
H=Cf.T@((wvec*np.cos(curv))[:,None]*Cf)
assert np.max(np.abs(Gf.T@J))<1e-12
assert np.max(np.abs(H@Gf))<1e-12
# Ward contact is cos(C); dropping the second derivative breaks the identity
# at nonzero background if one keeps only a source bubble approximation.

# Integrating/minimizing the real linearized link phases chi over 24 steps
# projects each edge curvature to its time average. This is exact for the
# quadratic Hessian in the zero-winding sector.
Atrial=rng.normal(size=(N,T))
Y=np.array(B.T,dtype=float)@Atrial
# Construct periodic chi from each edge's zero-mean time series.
chi_opt=np.zeros_like(Y)
for k in range(len(pairs)):
    y=Y[k]-Y[k].mean()
    # D chi=y, choose chi[0]=0, then chi[t+1]=chi[t]+y[t].
    for t in range(T-1):chi_opt[k,t+1]=chi_opt[k,t]+y[t]
    assert np.max(np.abs(np.roll(chi_opt[k],-1)-chi_opt[k]-y))<1e-12
res=Y-(np.roll(chi_opt,-1,axis=1)-chi_opt)
assert np.max(np.abs(res-Y.mean(axis=1,keepdims=True)))<1e-12
quad=lambda z:np.sum(wvec*(Cf@z)**2)/2
z=np.r_[Atrial.ravel(),chi_opt.ravel()]
Smin=quad(z)
Mfloat=np.array(M,dtype=float)
Sanalytic=np.sum([Atrial[:,t]@Mfloat@Atrial[:,u] for t in range(T) for u in range(T)])/(2*T)
assert abs(Smin-Sanalytic)<1e-11
# In Fourier space the gauge-covariant Schur complement is M tensor P0,
# not M tensor I24. All 23 nonzero clock frequencies are screened.
P0=sp.ones(T)/T
assert P0*D==sp.zeros(T,T)
assert P0*P0==P0
# Rank: 8 positive-weight edges * 23 nonzero clock modes + rank B_active=4
Bactive=B[:,[i for i,w in enumerate(weights) if w>0]]
assert Bactive.rank()==4
assert len([w for w in weights if w>0])*(T-1)+Bactive.rank()==188

# Quantify consequence for the PREVIOUS candidate mathematical 64x24
# resolvent: old M on every clock mode versus gauge-completed M on P0.
# This is an algebraic comparison, NOT a physical charged-current Ward proof.
mp.mp.dps=65
phi=(1+mp.sqrt(5))/2
r=mp.pi/mp.e
theta=2*mp.pi/phi**2
lams=[15-3*mp.sqrt(145)/5,mp.mpf(12),15+3*mp.sqrt(145)/5,mp.mpf(30)]
energies=[(0,2),(10,12),(16,30),(18,20)]
clock=[r*r*(2-2*mp.cos(2*theta-2*mp.pi*m/T)) for m in range(T)]
old=[];screened=[]
for lam in lams:
    old.append(sum(d/(e+lam+u) for e,d in energies for u in clock)/(64*T))
    screened.append(sum(d/(e+(lam if m==0 else 0)+u) for e,d in energies for m,u in enumerate(clock))/(64*T))
assert all(a>0 and b>a for a,b in zip(old,screened))
assert all(screened[i]>screened[i+1] for i in range(3))
print('Hodge trace E:',E,'sum',sum(E),'mean',sp.Rational(sum(E),5))
print('bridge weights (tet,cube,oct,dod,ico):',[(pairs[k],str(weights[k])) for k in range(len(pairs))])
print('M = B W B^T = P diag(E) P: exact')
print('spectrum M: 0, 12, 30, 15±3sqrt(145)/5 (exact)')
print('compact U(1)^5 gauge invariance: C G=0 exactly')
print('nonlinear Wilson current Ward G^T J=0, contact-inclusive Hessian H G=0: verified')
print('24-clock Stueckelberg elimination: H_eff=M tensor (J24/24) exactly')
print('rank nonzero bridge curvature',188,'screened clock frequencies',23,'relative holonomy modes',4)
for i,(a,b) in enumerate(zip(old,screened),1):
    print('mode',i,'old all-clock Green',mp.nstr(a,24),'bridge-screened scalar trace (not gauge observable)',mp.nstr(b,24),'difference',mp.nstr(b-a,20))
print('PASS: no-fit original Hodge bridge and exact gauge Ward screening; physical ARFs remain unproved')