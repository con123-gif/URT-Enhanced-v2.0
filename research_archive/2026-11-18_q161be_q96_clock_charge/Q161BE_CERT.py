#!/usr/bin/env python3
"""Exact original Q96 electric charge species registry x native 24-cycle diagnostic.
Conditional tensor diagnostic only; does not assert a source-dependent Ward join.
"""
from fractions import Fraction as F
from collections import Counter
# Q96: four LH doublets and eight RH singlets; 3 generations and conjugates.
species=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(species+species)*3
q=q+[-v for v in q]
assert len(q)==96
assert Counter(q)=={F(2,3):18,F(-2,3):18,F(-1,3):18,F(1,3):18,F(-1):6,F(1):6,F(0):12}
Q2=sum(v*v for v in q); Q4=sum(v**4 for v in q)
assert (Q2,Q4)==(F(32),F(176,9))
L=[[2*int(i==j)-int(j==(i+1)%24)-int(j==(i-1)%24) for j in range(24)] for i in range(24)]
assert all(sum(row)==0 for row in L)
t=sum(L[i][i] for i in range(24))
t2=sum(x*x for row in L for x in row)
assert (t,t2)==(48,144)
# The connected 24-cycle has rank 23: one constant kernel.
rank=sum(v!=0 for v in q)*23
nullity=96*24-rank
assert (rank,nullity,Q2*t,Q4*t2)==(1932,372,F(1536),F(2816))
print("Q161BE EXACT: Q96 charge x 24-clock rank 1932, nullity 372, Tr 1536, Tr2 2816")
print("CONDITIONAL ONLY: original source-dependent Q96/H64 Ward join remains OPEN")
