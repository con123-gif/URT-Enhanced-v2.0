#!/usr/bin/env python3
"""A concrete parameter-free joint URT chronology / icosahedral coupling,
under stated geometric axioms: exactly two-bit parity-preserving flips,
all 15 unordered axis pairs A5-equivalent, and unit total Markov probability.

No ARF value enters as input. This is a conditional mathematical selection
and exact source response, not a derived Standard Model source dictionary.
"""
from itertools import combinations
from pathlib import Path
import contextlib,io,runpy
import numpy as np
import sympy as s
H=next(p for p in (Path(__file__).resolve().parent.parent/'forward',Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
    src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
K=np.asarray(m['Hbits'],float)
P=np.zeros((64,64))
Q=np.zeros((64,64))
for h in range(64):
    for i,j in combinations(range(6),2):P[h,h^(1<<i)^(1<<j)]+=1/15
    Q[h,(2*h)%64]+=.5
    Q[h,(2*h+1)%64]+=.5
assert np.linalg.norm(P-(np.eye(64)-K/15))<1e-13
assert np.linalg.norm(Q@P-P@Q)<2e-13
F=Q@P
assert np.max(abs(F.sum(axis=1)-1))<1e-14
assert np.max(abs(F.sum(axis=0)-1))<1e-14
assert np.min(F)>-1e-15
assert np.linalg.norm(np.linalg.matrix_power(F,6)-np.ones((64,64))/64)<2e-12
R3=np.asarray(src['R3'],float);R5=np.asarray(src['R5'],float)
assert np.linalg.norm(P@R3+R3/5)<1e-10
assert np.linalg.norm(P@R5+R5/15)<1e-10
# Exact source-lag trace residues from independent original all-five Q(sqrt5) proof.
z=s.sqrt(5)
c3=(36+72*z/5,s.Rational(18,5)+36*z/25,(27+9*z)/25,(36+18*z)/25,0)
c5=(7,s.Rational(7,40),-s.Rational(61,120),-s.Rational(1,24),-s.Rational(1,6))
num3=s.factor(c3[0]+2*sum(c3[k]*(-s.Rational(1,5))**k for k in range(1,5)))
num5=s.factor(c5[0]+2*sum(c5[k]*(-s.Rational(1,15))**k for k in range(1,5)))
assert s.simplify(num3-18*(6011+2403*z)/3125)==0
assert s.simplify(num5-s.Rational(4235591,607500))==0
Cn=[];Fk=np.eye(64)
for k in range(6):
    Cn.append((np.trace(R3.T@Fk@R3)/64, np.trace(R5.T@Fk@R5)/64))
    Fk=Fk@F
assert all(abs(Cn[k][0]-float(c3[k]*(-s.Rational(1,5))**k))<1e-10 for k in range(5))
assert all(abs(Cn[k][1]-float(c5[k]*(-s.Rational(1,15))**k))<1e-10 for k in range(5))
assert abs(Cn[5][0])+abs(Cn[5][1])<1e-12
assert abs(Cn[0][0]+2*sum(v[0] for v in Cn[1:5])-float(num3))<1e-10
assert abs(Cn[0][1]+2*sum(v[1] for v in Cn[1:5])-float(num5))<1e-10
print('Exact canonical P=A_pair/15: 15 equally likely two-bit flips; original Hbits=15(I-P)')
print('Commutator [P,Q] residual',np.linalg.norm(Q@P-P@Q))
print('One joint process F=PQ=QP, F^6=J64/64 residual',np.linalg.norm(np.linalg.matrix_power(F,6)-np.ones((64,64))/64))
print('Source hidden3 eigenvalue P:',-s.Rational(1,5),'hidden5:',-s.Rational(1,15))
print('Joint URT+geometry two-sided Green-Kubo hidden3 =',num3,'=',float(num3))
print('Joint URT+geometry two-sided Green-Kubo hidden5 =',num5,'=',float(num5))
print('Source ratio even/(odd+even) =',float(num5/(num3+num5)))
print('PASS exact finite-memory combined chronology and minimal A5 pair coupling, no fitted scalar')
