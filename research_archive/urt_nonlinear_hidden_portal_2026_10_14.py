"""Constructive nonlinear escape from a linear A5 no-coupling theorem.

Run: python research_archive/urt_nonlinear_hidden_portal_2026_10_14.py
Requires NumPy, reuses the repository's independent geometric A4 verifier.
This constructs a finite candidate, not the already-selected H64 physical transfer.
"""
import json, runpy
from pathlib import Path
from math import pi, e, sqrt
import numpy as np
g=runpy.run_path(str(Path(__file__).with_name("platonic_A4_emergence_2026_10_14.py")))
B=np.asarray(g["B"],float)
P3=np.asarray(g["P3"],float)
P5=np.asarray(g["P5"],float)
phi=(1+sqrt(5))/2
delta=3/20-80*pi/(1053*phi)
PH=P3+P5
assert np.linalg.norm(PH@B)<1e-10

# Algebraic polynomial-span witness: quadratic response has full hidden rank.
mon=np.column_stack([(B[:,i]*B[:,j])*(2 if i!=j else 1)
    for i in range(12) for j in range(i,12)])
ranks=[int(np.linalg.matrix_rank(Q@mon,tol=1e-9)) for Q in (P3,P5,PH)]
assert ranks==[4,4,8]

def measure(x):
    y=B@x
    h3=P3@(y*y);h5=P5@(y*y)
    C3=P3@np.diag(y)@B
    C5=P5@np.diag(y)@B
    R3=C3.T@C3; R5=C5.T@C5
    K=R3+delta**2*R5
    E=(h3@h3+delta**2*(h5@h5))/4
    grad=B.T@(y*(h3+delta**2*h5))
    return E,grad,K,R3,R5

x=np.array([.2,.8,1.4,-.3,.6,-1.1,.9,.15,.45,-.7,1.25,-.25])
E,grad,K,R3,R5=measure(x)
r3=int(np.linalg.matrix_rank(R3,tol=1e-9))
r5=int(np.linalg.matrix_rank(R5,tol=1e-9))
r8=int(np.linalg.matrix_rank(K,tol=1e-9))
assert [r3,r5,r8]==[4,4,8]
assert np.linalg.eigvalsh(K).min()>-1e-9
assert abs(float(x@K@x)-4*E)<1e-9
eps=2e-6
num=np.array([(measure(x+eps*np.eye(12)[i])[0]-
               measure(x-eps*np.eye(12)[i])[0])/(2*eps)
              for i in range(12)])
assert np.max(np.abs(num-grad))<1e-7
E_next=measure(x-1e-5*grad)[0]
assert E_next<E
# Exact Feshbach self-energy: residues at the fixed hidden Laplacian poles.
Sigma=lambda z:R3/(z-3)+R5/(z-5)
assert np.linalg.norm(Sigma(0)+R3/3+R5/5)<1e-10
# Positive residue matrices, hence rank-four return at each level.
assert np.linalg.eigvalsh(R3).min()>-1e-9
assert np.linalg.eigvalsh(R5).min()>-1e-9
print(json.dumps(dict(
    linear_hidden_norm=float(np.linalg.norm(PH@B)),
    quadratic_ranks=ranks,
    return_residue_ranks=[r3,r5],
    weighted_return_rank=r8,
    quartic_energy=float(E),energy_after_descent=float(E_next),
    finite_difference_error=float(np.max(np.abs(num-grad))),
    self_energy_z0_norm=float(np.linalg.norm(Sigma(0))),
    gap=float(delta)),indent=2))
