#!/usr/bin/env python3
"""Exact fixed-frame gauge obstruction for the ORIGINAL 2026-11-09 Haar clock overlap."""
import sympy as s
phi=(1+s.sqrt(5))/2
alpha=s.simplify(phi**-2)
def positive(x):
    return bool(s.sign(s.simplify(x))==1)
def overlap(a,b,c,d):
    left=a if positive(a-c) else c
    right=b if positive(d-b) else d
    return s.simplify(right-left) if positive(right-left) else s.Integer(0)
C=s.zeros(24,64)
for j in range(24):
    a=s.Rational(j,24)+alpha
    b=s.Rational(j+1,24)+alpha
    for k in range(3):
        lo=max(0,int(64*(float(a)-k))-1)
        hi=min(63,int(64*(float(b)-k))+1)
        for h in range(lo,hi+1):
            C[j,h]+=overlap(a,b,s.Rational(h,64)+k,s.Rational(h+1,64)+k)
assert C*s.ones(64,1)==s.ones(24,1)/24
assert s.ones(1,24)*C==s.ones(1,64)/64
assert all(any(C[j,h]!=0 for h in range(64)) for j in range(24))
# Native q=2 Wilson large gauge: D_jj=exp(i*pi*j/12).
# DC=C requires every row with D_jj !=1 to vanish, which does not occur.
assert [j for j in range(24) if j%24==0]==[0]
assert sum(any(C[j,h]!=0 for h in range(64)) for j in range(1,24))==23
# A real untransported frame is impossible on the 22 rows with non-real D phase.
assert [j for j in range(24) if j%12==0]==[0,12]
assert sum(any(C[j,h]!=0 for h in range(64)) for j in range(24) if j not in (0,12))==22
print('EXACT original shifted Haar C: all 24 rows nonzero; margins 1/24,1/64')
print('EXACT DC=C fails on 23/24 rows; fixed real frame fails on 22/24 rows')
print('STATUS: finite conditional obstruction, physical source identification pending')
