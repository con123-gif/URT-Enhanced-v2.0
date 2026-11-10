#!/usr/bin/env python3
"""Q12 exact native signed-axis dictionary quotient and K2 collision certificate.

Loads the already checked native Q11 face source and five A4 vacuum lines;
all new combinatorics and fixed-Q rate evaluations use exact integers.
No fitted, measured or historical ARF inputs. Fail-on-error.
"""
from collections import Counter
from contextlib import redirect_stdout
from fractions import Fraction
from io import StringIO
from itertools import permutations
from pathlib import Path
import json, runpy

source = Path(__file__).resolve().parents[1] / '2026-11-10_signed_a5_covariance' / 'signed_a5_covariance.py'
assert source.is_file(), source
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(source))
proper, vacua, actions_fn = ns['proper'], ns['vacua'], ns['action']
assert len(proper)==60 and len(vacua)==5
# Q11's source and 5 hidden-5 vacuum lines are exact Q(sqrt5) quantities.
source_lines = [(scalar,r2.a) for _,r2,scalar,_ in vacua]
scale=60
ints=[]
for line,r2 in source_lines:
    assert r2>0 and all(x.a*scale==int(x.a*scale) and x.b*scale==int(x.b*scale) for x in line)
    ints.append(([(int(x.a*scale),int(x.b*scale)) for x in line],r2))

def exact_rate(indices, data):
    line,r2=data
    v=[line[j] for j in indices]
    # 32*sum v_h^2 + 2*32*sum_{d=1}^5 <v,Q^d v>.
    # Q^d has 2^d equiprobable successors, so all sums below are integers.
    num,irr=0,0
    cur=v
    for d in range(6):
        factor=32 if d==0 else 1<<(6-d)
        for (a,b),(c,e) in zip(v,cur):
            num+=factor*(a*c+5*b*e)
            irr+=factor*(a*e+b*c)
        cur=[(cur[2*h%64][0]+cur[(2*h+1)%64][0],
              cur[2*h%64][1]+cur[(2*h+1)%64][1]) for h in range(64)]
    assert irr==0, ('irrational K2 component',irr)
    return Fraction(num,64*32*scale*scale)/r2

base_indices=tuple(range(64))
assert sorted(exact_rate(base_indices,d) for d in ints)==sorted(v[3].a for v in vacua)
assert all(v[3].b==0 for v in vacua)

# A dictionary is a permutation of the six native antipodal axes plus one
# endpoint bit per time coordinate. Value 2*j+s denotes axis j, sign s.
actions=[(axes,flips) for _,axes,flips,_,_ in map(actions_fn,proper)]
assert len(set(actions))==60

def transform(D,a):
    axes,flips=a
    return tuple(2*axes[x//2]+((x&1)^flips[x//2]) for x in D)

def history_index(h,D):
    out=0
    for i,x in enumerate(D):out|=(((h>>i)&1)^(x&1))<<(x//2)
    return out

def spectrum(D):
    indices=[history_index(h,D) for h in range(64)]
    return tuple(sorted(exact_rate(indices,v) for v in ints))

remaining={tuple(2*p[i]+((s>>i)&1) for i in range(6))
           for p in permutations(range(6)) for s in range(64)}
assert len(remaining)==46080
reps=[]
while remaining:
    D=min(remaining)
    orbit={transform(D,a) for a in actions}
    assert len(orbit)==60 and orbit<=remaining
    remaining.difference_update(orbit)
    reps.append(D)
assert len(reps)==768 and not remaining

# The Q11 joint source-vacuum covariance implies that all 60 transforms of
# any D have the same five-vacuum multiset with fixed Q: at the same time
# index h, a transformed dictionary produces the rotated source, while the
# five A4 vacuum lines permute and rescale. No [A5,Q]=0 assumption is used.
for g in proper:
    T,axes,flips,fperm,vperm=actions_fn(g)
    for i,(_,r2,line,_) in enumerate(vacua):
        _,r22,line2,_=vacua[vperm[i]]
        pivot=next(h for h in range(64) if line[h]!=ns['Z'])
        c=line2[T(pivot)]/line[pivot]
        assert r22==c*c*r2
        assert all(line2[T(h)]==c*line[h] for h in range(64))

# Independent exact Q-iteration cross-check away from the canonical order.
for D in (reps[0],reps[1],reps[17],reps[257],reps[-1]):
    idx=[history_index(h,D) for h in range(64)]
    for (_,r2,line,_),data in zip(vacua,ints):
        direct=ns['k2']([line[j] for j in idx],r2)
        assert direct.b==0 and direct.a==exact_rate(idx,data)

counts=Counter(map(spectrum,reps))
assert len(counts)==56
assert Counter(counts.values())==Counter({8:16,16:40})
# Global inversion of all six axes leaves the quartic source unchanged.
assert all(all(line[h]==line[h^63] for h in range(64)) for line,_ in source_lines)
repset=set(reps);pairs=set()
for D in reps:
    other=min(transform(tuple(x^1 for x in D),a) for a in actions)
    assert other in repset and other!=D
    assert min(transform(tuple(x^1 for x in other),a) for a in actions)==D
    pairs.add(tuple(sorted((D,other))))
assert len(pairs)==384
# A genuine non-parity collision, not merely a change of representative.
collision=next((D,E) for D in reps for E in reps if D<E and spectrum(D)==spectrum(E)
               and E!=min(transform(tuple(x^1 for x in D),a) for a in actions))
# Check one full A5 orbit independently by recalculating rates with fixed Q.
assert {spectrum(transform(reps[0],a)) for a in actions}=={spectrum(reps[0])}
print(json.dumps({
 'status':'OBSTRUCTION / exact native source K2 classification',
 'signed_dictionaries':46080,'proper_A5_orbits':768,'central_inversion_quotient':384,
 'distinct_five_vacuum_K2_multisets':len(counts),
 'collision_multiplicities':{str(k):v for k,v in sorted(Counter(counts.values()).items())},
 'nonparity_collision':[list(D) for D in collision],
 'collision_K2':[str(x) for x in spectrum(collision[0])],
 'canonical_K2':[str(x) for x in spectrum(reps[0])],
 'source':'archived native icosahedral hidden-5 A4 source, original fixed Q',
 'physical_ARFs':'not derived'},sort_keys=True,indent=2))
