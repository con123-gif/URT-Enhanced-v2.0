#!/usr/bin/env python3
"""Unfitted Gaussian photon Wilson kernel on the native icosahedral shell.

This computes a genuine gauge-invariant photon functional integral over the
coexact 30-link Maxwell field, with 20 closed triangular loop sources. It does
NOT claim a phase from Gaussian vacuum noise or assert an H64 mass dictionary.

Requires: numpy, sympy; canonical cathedral_strict_64_closure.py.
"""
from __future__ import annotations
import numpy as np, sympy as sp
from pathlib import Path
import json, math
import cathedral_strict_64_closure as c

v,vc,edges,faces,ds,C=c.icosahedron()
d0,d1,d2,d3=ds
D=d2.copy()                 # 30 link rows, 20 oriented face columns
K=D@D.T                    # coexact Maxwell link kernel
L=D.T@D                    # induced face Laplacian
P=D.T@np.linalg.pinv(K,rcond=1e-12)@D
ideal=np.eye(20)-np.ones((20,20))/20
assert len(faces)==20 and len(edges)==30
assert np.linalg.norm(d1@d2)<1e-10
assert np.linalg.norm(d2@d3)<1e-10
assert np.linalg.matrix_rank(D)==19
assert np.linalg.norm(P-ideal)<1e-10
# All 20 oriented faces have the same loop self variance 19/20,
# while covariance between distinct faces is -1/20.
variances=np.diag(P)
assert np.max(np.abs(variances-.95))<1e-12

z=sp.symbols('z')
r=sp.sqrt(5)
terms=[(3,3-r),(5,sp.Integer(2)),(4,sp.Integer(3)),(4,sp.Integer(5)),(3,3+r)]
G=sp.factor(sum(sp.Rational(m,20)*lam/(z-lam) for m,lam in terms))
assert sp.simplify(G-3*(z**4-12*z**3+49*z**2-78*z+38)/((z-5)*(z-3)*(z-2)*((z-3)**2-5)))==0
assert sp.simplify(G.subs(z,0)+sp.Rational(19,20))==0
# Numerically verify the 20-loop resolvent against the exact spectral expression
for q in [-1.0,0.0,0.15,1.0,4.0,6.0]:
    prop=D.T@np.linalg.inv(q*np.eye(30)-K)@D if q not in [0.0] else -P
    ref=float(G.subs(z,q))
    assert np.max(np.abs(np.diag(prop)-ref))<1e-10

# For a free U(1) photon with exp[-A^T K A/(2g^2)], the characteristic
# function of the face flux is exp[-g^2 * n^T P n/2].
# This is exactly REAL POSITIVE for arbitrary integer face windings n.
G2=4*math.pi/(137+(17572/1215)*c.DELTA-(9/65)*c.DELTA**2)
loop_at_candidate_g=math.exp(-G2*19/40)
chiral_B=743/182250-1j*13*math.sqrt(15)/60750
screened=chiral_B*loop_at_candidate_g
assert abs(np.angle(screened)-np.angle(chiral_B))<1e-13

# A nonzero SOURCE j, in contrast, shifts photon phase by
# g^2 n^T D^T K^+ j. A unit conserved circulation j=D e_face yields
# g^2*19/20 for its own face, the exact finite coexact response.
f=np.zeros(20);f[0]=1
j=D@f
meanA=G2*np.linalg.pinv(K,rcond=1e-12)@j
flux=D.T@meanA
assert np.linalg.norm(flux-G2*(f-np.ones(20)/20))<1e-12
pred_delta=float(flux[0]/3)
result={
  'num_edges':len(edges),'num_faces':len(faces),'face_link_rank':int(np.linalg.matrix_rank(D)),
  'gauge_invariant_loop_covariance':'I_20 - J_20/20',
  'single_face_variance_unit_g_squared':float(P[0,0]),
  'different_face_covariance_unit_g_squared':float(P[0,1]),
  'exact_loop_resolvent':str(G),
  'static_loop_resolvent':str(G.subs(z,0)),
  'candidate_alpha_inv_used_for_example':float(4*math.pi/G2),
  'candidate_g_squared':G2,
  'single_face_Wilson_factor_example':loop_at_candidate_g,
  'native_complex_face_loop_phase_before':float(np.angle(chiral_B)),
  'native_complex_face_loop_phase_after_photon':float(np.angle(screened)),
  'unit_circulating_current_generated_face_flux_example':float(flux[0]),
  'one_face_current_delta_if_assumed_three_returns':pred_delta,
  'scope':'Exact free Maxwell loop integral; electromagnetic normalization and source-to-H64 mapping are not selected by the archived action.'
}
print(json.dumps(result,indent=2))
Path(__file__).with_name('RESULTS.json').write_text(json.dumps(result,indent=2)+'\n')
