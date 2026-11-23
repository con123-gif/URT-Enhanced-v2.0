"""Q161 conditional KMS-to-Yukawa selection audit (2026-11-23).

Provenance: docs/RESEARCH_STATE.md Q161 exact hidden-four Yukawa isometry
and Q161da real H64 complex bridge; frozen Delta and rho_*.
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (only the
conditional algebra below). No original operator is reconstructed here;
this is NOT a native full-190/H64/24/Q96 certificate and cannot establish
a Yukawa coupling, mass, mixing angle, or physical Dirac character.

Existing native source Gram:
 S†S=(3/20)P5, T3†T3=(3/2)P43, T5†T5=(3/2)P45.
Frozen rho_*=(I4 ⊕ Delta² I4)/(4(1+Delta²)).
For any U3,U5 unitary acting separately within the two quartets,
[U3⊕U5,rho_*]=0. Thus the KMS state alone has U(4)×U(4)
degeneracy and cannot select any flavour orientation, PMNS/CKM
phase, or three-generation singular spectrum. KMS ratio is Delta²,
but interpreting it as a Yukawa amplitude would be an additional
unjustified dynamical postulate. Relative fiveplet/hidden couplings
are also not fixed by the Gram identities.

Next test: load original Q161 S/T/J and the native 24/H64 transfer,
construct the sector-dependent response derivative, and test whether
its commutant shrinks beyond U(4)×U(4) before forming a Yukawa.
"""
from fractions import Fraction as F
from math import sqrt, pi
phi=(1+sqrt(5))/2
Delta=F(3,20)-F(80,81)*pi/(13*phi)
assert 0<Delta<F(1,100)
g5=F(3,20); g4=F(3,2)
assert g4/g5==10
w3=1/(1+Delta**2); w5=Delta**2/(1+Delta**2)
assert abs(w3+w5-1)<1e-14
assert abs(w5/w3-Delta**2)<1e-14
# A nontrivial U(4) rotation within the first block preserves rho
# because the density is proportional to the identity there.
import numpy as np
rho=np.diag([float(w3)/4]*4+[float(w5)/4]*4)
U=np.eye(8)
U[:2,:2]=np.array([[0,-1],[1,0]])
assert np.max(np.abs(U@rho@U.T-rho))<1e-14
print("CONDITIONAL KMS/GRAM AUDIT: PASS (not source-native Yukawa)")
print("Delta =",Delta,"KMS ratio =",w5/w3,"Gram ratio =",g4/g5)
print("No masses, physical chirality, or flavour selection derived")
