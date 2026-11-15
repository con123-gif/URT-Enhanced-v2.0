#!/usr/bin/env python3
"""Exact Q147 720-link fourth-power sum from canonical Q125a amplitude census.

This is a reconstructed algebraic cross-check of the Q125a source-weighted
link distribution; it does not compute the full charged Tr(H_ch^4).
"""
from sympy import Rational, sqrt, expand, simplify

root5=sqrt(5)
low=8*root5/5
high=4+12*root5/5
# Native Q125a undirected links: +/-low each 240; +/-high each 120;
# 240 zero outer-contact +72 zero central-contact.
counts={low:240, -low:240, high:120, -high:120, Rational(0):312}
assert sum(counts.values()) == 1032
assert sum(n for a,n in counts.items() if a != 0) == 720
second=expand(sum(n*a**2 for a,n in counts.items()))
fourth=expand(sum(n*a**4 for a,n in counts.items()))
assert simplify(second-(16896+4608*root5))==0
assert simplify(fourth-(5013504+2064384*root5)/5)==0
phi=(1+root5)/2
assert simplify(high/low - phi**2)==0
print('Q147 conditional on original Q125a exact native 1032-link census')
print('Q147 720 nonzero, 312 zero; high/low ratio phi²')
print('sum J_e^2 =', second)
print('sum J_e^4 =', fourth)
print('Q147 reconstructed exact algebra: PASS')
print('WARNING: this is NOT Tr(H_ch^4): it excludes closed-walk cross terms and Q96 holonomies')
