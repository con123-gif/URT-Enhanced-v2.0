#!/usr/bin/env python3
"""Exact declared Q96 charge/24-cycle pseudodeterminant, no empirical inputs."""
from fractions import Fraction
charges = {Fraction(4,9):36, Fraction(1,9):36, Fraction(1):12}
assert sum(charges.values()) == 84 and 96-sum(charges.values()) == 12
def bareiss(a):
    a=[row[:] for row in a]; prev=1
    for k in range(len(a)-1):
        pivot=a[k][k]
        assert pivot != 0
        for i in range(k+1,len(a)):
            for j in range(k+1,len(a)):
                num=a[i][j]*pivot-a[i][k]*a[k][j]
                assert num%prev == 0
                a[i][j]=num//prev
        for i in range(k+1,len(a)): a[i][k]=0
        prev=pivot
    return a[-1][-1]
L=[[2*int(i==j)-int((i-j)%24 in (1,23)) for j in range(24)] for i in range(24)]
assert all(sum(row)==0 for row in L)
assert bareiss([row[:-1] for row in L[:-1]])==24
rank=23*sum(charges.values())
nullity=96*24-rank
assert (rank,nullity)==(1932,372)
product=Fraction(576)**84
for q2,m in charges.items(): product*=q2**(23*m)
assert product==Fraction(2**2160,3**3144)
print("Q161dg EXACT: pdet(K)=2^2160/3^3144; rank=1932; nullity=372; cofactor=24")
