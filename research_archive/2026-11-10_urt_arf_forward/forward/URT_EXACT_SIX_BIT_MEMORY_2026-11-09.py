#!/usr/bin/env python3
"""URT Bernoulli shift and original all-five hidden source: fixed memory, no fitted response."""
import numpy as np, runpy, io, contextlib
from pathlib import Path
here=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    src=runpy.run_path(str(here/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R3=src['R3']; R5=src['R5']; P3=src['P3'];P5=src['P5']
H=np.column_stack([R3, R5])
Q=np.zeros((64,64))
for w in range(64):
    Q[w,(2*w)&63]+=.5
    Q[w,((2*w)&63)+1]+=.5
assert np.linalg.norm(Q@np.ones(64)-np.ones(64))<1e-15
assert np.linalg.norm(Q.T@np.ones(64)-np.ones(64))<1e-15
Qn=np.eye(64)
assert np.max(np.abs(Q@Q-Qn))>0
for k in range(1,10):
    Qn=Qn@Q
    if k==6: assert np.max(np.abs(Qn-1/64))<1e-15
assert np.max(np.abs(Qn-1/64))<1e-15
assert np.linalg.norm(H.mean(axis=0))<1e-12
raw=R3+R5
V=np.hstack([R3/np.sqrt(src['coef3']),R5/np.sqrt(src['coef5'])])
means=np.mean(raw,axis=0)
print('Q: 64 by 64 doubly stochastic; six-step Q^6=J/64 EXACT by binary counting')
print('full non-constant spectrum: nilpotent (all eigenvalues zero)')
print('all-five original hidden h mean',np.linalg.norm(means))
print('lag k, ||Ck||F raw, tr(Ck), ||Ck||F normalized, tr(Ck normalized), rank Qk on centered space')
Qn=np.eye(64)
Cs=[]
for k in range(8):
    C=raw.T@Qn@raw/64
    Cnorm=V.T@Qn@V/64
    Cs.append(C)
    print(k, format(np.linalg.norm(C),'.12g'), format(np.trace(C),'.12g'),format(np.linalg.norm(Cnorm),'.12g'),format(np.trace(Cnorm),'.12g'),np.linalg.matrix_rank(Qn-np.ones((64,64))/64,tol=1e-9))
    Qn=Qn@Q
assert all(np.linalg.norm(Cs[k])<1e-11 for k in (6,7))
# All 24-step source correlations are thus exactly finite memory, not a ring recurrence.
# Connected generating response in a declared source covariance: S(z)=C0+sum_k (z^k Ck + z^{-k} Ck^T); 5-lag Laurent polynomial.
C0=Cs[0];nC0=np.trace(C0)
for theta in (0, np.pi/4,np.pi/2,np.pi):
    S=C0.astype(complex).copy()
    for k in range(1,6):S+=np.exp(1j*theta*k)*Cs[k]+np.exp(-1j*theta*k)*Cs[k].T
    err=np.linalg.norm(S-S.conj().T)
    assert err<1e-11
    ev=np.linalg.eigvalsh(S)
    print('phase',theta,'trace PSD power',float(np.trace(S).real),'min eigenvalue',ev.min(),'max eigenvalue',ev.max())
    assert ev.min()>-1e-10
print('PASS exact finite six-bit source memory')
