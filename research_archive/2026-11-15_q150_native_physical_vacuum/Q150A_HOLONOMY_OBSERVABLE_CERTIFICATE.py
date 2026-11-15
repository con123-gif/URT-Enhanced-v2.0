#!/usr/bin/env python3
"""Exact Q150a compact Wilson holonomy diagnostic; no native v61 needed."""
from sympy import symbols,pi,sin,simplify,I,exp,Abs
c=symbols('c',real=True)
d2=4*sin(c/6)**2
assert simplify(d2-(2-exp(I*c/3)-exp(-I*c/3)))==0
assert simplify(d2.subs(c,0))==0
assert simplify(d2.subs(c,3*pi))==4
assert simplify(d2.subs(c,6*pi))==0
assert simplify(d2.subs(c,-3*pi))==4
assert simplify(d2.subs(c,c+6*pi)-d2)==0
assert simplify(d2.subs(c,-c)-d2)==0
assert simplify(sin(c/3).subs(c,3*pi))==0
print("Q150a minimal-charge 6pi compact Wilson holonomy diagnostic: PASS")
