#!/usr/bin/env python3
"""Q38 native primitive-Q2 compatibility: 48 Q28 residual A5-twirled pairs.

Reuses the exact original Q3 geometric A5 action and Q28 exhaustive orbit
representatives. Computes integer Tr((S_D-S_alt(D)) Q2); for first-order
survivors alone, computes the length-three Tr((S_D-S_alt(D)) Q2^2).
"""
from __future__ import annotations
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import hashlib, json, runpy, time
import numpy as np

T0=time.monotonic()
ROOT=Path(__file__).resolve().parents[1]
Q3=ROOT/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28=ROOT/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'
def blob_sha(path):
    raw=path.read_bytes()
    return hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()
assert blob_sha(Q3)=='bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984'
assert blob_sha(Q28)=='6e22cb7654176c6499ee138737f4f85240619ec7'
with redirect_stdout(StringIO()):
    ns=runpy.run_path(str(Q28))
perms,Q2,bits,reps,eight,alt=tuple(ns[k] for k in ('perms','Q','bits','reps','eight','alt'))
assert len(perms)==60 and len(reps)==96
assert np.array_equal(Q2.sum(axis=0),np.full(64,2))
assert np.array_equal(Q2.sum(axis=1),np.full(64,2))
assert 64*120**3 < 2**63
assert 64*120*4 < 2**63  # Tr(S Q2^2) has nonnegative row sums 120,4

def twirl(D):
    code=((bits^np.array([x&1 for x in D],dtype=np.int64))<<np.array([x//2 for x in D],dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64)
    inverse[code]=np.arange(64)
    X=Q2[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:
        S+=X[np.ix_(p,p)]
    assert np.all(S.sum(axis=0)==120) and np.all(S.sum(axis=1)==120)
    return S

residual=[]
for D in reps:
    m3={int(np.trace((S:=twirl(d))@S@S)) for d in eight(D)}
    if len(m3)==1:
        residual.append(D)
    else:
        assert len(m3)==2
assert len(residual)==48

rows=[]
for D in residual:
    E=alt(D)
    A,B=twirl(D),twirl(E)
    tA,tB=int(np.trace(A@Q2)),int(np.trace(B@Q2))
    assert int(np.trace(A@A@A))==int(np.trace(B@B@B))
    delta=tA-tB
    higher=None
    if delta==0:
        higher=int(np.trace((A-B)@(Q2@Q2)))
    rows.append({'D':list(D),'alt_D':list(E),'trace_D_Q2':tA,
                 'trace_alt_Q2':tB,'delta':delta,'higher_delta':higher})
first=Counter('obstructed' if r['delta'] else 'survivor' for r in rows)
higher=Counter('obstructed' if r['higher_delta'] else 'survivor' for r in rows if r['delta']==0)
assert first == Counter({'obstructed':46,'survivor':2}), first
assert higher == Counter({'obstructed':2}), higher
assert [(tuple(r['D']),r['higher_delta']) for r in rows if r['delta']==0] == [
    ((0,2,5,6,9,10),-160),((0,2,5,6,11,8),-192)]
assert all(r['delta']%8==0 for r in rows)
assert sum(1 for r in rows if r['delta']!=0 or r['higher_delta']!=0)==48
print(json.dumps({'task':'Q38','pairs':len(rows),'first':dict(first),
                  'higher':dict(higher),'first_deltas':[r['delta'] for r in rows],
                  'first_order_survivors':[r for r in rows if r['delta']==0],
                  'first_witness':next((r for r in rows if r['delta']),None),
                  'native':'Q3 geometric A5 action, Q28 signed dictionary orbits, primitive Q2',
                  'q3_sha':blob_sha(Q3),'q28_sha':blob_sha(Q28),
                  'elapsed_s':round(time.monotonic()-T0,3)},indent=2))
