#!/usr/bin/env python3
"""Q27: exact Q3 twirled Q2 chronology on Q24 history-symmetry orbits.

Imports the archived icosahedral A5 action, not a synthetic matrix. All
transfer moments and orbit counts are integer-exact. Fail-on-error.
"""
from collections import Counter
from itertools import permutations
from pathlib import Path
from contextlib import redirect_stdout
from io import StringIO
import json,runpy
import numpy as np

root=Path(__file__).resolve().parents[1]
q3=root/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
assert q3.is_file(),q3
with redirect_stdout(StringIO()): mod=runpy.run_path(str(q3))
perms=mod['geometric_a5_on_codes']()
assert len(perms)==60
Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):
    Q[h,(2*h)%64]=Q[h,(2*h+1)%64]=1
bits=np.array([[(h>>i)&1 for i in range(6)] for h in range(64)],dtype=np.int64)

def moment(D):
    code=((bits ^ np.array([x&1 for x in D])) << np.array([x//2 for x in D])).sum(axis=1)
    inv=np.empty(64,dtype=np.int64);inv[code]=np.arange(64)
    X=Q[np.ix_(inv,inv)]
    T=np.zeros((64,64),dtype=np.int64)
    for p in perms:T+=X[np.ix_(p,p)]
    return int(np.trace(T@T))

def signed_action(p):
    b=int(p[0]);dst=[];flip=[]
    for i in range(6):
        bit=int(p[1<<i])^b
        assert bit and bit&(bit-1)==0
        j=bit.bit_length()-1
        dst.append(j);flip.append((b>>j)&1)
    assert sorted(dst)==list(range(6))
    return tuple(dst),tuple(flip)
actions=[signed_action(p) for p in perms]
assert len(set(actions))==60

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
representatives=[]
while remaining:
    D=min(remaining)
    orbit={act(d,a) for d in eight(D) for a in actions}
    assert len(orbit)==480 and orbit<=remaining
    remaining-=orbit
    representatives.append(D)
assert len(representatives)==96
counts=Counter();distinct=Counter();counterR=counterS=0
for D in representatives:
    V={d:moment(d) for d in eight(D)}
    assert V[D]==V[inv(D)]
    counterR+=V[D]!=V[rev(D)]
    counterS+=V[D]!=V[alt(D)]
    distinct[len(set(V.values()))]+=1
    counts.update(V.values())
    # A5 covariance is exact by the complete group twirl; sample two actions.
    assert all(moment(act(D,a))==V[D] for a in (actions[1],actions[31]))
assert counterR==counterS==0
assert distinct==Counter({1:96})
assert len(counts)==32 and sum(counts.values())==768
assert {31440,42480,27120}<=set(counts)
# Strong independent cross-check against the archived Q3 full 46,080 census.
archived=root/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.json'
if archived.is_file():
    ref=json.loads(archived.read_text())['values_with_multiplicity']
    assert {str(k):v*60 for k,v in counts.items()}==ref
print(json.dumps({'result':'OBSTRUCTION: twirled Tr S_D^2 is invariant under R and S',
 'A5_order':60,'signed_dictionaries':46080,'A5_times_history_orbits':96,
 'R_inequivalent':counterR,'S_inequivalent':counterS,
 'distinct_values_per_eight_orbit':dict(distinct),
 'distinct_global_moments':len(counts),'multiplicity_per_A5_class':dict(sorted(counts.items())),
 'physical_ARFs':'not derived'},sort_keys=True))
