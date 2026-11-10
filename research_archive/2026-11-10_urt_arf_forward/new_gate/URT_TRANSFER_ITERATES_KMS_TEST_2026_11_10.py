from pathlib import Path
import contextlib,io,runpy
import numpy as np
from itertools import combinations
H=Path('/mnt/data/urt_arf_forward_2026_11_09')
with contextlib.redirect_stdout(io.StringIO()):
 src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R3=np.array(src['R3']);R5=np.array(src['R5'])
Q=np.zeros((64,64));P=np.zeros((64,64))
for h in range(64):
 Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
 for i,j in combinations(range(6),2): P[h,h^(1<<i)^(1<<j)]+=1/15
T=(Q@P).T@(Q@P)
Tn=np.eye(64)
for n in range(1,25):
 Tn=Tn@T
 g3=np.trace(R3.T@Tn@R3)/64;g5=np.trace(R5.T@Tn@R5)/64
 print(n,g3,g5,g5/(g3+g5) if g3+g5>0 else None)
