"""Infinite-depth Platonic UV candidate from the existing Oct 14 exact finite results.

Run from repository root:
  python research_archive/2026-10-14_platonic_unification/infinite_uv_fractal_transfer.py

Requires numpy/scipy and the two adjacent archived Cathedral scripts.
Golden length contraction, identical per-scale K13 and tensorized scale
addresses are explicit MODEL HYPOTHESES, NOT the physical H64 T_star.
"""
import json
import runpy
from pathlib import Path
import numpy as np
from scipy.optimize import brentq

here = Path(__file__).resolve().parent
geometry = runpy.run_path(str(here / "test_platonic_entropy_nonlinear.py"))
transfer = runpy.run_path(str(here / "positive_transfer_observable_gate.py"))
P = np.asarray(geometry["P"])               # (5,20,20) rank-four cube projectors
K = np.asarray(transfer["K13"])             # (13,13) entropy-graded candidate
phi = (1 + np.sqrt(5)) / 2
s = phi**-2
V = np.sqrt(5/4)*(np.eye(5)-np.ones((5,5))/5)
assert np.allclose(V@V.T,1.25*np.eye(5)-.25*np.ones((5,5)))
assert s < .5

# Actual five-cube overlap, not independent or arbitrarily weighted branches.
G = np.einsum("aij,bji->ab",P,P)
assert np.allclose(G,(4-5/8)*np.eye(5)+(5/8)*np.ones((5,5)))
R = G / np.trace(G)
r = np.linalg.eigvalsh(R)
assert np.allclose(r,[27/160]*4 + [13/40])
assert np.allclose(R,(27/160)*np.eye(5)+np.ones((5,5))/32)
assert np.isclose(np.trace(R@R),281/1280)
assert np.isclose(np.trace(R),1)
H = float(-r@np.log(r))
dH = np.log(5) / (-np.log(s))
d1 = H / (-np.log(s))
d2 = -np.log(np.trace(R@R))/(-np.log(s))

# Root-label doubling is an exact automorphism at every IFS depth.
D = np.zeros((5,5))
for j in range(5): D[(2*j)%5,j] = 1
assert np.allclose(D@R@D.T,R)
assert np.allclose(np.linalg.matrix_power(D,4),np.eye(5))
for j in range(5):
    for x in (np.zeros(5),V[0],V[2]):
        assert np.allclose(D@(s*x+(1-s)*V[j]),
                           s*D@x+(1-s)*V[(2*j)%5])

# At level n, the Hilbert dimension is 13*5^n, and transfer
# Q_n=R^{tensor n} tensor K^n is positive with Tr Q_n=Tr K^n.
w=np.linalg.eigvalsh(K)
assert w[0]>0 and w[-1]<1
assert 5*w[-1]>1  # the simple UNNORMALIZED five-copy recursion diverges
A=np.linalg.eigh(K)
sqrtK=(A[1]*np.sqrt(A[0]))@A[1].T
assert np.allclose(sum((sqrtK/np.sqrt(5)).T@(sqrtK/np.sqrt(5))
                       for _ in range(5)),K,atol=1e-12)
Q2=np.kron(np.kron(R,R),K@K)
assert Q2.shape==(325,325) and np.allclose(Q2,Q2.T)
assert np.linalg.eigvalsh(Q2).min()>-1e-13
assert np.isclose(np.trace(Q2),np.trace(K@K))
infinite_trace=float(np.trace(np.linalg.inv(np.eye(13)-K)))
assert np.isclose(sum(np.sum(w**n) for n in range(31)),infinite_trace,atol=1e-12)

# Heat trace for actual Cathedral convention H_T=-log(T).
# Z(beta)=sum_a [1-lambda_a^beta sum_i r_i^beta]^-1
# exists only when lambda_max^beta sum_i r_i^beta < 1.
threshold=lambda beta:w[-1]**beta*np.sum(r**beta)-1
beta_c=brentq(threshold,.1,1)
assert .5 < beta_c < .6
def Z(beta):
    factors=(w**beta)*np.sum(r**beta)
    return float(np.sum(1/(1-factors))) if np.max(factors)<1 else None
assert np.isclose(Z(1),infinite_trace)

result={
  "status":"EXACT CONDITIONAL INFINITE UV OPERATOR; NOT VERIFIED SPACETIME",
  "golden_geometric_contraction_hypothesis":float(s),
  "golden_IFS_four_simplex_dimension":float(dH),
  "five_cube_G":G.tolist(),
  "R5_spectrum":r.tolist(),
  "information_scaling_exponent":d1,
  "correlation_scaling_exponent":float(d2),
  "R5_entropy_nats_per_level":H,
  "lambda_max_K13":float(w[-1]),
  "naive_unnormalized_fivefold_growth":float(5*w[-1]),
  "positive_infinite_trace":infinite_trace,
  "canonical_H_minus_log_T_critical_beta":float(beta_c),
  "heat_trace_beta_055":Z(.55),
  "heat_trace_beta_1":Z(1),
  "UV_geometric_log_frequency":float(2*np.pi/(-np.log(s))),
  "operational_physical_mapping":"NOT DERIVED"
}
print(json.dumps(result,indent=2))
print("PASS: Platonic R5, S5 doubling, golden IFS, infinite trace, critical heat exponent")
