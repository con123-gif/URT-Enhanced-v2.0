#!/usr/bin/env python3
"""Exact character inner products for Q115's native permutation census from CI #129."""
from fractions import Fraction as F
counts=[(1,64),(15,0),(20,4),(24,4)]
m1=F(sum(n*f for n,f in counts),60)
m4=F(4*64+20*4-24*4,60)
m5=F(5*64+15*0-20*4,60)
# The two 12-element 5-cycle classes have conjugate 3-dimensional
# characters whose sum is one, and each fixes four histories.
m3=F(3*64-15*0+12*4,60)
assert (m1,m3,m4,m5)==(4,4,4,4)
assert m1+2*3*m3+4*m4+5*m5==64
print("Q115 native-CI census exact A5 multiplicities: (4,4,4,4,4); PASS")
