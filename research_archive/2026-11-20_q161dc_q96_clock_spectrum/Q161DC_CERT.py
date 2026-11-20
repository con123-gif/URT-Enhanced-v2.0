#!/usr/bin/env python3
"""Q161dc: exact original Q96 charge-squared x native 24-cycle spectrum."""
import sympy as S
from fractions import Fraction as F
from collections import Counter
x=S.symbols("x")
q8=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(q8*2)*3
q=q+[-v for v in q]
assert len(q)==96
L=S.zeros(24)
for i in range(24):
    L[i,i]=2
    L[i,(i+1)%24]=-1
    L[i,(i-1)%24]=-1
p=S.factor(L.charpoly(x).as_expr())
expected=x*(x-4)*(x-3)**2*(x-2)**2*(x-1)**2*(x*x-4*x+1)**2*(x*x-4*x+2)**2*(x**4-8*x**3+20*x*x-16*x+1)**2
assert S.expand(p-expected)==0
counts=Counter(v*v for v in q)
assert counts=={F(4,9):36,F(1,9):36,F(1):12,F(0):12}
for charge,mult in counts.items():
    if charge:
        a=S.Rational(charge.numerator,charge.denominator)
        block=S.Poly(S.expand(a**24*p.subs(x,x/a)),x)
        assert block.degree()==24 and block.LC()==1 and block.eval(0)==0
        assert S.factor(block.as_expr())==S.factor(a**24*p.subs(x,x/a))
nullity=12*24+36+36+12
rank=96*24-nullity
assert (rank,nullity)==(1932,372)
assert (sum(qi*qi for qi in q)*S.trace(L),sum(qi**4 for qi in q)*S.trace(L*L))==(1536,2816)
print("Q161dc EXACT: P24 =",p)
print("Q96 squared charge multiplicities:",counts)
print("rank",rank,"nullity",nullity,"trace",1536,"trace-square",2816)
print("Source-dependent B_x NOT constructed; physical gates remain open")
