#!/usr/bin/env python3
"""Exact original Q161l Q/P response to a one-bit upstream character; conditional only."""
from fractions import Fraction as F
N=64
P=[[F(0)]*N for _ in range(N)]
Q=[[F(0)]*N for _ in range(N)]
for x in range(N):
    Q[x][2*x%N]+=F(1,2); Q[x][(2*x+1)%N]+=F(1,2)
    for i in range(6):
        for j in range(i+1,6): P[x][x^(1<<i)^(1<<j)]+=F(1,15)
def mul(A,v): return [sum((a*b for a,b in zip(row,v)),F(0)) for row in A]
def w(s): return [F(-1 if (s&x).bit_count()%2 else 1) for x in range(N)]
def dot(a,b): return sum((x*y for x,y in zip(a,b)),F(0))
parity=w(63)
assert mul(P,parity)==parity and mul(Q,mul(P,parity))==[0]*N
results=[]
for bit in range(6):
    changed=[parity[x]*(-1 if x&(1<<bit) else 1) for x in range(N)]
    s=63^(1<<bit)
    assert changed==w(s)
    eigen=F((6-2*s.bit_count())**2-6,30)
    assert eigen==F(1,3) and mul(P,changed)==[eigen*z for z in changed]
    out=mul(Q,mul(P,changed))
    norm=dot(out,out)
    expected=F(64,9) if bit==0 else F(0)
    assert norm==expected,(bit,norm,expected)
    results.append(norm)
assert results==[F(64,9)]+[F(0)]*5
print('Q161n original Q/P: bit-0 source character gives squared response 64/9; bits 1..5 zero; local exact PASS')
