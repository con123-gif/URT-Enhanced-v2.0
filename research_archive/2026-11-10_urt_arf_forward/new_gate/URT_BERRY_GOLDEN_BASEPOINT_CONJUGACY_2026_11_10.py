#!/usr/bin/env python3
"""URT 24-clock Berry holonomy does NOT select the golden angular basepoint:
For periodic path a -> U(a) with U(a+1/24)=R U(a), induced Berry
connection is 1/24-periodic. Wilson loops based at any starting a0
have conjugate matrices, hence the same eigenangles. This is true without
using physical ARF targets and applies to the original 64x24 overlap source.
Convergence check uses a 24th-power computation on one segment.
"""
import contextlib,io,runpy
from pathlib import Path
import numpy as np
p=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(p/'URT_BERRY_24FOLD_MONODROMY_2026_11_10.py'))
B,H,polar=d['B'],d['H'],d['polar']
phi=(1+np.sqrt(5))/2
bases=[0,1/7,1/phi**2,np.sqrt(2)-1,0.495]

def holonomy(a0,m):
 U=polar(B(a0)@H); W=np.eye(8)
 for k in range(1,m+1):
  Up=polar(B(a0+k/(24*m))@H)
  W=W@polar(U.T@Up);U=Up
 return np.linalg.matrix_power(W,24)

def angle(W):return np.sort(np.angle(np.linalg.eigvals(W)))[4:]
for m in [64,128,256,512,1024]:
 angles=[]
 for x in bases:
  W=holonomy(x,m);angles.append(angle(W))
 diffs=[np.max(np.abs(a-angles[0])) for a in angles[1:]]
 print('substep',m,'max independent-basepoint angle difference',max(diffs),'golden',angles[2].tolist())
 assert max(diffs)<3/m
print('PASS: arbitrary golden offset does not change holonomy eigenangle conjugacy class')
