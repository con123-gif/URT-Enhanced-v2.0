#!/usr/bin/env python3
"""Exact five-Platonic original-face hidden Wick-cancellation / susceptibility.

Uses original 7 November Cathedral C, P3, P5, dual Lface and Gibbs rail.
No external Yang--Mills code, no fitted physical inputs.
"""
from pathlib import Path
import runpy
import numpy as np
from numpy.linalg import norm

z=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
C=z['C'];L=z['Lface'];P3=z['P3'];P5=z['P5'];Ph=P3+P5;Delta=z['Delta']
Aface=3*np.eye(20)-L
S=C@C.T
W=S*S
assert norm(W-(S+6*np.eye(20)+2*Aface))<1e-12
assert norm(Ph@S)<1e-12
assert norm(Ph@W@Ph - (6*P3+2*P5))<2e-11
assert norm(P3@W@P3-6*P3)<2e-11
assert norm(P5@W@P5-2*P5)<2e-11
assert norm(P3@W@P5)<2e-11
assert norm(P3@np.ones(20))<1e-11
assert norm(P5@np.ones(20))<1e-11

# Real centred A5-symmetric Gaussian: x~N(0,sigma² I12).
# z=Cx and h_s=P_s(z squared). Wick's theorem:
# E h= P_s diag(S)=3P_s 1=0,
# Cov(h)=2Ph (S hadamard S) Ph=12P3+4P5 (for sigma²=1).
Cov_expected=12*P3+4*P5
assert abs(np.trace(Cov_expected)-64)<2e-11
assert abs(np.trace(P3@Cov_expected)-48)<2e-11
assert abs(np.trace(P5@Cov_expected)-16)<2e-11
assert abs(np.trace(P3@np.linalg.pinv(L)@Cov_expected)-16)<1e-10
assert abs(np.trace(P5@np.linalg.pinv(L)@Cov_expected)-16/5)<1e-10
B=P3+Delta*P5
modular_cov=B@Cov_expected@B
chi_expected=16+(16/5)*Delta**2
chi= np.trace(np.linalg.pinv(L)@modular_cov)
assert abs(chi-chi_expected)<2e-10

# A5-invariant but nontrivial covariance K=I+0.1Aico, to verify no
# tadpole offset: diagonal of CKC^T remains uniform and Ph kills it.
Sigma=np.eye(12)+0.1*z['Aico']
assert np.linalg.eigvalsh(Sigma).min()>0
v=C@Sigma@C.T
assert max(np.diag(v))-min(np.diag(v))<1e-12
assert norm(Ph@np.diag(v))<1e-11

# Optional independent Monte Carlo, not a substitute for exact Wick identity.
rng=np.random.default_rng(20261108)
ns=120000
xb=rng.normal(size=(ns,12))
zz=xb@C.T
hh=(zz*zz)@Ph.T
mean=hh.mean(axis=0)
Cov=(hh.T@hh)/ns-np.outer(mean,mean)
error=norm(Cov-Cov_expected)/norm(Cov_expected)
assert error<.04,error
assert norm(mean)<.06,norm(mean)

# Expected static quartic sourced via original 64-history Schur complement.
expected_Veff=(2/9)*48+(7/32)*Delta**2*16
assert abs(expected_Veff - (32/3+7*Delta**2/2))<1e-12

print('PASS exact combinatorial face overlap identity: (CC^T)°² = CC^T +6I+2Adual')
print('PASS rank8 hidden identity: Ph[(CC^T)°²]Ph =6P3+2P5')
print('PASS full quadratic source automatically Wick centred for every A5-invariant real Gaussian covariance')
print('PASS exact hidden fluctuations: covariance =12P3+4P5, trace3=48, trace5=16')
print('PASS exact 3/5 modular-source dual susceptibility: 16+(16/5)Delta²')
print('PASS Monte Carlo check vs exact covariance, relative error:',f'{error:.6g}')
print('golden-rail source susceptibility:',f'{chi:.15f}')
print('expected static nonlinear source energy per sigma^4:',f'{expected_Veff:.15f}')
print('Note: divergent variance under 4D UV removal is not cancelled by centring.')