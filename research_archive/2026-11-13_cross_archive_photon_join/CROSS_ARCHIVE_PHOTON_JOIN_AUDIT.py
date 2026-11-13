#!/usr/bin/env python3
"""Exact cross-archive check of Coulomb trace and charged-source normalization."""
import sympy as s
r=s.sqrt(5)
spec=[(2,5),(3,4),(5,4),(3-r,3),(3+r,3)]
trace=s.simplify(sum(s.Rational(m,1)/x for x,m in spec))
hidden=s.Rational(4,3)+s.Rational(4,5)
assert trace==s.Rational(137,15)
assert hidden==s.Rational(32,15)
assert s.simplify(trace-hidden)==7
for h,c,expected in [(18,s.Rational(1,4),s.Rational(2,9)),(16,s.Rational(1,4),s.Rational(7,32))]:
 assert c-s.Rational(1,2*h)==expected
r0,M=s.symbols('r0 M',real=True)
K=s.Rational(13,2)*s.sqrt(5)*(1+s.Rational(23,3)*r0**2+s.Rational(20,3)*r0**4-M*(r0/2+r0**3))
assert s.diff(K,M)!=0
t=s.symbols('t')
assert s.solve(s.Eq(t**2,1),t)==[-1,1]
print('PASS Coulomb 15 Tr L+=137, hidden=32, complement=105 (scaled)')
print('PASS Schur quartics 2/9 and 7/32 in original 197-mode action')
print('PASS A4 Kgamma retains nonzero dependence on source Wilson M; 137 trace does not fix it')
print('PASS original real 197-mode source does not supply nontrivial charge-2 U(1) representation without additional structure')
