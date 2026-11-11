#!/usr/bin/env python3
"""Q28 exact Tr(S_D^3) of original geometric A5 twirl of primitive Q2.

The Q3 operator is imported, not substituted. Matrix arithmetic is int64,
with a proved magnitude bound below 2**63. The 96 Q24 orbits are exhausted.
"""
from collections import Counter, defaultdict
from contextlib import redirect_stdout
from io import StringIO
from itertools import permutations
from pathlib import Path
import json,runpy
import numpy as np

root=Path(__file__).resolve().parents[1]
q3=root/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
assert q3.is_file(),q3
with redirect_stdout(StringIO()): mod=runpy.run_path(str(q3))
perms=mod['geometric_a5_on_codes']()
assert len(perms)==60
Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=1
assert np.all(Q.sum(axis=1)==2)
bits=np.array([[(h>>i)&1 for i in range(6)] for h in range(64)],dtype=np.int64)
# Every S entry <=60 and each row sum =120. Thus each (S^3)_ii <=120^3
# and Tr S^3 <=64*120^3=110592000 <<2^63; integer matmul cannot overflow.
assert 64*120**3 < 2**63

def moments(D):
    code=((bits^np.array([x&1 for x in D],dtype=np.int64)) << np.array([x//2 for x in D],dtype=np.int64)).sum(axis=1)
    inv=np.empty(64,dtype=np.int64);inv[code]=np.arange(64)
    X=Q[np.ix_(inv,inv)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:S+=X[np.ix_(p,p)]
    assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
    S2=S@S
    return int(np.trace(S2)),int(np.trace(S2@S))

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
reps=[]
while remaining:
    D=min(remaining)
    orbit={act(d,a) for d in eight(D) for a in actions}
    assert len(orbit)==480 and orbit<=remaining
    remaining-=orbit
    reps.append(D)
assert len(reps)==96

per_orbit=Counter();global_k3=Counter();global_k2=Counter();R_break=S_break=0
partition_shapes=Counter()
first_S=None;first_any=None
for D in reps:
    values={d:moments(d) for d in sorted(eight(D))}
    assert len({v[0] for v in values.values()})==1
    assert values[D][1]==values[rev(D)][1],('R must be transpose isospectral',D)
    assert values[D][1]==values[inv(D)][1],('I must commute with Q',D)
    R_break+=values[D][1]!=values[rev(D)][1]
    S_break+=values[D][1]!=values[alt(D)][1]
    distinct={v[1] for v in values.values()}
    per_orbit[len(distinct)]+=1
    partition_shapes[tuple(sorted(Counter(v[1] for v in values.values()).values()))]+=1
    global_k2.update(v[0] for v in values.values())
    global_k3.update(v[1] for v in values.values())
    if len(distinct)>1 and first_any is None:
        x,y=next((x,y) for x in values for y in values if values[x][1]!=values[y][1])
        first_any={'D':list(x),'E':list(y),'TrS2':values[x][0], 'TrS3_D':values[x][1], 'TrS3_E':values[y][1]}
    if values[D][1]!=values[alt(D)][1] and first_S is None:
        first_S={'D':list(D),'S_D':list(alt(D)),'TrS2':values[D][0], 'TrS3_D':values[D][1], 'TrS3_S_D':values[alt(D)][1]}
    for a in (actions[1],actions[31]):
        assert moments(act(D,a))==values[D],('A5 twirl covariance',D,a)
assert sum(global_k3.values())==768
assert per_orbit==Counter({1:48,2:48})
assert partition_shapes==Counter({(8,):48,(4,4):48})
assert R_break==0 and S_break==48
assert len(global_k2)==32
q3_json=root/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.json'
if q3_json.is_file():
    ref=json.loads(q3_json.read_text())['values_with_multiplicity']
    assert {str(k):60*v for k,v in global_k2.items()}==ref
result={'task':'Q28','proper_A5':60,'signed_dictionaries':46080,'eight_orbits':96,
        'R_separations':R_break,'S_separations':S_break,
        'distinct_K3_per_eight_orbit':dict(sorted(per_orbit.items())),
        'distinct_global_K3':len(global_k3),'distinct_global_K2':len(global_k2),
        'partition_shapes':{str(k):v for k,v in sorted(partition_shapes.items())},
        'first_S_witness':first_S,
        'first_any_witness':first_any,'integer_exact':True,
        'physical_ARFs':'not derived'}
print(json.dumps(result,sort_keys=True,indent=2))
