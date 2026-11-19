#!/usr/bin/env python3
"""Exact full Q96 conjugate-sector neutral symmetric bilinear selection."""
from fractions import Fraction as F
from collections import Counter
q8=(F(2,3),)*3+(F(-1,3),)*3+(F(-1),F(0))
q48=(q8+q8)*3
q96=q48+tuple(-q for q in q48)
assert len(q96)==96
counts=Counter(q96)
assert counts=={F(2,3):18,F(-2,3):18,F(1,3):18,F(-1,3):18,F(1):6,F(-1):6,F(0):12},counts
allowed=sum(q96[i]+q96[j]==0 for i in range(96) for j in range(i,96))
assert allowed==18*18+18*18+6*6+12*13//2==762
assert 96*97//2-allowed==3894
rank=sum(q96[i]+q96[j]!=0 for i in range(96) for j in range(i,96))
assert rank==3894
print('Q161co EXACT PASS: Q96 symmetric neutral dimension 762 complex; charged Ward rank 3894; total 4656')
print('Scope: native Q96 charge labels only; not a 50-to-96 source embedding or physical Majorana mass')
