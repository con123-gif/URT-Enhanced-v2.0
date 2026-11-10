#!/usr/bin/env python3
"""Independent A5/perfectness and native 24-clock Wilson no-go certificate.

No ARF targets, experimental constants or fitted parameters. Reconstructs the
A5/C5 signed 64-history action without importing any archived analysis.
"""
from itertools import permutations
from math import pi,e,sqrt
import numpy as np

def mul(p,q):return tuple(p[q[i]] for i in range(5))
def inv(p):return tuple(p.index(i) for i in range(5))
def even(p):return sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))%2==0
G=[p for p in permutations(range(5)) if even(p)]
I=tuple(range(5))
assert len(G)==60 and I in G
# A5 is perfect: its commutators generate the whole group (exact).
comm={mul(mul(mul(a,b),inv(a)),inv(b)) for a in G for b in G}
sub={I};frontier=[I]
while frontier:
    x=frontier.pop()
    for c in comm:
        y=mul(x,c)
        if y not in sub:sub.add(y);frontier.append(y)
assert len(sub)==60
print('A5 commutator subgroup order:',len(sub),'(entire A5): exact')
# Native uniform golden-angle charge-two Wilson clock.
phi=(1+sqrt(5))/2
r=pi/e
theta=2*pi/phi**2
n=24
U=np.zeros((n,n),dtype=complex)
for t in range(n):U[t,(t+1)%n]=np.exp(2j*theta)
assert np.linalg.norm(U.conj().T@U-np.eye(n))<1e-13
D=U-np.eye(n)
L=D.conj().T@D
lam=np.linalg.eigvalsh(L)
Theta=n*theta
assert abs(2*Theta/pi-96/phi**2)<1e-12
assert min(np.diff(lam))>1e-5
# At any holonomy, cos-spectrum degeneracies cannot exceed two.
for hol in (0.,pi/2,pi,Theta):
    vals=sorted(2-2*np.cos((2*pi*m-2*hol)/24) for m in range(24))
    groups=[]
    for v in vals:
        if groups and abs(groups[-1][-1]-v)<1e-11:groups[-1].append(v)
        else:groups.append([v])
    assert max(map(len,groups))<=2
    print('holonomy',hol,'max clock eigenspace dimension',max(map(len,groups)))
assert np.allclose(lam,sorted([2-2*np.cos((2*pi*m-2*Theta)/24) for m in range(24)]),atol=1e-12)
for E in (16,18):
    A=E*np.eye(n)+r*r*L
    assert np.linalg.eigvalsh(A)[0]>=E
    print('native Schur block E=',E,'min eigenvalue=',float(np.linalg.eigvalsh(A)[0]))
print('golden Wilson clock eigenvalue separation min:',float(min(np.diff(lam))))
# Each clock eigenspace has dimension <=2. Since A5 irreps have dimensions
# 1,3,3',4,5, every ordinary A5 action preserving L is trivial.
# Reconstruct native signed histories from 12 A5/C5 cosets.
cycle=(1,2,3,4,0)
def power(g,k):
    x=I
    for _ in range(k):x=mul(x,g)
    return x
H={power(cycle,j) for j in range(5)}
cosets=sorted({frozenset(mul(g,h) for h in H) for g in G},key=min)
idx={c:i for i,c in enumerate(cosets)}
assert len(cosets)==12
perms12={g:[idx[frozenset(mul(g,h) for h in c)] for c in cosets] for g in G}
normalizer=[g for g in G if {mul(mul(g,h),inv(g)) for h in H}==H]
assert len(normalizer)==10
ninv=next(g for g in normalizer if g not in H and power(g,2)==I)
opposite=[idx[frozenset(mul(mul(min(c),ninv),h) for h in H)] for c in cosets]
pairs=[];seen=set()
for j in range(12):
    if j not in seen:
        pairs.append((j,opposite[j]));seen.update(pairs[-1])
assert len(pairs)==6
sets=[frozenset(pair[(mask>>k)&1] for k,pair in enumerate(pairs)) for mask in range(64)]
idx64={x:i for i,x in enumerate(sets)}
assert len(idx64)==64
perms64={g:[idx64[frozenset(perms12[g][i] for i in ss)] for ss in sets] for g in G}
commuting=[];witness=None
for g,p in perms64.items():
    ok=True
    for h in range(64):
        lhs={p[(2*h)%64],p[(2*h+1)%64]}
        rhs={(2*p[h])%64,(2*p[h]+1)%64}
        if lhs!=rhs:
            ok=False
            if witness is None:witness=(g,h,tuple(sorted(lhs)),tuple(sorted(rhs)))
            break
    if ok:commuting.append(g)
assert commuting==[I]
assert witness==((0,1,3,4,2),0,(24,26),(48,49))
print('primitive Q A5 commutant order:',len(commuting),'(identity only): exact')
print('exact counterexample:',witness)
print('PASS: original Wilson 24-clock cannot carry nontrivial commuting ordinary A5 action')
print('PASS: factorized Q tensor A_clock cannot become one-step A5-equivariant')
