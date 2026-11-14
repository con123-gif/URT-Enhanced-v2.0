#!/usr/bin/env python3
"""Q99: exact parity rigidity of original 64-history URT successor block transfer."""
from fractions import Fraction as F
import sympy as s
N=64
def zvals(t):
    return [2*((1-t[j%32])+(1-t[j//2])*(1-2*t[j//2])) for j in range(N)]
def dense(t):
    B=[[F(0)]*N for _ in range(N)]
    for x,a in enumerate(t):
        B[x][2*x]=a; B[x][2*x+1]=1-a
        B[x+32][2*x]=1-a; B[x+32][2*x+1]=a
    w=[F(-1 if j.bit_count()%2 else 1) for j in range(N)]
    v=[w[i]-sum(B[i][j]*w[j] for j in range(N)) for i in range(N)]
    Aw=[v[j]-sum(B[i][j]*v[i] for i in range(N)) for j in range(N)]
    return [Aw[j]*w[j] for j in range(N)]
for a in [F(1,4),F(1,3),F(2,5)]:
    t=[a]*32
    assert len(set(zvals(t)))==1
    assert dense(t)==zvals(t)
    for j in range(32):
        q=t.copy();q[j]=a+F(1,100)
        assert dense(q)==zvals(q)
        assert len(set(zvals(q)))>1
a,b=s.symbols('a b')
f=lambda x:(1-x)*(1-2*x)
assert s.simplify(2*((1-b)+f(a))-2*((1-a)+f(a)))==2*(a-b)
# Exact induction: z_1=z_0 implies t_1=t_0; if t_k=t_0,
# z_(2k)=z_0 and z_(2k+1)=z_0 force t_(2k)=t_(2k+1)=t_0.
# Every index 0..31 is reached by the binary parent map floor(j/2).
print("Q99 PASS: V=0 iff t_0=...=t_31; 99 dense 64x64 regressions")
