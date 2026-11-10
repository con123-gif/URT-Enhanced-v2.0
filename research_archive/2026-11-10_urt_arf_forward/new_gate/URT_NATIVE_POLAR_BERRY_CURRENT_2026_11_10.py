#!/usr/bin/env python3
"""Source-derived Berry connection of the 8D polar URT history-clock readout.
Uses exact piecewise derivative of the 24-bin/64-history overlap at golden phase.
No history ARF coefficients or fitted coupling used. This is a statistical
source-phase connection, NOT yet a physical gauge-current identification.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np
from scipy.linalg import solve_sylvester
Hpath=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(Hpath/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
H=np.asarray(d['H'],float);P3=np.asarray(d['P3'],float);P5=np.asarray(d['P5'],float);P=P3+P5
lam,E=np.linalg.eigh(P);V=E[:,lam>.5]
assert V.shape==(20,8)
H8=H@V

def overlap_and_derivative(a):
    C=np.zeros((24,64));Cp=np.zeros((24,64))
    for j in range(24):
        lo=j/24+a;hi=(j+1)/24+a
        for h in range(64):
            for k in range(3):
                left=h/64+k;right=(h+1)/64+k
                L=max(lo,left);R=min(hi,right)
                if R>L:
                    C[j,h]+=R-L
                    Cp[j,h]+=float(hi<right)-float(lo>left)
    return np.sqrt(1536)*C,np.sqrt(1536)*Cp

def polar(S):
    t,V=np.linalg.eigh(S.T@S)
    assert t.min()>1e-8
    inv=(V*(t**(-.5)))@V.T
    return S@inv,(V*np.sqrt(t))@V.T

a=(3-np.sqrt(5))/2
B,Bp=overlap_and_derivative(a)
S=B@H8;Sp=Bp@H8
U,R=polar(S)
AA=U.T@Sp-Sp.T@U
A=solve_sylvester(R,R,AA)
assert np.linalg.norm(A+A.T)<1e-10
assert np.linalg.norm(R@A+A@R-AA)<1e-10
for eps in (1e-4,1e-5,1e-6):
    Sm=overlap_and_derivative(a-eps)[0]@H8
    Sp_=overlap_and_derivative(a+eps)[0]@H8
    Um,_=polar(Sm);Up,_=polar(Sp_)
    A_fd=U.T@(Up-Um)/(2*eps)
    err=np.linalg.norm(A_fd-A)
    print('eps, finite-difference Berry connection residual:',eps,err)
assert err<1e-4
Afull=V@A@V.T
cross=P3@Afull@P5
within3=P3@Afull@P3
within5=P5@Afull@P5
print('source Berry connection ||A||_F=',np.linalg.norm(A))
print('3-5 interquartet ||P3 A P5||_F=',np.linalg.norm(cross))
print('intraquartet norms 3,5=',np.linalg.norm(within3),np.linalg.norm(within5))
print('source singular values',np.linalg.svd(S,compute_uv=False))
print('connection eigenvalues imaginary parts',np.imag(np.linalg.eigvals(A)))
print('PASS exact-bin derivative plus Sylvester current; original 64-history/24-clock/5-solid source')