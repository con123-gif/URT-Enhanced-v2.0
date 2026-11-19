#!/usr/bin/env python3
"""Exact source-native 190x24 golden-clock determinant factorization."""
import sympy as s
x=s.symbols("x")
T=s.Matrix([[2*x,-1],[1,0]])
assert T.det()==1 and T.trace()==2*x
a,b=s.Integer(2),2*x
for n in range(2,25):
    a,b=b,s.expand(2*x*b-a)
    assert s.expand(b-2*s.chebyshevt(n,x))==0
assert s.expand(b-2*s.chebyshevt(24,x))==0
y,z=s.symbols("y z")
p=s.Poly(2*(s.chebyshevt(24,y/2)-1),y)
assert p.degree()==24 and p.LC()==1
assert s.cancel(2*z**24*s.chebyshevt(24,(z+1/z)/2)-(z**48+1))==0
phi=(1+s.sqrt(5))/2
alpha=s.simplify(24/phi**2)
assert s.simplify(alpha-(36-12*s.sqrt(5)))==0
assert alpha.is_rational is False
print("Q161by EXACT PASS: transfer trace 2*T24; clock determinant 2*r^48*(T24(x)-cos(24theta)); 24/phi^2=36-12sqrt(5) irrational")
