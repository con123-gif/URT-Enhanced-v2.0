#!/usr/bin/env python3
"""Falsification test: does polar+frozen Delta select the golden phase?
For any full-rank clock/history readout S, its polar U obeys U*U=P_h,
so the output KMS state is independent of the phase even when S changes.
The result is a mathematical sanity check, not a new physical law.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np
Hpath=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(Hpath/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
H=np.array(d['H'],float);P3=np.array(d['P3'],float);P5=np.array(d['P5'],float); P=P3+P5
Delta=float(d['Delta'])
F=P3+Delta*P5
rho0=(P3+Delta**2*P5)/(4*(1+Delta**2))

def overlap(shift):
 C=np.zeros((24,64))
 for j in range(24):
  a=j/24+shift;b=(j+1)/24+shift
  for h in range(64):
   C[j,h]=sum(max(0.,min(b,(h+1)/64+k)-max(a,h/64+k)) for k in range(3))
 return C

golden=(3-np.sqrt(5))/2
vals=[]
for shift in [0., 1/7, golden, np.sqrt(2)-1, .495]:
 C=overlap(shift)
 assert np.linalg.norm(C.sum(axis=1)-np.ones(24)/24)<1e-13
 assert np.linalg.norm(C.sum(axis=0)-np.ones(64)/64)<1e-13
 B=np.sqrt(24*64)*C
 S=B@H
 T=S.T@S
 w,V=np.linalg.eigh(T);keep=w>1e-10
 assert keep.sum()==8
 U=S@((V[:,keep]*(w[keep]**-.5))@V[:,keep].T)
 assert np.linalg.norm(U.T@U-P)<2e-10
 rho=F@U.T@U@F;rho/=np.trace(rho)
 assert np.linalg.norm(rho-rho0)<2e-10
 vals.append((shift,np.trace(P5@T)/np.trace(P@T),float(np.min(w[keep])),float(np.max(w[keep]))))
print('shift, raw p5, min_positive_Gram, max_positive_Gram')
for tup in vals: print(*tup)
assert np.ptp([v[1] for v in vals])>1e-3
print('all five polar readouts recover *identical* rho_star after externally fixed F')
print('PASS: minimum-disturbance polar isometry does not uniquely select the golden phase or KMS cost')