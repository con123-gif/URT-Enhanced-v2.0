#!/usr/bin/env python3
"""Q161dd: exact pseudoinverse trace of original Q96 charge registry x native 24-cycle."""
from fractions import Fraction as F
import sympy as S
n=24
q8=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(q8*2)*3
q=q+[-v for v in q]
assert len(q)==96
L=S.zeros(n)
for i in range(n):
    L[i,i]=2
    L[i,(i+1)%n]=-1
    L[i,(i-1)%n]=-1
assert L[:n-1,:n-1].det()==n
x=S.symbols('x')
p=S.Poly(L.charpoly(x).as_expr(),x)
recip=S.cancel(-S.diff(p.as_expr(),x,2).subs(x,0)/(2*S.diff(p.as_expr(),x).subs(x,0)))
assert recip==S.Rational(575,12)
weighted=sum((S.Rational(v.denominator,v.numerator)**2 for v in q if v),S.Integer(0))
assert weighted==417
assert sum(1 for v in q if v)==84
assert recip*weighted==S.Rational(79925,4)
print("Q161dd EXACT: 24-cycle reciprocal trace",recip,"Q96 inverse charge weight",weighted)
print("Tr(K^+) =",recip*weighted)
print("CONDITIONAL Q96/24 operator only; B_x and physical gates OPEN")
