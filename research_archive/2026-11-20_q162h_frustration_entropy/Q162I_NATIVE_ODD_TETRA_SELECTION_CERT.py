#!/usr/bin/env python3
"""Q162i original tetrahedral cubic order parameter on all 60 Q101 vacua.

Uses original Q162E native 50->8->12->20->H64 full-five evolution.
An EXACT inversion theorem says current squared-face hidden source is
even, and therefore cannot create a signed imbalance even though the
tetrahedron supplies the only inversion-odd native third moment.
No hypothetical baryon/antibaryon identification or fitted coefficient.
"""
from pathlib import Path
import numpy as np,math,runpy,contextlib,io
from scipy.linalg import expm
src=Path(__file__).resolve().parent.parent/(
 "2026-11-20_q162d_h64_charge_doubling/Q162E_WHOLE_FIVE_TO_Q4_KINETIC_CERT.py")
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(src))
V=d['original_v'];ground=d['ground'];Iico=d['Iico'];K=d['kin']
C=d['C'];P3=d['P3'];P5=d['P5'];Delta=d['Delta'];phi=d['phi']
tetra=np.array([(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],float)/math.sqrt(3)
O={};spins={}
for mask,s,_ in ground:
 raw=s@V;N=np.linalg.norm(raw)
 assert abs(N-4/phi)<1e-11
 m=raw/N
 odd=sum((tetra@m)**3)
 # The only nonzero original unit-tetra third moment is T_xyz =
 # 4/(3sqrt3), six permutations, hence O=8*m_x*m_y*m_z/sqrt3.
 assert abs(odd-8*math.prod(m)/math.sqrt(3))<1e-11
 assert min(abs(odd-1/math.sqrt(3)),abs(odd),
            abs(odd+1/math.sqrt(3)))<1e-11
 O[mask]=odd;spins[mask]=s
assert len(O)==60
assert sum(z>1e-10 for z in O.values())==24
assert sum(abs(z)<1e-10 for z in O.values())==12
assert sum(z< -1e-10 for z in O.values())==24
for mask,odd in O.items():
 inv=mask^4095
 assert inv in O and abs(O[inv]+odd)<1e-11
 assert np.linalg.norm(spins[inv]+spins[mask])<1e-12
# For any linear kinetic x_s(t)=Iico exp(-K t) Iico.T s,
# x_-s(t)=-x_s(t), so f_-s(t)=(C(-x_s))**2=f_s(t)
# and u_-s(t)=u_s(t) for ANY Delta and ANY time. Thus
# w_-s(t)=w_s(t) and <odd> conditioned =0 IDENTICALLY.
for t in (0,1e-4,.01,.1,1,2):
 T=expm(-K*t);weights={}
 for mask,s,_ in ground:
  x=Iico@(T@(Iico.T@s));f=(C@x)**2
  u=P3@f+Delta*P5@f
  weights[mask]=float(u@u)
 assert max(abs(weights[m]-weights[m^4095]) for m in weights)<1e-11
 odd_mean=sum(weights[m]*O[m] for m in weights)/sum(weights.values())
 assert abs(odd_mean)<1e-14
print('Q162i PASS actual 60: -1/sqrt3 (24), zero (12), +1/sqrt3 (24)')
print('Q162i exact inversion paired hidden source -> no odd population bias')
print('Q162i physical parity/charge selection and Q96 local Ward OPEN')
