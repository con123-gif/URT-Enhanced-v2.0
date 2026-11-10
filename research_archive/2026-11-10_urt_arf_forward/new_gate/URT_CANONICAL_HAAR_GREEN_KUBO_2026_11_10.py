#!/usr/bin/env python3
"""New first-principles source response from the *unaltered* URT doubling chronology.

No historical ARF value or measured constants enter this calculation.
Source is the original all-five Platonic 50->8 hidden nonlinear observable.
The probability law is the unique absolutely-continuous invariant phase measure.
Spectral tests are for the unique stationary two-point (Green-Kubo) response;
these results do not identify Standard Model mass/EM observables.
"""
from pathlib import Path
from fractions import Fraction as F
from math import sqrt
import contextlib, io, runpy
import numpy as np
import sympy as sp

_root=Path(__file__).resolve().parent
H=next((p for p in (_root.parent/'forward',_root.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists()),None)
assert H is not None, 'original Nov 9 source cannot be found'
with contextlib.redirect_stdout(io.StringIO()):
    src = runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R3=np.asarray(src['R3'],float)
R5=np.asarray(src['R5'],float)
Hsrc=R3+R5
N=len(Hsrc)
assert N==64 and Hsrc.shape==(64,20)
assert np.linalg.norm(Hsrc.mean(axis=0))<3e-13
Q=np.zeros((64,64))
for word in range(64):
    Q[word,(2*word)%64]+=.5
    Q[word,(2*word+1)%64]+=.5
assert np.max(abs(np.linalg.matrix_power(Q,6)-np.ones((64,64))/64))<1e-14

# Proof outside code: under the unique ACIM of doubling, the binary digits
# are iid fair. This Markov transfer is its exact six-consecutive-digit factor.
# C_k = E[h_0^T h_k]; S(0) = C_0 + sum_{k>0}(C_k+C_k^T).
C=[]
Pk=np.eye(64)
for k in range(7):
    C.append(Hsrc.T@Pk@Hsrc/64)
    Pk=Pk@Q
for k in (5,6):
    assert np.linalg.norm(C[k])<1e-12
S=C[0].copy()
for k in range(1,5):
    S+=C[k]+C[k].T
S=(S+S.T)/2
assert np.linalg.norm(S-S.T)<1e-12
E=np.linalg.eigvalsh(S)
assert E.min()>-1e-10
nz=E[E>1e-8]
assert len(nz)==8, (len(nz),E)
P3=np.asarray(src['P3'],float)
P5=np.asarray(src['P5'],float)
assert np.linalg.norm(P3@S@P5)<1e-9  # parity-odd and parity-even source blocks are orthogonal
S3=P3@S@P3
S5=P5@S@P5

# Independently certified exact Q(sqrt5) temporal lag trace coefficients.
ss=sp.sqrt(5)
c3=(36+72*ss/5,sp.Rational(18,5)+36*ss/25,(27+9*ss)/25,(36+18*ss)/25,sp.Integer(0))
c5=(sp.Integer(7),sp.Rational(7,40),-sp.Rational(61,120),-sp.Rational(1,24),-sp.Rational(1,6))
tr3=sp.factor(c3[0]+2*sum(c3[1:]))
tr5=sp.factor(c5[0]+2*sum(c5[1:]))
assert abs(np.trace(S3)-float(tr3))<5e-11
assert abs(np.trace(S5)-float(tr5))<5e-11
assert np.linalg.norm(S-S3-S5)<5e-12

# Exact time-lag values also match original original source without optional A5 averaging.
for k in range(5):
    assert abs(np.trace(R3.T@np.linalg.matrix_power(Q,k)@R3)/64-float(c3[k]))<6e-11
    assert abs(np.trace(R5.T@np.linalg.matrix_power(Q,k)@R5)/64-float(c5[k]))<6e-11

# The four-tuple of group channel eigenvalues depends on the URT ordering;
# rotations of the six axes do not preserve the chronological shift.
E3=np.linalg.eigvalsh(S3);E5=np.linalg.eigvalsh(S5)
E3=E3[E3>1e-9];E5=E5[E5>1e-9]
assert len(E3)==len(E5)==4
# Zero-frequency response of the trace-integrated source is exactly Tr(S)
tr_total=sp.simplify(tr3+tr5)
assert abs(float(tr_total)-np.trace(S))<5e-11
print('URT natural Haar 64-symbol chronology exact P^6=J/64: PASS')
print('All five Platonic source: hidden dimensions',len(nz))
print('P3 odd exact zero-frequency Green-Kubo trace =',tr3,'=',float(tr3))
print('P5 even exact zero-frequency Green-Kubo trace =',tr5,'=',float(tr5))
print('TOTAL exact Green-Kubo source trace =',tr_total,'=',float(tr_total))
print('P3 four positive eigenvalues',np.array2string(E3,precision=14))
print('P5 four positive eigenvalues',np.array2string(E5,precision=14))
print('trace S',np.trace(S),'cross-block norm',np.linalg.norm(P3@S@P5),'smallest eigenvalue',nz.min())
print('A5 isotropy within P3, P5 (Frob residuals)',np.linalg.norm(S3-np.trace(S3)/4*P3),np.linalg.norm(S5-np.trace(S5)/4*P5))
# Exact variance of the additive 64-history source accumulated for n steps.
# k-dependent terms vanish exactly when k >= 5, giving linear cost in n.
Nsym=sp.symbols('n',integer=True,positive=True)
linear3=sp.simplify(Nsym*tr3-2*sum(k*c3[k] for k in range(1,5)))
linear5=sp.simplify(Nsym*tr5-2*sum(k*c5[k] for k in range(1,5)))
for n in (5,6,10,24,100):
    direct3=n*float(c3[0])+2*sum((n-k)*float(c3[k]) for k in range(1,5))
    direct5=n*float(c5[0])+2*sum((n-k)*float(c5[k]) for k in range(1,5))
    assert abs(direct3-float(linear3.subs(Nsym,n)))<1e-9
    assert abs(direct5-float(linear5.subs(Nsym,n)))<1e-9
assert sp.factor(linear3-((1206+486*ss)*Nsym-(504+216*ss))/25)==0
assert sp.factor(linear5-(sp.Rational(71,12)*Nsym+sp.Rational(49,15)))==0
print('EXACT n>=5 hidden3 additive-source variance:',linear3)
print('EXACT n>=5 hidden5 additive-source variance:',linear5)
print('PASS — direct six-bit URT natural-source Hessian and all-n O(N) finite-memory variance: no fitting')
