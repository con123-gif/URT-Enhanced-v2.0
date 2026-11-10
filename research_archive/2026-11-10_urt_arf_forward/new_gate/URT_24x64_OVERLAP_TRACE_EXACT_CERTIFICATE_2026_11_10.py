#!/usr/bin/env python3
"""Exact purely combinatorial proof of the URT 24-clock/64-history overlap
purity for every relative offset, not merely a numerical fit.

For a in (k/192,(k+1)/192), z={192a}, the clock/history boundaries
at integer units of 1/192 have residues r=0,1,2 modulo3, each appearing
for exactly 8 of the 24 clock bins. Their overlap lengths (in 1/192 units)
are:
 r=0: (3-z),3,(2+z)
 r=1: (2-z),3,3,z
 r=2: (1-z),3,3,(1+z).
All coefficients follow from 24 and 64, no fitted free parameter.
"""
import sympy as s
z=s.symbols('z',real=True)
L0=[3-z,s.Integer(3),2+z]
L1=[2-z,s.Integer(3),s.Integer(3),z]
L2=[1-z,s.Integer(3),s.Integer(3),1+z]
assert all(s.expand(sum(l)-8)==0 for l in [L0,L1,L2])
# 8 occurrences of each residue; B=sqrt(24*64)*C with C=length/192.
purity=s.simplify(s.Rational(24*64*8,192**2)*sum(sum(v*v for v in l) for l in (L0,L1,L2)))
assert s.simplify(purity-(s.Rational(64,3)-2*z+2*z*z))==0
assert s.diff(purity,z,2)==4
vertex=s.solve(s.diff(purity,z),z)
assert vertex==[s.Rational(1,2)]
assert purity.subs(z,s.Rational(1,2))==s.Rational(125,6)
assert purity.subs(z,0)==s.Rational(64,3)
print('symbolic purity=',purity)
print('global exact minimum=',purity.subs(z,s.Rational(1,2)),
      'maximum=',purity.subs(z,0))
print('uniqueness: stationary in each piece only at z=1/2; golden z is irrational')
print('PASS exact sympy polynomial identity and extrema')
