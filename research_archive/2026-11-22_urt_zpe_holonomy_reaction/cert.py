"""Native fixed-holonomy reaction and scale stress. Standalone URT-ZPE.
Parent 1db1e26b62285468abbf0adcef5185da3764269c.
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, for declared ideal
plaquette constraint on original open cubic graph.

THEOREM: let B be edge-vertex incidence, C face-edge boundary, F native
plaquette phase. CB=0 and ker C=im B on the contractible cube complex.
E=Tr sqrt L; gauge invariance gives B^T j=0, j=partial_A E. Since
im C^T=(ker C)^perp, reaction exists: lambda=-(C^T)^+ j and
j+C^T lambda=0. Every other multiplier differs by ker C^T.
All allowed variations at fixed real lifted flux are pure gauge,
so the fixed-flux energy is constant on that orbit. This is constrained
stationarity, not proof of dynamical stabilization of free flux.
For prescribed F(t), dE/dt=-lambda^T dot F at fixed geometry;
this follows by contracting j=-C^T lambda with dot A.
The ideal constraint lambda^T(CA-F) vanishes on shell and has no
explicit metric derivative for frozen combinatorial holonomy.
For fixed carrier number and uniform proper scale a, E_phys=E/a
in reference units, rho=E/(M a^4), p=rho/3. Thus an ideal constraint
cannot supply negative pressure or select a stable density. A physical
source action and its stress/energy cannot be inferred from the
reaction multiplier alone; adding any metric-only energy leaves
the connection stationarity unchanged. Do not identify the
multiplier as an independent gravitational source.
No Cathedral ARFs or observed physical values used.

Executed locally: OPENBLAS_NUM_THREADS=1 python
/mnt/data/urt_holonomy/cert.py; exit 0; eight native cases.
N=2,3,4,5, f=-theta or pi-theta. Max residual 6.178e-16,
max independent virtual work finite difference error 6.690e-10,
pressure ratio 0.3333333356 in all eight cases.
Rank(C) 5,28,81,176; number of faces 6,36,108,240.
At N=5 the negative/positive sectors have multiplier norms
.0193884242/.0527438733 and flux-scaling work .6570049488/.5749973941.
Latest observed CI checkpoint 305 PASS d58dd09, not this certificate.
RESUME HERE: derive physical carrier/source equation beyond an ideal
flux constraint. A fixed-flux positive Maxwell term with fixed
dimensionless coefficient also scales as a^-4 in energy density;
it cannot select scale. Need a native mechanism that changes the
scale law, not another imposed flux or fitted stabilizing potential.
"""
import numpy as np
from itertools import product, combinations
from math import pi,sqrt

def native(n,f):
    xyz=list(product(range(n),repeat=3)); idx={x:i for i,x in enumerate(xyz)}
    edges=[]; phase=[]; lookup={}
    for x in xyz:
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y in idx:
                lookup[x,a]=len(edges);edges.append((idx[x],idx[y]));phase.append(f*x[(a-1)%3])
    i,j=np.array(edges).T;m=len(xyz);ne=len(i);B=np.zeros((ne,m));B[np.arange(ne),i]=1;B[np.arange(ne),j]=-1
    faces=[]
    for x in xyz:
        for a,b in combinations(range(3),2):
            if x[a]+1>=n or x[b]+1>=n:continue
            xa=list(x);xa[a]+=1;xb=list(x);xb[b]+=1
            row=np.zeros(ne);row[lookup[x,a]]=1;row[lookup[tuple(xa),b]]=1;row[lookup[tuple(xb),a]]=-1;row[lookup[x,b]]=-1;faces.append(row)
    return m,i,j,np.array(phase),B,np.array(faces)

def spectrum(m,i,j,A):
    D=np.zeros((len(i),m),complex);r=np.arange(len(i));D[r,i]=1;D[r,j]=-np.exp(1j*A)
    L=D.conj().T@D;lam,U=np.linalg.eigh(L);assert lam.min()>0
    w=np.sqrt(lam);V=(U/w)@U.conj().T
    return w.sum(),np.real(-1j*np.exp(1j*A)*V[j,i])

def run(n,f):
    m,i,j,A,B,C=native(n,f);ne=len(i);nf=len(C)
    assert np.max(abs(C@B))==0
    assert np.linalg.matrix_rank(B)==m-1
    assert np.linalg.matrix_rank(C)==ne-m+1
    E,jcur=spectrum(m,i,j,A);assert np.linalg.norm(jcur)>1e-8
    multiplier=np.linalg.lstsq(C.T,-jcur,rcond=None)[0]
    residual=np.linalg.norm(jcur+C.T@multiplier)
    assert residual<1e-11 and np.linalg.norm(B.T@jcur)<1e-11
    F=C@A;assert np.max(abs(abs(F)-abs(f)))<1e-12
    v=np.sin(np.arange(m)*.7);g=B@v
    assert np.linalg.norm(C@g)<1e-12 and abs(jcur@g)<1e-12
    eg,jg=spectrum(m,i,j,A+.3*g);assert abs(eg-E)<1e-10
    assert np.max(abs(jg-jcur))<1e-11
    h=1e-4;ep=spectrum(m,i,j,A*(1+h))[0];em=spectrum(m,i,j,A*(1-h))[0]
    fd=(ep-em)/(2*h);work=-multiplier@F
    assert abs(fd-work)<1e-5 and abs(jcur@A-work)<1e-11
    ap,am=1+h,1-h;pressure=-(E/ap-E/am)/(m*(ap**3-am**3));rho=E/m
    assert abs(pressure/rho-1/3)<1e-7
    print(f'N={n} f={f:+.9f} rank={ne-m+1}/{nf} E/M={rho:.10f} |j|={np.linalg.norm(jcur):.8e} |lambda|={np.linalg.norm(multiplier):.8e} residual={residual:.3e} flux_work={work:.10f} fd_error={abs(fd-work):.3e} p/rho={pressure/rho:.10f}',flush=True)

if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,3,4,5):
        for f in (-theta,pi-theta):run(n,f)
    print('PASS: eight native constrained reactions, exact incidence complex, gauge invariance, virtual work and scale pressure')
