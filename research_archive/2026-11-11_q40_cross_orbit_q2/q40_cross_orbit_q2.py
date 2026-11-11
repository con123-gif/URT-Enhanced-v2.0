#!/usr/bin/env python3
"""Q40: independent exact native Q3/Q28 reconstruction and cross-orbit Q2 refinement.

The icosahedral graph automorphisms, Q2, A5 twirl and 96 eight-orbits
are rebuilt from the named Q3/Q28 constructions, not synthetic matrices.
"""
from collections import Counter,defaultdict
from itertools import product,permutations,combinations
import numpy as np
import networkx as nx
import json,time,hashlib
from pathlib import Path
st=time.monotonic()
ARCHIVE=Path(__file__).resolve().parents[1]
Q3_SOURCE=ARCHIVE/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28_SOURCE=ARCHIVE/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'
def blob_sha(p):
    b=p.read_bytes()
    return hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
# On GitHub CI, verify the native definitions being independently rebuilt.
if Q3_SOURCE.is_file() and Q28_SOURCE.is_file():
    assert blob_sha(Q3_SOURCE)=='bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984'
    assert blob_sha(Q28_SOURCE)=='6e22cb7654176c6499ee138737f4f85240619ec7'

PHI=(1+5**0.5)/2
pts=np.array([(0,a,b*PHI) for a,b in product((-1,1),repeat=2)]+[(a,b*PHI,0) for a,b in product((-1,1),repeat=2)]+[(a*PHI,0,b) for a,b in product((-1,1),repeat=2)],float)
pairs=[]; rem=set(range(12))
while rem:
    i=min(rem);j=min(rem-{i},key=lambda k:np.linalg.norm(pts[i]+pts[k]));pairs.append((i,j));rem-={i,j}
G=nx.Graph();G.add_edges_from((i,j) for i,j in combinations(range(12),2) if abs(np.linalg.norm(pts[i]-pts[j])-2)<1e-9)
code_of={frozenset(pairs[k][(c>>k)&1] for k in range(6)):c for c in range(64)}
perms=[]
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    p=[m[i] for i in range(12)]
    if np.linalg.det(np.linalg.lstsq(pts,pts[p],rcond=None)[0])>0:
        perms.append(np.array([code_of[frozenset(p[pairs[k][(c>>k)&1]] for k in range(6))] for c in range(64)]))
assert len(perms)==60
Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=1
Q2=Q@Q;Q3=Q2@Q
bits=np.array([[(h>>i)&1 for i in range(6)] for h in range(64)],dtype=np.int64)
def signed_action(p):
    b=int(p[0]);dst=[];flip=[]
    for i in range(6):
        bit=int(p[1<<i])^b
        assert bit and bit&(bit-1)==0
        j=bit.bit_length()-1;dst.append(j);flip.append((b>>j)&1)
    assert sorted(dst)==list(range(6))
    return tuple(dst),tuple(flip)
actions=[signed_action(p) for p in perms]
def act(D,a):
    dst,flip=a
    return tuple(2*dst[x//2]+((x&1)^flip[x//2]) for x in D)
def inv(D):return tuple(x^1 for x in D)
def rev(D):return D[::-1]
def alt(D):return tuple(x^(i&1) for i,x in enumerate(D))
def eight(D):
    seen={D};todo=[D]
    while todo:
        x=todo.pop()
        for f in (inv,rev,alt):
            y=f(x)
            if y not in seen:seen.add(y);todo.append(y)
    assert len(seen)==8
    return seen
remaining={tuple(2*p[i]+((s>>i)&1) for i in range(6)) for p in permutations(range(6)) for s in range(64)}
assert len(remaining)==46080
reps=[]
while remaining:
    D=min(remaining)
    orbit={act(d,a) for d in eight(D) for a in actions}
    assert len(orbit)==480 and orbit<=remaining
    remaining-=orbit;reps.append(D)
assert len(reps)==96

def twirl(D):
    code=((bits^np.array([x&1 for x in D],dtype=np.int64))<<np.array([x//2 for x in D],dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64);inverse[code]=np.arange(64)
    X=Q[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:S+=X[np.ix_(p,p)]
    assert np.all(S.sum(axis=0)==120) and np.all(S.sum(axis=1)==120)
    return S

def trace2(A,B):return int(np.sum(A*B.T))
records=[]
for oid,D in enumerate(reps):
    im=sorted(eight(D))
    assert len(im)==8
    # Pick exactly one from each inversion pair, preserving orbit provenance.
    d4=sorted(d for d in im if d<inv(d))
    assert len(d4)==4
    for d in d4:
        S=twirl(d)
        s2=S@S
        sig=(trace2(S,Q),trace2(S,Q2))
        ext=(trace2(S,Q3),trace2(s2,Q))
        assert all(isinstance(x,int) and x>=0 for x in sig+ext)
        assert np.array_equal(S,twirl(inv(d)))
        records.append((oid,d,sig,ext))
assert len(records)==384
old=defaultdict(list)
for x in records:old[x[2]].append(x)
assert len(old)==297
collisions=[(a,b) for group in old.values() for i,a in enumerate(group) for b in group[i+1:]]
assert len(collisions)==108
assert all(a[0]!=b[0] for a,b in collisions)
remaining_pairs=[(a,b) for a,b in collisions if a[3]==b[3]]
new=defaultdict(list)
for x in records:new[(x[2],x[3])].append(x)
assert len(new)==372
assert len(remaining_pairs)==12
assert len(collisions)-len(remaining_pairs)==96
witness=next(((a,b) for a,b in collisions if a[3]!=b[3]),None)
residual_orbit_pairs=Counter(tuple(sorted((a[0],b[0]))) for a,b in remaining_pairs)
assert residual_orbit_pairs==Counter({(2,58):4,(6,62):4,(41,81):4}),residual_orbit_pairs
# Check native matrix contractions by direct products for representative dictionaries.
for D in (reps[0],reps[-1]):
    S=twirl(D)
    assert trace2(S,Q3)==int(np.trace(S@Q3))
    assert trace2(S@S,Q)==int(np.trace(S@S@Q))
# Exact nonnegative walk-count bounds exclude int64 overflow.
assert 64*120*8 < 2**63 and 64*120**2*2 < 2**63
assert all(0<=x[3][0]<=64*120*8 and 0<=x[3][1]<=64*120**2*2 for x in records)

res={
 'orbits':96,'inversion_classes':384,'original_signatures':len(old),
 'original_cross_orbit_collision_pairs':len(collisions),
 'remaining_cross_orbit_collision_pairs':len(remaining_pairs),
 'split_cross_orbit_collision_pairs':len(collisions)-len(remaining_pairs),
 'refined_signatures':len(new),
 'residual_orbit_pairs':{str(k):v for k,v in sorted(residual_orbit_pairs.items())},
 'remaining_collision_groups':[{'signature':list(k),'members':[{'orbit':x[0],'dictionary':list(x[1])} for x in v]} for k,v in new.items() if len(v)>1],
 'first_split_witness':None if witness is None else {'D':list(witness[0][1]),'E':list(witness[1][1]),'old_signature':list(witness[0][2]),'new_D':list(witness[0][3]),'new_E':list(witness[1][3])},
 'elapsed_s':round(time.monotonic()-st,3),
 'exact_integer':True,'physical_ARFs':'not derived'}
assert sum(len(v)*(len(v)-1)//2 for v in new.values())==len(remaining_pairs)
print(json.dumps(res,indent=2,sort_keys=True))
