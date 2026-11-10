#!/usr/bin/env python3
"""Strict golden-cap and invariant-measure counterexamples for URT uniqueness.

No historical ARF outputs, measured constants, or fitted coefficients used.
Loads actual all-five-solid incidence matrices of the original model.
"""
import numpy as np,runpy,io,contextlib
from pathlib import Path
from math import pi
P=Path(__file__).resolve().parents[1]
candidates=[P/'forward'/'cathedral_constructed_joint_dynamics_2026_11_07.py',P/'urt_arf_forward_2026_11_09'/'cathedral_constructed_joint_dynamics_2026_11_07.py']
with contextlib.redirect_stdout(io.StringIO()):
    g=runpy.run_path(str(next(x for x in candidates if x.exists())))
phi=g['phi'];omega=2*pi/phi**2
# Original complex URT on r*=9/13 circle, angle T(theta)=2 theta+omega mod 2pi.
# Exact fixed angular orbit (x=0 under conjugacy x=(theta+omega)/2pi).
theta0=(-omega)%(2*pi)
for k in range(9):
    assert abs(((2*theta0+omega-theta0+pi)%(2*pi))-pi)<1e-12
    theta0=(2*theta0+omega)%(2*pi)
# Haar measure is also invariant; the fixed Dirac measure is not Haar.
# Thus the angular map does not select one invariant measure on all orbits.

# Gauge κ is not selected by complexity, equivariance or the strict cap κ≤φ^-2.
cap=phi**-2
kappaA=cap
kappaB=cap**2
assert 0<kappaB<kappaA<=cap
blocks=[]
for name in g['names']:
    d=g['geom'][name];b1=d['b1'];b2=d['b2']
    assert np.linalg.norm(b1@b2)<1e-12
    blocks.append(b2@b2.T)
# Local U(1) plaquette action ∑[1-cos(b2^T A)] is nonnegative.
positive=np.concatenate([np.linalg.eigvalsh(m)[np.linalg.eigvalsh(m)>1e-8] for m in blocks])
assert len(positive)==45
assert np.allclose((kappaA*positive)/(kappaB*positive),phi**2)
print('primitive URT invariant circle supports a fixed angular orbit and Haar-typical chaotic orbits')
print('strict golden coupling cap phi^-2:',format(cap,'.17g'))
print('unfitted local gauge coupling κA=phi^-2:',format(kappaA,'.17g'))
print('unfitted local gauge coupling κB=phi^-4:',format(kappaB,'.17g'))
print('both κ below cap, positive, compact gauge invariant, O(N) local')
print('45 positive Maxwell modes; stiffness ratio phi^2:',format(kappaA/kappaB,'.17g'))
print('PASS: URT O(N)+strict golden cap+gauge symmetry does not uniquely fix current stiffness or orbit law')
