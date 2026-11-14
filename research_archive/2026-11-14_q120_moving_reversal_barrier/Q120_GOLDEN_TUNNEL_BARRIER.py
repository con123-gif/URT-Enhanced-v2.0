#!/usr/bin/env python3
"""Q120 exact 13-spin golden-centre barrier. NO Q77 history-clock inputs."""
from itertools import product,combinations
from collections import Counter,deque
import sympy as sp
phi=(1+sp.sqrt(5))/2
v=([(0,sp.Integer(a),sp.Integer(b)*phi) for a,b in product((-1,1),repeat=2)]
  +[(sp.Integer(a),sp.Integer(b)*phi,0) for a,b in product((-1,1),repeat=2)]
  +[(sp.Integer(a)*phi,0,sp.Integer(b)) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2)
       if sp.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0]
assert len(edges)==30
outer=[]
for mask in range(4096):
    s=[1-2*((mask>>i)&1) for i in range(12)]
    outer.append((sum(s[i]*s[j] for i,j in edges),sum(s)))
assert {m:min(e for e,n in outer if abs(n)==m) for m in range(0,13,2)}=={
    0:-10,2:-8,4:-6,6:0,8:10,10:20,12:30}
full=[]
for mask in range(8192):
    e,m=outer[mask&4095]
    full.append((e,m,1-2*((mask>>12)&1)))
classes={(e,c*m) for e,m,c in full}
below={(e,n):bool(sp.simplify(e+10+phi*n).is_nonpositive)
       for e,n in classes}
sub={i for i,(e,m,c) in enumerate(full) if below[e,c*m]}
assert len(sub)==444
assert Counter((full[i][0],abs(full[i][1])) for i in sub)=={
    (-6,4):60,(-8,2):240,(-10,0):144}
pos=[i for i,x in enumerate(full) if x==(-6,4,-1)]
neg={i for i,x in enumerate(full) if x==(-6,-4,1)}
assert len(pos)==len(neg)==30
start=pos[0];parents={start:None};todo=deque([start]);end=None
while todo:
    u=todo.popleft()
    if u in neg:end=u;break
    for k in range(13):
        w=u^(1<<k)
        if w in sub and w not in parents:
            parents[w]=u;todo.append(w)
assert end is not None
path=[];u=end
while u is not None:
    path.append(u);u=parents[u]
path.reverse()
assert len(path)==6
assert [full[u][1] for u in path]==[4,2,0,0,-2,-4]
assert all((path[j]^path[j+1]).bit_count()==1 for j in range(5))
assert sum((path[j]^path[j+1])==(1<<12) for j in range(5))==1
assert all(sp.simplify(e+phi*c*m+10).is_nonpositive
           for u in path for e,m,c in [full[u]])
for i,u in enumerate(path):
    e,m,c=full[u]
    print("step",i,"mask",u,"E",e,"M",m,"centre",c,
          "H",sp.simplify(e+phi*c*m))
seen={start};todo=deque([start])
while todo:
    u=todo.popleft()
    for k in range(13):
        w=u^(1<<k)
        if w in sub and w not in seen:seen.add(w);todo.append(w)
assert seen==sub
barrier=sp.simplify(-10-(-6-4*phi))
gap=sp.sqrt(5)-1
assert sp.simplify(barrier-2*gap)==0
for u,(e,m,c) in enumerate(full):
    ee,mm,cc=full[u^8191]
    assert (ee,mm,cc)==(e,-m,-c)
print("Exact barrier",barrier,"first gap",gap,"ratio 2")
print("Threshold component 444 states; finite equilibrium unbiased orientation zero")
print("TRACK M ONLY; no Q77 selected history; no claimed physical ARF")
print("Q120 EXACT GOLDEN REVERSAL BARRIER: PASS")
