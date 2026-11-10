#!/usr/bin/env python3
"""Hidden-frame-invariant loop holonomy of URT 64->24->hidden8 polar source.
C(a) is the exact overlap of 24 equal clock arcs with 64 binary histories,
a ranging through one full period. U(a)=polar[B(a) H8] is canonical.
Construct parallel transport as ordered products of polar(U(a)^T U(a+da)).
This is an information-geometric Berry/Wilson holonomy, NOT physical alpha.
"""
from pathlib import Path
import contextlib,io,runpy,sys
import numpy as np
Hpath=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(Hpath/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
H=d['H'];P=d['P3']+d['P5'];ev,ee=np.linalg.eigh(P);E=ee[:,ev>.5];H8=H@E

def B_of(a):
    C=np.zeros((24,64))
    for j in range(24):
        lo=j/24+a;hi=(j+1)/24+a
        for h in range(64):
            for k in range(3):
                L=max(lo,h/64+k);R=min(hi,(h+1)/64+k)
                if R>L:C[j,h]+=R-L
    return np.sqrt(1536)*C

def polar(X):
    u,s,v=np.linalg.svd(X,full_matrices=False)
    if s.min()<1e-9:raise ValueError('readout loses rank at phase shift')
    return u@v,s

def loop(N):
    U0,_=polar(B_of(0)@H8);prev=U0
    hol=np.eye(8)
    min_sv=1.
    for j in range(1,N+1):
        U,ss=polar(B_of(j/N)@H8)
        min_sv=min(min_sv,ss.min())
        o,_=polar(prev.T@U)
        hol=hol@o
        prev=U
    assert np.linalg.norm(prev-U0)<3e-10
    assert np.linalg.norm(hol.T@hol-np.eye(8))<3e-9
    vals=np.linalg.eigvals(hol)
    angles=np.sort(np.angle(vals))
    return hol,angles,min_sv

for N in ((768,1536,3072,6144) if '--high' in sys.argv else (96,192,384,768)):
 H,angles,m=loop(N)
 print('steps',N,'holonomy distance from I',np.linalg.norm(H-np.eye(8)),
       'det',np.linalg.det(H),'minimum readout singular',m,
       'angles rad',np.round(angles,9).tolist())
print('PASS closed phase loop holonomy computation: original 64 binary histories, 24 clock, hidden source')