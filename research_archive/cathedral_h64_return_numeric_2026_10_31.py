#!/usr/bin/env python3
"""Numerical 64-state checks of exact H64 semigroup hidden return."""
import itertools,math
import numpy as np
from scipy.linalg import expm
phi=(1+math.sqrt(5))/2
u=np.array([(0,1,phi),(0,-1,phi),(1,phi,0),(-1,phi,0),
            (phi,0,1),(phi,0,-1)],float)/math.sqrt(1+phi**2)
states=np.array(list(itertools.product((-1.,1.),repeat=6)))
lookup={tuple(map(int,s)):i for i,s in enumerate(states)}
H=np.eye(64)*15
for i,s in enumerate(states):
    for j in range(6):
        for k in range(j+1,6):
            z=s.copy();z[j]*=-1;z[k]*=-1
            H[i,lookup[tuple(map(int,z))]]-=1
spec=np.linalg.eigvalsh(H)
assert np.allclose(np.unique(np.round(spec,8),return_counts=True)[1],[2,12,30,20])
x=states@u
Qgeo=np.sum(x*x,axis=1)
quad=np.column_stack([x[:,0]**2-x[:,1]**2,
    x[:,0]**2+x[:,1]**2-2*x[:,2]**2,
    x[:,0]*x[:,1],x[:,0]*x[:,2],x[:,1]*x[:,2]])
visible=np.column_stack([np.ones(64),np.prod(states,axis=1),states,quad])
assert np.linalg.matrix_rank(visible)==13
V,_=np.linalg.qr(visible)
P=V@V.T;R=np.eye(64)-P
assert np.linalg.norm(P@H@R)<1e-11
G=(V.T@np.diag(Qgeo)@R@np.diag(Qgeo)@V)
vals=np.sort(np.linalg.eigvalsh((G+G.T)/2))
target=np.array([19/5]*5+[8]*6+[12]*2)
assert np.allclose(vals,target,atol=1e-10)
lam=1. # only a numerical test; physical lambda NOT derived
Hg=H+lam*np.diag(Qgeo)
t=.015
E=expm(-t*Hg)
D=V.T@(E@E)@V-(V.T@E@V)@(V.T@E@V)
assert np.linalg.norm(D-V.T@E@R@E@V)<5e-13
assert np.linalg.eigvalsh((D+D.T)/2).min()>0
for t in [.0001,.00003,.00001]:
    E=expm(-t*Hg)
    D=V.T@E@R@E@V
    levels=np.sort(np.linalg.eigvalsh((D+D.T)/(2*t*t)))
    assert np.linalg.norm(levels-target)<.11
s=.15;t=.21
semigroup=np.linalg.norm(expm(-(s+t)*Hg)-expm(-s*Hg)@expm(-t*Hg))
wrong=np.linalg.norm(expm(-(s+t)**2*Hg)-expm(-s*s*Hg)@expm(-t*t*Hg))
assert semigroup<2e-13 and wrong>1e-2
print("PASS H8 spectrum 0^2,10^12,16^30,18^20")
print("PASS native H13/H51=13+51, G positive full rank")
print("PASS spectral 19/5(x5),8(x6),12(x2)")
print("PASS positive hidden-return composition identity and short-time limit")
print("PASS semigroup law; t^2 scaling violates it")
print("Residual semigroup:",semigroup,"wrong scaling:",wrong)
