#!/usr/bin/env python3
"""Q71 exact native Q2 mixing of sigma1 24-clock fixed space."""
import sympy as s
n=64
sig=[None]*n
for x in range(32):
    sig[x]=2*x+1
    sig[x+32]=2*x
assert sorted(sig)==list(range(n))
cycles=[];seen=set()
for x in range(n):
    if x in seen: continue
    c=[];y=x
    while y not in seen:
        seen.add(y);c.append(y);y=sig[y]
    assert y==x
    cycles.append(c)
assert sorted(map(len,cycles))==[4,12,12,12,12,12]
Q=s.zeros(n)
for h in range(n):
    Q[h,2*h%n]=Q[h,(2*h+1)%n]=s.Rational(1,2)
C=s.zeros(n)
for c in cycles:
    for i in c:
        for j in c:
            C[i,j]=s.Rational(1,len(c))
J=s.ones(n)/n
assert C*C==C and C.T==C and C*J==J
ranks=[];comm=[]
P=s.eye(n)
for k in range(1,7):
    P=P*Q
    ranks.append((P*C-J).rank())
    comm.append((P*C-C*P).rank())
assert ranks==[5,3,2,1,0,0],ranks
assert comm==[10,6,4,2,0,0],comm
assert Q**5*C==J and C*Q**5==J
assert Q**4*C!=J
assert Q**6==J
print('rank(Q^k C-J), k=1..6:',ranks)
print('rank([Q^k,C]), k=1..6:',comm)
print('Q^5 C=C Q^5=J/64; Q^4 C != J/64')
print('Q71_Q2_CLOCK_MIXING_CERTIFIED')
