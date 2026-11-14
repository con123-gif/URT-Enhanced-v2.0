#!/usr/bin/env python3
"""Q111: global charge-bundle lift and 6pi-native Wilson compactness certificate.

Reexecutes ORIGINAL Q107 (five Platonic 190/50/H64 moving Berry Chern +7)
and Q106 (Q(sqrt5) exact charged moving spectrum). Original archived v61 source
is required. The Berry=physical electron line identification is CONDITIONAL.
No measured numbers or fitted old ARF equations are used.
"""
from pathlib import Path
from fractions import Fraction
from math import pi, sqrt, gcd
import importlib.util, runpy, sys
import numpy as np

ROOT=Path(__file__).resolve().parents[2]
R=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q107_berry_topological_photon/Q107_BERRY_CHERN_AND_MAXWELL.py'))
assert R['Chern']==7 and len(R['faces'])==32
assert abs(sum(R['a3'] if len(face)==3 else R['a5'] for face in R['faces'])-14*pi)<1e-11
# If a globally smooth SU2 rotation aligned all n_a to fixed sigma3,
# it would furnish a nonzero global section of the + eigenline, forcing c1=0.
assert R['Chern']!=0
print('Global smooth SU2 alignment of broken charge axis is obstructed: Chern=+7')

q96=[Fraction(-1),Fraction(-2,3),Fraction(-1,3),Fraction(0),
     Fraction(1,3),Fraction(2,3),Fraction(1)]
m96=[6,18,18,12,18,18,6]
assert sum(m96)==96 and sum(m*q*q for q,m in zip(q96,m96))==32
period=1
for q in q96:
    period=period*q.denominator//gcd(period,q.denominator)
assert period==3
# CONDITIONAL: if the Berry eigenline L is assigned physical unit electron
# charge, an ordinary fractional q=1/3 line requires M^3=L.
# c1(L)=7 cannot equal 3*c1(M) on this sphere.
assert 7%3==1
print('No ordinary cubic root of Berry line L: 7 mod 3 = 1 (conditional EM identification)')
# Explicit rank-three bundle E has determinant L:
# G(t)=diag(exp(i7t),1,1) = exp(i7t/3) * S(t)
# S(t)=diag(exp(i14t/3),exp(-i7t/3),exp(-i7t/3)) is SU3.
# At t=2pi: central phase omega, SU3 endpoint omega^2 I,
# so the product is single-valued; the factors separately are not.
omega=np.exp(2j*pi/3)
assert abs(np.exp(2j*pi*7/3)-omega)<1e-12
assert abs(np.exp(2j*pi*14/3)-omega**2)<1e-12
assert abs(np.exp(-2j*pi*7/3)-omega**2)<1e-12
for theta in (0,.13,1.3,pi,2*pi):
    center=np.exp(1j*7*theta/3)
    color=np.diag([np.exp(1j*14*theta/3),
          np.exp(-1j*7*theta/3),np.exp(-1j*7*theta/3)])
    assert abs(np.linalg.det(color)-1)<1e-12
    assert np.linalg.norm(center*color-
         np.diag([np.exp(1j*7*theta),1,1]))<1e-11
print('U(3) clutching det c1=7 with explicit compensating Z3 center: PASS')

source=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert source.is_file(),source
spec=importlib.util.spec_from_file_location('q111_original_native_v61',source)
v61=importlib.util.module_from_spec(spec);sys.modules[spec.name]=v61
spec.loader.exec_module(v61)
g,g5=v61.gamma_matrices()
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
G5=np.kron(np.eye(48),g5); I192=np.eye(192,dtype=complex)
one=np.zeros((48,11));one[0,3]=1
def hw(q,angle):
    return G5@(v61.wilson_operator_from_links(
       np.exp(1j*float(q)*angle*one))-float(v61.M_EXACT)*I192)
H0=hw(0,0)
for q in q96:
    assert np.linalg.norm(hw(q,6*pi)-H0)<1e-10
assert np.linalg.norm(hw(Fraction(1,3),2*pi)-H0)>.1
assert np.linalg.norm(hw(Fraction(2,3),2*pi)-H0)>.1
print('Genuine 192x192 v61 Wilson: all seven charges 6pi periodic, fractional charges not 2pi')

# Re-execute the ACTUAL Q106 exact moving charged spectral bands.
Z=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py'))
root5=sqrt(5)
num=lambda x:float(x[0])+root5*float(x[1])
pauli=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
A=np.zeros((30,30));H=np.zeros((60,60),complex)
scale=sqrt(2-2*root5/5)
for a,b in Z['links']:A[a,b]=A[b,a]=1
for a in range(30):
    for b,t in Z['nbr'][a]:
        H[2*a:2*a+2,2*b:2*b+2]=scale*(num(t[0])*np.eye(2)+
              1j*np.einsum('j,jkl->kl',[num(x) for x in t[1:]],pauli))
spin=np.linalg.eigvalsh(H)
assert max(abs(spin[::2]-spin[1::2]))<1e-10
shift=np.r_[spin[::2],np.linalg.eigvalsh(A)]
assert len(shift)==60
# The full Q96 registry decomposes into two 48-charge weak/singlet bands.
# EACH of the 60 moving weak+singlet levels is weighted by HALF the Q96
# charge multiplicity; double-counting it changes the determinant 2x.
half=[(q,m//2) for q,m in zip(q96,m96) if q!=0]
assert sum(m*q*q for q,m in half)==16
def gamma(angle):
    result=0.
    for q,m in half:
        e=np.linalg.eigvalsh(hw(q,angle))
        x=np.abs(e[:,None]+shift[None,:])
        assert np.min(x)>1e-8
        result-=m*np.log(x).sum()
    return float(result)
base=gamma(0.)
d2=gamma(2*pi)-base
d6=gamma(6*pi)-base
assert abs(d2)>1e-2,d2
assert abs(d6)<1e-6,d6
print('Exact model charge-weighted joined Gamma(2pi)-Gamma(0)=',d2)
print('Exact model charge-weighted joined Gamma(6pi)-Gamma(0)=',d6)
print('Q111 ORIGINAL GLOBAL BUNDLE + 6PI CHARGE PERIOD CERTIFICATE: PASS')
print('No conclusion of uniquely selected SU3, physical Maxwell alpha or particle masses.')
