#!/usr/bin/env python3
"""Prove the Bernoulli shift does not intrinsically contain a deterministic
24-cycle phase factor; reconstruct native charged 24-fibre operator.
"""
from pathlib import Path
import numpy as np,contextlib,io,runpy
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    x=runpy.run_path(str(HERE/'URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py'))
    m=runpy.run_path(str(HERE/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
Q=np.zeros((64,64))
for h in range(64):Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
assert np.array_equal(np.linalg.matrix_power(Q,6),np.ones((64,64))/64)
# Unique nonzero eigenvalue of Q is 1; its 63D meanzero part nilpotent.
assert np.linalg.matrix_rank(np.linalg.matrix_power(Q,6))==1
# A nonconstant deterministic 24-cycle factor would provide a 24th-root
# eigenfunction. Q has no such eigenvectors: Q^6 is rank-one stationary.
B=x['B'];N=24
S=np.zeros((N,N))
for j in range(N):S[(j+1)%N,j]=1
compressed=B@Q@B.T
comm=np.linalg.norm(compressed@S-S@compressed)
assert comm>1
assert np.linalg.norm(m['clock_laplacian'](np.full(N,m['theta']),2)@S-S@m['clock_laplacian'](np.full(N,m['theta']),2))<1e-12
print('Q^6=J/64 exactly: stationary rank 1, nonconstant history modes killed')
print('no nontrivial Z24 time-clock eigenfactor on six-bit Bernoulli shift')
print('phase-partition compression BQB.T not same as native cyclic clock; commutator',comm)
print('native clock *is* a 24D cyclic fibre with unit shift and URT golden phase')
print('PASS')
