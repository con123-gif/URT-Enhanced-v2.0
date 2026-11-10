#!/usr/bin/env python3
"""Recover two historical tracial ARF rational factors from the URT
least-disturbance isometric readout and A4 vacuum. No historical coefficients
used to form operators. Conditional identification with physical rail/mass.
"""
import runpy,contextlib,io
from pathlib import Path
import numpy as np
from fractions import Fraction
D=Path(__file__).resolve().parent
H=D.parent/'urt_arf_forward_2026_11_09'
with contextlib.redirect_stdout(io.StringIO()):
 a=runpy.run_path(str(D/'URT_A4_CUBIC_EXACT_SOURCE_THEOREM_2026_11_10.py'))
 r=runpy.run_path(str(D/'URT_HAAR_CLOCK_POLAR_KMS_BRIDGE_2026_11_10.py'))
P3=np.array(r['P3'],float);P5=np.array(r['P5'],float)
P=P3+P5; U=r['U']; T=r['T']
Vs=a['Vgroups']; proper=a['proper']; faces=a['faces']; faceid=a['faceid']; compose=a['compose']; e=a['e']
def inverse(g):return tuple(g.index(i) for i in range(12))
V=next(iter(Vs))
normalizer=[g for g in proper if frozenset(compose(compose(g,v),inverse(g)) for v in V)==V]
assert len(normalizer)==12
Pavg=np.zeros((20,20))
for g in normalizer:
 Ug=np.zeros((20,20))
 for i,face in enumerate(faces):
  j=faceid[frozenset(g[x] for x in face)]
  Ug[j,i]=1
 Pavg+=Ug/12
Pv=P5@Pavg@P5
assert np.linalg.norm(Pv@Pv-Pv)<1e-11
assert abs(np.trace(Pv)-1)<1e-11
# Exact tracial URT information-recovered hidden stiffness factor 5.
L=3*P3+5*P5
Linv=P3/3+P5/5
factor1=np.trace(U@Pv@Linv@U.T)/8
factor2=np.trace(U@(P-Pv)@U.T)/8
assert abs(factor1-1/40)<1e-12
assert abs(factor2-7/8)<1e-12
rawfactor=np.trace(Pv@T)/8
assert abs(rawfactor-1/8)>1e-6
print('native A4 singlet rank',np.trace(Pv))
print('minimally disturbing 24-clock recovery rank-one inverse energy contribution:',factor1)
print('minimally disturbing complementary rank-seven trace:',factor2)
print('original unconditioned clock transfer unweighted A4 singlet:',rawfactor)
print('PASS conditional information-readout two-factor bridge: no fitted ARF inputs')