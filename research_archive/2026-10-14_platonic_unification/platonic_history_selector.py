"""Canonical five-cube Kraus selector and conditional infinite Markov IFS.

Run from repository root:
python research_archive/2026-10-14_platonic_unification/platonic_history_selector.py
No experimentally fitted inputs; NOT an identification with species-loaded T_star.
"""
import runpy
from pathlib import Path
import math
import numpy as np
here=Path(__file__).resolve().parent
g=runpy.run_path(str(here/"test_platonic_entropy_nonlinear.py"))
Pc=g["P"]; P3=g["p3"]; P4=g["p5"]; P5=g["p_five"]
P8=P3+P4
P13=P8+P5
# Five rank-one simplex rays arise by projection of full cube kernels.
Q=[P3@pj@P3 for pj in Pc]
assert all(abs(np.trace(q)-1)<1e-10 and np.linalg.norm(q@q-q)<1e-10 for q in Q)
assert np.linalg.norm(sum(Q)-1.25*P3)<1e-10
A=[math.sqrt(4/5)*q for q in Q]
assert np.linalg.norm(sum(a.T@a for a in A)-P3)<1e-10
M=np.array([[np.trace(a@Q[i]@a.T) for a in A] for i in range(5)])
assert np.allclose(M,.75*np.eye(5)+.05*np.ones((5,5)))
assert np.allclose(np.linalg.eigvalsh(M),[.75]*4+[1])
# Complete fusion frame on the actual 13D combined cube-span.
S=sum(Pc)
assert np.linalg.norm(S-1.25*P8-2*P5)<1e-10
Sinv=math.sqrt(4/5)*P8+P5/math.sqrt(2)
F=[pj@Sinv for pj in Pc]
assert np.linalg.norm(sum(a.T@a for a in F)-P13)<1e-10
blocks=[P3,P4,P5];ranks=[4,4,5]
T=np.array([[np.trace(X@sum(a@(Y/d)@a.T for a in F))
     for Y,d in zip(blocks,ranks)] for X in blocks])
assert np.allclose(T,[[1,0,0],[0,1/3,1/3],[0,2/3,2/3]],atol=1e-10)
# Mathematically derived second-order triplet scale, if matched across levels.
phi=(1+math.sqrt(5))/2
s=math.sqrt((3-math.sqrt(5))/(3+math.sqrt(5)))
assert abs(s-phi**-2)<1e-12
h=-.8*math.log(.8)-4*.05*math.log(.05)
d0=math.log(5)/(-math.log(s))
d1=h/(-math.log(s))
d2=-math.log(.8**2+4*.05**2)/(-math.log(s))
assert d2<d1<d0
print("PASS canonical geometry-only 5-outcome finite instrument")
print("branch transition: diag 4/5, offdiag 1/20; spectrum 1 and 3/4 x4")
print("13D population transfer:\n",T)
print("conditional (spatial IFS) D0,D1,D2 =",d0,d1,d2)
print("golden relative refinement s =",s)
