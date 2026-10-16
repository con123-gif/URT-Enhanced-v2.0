#!/usr/bin/env python3
"""Koide positive Hermitian circulant: exact trace/determinant phase gate.

This constructs a MATHEMATICAL TARGET FOR a microscopic H64 generation-space
operator. It is not claimed that canonical H64 already equals this matrix.
The phase is not fitted or derived by this script; tests use several arbitrary
phase values to establish identities valid for ALL phases.

    python koide_circulant_invariant_gate.py
"""
import math
import numpy as np

S=np.array([[0,1,0],[0,0,1],[1,0,0]],dtype=complex)
I=np.eye(3)

def H(delta,A=1.):
    z=np.exp(1j*delta)
    return A*(I+(z*S+z.conjugate()*S.conj().T)/math.sqrt(2))

for delta in [0.,.03,.12,.222222047073,.2499]:
    h=H(delta)
    tr=np.trace(h).real
    tr2=np.trace(h@h).real
    det=np.linalg.det(h).real
    lam=np.linalg.eigvalsh(h)
    closed=np.array([1+math.sqrt(2)*math.cos(delta+2*math.pi*k/3)
                     for k in range(3)])
    assert np.max(abs(np.sort(lam)-np.sort(closed)))<2e-14
    assert abs(tr-3)<1e-14
    assert abs(tr2-6)<1e-14
    assert abs(tr2/(tr*tr)-2/3)<1e-14
    assert abs(det-(math.sqrt(2)*math.cos(3*delta)-1)/2)<1e-14
    recovered_cos=(1+54*det/tr**3)/math.sqrt(2)
    assert abs(recovered_cos-math.cos(3*delta))<1e-13

# For the corresponding source-free cubic phase action:
# V(delta)=a cos(3delta)+b cos(6delta), interior stationary point
# needs cos(3delta)=-a/(4b). Without a and b fixed from the same
# microscopic operator this is NOT a parameter-free phase selection.
d=.22222204707308765
need=math.cos(3*d)
print('PASS exact trace Q=2/3 and determinant phase identity')
print('trace H=3A, trace H^2=6A^2, independent of delta')
print('det H/A^3 = (sqrt(2)cos(3delta)-1)/2')
print('cos(3delta) = [1 + 54det(H)/(tr H)^3]/sqrt(2)')
print('measured-input diagnostic cos(3delta)=',need)
print('required -a/(4b) in a two-harmonic action=',need)
print('STATUS: existing URT/H64 operator must compute this determinant/invariant independently')
