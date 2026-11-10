#!/usr/bin/env python3
"""Gauge covariance of phase-loop Wilson transport for URT information readout.
Correct transported overlap includes the 24-clock site-link D_j D_{j+1}^*;
periodic hidden O(8) changes only the Wilson-frame conjugacy class.
This checks a statistical Berry/Wilson candidate, not electromagnetic alpha.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np
Hpath=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(Hpath/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
H=np.array(d['H'],float);P=d['P3']+d['P5'];v,W=np.linalg.eigh(P);H8=H@W[:,v>.5]

def polar(Y):
 u,s,v=np.linalg.svd(Y,full_matrices=False)
 return u@v

def S_of(a):
 C=np.zeros((24,64))
 for j in range(24):
  lo=j/24+a;hi=(j+1)/24+a
  for h in range(64):
   for k in range(3):
    l=max(lo,h/64+k);rr=min(hi,(h+1)/64+k)
    if rr>l:C[j,h]+=rr-l
 return np.sqrt(1536)*C@H8

def D_of(a):
 j=np.arange(24)
 return np.diag(np.exp(1j*(j+1)/17*np.sin(2*np.pi*a)))

def V_of(a):
 angle=.4*np.sin(2*np.pi*a)
 M=np.eye(8)
 M[0,0]=np.cos(angle);M[1,1]=np.cos(angle)
 M[0,1]=-np.sin(angle);M[1,0]=np.sin(angle)
 return M

def walk(N):
 U0=polar(S_of(0));before=U0;G0=D_of(0)@U0@V_of(0);old=G0;Dold=D_of(0)
 Hraw=np.eye(8,dtype=complex);Hcov=np.eye(8,dtype=complex);Hbad=np.eye(8,dtype=complex)
 for k in range(1,N+1):
  a=k/N
  U=polar(S_of(a));D=D_of(a);V=V_of(a);Gt=D@U@V
  L0=polar(before.conj().T@U)
  Lcov=polar(old.conj().T@(Dold@D.conj().T)@Gt)
  Lbad=polar(old.conj().T@Gt)
  Hraw=Hraw@L0;Hcov=Hcov@Lcov;Hbad=Hbad@Lbad
  before=U;old=Gt;Dold=D
 assert np.linalg.norm(old-G0)<2e-9
 return Hraw,Hcov,Hbad
N=384
H0,Hc,Hbad=walk(N)
assert np.linalg.norm(H0-Hc)<2e-10,(np.linalg.norm(H0-Hc))
print('canonical Wilson vs gauge transported Wilson difference',np.linalg.norm(H0-Hc))
print('ungauged naive Wilson difference under changing output-clock frame',np.linalg.norm(H0-Hbad))
print('nontrivial hidden frame-invariant holonomy: distance from identity',np.linalg.norm(H0-np.eye(8)))
print('unit determinant check',np.linalg.det(H0))
print('PASS gauge-covariant clock-link Wilson and periodic hidden-frame equivariance')