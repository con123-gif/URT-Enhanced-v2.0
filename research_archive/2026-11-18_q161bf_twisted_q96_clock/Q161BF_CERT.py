#!/usr/bin/env python3
"""Conditional Q96 species holonomy on original 24-cycle. Exact cyclotomic check."""
from fractions import Fraction as F
from collections import Counter
import sympy as s
species=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(species+species)*3
q=q+[-v for v in q]
assert len(q)==96
counts=Counter(q)
assert counts=={F(2,3):18,F(-2,3):18,F(-1,3):18,F(1,3):18,F(-1):6,F(1):6,F(0):12}
rank=0;null=0;det_classes={}
for charge,n in counts.items():
    h=s.exp(2*s.pi*s.I*s.Rational(charge.numerator,charge.denominator)).expand(complex=True)
    D=s.zeros(24)
    for k in range(23):
        D[k,k]=-1
        D[k,k+1]=1
    D[23,23]=-1
    D[23,0]=h
    det=s.simplify(D.det(method='domain-ge'))
    assert s.simplify(det-(1-h))==0,(charge,det,h)
    if charge.denominator==1:
        assert h==1 and det==0
        r=23
    else:
        assert s.simplify(s.conjugate(det)*det-3)==0
        r=24
    rank+=n*r;null+=n*(24-r)
    det_classes[str(charge)]=str(s.simplify(s.conjugate(det)*det))
assert (rank,null)==(2280,24),(rank,null)
print('Q161BF EXACT CONDITIONAL: rank 2280 nullity 24; |det Dq|²=3 for 72 fractional-charge species; 24 integer-charge species have det 0')
print('holonomy determinant classes',det_classes)
