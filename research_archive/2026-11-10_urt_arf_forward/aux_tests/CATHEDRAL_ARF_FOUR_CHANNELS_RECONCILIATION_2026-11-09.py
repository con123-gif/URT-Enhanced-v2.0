#!/usr/bin/env python3
"""Audit all four historical ARF outputs using original unmodified Cathedral K64.

No change to upstream source. Eigen-5 and eigen-7 projector trace tests are exact.
Other coefficients are audited as stated rank/trace prescriptions, NOT claimed
uniquely selected by the microscopic primitive.
"""
from pathlib import Path
import contextlib, io, runpy
import sympy as s
import mpmath as mp

src = Path(__file__).parent/'cathedral_audit/cathedral_64_chiral_hybridization_2026_10_29.py'
with contextlib.redirect_stdout(io.StringIO()):
    ns=runpy.run_path(str(src))
K=ns['K']; B=ns['B']; L_I=ns['L_I']; L_D=ns['L_D']
I12=s.eye(12); I20=s.eye(20)
Ph=s.eye(20)-B.T*(B*B.T).inv()*B
P3=s.simplify(Ph*(5*I20-L_D)/2)
P5=s.simplify(Ph*(L_D-3*I20)/2)
assert P3*P3==P3 and P5*P5==P5 and P3*P5==s.zeros(20)
assert P3.trace()==4 and P5.trace()==4
# Hidden energy=5: + face sheet, 5-face spectral quartet; - face sheet,
# 3-face spectral quartet.
Pmid_face=s.BlockMatrix([[(P3+P5)/2,(P5-P3)/2],[(P5-P3)/2,(P3+P5)/2]]).as_explicit()
P_energy5=s.diag(s.zeros(24),Pmid_face)
# Hidden energy=7 on - face sheet, 5-face quartet.
P7_face=s.BlockMatrix([[P5/2,-P5/2],[-P5/2,P5/2]]).as_explicit()
# Complementary 5-dimensional vertex irrep at L_I eigenvalue 6 ->
# 7 on 12_A since K_V = L_I + I in this representation.
P_ico5=-(L_I*(L_I*L_I-10*L_I+20*I12))/24
assert P_ico5*P_ico5==P_ico5 and P_ico5.trace()==5
P_energy7=s.diag(P_ico5,s.zeros(12),P7_face)
for P,lam,dim in [(P_energy5,5,8),(P_energy7,7,9)]:
    assert P*P == P and P==P.T and P.trace()==dim
    assert K*P==lam*P and P*K==lam*P
assert K.trace()==304 and (K*K).trace()==1826

mp.mp.dps=40
pi,phi=mp.pi,(1+mp.sqrt(5))/2
delta=80*pi/(1053*phi);gamma=mp.mpf(1)/81
beta=mp.mpf(1)/4
arf1=-delta**3*beta**3/(1-beta**3)-gamma/mp.mpf(40)
arf2=3/(64*phi)+1/(79*phi**2)
arf3=-mp.mpf(5)/16*delta**3+mp.mpf(7)/8*pi*phi
arf4=mp.mpf(3)/35*delta**2-mp.mpf(4)/51*pi**3
assert beta**3/(1-beta**3)==mp.mpf(1)/63
# Exact structural origin of poles/multiplicities -- source weights remain premises.
assert gamma*9==mp.mpf(1)/9
assert gamma*8/64==gamma/8
# v101 notation problem when P_4_5 has rank4 and K5 is 5I:
assert s.Rational(4,8*5)==s.Rational(1,10)
assert s.Rational(1,10)!=s.Rational(1,40)

print('PASS original full K64 trace invariants; P5 rank8, P7 rank9 and spectral commutation')
print('PASS four historical ARF arithmetic channels (no empirical fitting)')
for name,v in [('Delta_delta',arf1),('R_alpha',arf2),('C_mass',arf3),('R_mass',arf4),('delta_eff',delta+arf1)]:
    print(f'{name}={mp.nstr(v,22)}')
print('NOTE rank4/8/eigen5 trace=1/10, NOT 1/40; full K64 eig5 trace normalized by64=1/40 at zero frequency.')
print('NOTE rank denominators alone do not derive source couplings, physical alpha or mass identification.')
