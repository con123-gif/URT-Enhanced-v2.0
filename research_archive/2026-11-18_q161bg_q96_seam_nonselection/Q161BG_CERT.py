#!/usr/bin/env python3
"""Q161bg bounded native Q96/24-clock seam nonselection certificate.
Original Q96 charge registry and 24-cycle. Does EM Ward select the seam?
No H64/Q101 source-to-clock map is assumed or claimed.
"""
from fractions import Fraction as F
from collections import Counter
import sympy as S
species=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
charges=(species+species)*3
charges += [-x for x in charges]
assert len(charges)==96
counts=Counter(charges)
assert counts=={F(2,3):18,F(-2,3):18,F(-1,3):18,F(1,3):18,F(-1):6,F(1):6,F(0):12}
w=S.Rational(-1,2)+S.sqrt(3)*S.I/2
results=[]
for h in (S.Integer(1),w):
    D=S.zeros(24)
    for k in range(23):
        D[k,k]=-1
        D[k,k+1]=1
    D[23,23]=-1
    D[23,0]=h
    assert all(q*D-D*q==S.zeros(24) for q in counts)
    det=S.simplify(D.det(method='domain-ge'))
    assert S.simplify(det-(1-h))==0
    rank=23 if h==1 else 24
    results.append((96*rank,96*(24-rank),S.simplify(S.conjugate(det)*det)))
assert results==[(2208,96,S.Integer(0)),(2304,0,S.Integer(3))],results
print('Q161BG exact original Q96 electric Ward nonselection')
print('h=1: rank 2208 nullity 96 determinant-square 0')
print('h=exp(2pi i/3): rank 2304 nullity 0 determinant-square 3')
print('Both commute with Q96 electric charge; original H64/Q101 seam and full Ward OPEN')
