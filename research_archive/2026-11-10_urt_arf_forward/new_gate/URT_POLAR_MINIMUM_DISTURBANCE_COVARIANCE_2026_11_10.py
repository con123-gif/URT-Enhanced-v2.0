#!/usr/bin/env python3
"""Gauge-equivariant unique polar completion of native 64->24 URT source.
Proof: under faithful isometric readout V*V=P, polar U of S minimizes
||S-V||_F uniquely when S has full rank on P. This is a conditional
observable-selection principle, not an automatically selected URT dynamics.
"""
import contextlib,io,runpy
from pathlib import Path
import numpy as np
here=next(p for p in (Path(__file__).resolve().parent.parent/'forward', Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(here/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
P3=d['P3'];P5=d['P5'];P=P3+P5;Delta=float(d['Delta']);S=d['B']@d['H']
T=S.T@S
lam,W=np.linalg.eigh(T);J=lam>1e-10
assert J.sum()==8
inv=(W[:,J]*(lam[J]**(-.5)))@W[:,J].T
U=S@inv
assert np.linalg.norm(U.T@U-P)<3e-11
sing=np.sqrt(lam[J]);
d_exact=np.sum((sing-1)**2)
d_direct=np.linalg.norm(S-U)**2
assert abs(d_exact-d_direct)<1e-11
# An actual different isometry, constructed by rotating U in its output 24D.
rng=np.random.default_rng(26011)
A=rng.normal(size=(24,24));K=A-A.T
# Cayley transform of skew matrix, exactly orthogonal in exact arithmetic.
D=np.linalg.solve(np.eye(24)-.04*K,np.eye(24)+.04*K)
alt=D@U
assert np.linalg.norm(alt.T@alt-P)<1e-11
assert np.linalg.norm(S-alt)**2>d_direct+1e-6
# Local U(1) clock phases acting on output; hidden A5 respects 4+4.
phase=np.exp(2j*np.pi*(np.arange(24)**2)/29)
Dclk=np.diag(phase)
W3,U3=np.linalg.eigh(P3); W5,U5=np.linalg.eigh(P5)
E3=U3[:,W3>.5]; E5=U5[:,W5>.5]
a=rng.normal(size=(4,4));b=rng.normal(size=(4,4))
rot3,_=np.linalg.qr(a);rot5,_=np.linalg.qr(b)
V=E3@rot3@E3.T+E5@rot5@E5.T+(np.eye(20)-P)
assert np.linalg.norm(V.T@V-np.eye(20))<2e-11
assert np.linalg.norm(V@P3-P3@V)<2e-11
assert np.linalg.norm(V@P5-P5@V)<2e-11
S1=Dclk@S@V
T1=S1.conj().T@S1
la,Z=np.linalg.eigh(T1)
k=la>1e-10
U1=S1@((Z[:,k]*(la[k]**(-.5)))@Z[:,k].conj().T)
assert np.linalg.norm(U1-Dclk@U@V)<2e-11
F=P3+Delta*P5
rho=F@(U.T@U)@F
rho=rho/np.trace(rho)
expected=(P3+Delta**2*P5)/(4*(1+Delta**2))
assert np.linalg.norm(rho-expected)<2e-11
rho1=F@(U1.conj().T@U1)@F
rho1/=np.trace(rho1)
assert np.linalg.norm(rho1-expected)<2e-11
print('8 strict positive singular values; polar Procrustes unique minimizer')
print('minimum source-to-isometry distance squared',d_exact)
print('alternative isometry excess cost',np.linalg.norm(S-alt)**2-d_direct)
print('local-clock U(1) and hidden block-symmetry equivariance error',np.linalg.norm(U1-Dclk@U@V))
print('source recovered p5',np.trace(P5@rho).real,'frozen p5',Delta**2/(1+Delta**2))
print('PASS unique minimum-disturbance conditional recovery, gauge covariance and KMS factorization')