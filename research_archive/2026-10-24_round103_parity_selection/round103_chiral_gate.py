#!/usr/bin/env python3
"""Round 103: independent exact parity / chiral-response gate (not Round 102 source)."""
import itertools
from math import cos, pi, sqrt, log, tanh, cosh, hypot, atan
import numpy as np
import sympy as sp

# Exact tetrahedral-frame orientation test: 24 orderings, 12 proper.
v=[sp.Matrix(t) for t in ((1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1))]
x=sp.Matrix.hstack(*(v[k]-v[0] for k in (1,2,3)))
perm=list(itertools.permutations(range(4)))
sign=lambda p:(-1)**sum(p[i]>p[j] for i in range(4) for j in range(i+1,4))
for p in perm:
    y=sp.Matrix.hstack(*(v[p[k]]-v[p[0]] for k in (1,2,3)))
    u=y*x.inv()
    assert u.T*u==sp.eye(3) and u.det()==sign(p)
a4=[p for p in perm if sign(p)==1]
assert len(a4)==12 and len(perm)==24
for q in perm:
    orbit={tuple(p[q[i]] for i in range(4)) for p in a4}
    assert len(orbit)==12 and all(sign(t)==sign(q) for t in orbit)

# General block spectral sign and L/R-swap identities.
i=np.eye(4); z=np.zeros((4,4)); r=np.block([[i,z],[z,-i]])
s=np.block([[z,i],[i,z]]); pl=np.block([[i,z],[z,z]])
a=np.diag([1.,2.,3.,4.]); c=np.diag([5.,6.,7.,8.])
b=np.arange(16,dtype=float).reshape(4,4)/10
h=np.block([[a,b],[b.T,c]])
assert np.allclose(np.linalg.eigvalsh(h),np.linalg.eigvalsh(r@h@r))
assert np.allclose(np.linalg.eigvalsh(h),np.linalg.eigvalsh(s@h@s))
assert np.allclose((pl@s@h@s@pl)[:4,:4],c)

# Native hidden 4+4 rho*, complex structure J, plus/minus chiral states.
phi=(1+sqrt(5))/2; delta=3/20-80*pi/(1053*phi)
eta=-log(delta); p5=delta**2/(1+delta**2)
a=1/(4*(1+delta**2)); b=delta**2*a
rho=np.diag([a]*4+[b]*4)
j=np.block([[z,i],[-i,z]]); m=-1j*j
assert np.allclose(j@j,-np.eye(8)) and np.allclose(r@j@r,-j)
for orientation in (-1,1):
    state=rho+orientation*1j*sqrt(a*b)*j
    assert np.allclose(np.sort(np.linalg.eigvalsh(state)),[0.]*4+[.25]*4)
    assert np.allclose(np.diag(state),np.diag(rho))
h2=-(1-p5)*log(1-p5)-p5*log(p5)
chi=tanh(eta)/eta
logrho=np.diag([log(a)]*4+[log(b)]*4)
for source in (0,0.1,1,6):
    eig,vec=np.linalg.eigh(logrho+source*m)
    exp_eig=np.exp(eig)
    state=(vec*exp_eig)@vec.conj().T/exp_eig.sum()
    q=hypot(eta,source)
    assert abs(exp_eig.sum()-cosh(q)/cosh(eta))<1e-11
    assert abs(np.trace(state@m).real-source*tanh(q)/q)<1e-11

# Koide determinant gate: observable input only for comparison.
def determinant(d): return (sqrt(2)*cos(3*d)-1)/2
def ratio(d,k):
    x=lambda n:1+sqrt(2)*cos(d+2*pi*n/3)
    return (x(k)/x(1))**2
old=0.212; inferred=0.222222047073088
print('PASS: A4 parity 12+12 and unitary block identities')
print('Delta:',delta,'eta:',eta,'H2(p5):',h2,'chiral susceptibility:',chi)
print('old mu/e:',ratio(old,2),'inferred mu/e:',ratio(inferred,2))
print('required delta shift:',inferred-old,'determinant shift:',determinant(inferred)-determinant(old))
print('native KMS chiral phase:',-atan(54*sqrt(15)*delta/(699+655*delta**2)))
print('SCOPE: no choice of chirality or physical Koide phase derived')
