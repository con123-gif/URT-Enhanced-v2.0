#!/usr/bin/env python3
"""Exact no-fit URT history/clock to KMS test.

Read the ORIGINAL 2026-11-07 five-Platonic source; construct the six-bit
chronological Q and the symmetry-minimal pair transition P. Show what the
canonical PSD T=(QP)^T(QP) actually does on the source and check whether
repeated T or the native pi/e golden clock yields the frozen Delta^2 odds.

Scope: this is a test of this particular zero-extra-parameter coupling, not
of every candidate URT completion. Never use empirical ARF targets as inputs.
"""
import contextlib, io, runpy, math
from pathlib import Path
from itertools import combinations
import numpy as np
import sympy as s

h = next(p for p in (Path(__file__).resolve().parent.parent/'forward', next(p for p in (Path(__file__).resolve().parent.parent/'forward', Path(__file__).resolve().parent.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())) if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
    src=runpy.run_path(str(h/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R3=np.asarray(src['R3'],float);R5=np.asarray(src['R5'],float)
Q=np.zeros((64,64));P=np.zeros((64,64))
for a in range(64):
    Q[a,(2*a)%64]+=.5
    Q[a,(2*a+1)%64]+=.5
    for i,j in combinations(range(6),2):
        P[a,a^(1<<i)^(1<<j)] += 1/15
T=(Q@P).T@(Q@P)
bit0=np.array([[int(b==a^1) for b in range(64)] for a in range(64)],float)
Pi=(np.eye(64)+bit0)/2
assert np.linalg.norm(T-P@P@Pi)<1e-12
assert np.linalg.norm(T@(T@R3)-(T@R3)/25)<1e-12
assert np.linalg.norm(T@(T@R5)-(T@R5)/225)<1e-12

v=s.sqrt(5)
S3=36+72*v/5
S5=s.Integer(7)
g3=s.simplify(S3/2)
g5=s.Rational(19,6)
assert abs(np.trace(R3.T@Pi@R3)/64-float(g3))<3e-11
assert abs(np.trace(R5.T@Pi@R5)/64-float(g5))<3e-11
phi=(1+v)/2
Delta=s.Rational(3,20)-80*s.pi/(1053*phi)
r=s.pi/s.E
eta=-s.log(Delta)
# This equality is impossible for every integer n because r_n is algebraic
# and Delta^2 is transcendental (pi is transcendental; phi algebraic).
assert s.simplify(Delta).has(s.pi)
print('n, exact g3(n), exact g5(n), native p5(n)')
for n in range(1,7):
    a3=s.simplify(g3/s.Integer(25)**n)
    a5=s.simplify(g5/s.Integer(225)**n)
    a=float(a3);b=float(a5)
    t=np.linalg.matrix_power(T,n)
    assert abs(np.trace(R3.T@t@R3)/64-a)<2e-10
    assert abs(np.trace(R5.T@t@R5)/64-b)<2e-10
    print(n,a3,a5,'%.15g'%(b/(a+b)))

# Original charge-two 24 clock, unmodified source h3/h5.
omega=2*math.pi/float(phi**2)
rval=math.pi/math.e
modes=np.arange(24)
ell=2-2*np.cos(2*omega-2*math.pi*modes/24)
G18=float(np.mean(1/(18+rval*rval*ell)))
G16=float(np.mean(1/(16+rval*rval*ell)))
q_ratio=G16/G18
assert 1<q_ratio<18/16
# Chebyshev/Poisson closed resolvent; no fit and no num inverted matrices.
def clock_closed(E):
    x=rval*rval
    root=math.sqrt(E*(E+4*x))
    q=(E+2*x-root)/(2*x)
    theta=2*omega
    return (1/root)*(1-q**48)/(1-2*q**24*math.cos(24*theta)+q**48)
assert abs(G18-clock_closed(18))<2e-16
assert abs(G16-clock_closed(16))<2e-16
raw_odds=float(S5/S3)*q_ratio
raw_p=raw_odds/(1+raw_odds)
req_odds=float(Delta**2)
# The native source is enhanced at energy 16, not suppressed.
assert raw_odds>float(S5/S3)>0.1
assert raw_odds>req_odds*10000
# The frozen Delta amplitude is explicitly included in Nov 7 matter source.
preweighted_odds=raw_odds*req_odds
print('native clock G_18:',G18,'G_16:',G16,'ratio:',q_ratio)
print('unweighted source clock odds:',raw_odds,'probability:',raw_p)
print('frozen KMS odds:',req_odds,'probability:',req_odds/(1+req_odds))
print('original preweighted source odds (explicit Delta^2):',preweighted_odds)
print('n_eff interpolating discrete Gram-odds to KMS:', 1+math.log(float(g5/g3)/9/req_odds)/math.log(9))
print('PASS original five-Platonic source; exact Gram spectral recursion; exact golden clock; no fitted inputs')