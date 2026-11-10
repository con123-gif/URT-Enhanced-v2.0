#!/usr/bin/env python3
"""The first *positive* 64-state T=B^T B from the canonical URT shift
plus unit-normalised A5 two-bit coupling, and its original nonlinear source.
This conditional construction has no tuned numbers but the pair-step rule is
an explicit modelling premise; it is not the physical KMS gate by itself.
"""
import contextlib,io,runpy
from pathlib import Path
import numpy as np
import sympy as s
from itertools import combinations
H=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 m=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
 src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
Q=np.zeros((64,64));P=np.zeros((64,64))
for h in range(64):
 Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
 for i,j in combinations(range(6),2):P[h,h^(1<<i)^(1<<j)]+=1/15
B=Q@P
T=B.T@B
X0=np.zeros((64,64))
for h in range(64):X0[h,h^1]=1
assert np.linalg.norm(Q.T@Q-(np.eye(64)+X0)/2)<1e-13
assert np.linalg.norm(Q@P-P@Q)<1e-13
assert np.linalg.norm(T-P@P@(np.eye(64)+X0)/2)<1e-12
assert np.linalg.norm(T-T.T)<1e-13
w=np.linalg.eigvalsh(T)
assert w.min()>-1e-12 and w.max()<1+1e-12
expected=[(0,32),(s.Rational(1,225),15),(s.Rational(1,25),10),(s.Rational(1,9),6),(1,1)]
for x,n in expected:
 assert np.sum(np.isclose(w,float(x),atol=1e-12,rtol=0))==n,(x,n)
R3=np.asarray(src['R3'],float);R5=np.asarray(src['R5'],float)
res3=np.trace(R3.T@T@R3)/64
res5=np.trace(R5.T@T@R5)/64
ss=s.sqrt(5)
raw3=36+72*ss/5
expected3=s.simplify(raw3/50)
expected5=s.Rational(19,1350)
assert abs(res3-float(expected3))<2e-11,(res3,expected3)
assert abs(res5-float(expected5))<2e-11,(res5,expected5)
print('exact positive T=B^T B, B=QP=PQ; rank',np.linalg.matrix_rank(T,tol=1e-12))
print('T spectrum: 0(32), 1/225(15), 1/25(10), 1/9(6), 1(1)')
print('original five-solid nonlinear source Tr(R3^T T R3)/64=',expected3,'=',res3)
print('original five-solid nonlinear source Tr(R5^T T R5)/64=',expected5,'=',res5)
print('hidden even response fraction of source T:',res5/(res3+res5))
print('KMS ratio delta^2 not obtained by this T alone: a physically selected cost/observable dictionary is needed')
print('PASS: source-loaded primitive URT plus minimal pair flip yields a bounded, positive, no-fit transfer')
