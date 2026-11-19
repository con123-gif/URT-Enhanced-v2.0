#!/usr/bin/env python3
"""Original Q96 right-singlet charge registry: exact symmetric Majorana selection."""
from fractions import Fraction as F
from collections import Counter
q8 = (F(2,3),)*3 + (F(-1,3),)*3 + (F(-1), F(0))
q = q8*3
assert len(q)==24 and Counter(q)=={F(2,3):9,F(-1,3):9,F(-1):3,F(0):3}
allowed = [(i,j) for i in range(24) for j in range(i,24) if q[i]+q[j]==0]
forbidden = [(i,j) for i in range(24) for j in range(i,24) if q[i]+q[j]!=0]
assert len(allowed)==6 and len(forbidden)==294
assert all(q[i]==q[j]==0 for i,j in allowed)
assert len([1 for i,j in allowed if i==j])==3
assert len([1 for i,j in allowed if i!=j])==3
print('Q161cn EXACT PASS: symmetric right-singlet Q96 Majorana kernel 6 complex, rank 294; only 3 neutral singlets')
print('Scope: charge selection only, no mass magnitude or source-to-Q96 embedding B')
