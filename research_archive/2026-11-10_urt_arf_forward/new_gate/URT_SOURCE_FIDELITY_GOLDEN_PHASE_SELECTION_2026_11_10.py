#!/usr/bin/env python3
"""EXHAUSTIVE eight-piece no-fit test of whether the actual all-five-solid
URT hidden source selects the golden relative clock offset by maximizing or
minimizing raw faithful source overlap fidelity ||B(a)H||_F**2.

Any 24x64 bin overlap B(a) is affine on each k/192 <= a <=(k+1)/192,
clock row covariance makes the source fidelity 1/24 periodic, hence eight
quadratics (k=0,...,7) determine every a. H is the original covariance-
normalized five-solid hidden source. No historical ARF values are used.
"""
import contextlib,io,runpy
from pathlib import Path
import numpy as np
here=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()): d=runpy.run_path(str(here/'URT_BERRY_24FOLD_MONODROMY_2026_11_10.py'))
B,H=d['B'],d['H']
phi=(1+np.sqrt(5))/2
golden=1/phi**2

def fidelity(a):
 S=B(a)@H
 return np.linalg.norm(S,'fro')**2

quad=[]
for k in range(8):
 F0=fidelity(k/192)
 Fm=fidelity((k+.5)/192)
 F1=fidelity((k+1)/192)
 c2=2*(F0+F1-2*Fm)
 c1=F1-F0-c2
 quad.append((F0,c1,c2))
 for z in [.13,.37,.71,.91]:
  val=F0+c1*z+c2*z*z
  assert abs(val-fidelity((k+z)/192))<5e-11,(k,z,val)

# Since source covariance Gram is positive semidefinite, c2>0 unless the
# hidden source falls in nullspace of the readout slope, verified directly.
assert all(x[2]>1e-8 for x in quad)
minima=[];maxima=[]
for k,(c0,c1,c2) in enumerate(quad):
 z=np.clip(-c1/(2*c2),0,1)
 minima.append((c0+c1*z+c2*z*z,k,z))
 maxima.append((c0,k,0))
 maxima.append((c0+c1+c2,k,1))
fm,km,zm=min(minima)
fM,kM,zM=max(maxima)
kg=int(np.floor(golden*192))%8
zg=(golden*192)%1
c0,c1,c2=quad[kg]
fGolden=fidelity(golden)
assert abs(fGolden-(c0+c1*zg+c2*zg*zg))<1e-10
slope=192*(c1+2*c2*zg)
assert abs(slope)>1e-5
print('eight exact-affine pieces of source fidelity (c0,c1,c2) in z=(192a)%1:')
for k,x in enumerate(quad):print(k,[round(a,14) for a in x])
print('global source fidelity minimum over all a',fm,'at a=',(km+zm)/192,'one representative, k,z=',km,zm)
print('global source fidelity maximum over all a',fM,'at a=',(kM+zM)/192,'one representative, k,z=',kM,zM)
print('golden phase a=',golden,'branch',kg,'fraction',zg)
print('golden source fidelity=',fGolden,'derivative dF/da=',slope)
print('gap vs max=',fM-fGolden,'gap vs min=',fGolden-fm)
print('check 24-clock row-rotation periodicity',fidelity(golden+1/24)-fGolden)
print('PASS exhaustive no-fit native source-fidelity selection test')
