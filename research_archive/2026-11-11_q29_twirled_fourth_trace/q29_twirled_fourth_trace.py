#!/usr/bin/env python3
"""Q29 exact fourth trace of native Q3 A5-twirled 64-history Q2.

Imports the original Q28 orbit enumeration (which itself imports the original
Q3 geometric A5 operator); no synthetic matrices, fitting or measured inputs.
All products are exact int64, with explicit row-sum overflow bounds.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import json, runpy
import numpy as np

root = Path(__file__).resolve().parents[1]
q28 = root / '2026-11-11_q28_twirled_third_trace' / 'q28_twirled_third_trace.py'
assert q28.is_file(), q28
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(q28))
perms, Q, bits = (ns[x] for x in ('perms', 'Q', 'bits'))
reps, eight, alt, rev, inv = (ns[x] for x in ('reps', 'eight', 'alt', 'rev', 'inv'))
act, actions = ns['act'], ns['actions']
assert len(perms) == 60 and len(reps) == 96
assert 64 * 120**4 < 2**63  # Tr S^4 bound; each row sum is 120.
assert np.all(Q.sum(axis=1) == 2)

def traces(D):
    code = ((bits ^ np.array([x & 1 for x in D], dtype=np.int64)) <<
            np.array([x // 2 for x in D], dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist()) == list(range(64))
    inverse = np.empty(64, dtype=np.int64)
    inverse[code] = np.arange(64)
    X = Q[np.ix_(inverse, inverse)]
    S = np.zeros((64, 64), dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p, p)]
    assert np.all(S.sum(axis=1) == 120) and np.all(S.sum(axis=0) == 120)
    S2 = S @ S
    m2 = int(np.trace(S2))
    m3 = int(np.trace(S2 @ S))
    m4 = int(np.sum(S2 * S2.T))  # Tr S^4 without a second matrix product.
    assert 0 <= m4 <= 64 * 120**4
    return m2, m3, m4

split3 = Counter()
split4 = Counter()
shapes4 = Counter()
R_break = I_break = S_break = 0
witness = None
unsplit = []
all_k2 = set()
all_k3 = set()
for D in reps:
    images = sorted(eight(D))
    prior = {d: traces(d)[:2] for d in images}
    all_k2.update(x[0] for x in prior.values())
    all_k3.update(x[1] for x in prior.values())
    assert len({v[0] for v in prior.values()}) == 1
    split3[len({v[1] for v in prior.values()})] += 1
    if len({v[1] for v in prior.values()}) != 1:
        continue
    unsplit.append(D)
    vals = {d: traces(d) for d in images}
    assert all(vals[d][:2] == prior[d] for d in images)
    distinct = {v[2] for v in vals.values()}
    split4[len(distinct)] += 1
    shapes4[tuple(sorted(Counter(v[2] for v in vals.values()).values()))] += 1
    R_break += vals[D][2] != vals[rev(D)][2]
    I_break += vals[D][2] != vals[inv(D)][2]
    S_break += vals[D][2] != vals[alt(D)][2]
    assert vals[D][2] == vals[rev(D)][2] == vals[inv(D)][2]
    # Native geometric A5 covariance of the twirl, with fixed original Q2.
    assert all(traces(act(D,a)) == vals[D] for a in (actions[1], actions[31]))
    if len(distinct) > 1 and witness is None:
        x,y = next((x,y) for x in images for y in images if vals[x][2] != vals[y][2])
        witness = {'D':list(x), 'E':list(y), 'TrS2':vals[x][0],
                   'TrS3':vals[x][1], 'TrS4_D':vals[x][2],
                   'TrS4_E':vals[y][2], 'difference':vals[x][2]-vals[y][2]}
assert split3 == Counter({1:48,2:48}), split3
assert len(all_k2) == 32 and len(all_k3) == 53
assert len(unsplit) == 48 and sum(split4.values()) == 48
assert R_break == I_break == 0
result = {'task':'Q29','native_A5_order':60,'history_orbits':96,
          'Q28_unsplit_orbits':len(unsplit),
          'K4_distinct_values_per_unsplit_orbit':dict(sorted(split4.items())),
          'K4_partition_shapes':{str(k):v for k,v in sorted(shapes4.items())},
          'S_separations':S_break,'R_separations':R_break,
          'I_separations':I_break,'first_K4_witness':witness,
          'integer_exact':True,'physical_ARFs':'not derived'}
print(json.dumps(result,indent=2,sort_keys=True))
