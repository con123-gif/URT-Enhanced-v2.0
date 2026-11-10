#!/usr/bin/env python3
"""Exact A5 antipodal C3 and q=2 24-clock pairing; no-fit tests.
Imports original five-solid face-edge/dual-pair theorem and exact cubic source.
Does not derive a physical fermion vertex or any historical ARF.
"""
from pathlib import Path
import contextlib, io, runpy
import numpy as np
import sympy as s
root=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(root/'URT_DUAL_PAIR_QUARTET_2026_11_10.py'))
    cubic=runpy.run_path(str(root/'URT_DARK_THREE_CHANNEL_CUBIC_TENSOR_2026_11_10.py'))
assert cubic['T']['ddd']==cubic['K'](s.Rational(3,128))
Pi,R,Te3,Te5=(d[k] for k in ('Pi','R','Te3','Te5'))
edges=d['edges'];anti=d['anti'];ei={x:i for i,x in enumerate(edges)}
A=s.zeros(30)
for j,(u,v) in enumerate(edges):
    A[ei[tuple(sorted((anti[u],anti[v])))],j]=1
Pe=(s.eye(30)+A)/2
V=Pi.T*R/2
assert V*V.T==V.T*V==Pe and V**3==Pe and V.T==V**2
assert V*Te3==s.zeros(30,20) and V*Te5==Te5
P1=(Pe+V+V**2)/3
assert P1.trace()==5 and P1*P1==P1
assert s.simplify(P1-s.ones(30,30)/30-Te5*Te5.T)==s.zeros(30)
assert V.eigenvals()=={0:15,1:5,(-1-s.I*s.sqrt(3))/2:5,(-1+s.I*s.sqrt(3))/2:5}
partner=[next(j for j in range(30) if A[j,i]==1) for i in range(30)]
classes=[];seen=set()
for i in range(30):
    if i not in seen:
        classes.append((i,partner[i]));seen.update((i,partner[i]))
assert len(classes)==15
lookup={e:j for j,c in enumerate(classes) for e in c}
perm=[]
for a,b in classes:
    out=[j for j in range(30) if V[a,j]!=0]
    assert len(out)==2 and lookup[out[0]]==lookup[out[1]]
    perm.append(lookup[out[0]])
assert sorted(perm)==list(range(15))
seen=set();cycles=[]
for i in range(15):
    if i not in seen:
        c=[];j=i
        while j not in seen:
            seen.add(j);c.append(j);j=perm[j]
        assert j==i;cycles.append(c)
assert len(cycles)==5 and all(len(c)==3 for c in cycles)
q=2;N=24;rng=np.random.default_rng(20261110)
theta=rng.uniform(-.7,.7,N);lam=rng.uniform(-.4,.4,N)
def shift8(t):
    T=np.zeros((N,N),complex)
    for j in range(N):
        T[j,(j+8)%N]=np.exp(-1j*q*sum(t[(j+k)%N] for k in range(8)))
    return T
U=np.diag(np.exp(1j*q*lam));W=np.kron(U,np.eye(30))
X=np.kron(shift8(theta),np.array(V,float))
Xg=np.kron(shift8(theta+np.roll(lam,-1)-lam),np.array(V,float))
P=np.kron(np.eye(N),np.array(Pe,float));I=np.eye(720)
Theta=sum(theta);hol=np.exp(-1j*q*Theta)
assert np.linalg.norm(Xg-W@X@W.conj().T)<1e-11
assert np.linalg.norm(X.conj().T@X-P)<1e-11
assert np.linalg.norm(np.linalg.matrix_power(X,3)-hol*P)<1e-11
assert abs(np.trace(X))<1e-11 and abs(np.trace(X@X))<1e-11
z=1.37+.19j  # arbitrary off-pole test point, not a mass input
G=(I-P)/z+(z*z*P+z*X+X@X)/(z**3-hol)
assert np.linalg.norm((z*I-X)@G-I)<1e-10
assert np.linalg.norm(G@(z*I-X)-I)<1e-10
Q3=np.kron(np.eye(N),np.array(Te3*Te3.T,float))
Q5=np.kron(np.eye(N),np.array(Te5*Te5.T,float))
roots=[np.exp(-1j*q*Theta/3)*np.exp(2j*np.pi*j/3) for j in range(3)]
projectors=[]
for rho in roots:
    J=(P+X/rho+(X@X)/(rho*rho))/3
    assert np.linalg.norm(J@J-J)<1e-10
    assert np.linalg.norm(J-J.conj().T)<1e-10
    assert abs(np.trace(J)-120)<1e-10
    assert abs(np.trace(J@Q5)-32)<1e-10
    assert np.linalg.norm(J@Q3)<1e-10
    projectors.append(J)
assert np.linalg.norm(sum(projectors)-P)<1e-10
K=X+X.conj().T;L=np.kron(np.diag(lam),np.eye(30))
K1=1j*q*(L@K-K@L)
K2=-q*q*(L@L@K-2*L@K@L+K@L@L)
b=rng.normal(size=720)+1j*rng.normal(size=720)
b1=1j*q*L@b;b2=-q*q*L@L@b
first=2*np.vdot(b1,K@b).real+np.vdot(b,K1@b).real
contacts=[2*np.vdot(b2,K@b).real,2*np.vdot(b1,K@b1).real,
          4*np.vdot(b1,K1@b).real,np.vdot(b,K2@b).real]
assert abs(first)<1e-9 and abs(sum(contacts))<1e-8
assert abs(np.vdot(b,K@b)-np.vdot(W@b,(Xg+Xg.conj().T)@(W@b)))<1e-9
h=2e-4;dg=np.roll(lam,-1)-lam
Xp=np.kron(shift8(theta+h*dg),np.array(V,float))
Xm=np.kron(shift8(theta-h*dg),np.array(V,float))
Kp=Xp+Xp.conj().T;Km=Xm+Xm.conj().T
assert np.linalg.norm((Kp-Km)/(2*h)-K1)<1e-6
assert np.linalg.norm((Kp+Km-2*K)/h**2-K2)<1e-5
print('PASS original 190 cochains, 64 histories and exact A5 cubic regression')
print('PASS five geometric 3-cycles, V^3=P_even, fixed space 1+4_5')
print('PASS q=2 24-clock Wilson covariance, rank 360, three rank-120 residues')
print('PASS 4_5 contributes rank 32 per auxiliary pole; 4_3 contributes zero')
print('PASS first and four second Ward contacts, finite differences')
print('second contacts',contacts,'sum',sum(contacts))
print('OPEN H13+H51 physical vertex, Schur/fermion-loop join, four ARFs')
