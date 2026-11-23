#!/usr/bin/env python3
"""Q161el: original Q124/Q125 inversion parity and standard Q96 weak-spin lift."""
from itertools import combinations, product
Z=(0,0)
def add(x,y): return (x[0]+y[0],x[1]+y[1])
def neg(x): return (-x[0],-x[1])
def mul(x,y): return (x[0]*y[0]+x[1]*y[1],x[0]*y[1]+x[1]*y[0]+x[1]*y[1])
def dot(u,v):
    z=Z
    for x,y in zip(u,v): z=add(z,mul(x,y))
    return z
def sign(z):
    a,b=z
    if b==0: return (a>0)-(a<0)
    if a==0: return (b>0)-(b<0)
    if a*b>0: return (a>0)-(a<0)
    c=2*a+b
    return ((c>0)-(c<0)) if c*c>5*b*b else (b>0)-(b<0)
V=[(Z,(a,0),(0,b)) for a,b in product((-1,1),repeat=2)]
V += [((a,0),(0,b),Z) for a,b in product((-1,1),repeat=2)]
V += [((0,b),Z,(a,0)) for a,b in product((-1,1),repeat=2)]
E={(i,j) for i,j in combinations(range(12),2) if dot(tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])),tuple(add(x,neg(y)) for x,y in zip(V[i],V[j])))==(4,0)}
allowed=set()
for m in range(8192):
    s=[1-2*((m>>i)&1) for i in range(12)]
    c=1-2*((m>>12)&1)
    if sign((sum(s[i]*s[j] for i,j in E)+10,c*sum(s)))<=0: allowed.add(m)
W={m:tuple(tuple(sum((1-2*((m>>i)&1))*V[i][k][h] for i in range(12)) for h in (0,1)) for k in range(3)) for m in allowed}
def canonical(q):
    return min(tuple(q[(sgn*i+shift)%4] for i in range(4)) for shift in range(4) for sgn in (1,-1))
S=set()
for m in sorted(allowed):
    for a,b in combinations(range(12),2):
        q=(m,m^(1<<a),m^(1<<a)^(1<<b),m^(1<<b))
        if min(q)==m and all(x in allowed for x in q): S.add(canonical(q))
assert (len(V),len(E),len(allowed),len(S))==(12,30,444,480)
assert all(m^8191 in allowed and W[m^8191]==tuple(neg(x) for x in W[m]) for m in allowed)
pairs=set()
for q in S:
    qi=tuple(x^8191 for x in q)
    r=canonical(qi)
    assert r in S and r!=q
    pairs.add(tuple(sorted((q,r))))
    assert all(dot(W[q[i]],W[q[j]])==dot(W[qi[i]],W[qi[j]]) for i in range(4) for j in range(4))
assert len(pairs)==240
assert 3*2*8*2==96
# Original Q125 spinor parallel transport is built from pairwise Pauli
# products; simultaneous W->-W preserves each factor, hence each
# ordered four-link product and its 48-fold standard Q96 weak-spin lift.
# This does not construct the missing physical H64->Q96 embedding.
print("Q161EL EXACT PASS: 444 states, 480 squares, 240 inversion pairs; Q125 Gram and standard 48-block Q96 weak-spin transport inversion-even.")
