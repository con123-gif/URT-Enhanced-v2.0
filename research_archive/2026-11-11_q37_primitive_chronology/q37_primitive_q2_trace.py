#!/usr/bin/env python3
"""Q37: exact primitive-Q2 mixed-trace obstruction for Q36's 20 native pairs.

Original Q3 geometric A5 code action and primitive 64-history Q2 are used
without replacement. The 20 dictionaries are Q36's published residual pairs.
No empirical input, fitting, or physical selection claim.
"""
from __future__ import annotations
import hashlib
import json
import re
import runpy
from pathlib import Path
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
Q3 = ROOT / '2026-11-11_q3_twirled_chronology_classes' / 'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q36 = ROOT / '2026-11-11_q36_star_intertwiner' / 'Q36_RATIONAL_STAR_INTERTWINERS.md'
assert Q3.is_file(), Q3
raw = Q3.read_bytes()
sha = hashlib.sha1(b'blob ' + str(len(raw)).encode() + b'\0' + raw).hexdigest()
assert sha == 'bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984', ('original Q3 changed', sha)
perms = runpy.run_path(str(Q3))['geometric_a5_on_codes']()
assert len(perms) == 60 and len({tuple(p) for p in perms}) == 60
Q2 = np.zeros((64, 64), dtype=np.int64)
for h in range(64):
    Q2[h, 2*h % 64] = Q2[h, (2*h+1) % 64] = 1
assert np.all(Q2.sum(axis=1) == 2) and np.all(Q2.sum(axis=0) == 2)
bits = np.array([[(h >> i) & 1 for i in range(6)] for h in range(64)], dtype=np.int64)

# Q36 published table, copied verbatim as ordered dictionaries (not fitted).
D36 = [
 (0,2,4,6,10,8), (0,2,4,6,11,9), (0,2,4,7,9,11),
 (0,2,4,7,10,8), (0,2,4,7,10,9), (0,2,4,7,11,9),
 (0,2,4,8,11,7), (0,2,4,9,10,6), (0,2,4,10,6,8),
 (0,2,5,6,8,10), (0,2,5,6,10,8), (0,2,5,6,10,9),
 (0,2,5,6,11,9), (0,2,5,7,8,10), (0,2,5,7,9,11),
 (0,2,5,7,10,8), (0,2,5,7,11,9), (0,2,5,10,6,8),
 (0,2,5,10,7,9), (0,2,5,11,7,9),
]
assert len(D36) == len(set(D36)) == 20
if Q36.is_file():
    source_rows = re.findall(r'^\|\s*\d+\s*\|\s*`\(([^\`]+)\)`\s*\|', Q36.read_text(), re.M)
    parsed = [tuple(map(int, row.split(','))) for row in source_rows]
    assert parsed == D36, ('Q36 source table changed', parsed)

def twirl(D):
    assert len(D) == 6 and {x//2 for x in D} == set(range(6))
    code = ((bits ^ np.array([x&1 for x in D], dtype=np.int64)) <<
            np.array([x//2 for x in D], dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist()) == list(range(64))
    inverse = np.empty(64, dtype=np.int64)
    inverse[code] = np.arange(64)
    X = Q2[np.ix_(inverse, inverse)]
    S = np.zeros((64, 64), dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p, p)]
    assert np.all(S.sum(axis=0) == 120) and np.all(S.sum(axis=1) == 120)
    return S

rows = []
for D in D36:
    E = tuple(x ^ (i&1) for i,x in enumerate(D))
    A, B = twirl(D), twirl(E)
    # Each entry of A,B <=120 and each Q2 row/column has two ones.
    # Therefore 64*2*120=15360 bounds each nonnegative trace;
    # signed differences are exact in int64 without overflow.
    a = int(np.trace(A @ Q2))
    b = int(np.trace(B @ Q2))
    delta = a - b
    assert delta != 0, ('primitive Q2 failed to separate pair', D)
    assert delta % 8 == 0, ('unexpected integer structure', D, delta)
    rows.append({'D': list(D), 'alt_D': list(E), 'trace_D_Q2': a,
                 'trace_alt_Q2': b, 'difference': delta})
assert len(rows) == 20
print(json.dumps({'task':'Q37', 'result':'OBSTRUCTION',
 'status':'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
 'native':'original Q3 A5-twirl and primitive two-successor Q2',
 'pairs':20, 'nonzero_mixed_trace_differences':20,
 'differences':[r['difference'] for r in rows], 'witnesses':rows,
 'proof':'If X A=B X, X Q2=Q2 X and det X !=0, then Tr(A Q2)=Tr(B Q2), contradicted for every pair.',
 'local_Q3_git_blob_sha1':sha, 'physical_ARFs':'not derived'}, indent=2))
