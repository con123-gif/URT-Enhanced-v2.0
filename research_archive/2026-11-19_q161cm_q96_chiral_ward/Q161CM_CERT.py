#!/usr/bin/env python3
"""Exact Q96 charge-sector Ward kernel from the original Q125/Q96 charge registry.
No fitted or measured input; source embedding 50->96 is NOT assumed.
"""
from fractions import Fraction as F
from collections import Counter
q8=(F(2,3),)*3+(F(-1,3),)*3+(F(-1),F(0))
assert len(q8)==8
q24=q8*3
counts=Counter(q24)
assert counts=={F(2,3):9,F(-1,3):9,F(-1):3,F(0):3}
allowed=sum(v*v for v in counts.values())
forbidden=sum(a!=b for a in q24 for b in q24)
assert (allowed,forbidden)==(180,396)
nullity=rank=0
for i in range(24):
 for j in range(24):
  if q24[i]-q24[j]==0: nullity+=1
  else: rank+=1
assert (rank,nullity)==(396,180)
assert 2*allowed==360
print("Q161cm EXACT PASS: Ward rank 396; complex kernel 180; Hermitian chiral real dimension 360")
print("Q96 charge sector only; no 50-to-96 embedding or H64/24 Ward claimed")
