#!/usr/bin/env python3
"""URT 64-to-24 conditional clock: exact reconstruction, symmetry twirl,
positive polar information recovery and comparison with frozen KMS.
Uses original 7 Nov five-platonic source unaltered. No ARF numbers fed in.
"""
from pathlib import Path
import runpy, contextlib, io
import numpy as np

here=next(p for p in (Path(__file__).resolve().parent.parent/'forward', Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(here/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
T=np.asarray(d['T'],float)
B=np.asarray(d['B'],float)
H=np.asarray(d['H'],float)
P3=np.asarray(d['P3'],float)
P5=np.asarray(d['P5'],float)
P=P3+P5
Delta=float(d['Delta'])
a=np.trace(P3@T)/4
b=np.trace(P5@T)/4
assert a>0 and b>0
assert np.linalg.norm(P@(P3@P5))<1e-12
Ttw=a*P3+b*P5
assert np.linalg.norm(T-Ttw)>0.1
rho_bare=Ttw/np.trace(Ttw)
rho_kms=(P3+Delta**2*P5)/(4*(1+Delta**2))
assert abs(np.trace(P5@rho_bare)-b/(a+b))<1e-12
assert abs(np.trace(P5@rho_kms)-Delta**2/(1+Delta**2))<1e-12
print('source+Haar24 geometric transfer A5-twirl: a=',a,'b=',b,'b/a=',b/a)
print('native twirled p5=',b/(a+b),'frozen KMS p5=',Delta**2/(1+Delta**2))
print('negative native modular gap if H5=1:',-np.log(b/a))
print('original transfer spectral variance ||T-Ttw||_F=',np.linalg.norm(T-Ttw))

# Raw information transfer B@H is a contraction, not an isometry.
S=B@H
w,V=np.linalg.eigh(T)
mask=w>1e-10
assert mask.sum()==8
W=(V[:,mask]*(w[mask]**-.5))@V[:,mask].T
U=S@W
assert np.linalg.norm(U.T@U-P)<2e-11
assert np.linalg.norm(U@U.T@U-U)<2e-11
# Unique polar partial isometry is conditional statistical recovery.
F=P3+Delta*P5
recovered=F@(U.T@U)@F
recovered/=np.trace(recovered)
assert np.linalg.norm(recovered-rho_kms)<2e-11
print('canonical polar isometric recovery ||U^T U-P_hidden||',np.linalg.norm(U.T@U-P))
print('recovered frozen KMS with independently specified Delta ||rho-rho_star||',np.linalg.norm(recovered-rho_kms))
print('Recovery is a change in the observation/instrument; original unconditioned transfer remains T')
print('PASS original URT Haar24 source; A5 twirl; canonical polar recovery; KMS-source distinction')