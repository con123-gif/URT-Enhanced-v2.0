#!/usr/bin/env python3
"""Exact complement grading of original Q115 Hbits, no fitted inputs."""
from fractions import Fraction
from math import comb
import sympy as S
n=64
H=S.zeros(n); C=S.zeros(n)
for h in range(n):
    H[h,h]=15
    C[h,63-h]=1
    for i in range(6):
        for j in range(i+1,6):
            H[h,h^(1<<i)^(1<<j)]-=1
assert H==H.T and C==C.T and C*C==S.eye(n) and H*C==C*H
assert H.charpoly().as_expr().factor()==S.Symbol('lambda')**2*(S.Symbol('lambda')-10)**12*(S.Symbol('lambda')-16)**30*(S.Symbol('lambda')-18)**20
Pplus=(S.eye(n)+C)/2; Pminus=(S.eye(n)-C)/2
assert S.trace(Pplus)==32 and S.trace(Pminus)==32
for k in range(7):
    eig=18-S.Rational((6-2*k)**2,2)
    assert eig in (0,10,16,18)
    assert sum((-1)**(sum((h>>i)&1 for i in range(6))) for h in range(64))==0
for lam,mplus,mminus in [(0,2,0),(10,0,12),(16,30,0),(18,0,20)]:
    P=S.eye(n)
    for mu in (0,10,16,18):
        if mu!=lam:P=P*(H-mu*S.eye(n))/S.Rational(lam-mu)
    assert P*P==P and H*P==lam*P
    assert S.trace(P*Pplus)==mplus and S.trace(P*Pminus)==mminus
    assert P*C==((-1 if mminus else 1)*P)
print('EXACT: complement +: 0(2),16(30); complement -: 10(12),18(20).')
print('Q118 original Hbits complement grading: PASS')
