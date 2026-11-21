#!/usr/bin/env python3
"""Native 3D URT-ZPE: physical subsystem energy, seam work, entropy and modular test.
No parameters selected for closure. Use the existing free-boundary magnetic graph.
The de Sitter redshift comparison is a declared horizon interpretation, not a derived coupling.
"""
import math
import numpy as np
from scipy.linalg import eigh
import sympy as sp
THETA=2*math.pi/((1+math.sqrt(5))/2)**2
BETA=2*math.pi
def graph(n,f):
    L=np.zeros((n**3,n**3),complex); B=np.zeros_like(L)
    for z in range(n):
        for y in range(n):
            for x in range(n):
                i=x+n*(y+n*z)
                for d,(xx,yy,zz,power) in enumerate(((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y))):
                    if max(xx,yy,zz)>=n:continue
                    j=xx+n*(yy+n*zz); w=np.exp(1j*f*power)
                    for M in (L,B) if d==0 and x==n//2-1 else (L,):
                        M[i,i]+=1;M[j,j]+=1;M[i,j]-=w;M[j,i]-=w.conjugate()
    a=np.array([i for i in range(n**3) if i%n<n//2]);b=np.array([i for i in range(n**3) if i%n>=n//2])
    return L,B,a,b
def calc(n,eps):
    f=float(np.angle(eps*np.exp(-1j*THETA)));g=1-math.cos(abs(f)/4)
    L,B,a,b=graph(n,f); L0=L-B
    ev,U=eigh(L);assert ev[0]>=g-1e-10
    W=(U*np.sqrt(ev))@U.conj().T; V=(U/np.sqrt(ev))@U.conj().T
    assert abs(np.trace(B).real-2*n*n)<1e-10
    assert np.max(np.abs(L0[np.ix_(a,b)]))<1e-12
    def sub(ids):
        ix=np.ix_(ids,ids); A=L0[ix]; WA=W[ix]; VA=V[ix]
        e=eigh(A,eigvals_only=True); assert e[0]>=g-1e-10
        root=np.sqrt(e); E0=root.sum(); E=.5*np.trace(WA+A@VA).real; X=E-E0
        evv,Uv=eigh(VA);sqrtV=(Uv*np.sqrt(evv))@Uv.conj().T
        nu=np.sqrt(np.maximum(eigh(sqrtV@WA@sqrtV,eigvals_only=True),1))/2
        occ=nu-.5
        h=(1+occ)*np.log1p(occ)-occ*np.log(np.maximum(occ,1e-300));S=2*h.sum()
        logZ=-2*np.log(-np.expm1(-BETA*root)).sum()
        D=BETA*X+logZ-S
        assert X>=-1e-10 and D>=-1e-9
        comm=np.linalg.norm(WA@VA-VA@WA,'fro')/np.linalg.norm(WA@VA,'fro')
        return X,S,E0,logZ,D,comm
    XA,SA,E0A,ZA,DA,CA=sub(a); XB,SB,E0B,ZB,DB,CB=sub(b)
    Wjoin=np.sqrt(ev).sum()-E0A-E0B
    seam=.5*np.trace(B@V).real
    assert abs(SA-SB)<1e-8
    assert abs(XA+XB+seam-Wjoin)<1e-8
    assert Wjoin>=n*n/math.sqrt(12)-1e-8
    assert XA>=0 and XB>=0 and seam>0
    assert CA>1e-8
    print(f'{n} {eps:+d} S/A={SA/n**2:.12f} exA/A={XA/n**2:.12f} exB/A={XB/n**2:.12f} seam/A={seam/n**2:.12f} W/A={Wjoin/n**2:.12f} ',end='')
    print(f'2pi*exA/S={BETA*XA/SA:.12f} 2pi*W/S={BETA*Wjoin/SA:.12f} D/A={DA/n**2:.12f} logZ/A={ZA/n**2:.12f} comm={CA:.6g}')
    return SA,XA,DA
def identity():
    b,x,z,s=sp.symbols('beta X logZ S',real=True); d=b*x+z-s
    assert sp.simplify(b*x-s-(d-z))==0
    R,lP,sigma,ell=sp.symbols('R lP sigma ell',positive=True)
    assert sp.solve(sigma/ell**2-1/(4*lP**2),ell)==[2*lP*sp.sqrt(sigma)]
if __name__=='__main__':
    identity()
    for n in (2,4,6,8,10):
        for ep in (+1,-1):calc(n,ep)
    print('PASS: original 3D cut energy ledger, entropy from same vacuum, positive relative entropy, noncommuting physical covariance, horizon-scale algebra.')
