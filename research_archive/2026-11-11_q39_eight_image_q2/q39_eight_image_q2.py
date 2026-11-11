#!/usr/bin/env python3
"""Q39: exact primitive-Q2 mixed signatures on Q28's 96 eight-image orbits.

Native inputs are the unchanged, SHA-pinned original Q3 icosahedral A5
permutations and Q28 canonical signed-dictionary orbit construction. All
matrices are integer-valued; no fitted or empirical inputs occur.
"""
from __future__ import annotations

from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import hashlib
import json
import runpy
import time
import numpy as np

START = time.monotonic()
ROOT = Path(__file__).resolve().parents[1]
Q3 = ROOT/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28 = ROOT/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'

def git_blob(path):
    raw = path.read_bytes()
    return hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()

assert git_blob(Q3) == 'bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984'
assert git_blob(Q28) == '6e22cb7654176c6499ee138737f4f85240619ec7'
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(Q28))
perms, Q, bits, reps, eight, alt, rev, inv, act, actions = (
    ns[k] for k in ('perms','Q','bits','reps','eight','alt','rev','inv','act','actions'))
assert len(perms)==60 and len(reps)==96
assert len(set(reps))==96
assert np.all(Q.sum(axis=0)==2) and np.all(Q.sum(axis=1)==2)
Q2 = Q @ Q
assert np.all(Q2.sum(axis=0)==4) and np.all(Q2.sum(axis=1)==4)
# Row sums of the native S, Q and Q^2 are 120, 2, 4 respectively.
# Therefore 0 <= Tr(SQ) <= 64*120*2 and 0 <= Tr(SQ^2) <= 64*120*4.
assert 64*120*4 < 2**63

def twirl(D):
    code = ((bits ^ np.array([x&1 for x in D], dtype=np.int64)) <<
            np.array([x//2 for x in D], dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64)
    inverse[code]=np.arange(64)
    X=Q[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p,p)]
    assert np.all(S.sum(axis=0)==120) and np.all(S.sum(axis=1)==120)
    return S

def signature(D):
    S=twirl(D)
    # Entrywise contraction is exactly the trace of the original matrix product.
    return (int(np.sum(S*Q.T)), int(np.sum(S*Q2.T)))

orbit_shapes=Counter()
distinct_by_orbit=Counter()
all_sigs=Counter()
colliding_pairs=0
fully_separated=0
first_collision=None
first_eight=None
first_witness=None
first_rev_witness=None
I_split=R_split=A_split=0
image_count=0
for D in reps:
    images=sorted(eight(D))
    assert len(images)==8
    sig={d:signature(d) for d in images}
    for d in images:
        assert np.array_equal(twirl(d),twirl(inv(d))), ("inversion operator equality",d)
    assert all(isinstance(x,int) and x>=0 for s in sig.values() for x in s)
    values=Counter(sig.values())
    shape=tuple(sorted(values.values()))
    orbit_shapes[shape]+=1
    distinct_by_orbit[len(values)]+=1
    all_sigs.update(sig.values())
    image_count+=len(images)
    colliding_pairs+=sum(m*(m-1)//2 for m in values.values())
    fully_separated+=(len(values)==8)
    I_split+=(sig[D]!=sig[inv(D)])
    R_split+=(sig[D]!=sig[rev(D)])
    A_split+=(sig[D]!=sig[alt(D)])
    if first_collision is None and len(values)<8:
        x,y=next((x,y) for x in images for y in images if x<y and sig[x]==sig[y])
        first_collision={'rep':list(D),'D':list(x),'E':list(y),'signature':list(sig[x]),'shape':list(shape)}
    if first_eight is None and len(values)==8:
        first_eight={'rep':list(D),'signatures':{str(d):list(sig[d]) for d in images}}
    if first_rev_witness is None and sig[D]!=sig[rev(D)]:
        first_rev_witness={'D':list(D),'rev_D':list(rev(D)),
                           'signature_D':list(sig[D]),'signature_rev':list(sig[rev(D)])}
    if first_witness is None and sig[D]!=sig[alt(D)]:
        first_witness={'D':list(D),'alt_D':list(alt(D)),
                       'signature_D':list(sig[D]),'signature_alt':list(sig[alt(D)])}
assert image_count==768
assert sum(orbit_shapes.values())==96
assert sum(distinct_by_orbit.values())==96
assert sum(all_sigs.values())==768
assert orbit_shapes==Counter({(2,2,2,2):96}),orbit_shapes
assert distinct_by_orbit==Counter({4:96}),distinct_by_orbit
assert colliding_pairs==384
assert (I_split,R_split,A_split)==(0,96,96)
# A5 transport leaves the twirl S_D unchanged even though the primitive Q
# itself does not commute with every A5 permutation (Q11).
for D in (reps[0],reps[47],reps[-1]):
    reference=twirl(D)
    for a in actions:
        assert np.array_equal(twirl(act(D,a)),reference)
# Independently check the entrywise contraction against direct matrix products.
for D in (reps[0],reps[-1]):
    S=twirl(D)
    assert signature(D)==(int(np.trace(S@Q)),int(np.trace(S@Q2)))
# Each eight-orbit contains four inversion pairs; count signature coincidences
# between different eight-orbits separately from the 384 unavoidable I-pairs.
inversion_pair_frequency=Counter(n//2 for n in all_sigs.values())
assert all(n%2==0 for n in all_sigs.values())
assert sum(n*freq for n,freq in inversion_pair_frequency.items())==384
cross_orbit_pairs=sum((n//2)*(n//2-1)//2 for n in all_sigs.values())
result={
    'task':'Q39', 'status':'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'q3_git_blob':git_blob(Q3),'q28_git_blob':git_blob(Q28),
    'orbits':len(reps),'images':image_count,
    'distinct_signatures_per_orbit':dict(sorted(distinct_by_orbit.items())),
    'partition_shapes':{str(k):v for k,v in sorted(orbit_shapes.items())},
    'distinct_global_signatures':len(all_sigs),
    'equal_signature_pairs_within_eight_orbits':colliding_pairs,
    'global_inversion_pair_multiplicity':dict(sorted(inversion_pair_frequency.items())),
    'cross_orbit_signature_collision_pairs':cross_orbit_pairs,
    'excess_inversion_pairs_beyond_distinct_signatures':384-len(all_sigs),
    'orbits_all_eight_separated':fully_separated,
    'representative_I_R_alt_separations':{'I':I_split,'R':R_split,'alt':A_split},
    'first_collision':first_collision,'first_full_eight':first_eight,
    'first_alt_witness':first_witness,
    'first_rev_witness':first_rev_witness,
    'A5_twirl_invariance_checked':3*60,
    'exact_integer':True,'physical_ARFs':'not derived',
    'elapsed_s':round(time.monotonic()-START,3)}
print(json.dumps(result,indent=2,sort_keys=True))
