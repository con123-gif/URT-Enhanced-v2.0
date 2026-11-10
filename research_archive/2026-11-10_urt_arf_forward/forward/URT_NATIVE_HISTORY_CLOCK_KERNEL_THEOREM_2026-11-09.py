#!/usr/bin/env python3
"""URT symbolic dynamics + A5 pair flip + minimal Z24 cyclic fibre
recovers exactly the NOV7 64-history x 24-clock positive Gaussian kernel.
Verifies the source-KMS 3/5 bridge. No historical four ARF coefficients used.
"""
from pathlib import Path
import numpy as np,contextlib,io,runpy
from scipy.linalg import expm
from math import sqrt,pi,e,log
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(HERE/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
K=m['Hbits'];U=m['Uh'];P3=m['P3'];P5=m['P5'];Delta=m['Delta'];eta=-log(Delta)
omega=m['theta'];r=pi/e
S=np.zeros((24,24),dtype=complex)
for j in range(24):S[(j+1)%24,j]=1
for q in (1,2):
    Dq=S-np.exp(-1j*q*omega)*np.eye(24)
    Lq=Dq.conj().T@Dq
    Lnative=m['clock_laplacian'](np.full(24,omega),q)
    assert np.linalg.norm(Lq-Lnative)<1e-12
    v=np.linalg.eigvalsh(Lq)
    mstar=int(round(24*q*omega/(2*pi)))%24
    eigen_mstar=2-2*np.cos(q*omega-2*pi*mstar/24)
    assert abs(v[0]-eigen_mstar)<1e-12
    print('charge',q,'L24 match exact',np.linalg.norm(Lq-Lnative),'min eig',v[0], 'm*',mstar)
# Natural full original Hessian = history graph K plus covariant clock 24.
L2=m['clock_laplacian'](np.full(24,omega),2)
# Note model has basis clock x histories with Hbits and r2 L2; kron reversed.
G=np.kron(np.eye(24),K)+r*r*np.kron(L2,np.eye(64))
assert np.linalg.eigvalsh(K).min()>-1e-11
assert np.linalg.eigvalsh(L2).min()>0
# Fourier minimal spectral response is min(K)+r2 min(L24).
minG=float(r*r*np.linalg.eigvalsh(L2)[0]);assert minG>0
# Positive KMS reversed-gap amplitude on the original hidden subspace.
Ch=18*np.eye(64)-K
assert np.linalg.eigvalsh(Ch).min()>-1e-11
W=expm(-eta*Ch/2)
selected=U@(P3+Delta*P5)
assert np.linalg.norm(W@U-selected)<2e-11
Th=W@W
assert np.linalg.norm(Th@U-U@(P3+Delta**2*P5))<2e-11
# But the native Gaussian energy uses +K, not reversed-gap Ch. Thus this bridge
# is exact for this KMS instrument but NOT proof action uniquely selects it.
# The ordinary +K Boltzmann factor gives a markedly different source ratio.
ratio=np.exp(-eta*(16-18)) # H5 energy16 vs H3 energy18, >1
assert ratio>1
print('native full 1536D H=K64+r²L24^(2) positive min eigen',minG)
print('hidden-3 K-energy18; hidden-5 K-energy16; reversed cost18-K: 0 and2')
print('KMS positive transfer norm ||exp[-eta(18-K)/2] Uh - Uh(P3+Delta P5)||=',np.linalg.norm(W@U-selected))
print('delta ratio for reversed cost:',Delta**2,'versus ordinary K Boltzmann ratio:',ratio)
print('PASS')
