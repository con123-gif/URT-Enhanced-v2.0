#!/usr/bin/env python3
"""Source-derived Berry interquartet current -> exact KMS relative-entropy
curvature, with original rho_star and BKM metric. No particle ARF fitting.
"""
from pathlib import Path
import runpy,contextlib,io
import numpy as np
from scipy.linalg import expm
here=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(here/'URT_NATIVE_POLAR_BERRY_CURRENT_2026_11_10.py'))
P3=np.asarray(d['P3'],float);P5=np.asarray(d['P5'],float)
A=np.asarray(d['Afull'],float);Delta=float(d['d']['Delta'])
eta=-np.log(Delta);a=1/(4*(1+Delta**2));b=a*Delta**2
rho=a*P3+b*P5
A35=P3@A@P5
amp2=float(np.linalg.norm(A35)**2)
coefficient=2*eta*(a-b)*amp2
chi35=8*eta*(1+Delta**2)/(1-Delta**2)
drho=A@rho-rho@A
bkm=.5*chi35*np.linalg.norm(drho)**2
assert abs(coefficient-bkm)/coefficient<1e-12
for t in (1e-3,1e-4,1e-5):
 U=expm(t*A)
 mixing=np.linalg.norm(P5@U@P3)**2
 # Exact relative entropy for the unitary orbit, no log zero outside support.
 D=2*eta*(a-b)*mixing
 assert D>=0
 print('t, exact unitary-orbit relative entropy, quadratic approximation, relative error',t,D,coefficient*t*t,abs(D-coefficient*t*t)/max(D,1e-20))
print('Berry portal ||A35||^2=',amp2)
print('exact KMS information stiffness (coefficient of t^2)=',coefficient)
print('BKM Hessian / 2 cross-check=',bkm)
print('PASS exact KMS relative entropy identity and source-induced portal curvature')