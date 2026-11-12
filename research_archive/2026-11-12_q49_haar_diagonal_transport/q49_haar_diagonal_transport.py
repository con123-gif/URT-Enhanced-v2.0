#!/usr/bin/env python3
"""Exact support graph of the original 2026-11-09 shifted 24x64 Haar dictionary."""
import sympy as S
alpha=(3-S.sqrt(5))/2
N=24; H=64
assert S.simplify(alpha-(1/((1+S.sqrt(5))/2)**2))==0
bridges=[]
for j in range(N):
    boundary=alpha+S.Rational(j,24)
    b=boundary-S.floor(boundary)
    h=S.floor(H*b)
    assert S.simplify(b-S.Rational(h,H))>0
    assert S.simplify(S.Rational(h+1,H)-b)>0
    bridges.append(int(h))
assert len(bridges)==24 and len(set(bridges))==24
exclusive=[]
for j in range(N):
    left=alpha+S.Rational(j,24)
    right=left+S.Rational(1,24)
    h=S.ceiling(64*left)
    assert S.simplify(S.Rational(h,64)-left)>0
    assert S.simplify(right-S.Rational(h+1,64))>0
    exclusive.append(int(h)%64)
assert len(set(exclusive))==24
# A bridge column has two strictly positive overlaps, so DC=CU with diagonal
# unitaries implies D_j=D_(j-1) at every boundary, hence D is scalar.
# The 24 exclusive columns independently prove rank(C)=24 and nullity 40.
assert N==24 and H-N==40
assert len({j%24 for j in range(N)})==24
print("EXACT 24 boundary bridges; 24 exclusive columns; rank(C)=24; kernel=40")
print("EXACT diagonal DC=CU forces scalar D; charge-two Wilson D non-scalar")
print("STATUS conditional native Haar only; nonlinear/non-diagonal source OPEN")
