#!/usr/bin/env python3
"""Exact arithmetic prime-pair ground-state and gauge-sensitivity certificate.
Mathematical model only: neither physical vacuum nor dark energy is proved.
"""
import math, cmath
import numpy as np
import sympy as sp
import mpmath as mp
mp.mp.dps=65
phi=(1+mp.sqrt(5))/2; theta=2*mp.pi/phi**2
x=sp.Symbol('x'); z=sp.Symbol('z', nonzero=True)
A=sp.Matrix([[0,1,1,0],[1,0,0,z],[1,0,0,1],[0,1/z,1,0]])
assert sp.simplify(A.charpoly(x).as_expr()-(x**4-4*x**2+2-z-1/z))==0
def H(probs):
    return -sum(v*math.log(v) for v in probs if v>1e-14)
def spectrum(F,b):
    return [b+sign*2*fun(F/4) for fun in (mp.sin,mp.cos) for sign in (-1,1)]
for eps in (1,-1):
    c=eps*cmath.exp(-1j*float(theta)); f=cmath.phase(c)
    a=np.zeros((4,4),complex)
    for i,j,w in ((0,1,1),(0,2,1),(1,3,c),(2,3,1)):
        a[i,j]=w; a[j,i]=complex(w).conjugate()
    L=4*np.eye(4)-a
    v=np.array([1,cmath.exp(1j*f/4),cmath.exp(-1j*f/4),cmath.exp(-1j*f/2)])/2
    assert np.linalg.norm(L@v-(4-2*math.cos(f/4))*v)<2e-13
    M=np.array([[v[0],v[2]],[v[1],v[3]]])
    eig=np.linalg.svd(M,compute_uv=False)**2
    assert abs(H(eig)-H([(1+math.cos(f/4))/2,(1-math.cos(f/4))/2]))<1e-12
    assert np.allclose(abs(v)**2,np.ones(4)/4)
    g=np.diag(np.conj(v)/np.abs(v)); vg=g@v; ag=g@a@g.conj().T
    assert np.allclose(vg,np.ones(4)/2)
    assert abs(ag[1,3]*ag[3,2]*ag[2,0]*ag[0,1]-c)<1e-12
    assert np.allclose(np.linalg.eigvalsh(ag),np.linalg.eigvalsh(a))
    Mg=np.array([[vg[0],vg[2]],[vg[1],vg[3]]])
    assert H(np.linalg.svd(Mg,compute_uv=False)**2)<1e-12
    F=abs(f)
    for beta in (0.1,1,2,5):
        zd=np.exp(-beta*np.linalg.eigvalsh(L)).sum()
        zf=2*math.exp(-4*beta)*(math.cosh(2*beta*math.cos(F/4))+math.cosh(2*beta*math.sin(F/4)))
        assert abs(zd-zf)<1e-13
    print(f'eps={eps:+d} flux={F:.12f} fixed-basis I/2={H(eig):.12f} gauge-transformed I/2=0 diagonal-MI=0')
Fplus=theta; Fminus=mp.pi-theta
d2=mp.fsum(map(mp.sqrt,spectrum(Fplus,2)))-mp.fsum(map(mp.sqrt,spectrum(Fminus,2)))
d4=mp.fsum(map(mp.sqrt,spectrum(Fplus,4)))-mp.fsum(map(mp.sqrt,spectrum(Fminus,4)))
Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
p=Delta**2/(1+Delta**2)
s=mp.log(4)-p*mp.log(p)-(1-p)*mp.log(1-p)
assert abs(d4-mp.mpf('0.00447238082196126121825666874494'))<mp.mpf('1e-30')
assert abs(2*mp.pi*d4/s-mp.mpf('0.0202692636252846063435260066283'))<mp.mpf('1e-28')
assert s-2*mp.pi*d4>mp.log(2)
print('d2=',mp.nstr(d2,18),'d4=',mp.nstr(d4,18))
print('consistent horizon conditional ratio=',mp.nstr(2*mp.pi*d4/s,20))
print('corrected forced-correlation amount=',mp.nstr(s-2*mp.pi*d4,20))
print('PASS: exact charpoly, ground state, gauge non-invariance of naive I, Gibbs trace, corrected compression')
print('NO RH OR PHYSICAL ZPE/DARK ENERGY THEOREM')
