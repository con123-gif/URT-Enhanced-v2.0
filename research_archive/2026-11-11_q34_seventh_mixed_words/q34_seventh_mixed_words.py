#!/usr/bin/env python3
"""Q34: exhaustive exact length-seven mixed-word traces of native A5-twirled Q2.

Imports original Q28, which imports original Q3's icosahedral geometric A5
and six-bit primitive Q2. All 128 binary words are tested on precisely Q30's
20 non-permutation residual pairs (after its length<=6 mixed-word test).
No synthetic operators, measured inputs, or fitted constants.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from itertools import product
from pathlib import Path
import json, runpy, time
import networkx as nx
import numpy as np
from networkx.algorithms import isomorphism as iso

t0=time.monotonic()
root=Path(__file__).resolve().parents[1]
q28=root/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'
assert q28.is_file(), q28
with redirect_stdout(StringIO()): native=runpy.run_path(str(q28))
perms,Q,bits,reps,alt=(native[k] for k in ('perms','Q','bits','reps','alt'))
assert len(perms)==60 and len(reps)==96 and np.all(Q.sum(axis=1)==2)
assert 64*120**7 < 2**63

def twirl(D):
    code=((bits ^ np.array([x&1 for x in D],dtype=np.int64)) <<
          np.array([x//2 for x in D],dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64);inverse[code]=np.arange(64)
    X=Q[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms: S+=X[np.ix_(p,p)]
    assert S.min()>=0 and np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
    return S

def graph(S):
    g=nx.DiGraph();g.add_nodes_from(range(64))
    for i,j in zip(*np.nonzero(S)):g.add_edge(int(i),int(j),w=int(S[i,j]))
    return g

def permutation_conjugate(GA,B):
    return iso.DiGraphMatcher(GA,graph(B),edge_match=lambda x,y:x['w']==y['w']).is_isomorphic()

def traces(S, length):
    # One exact product per binary prefix; all entries nonnegative and row sums
    # 120**k, so int64 is safe through k=7. This computes all 2**7 words.
    P={():np.eye(64,dtype=np.int64)}
    for k in range(1,length+1):
        P={w+(b,): M @ (S.T if b else S)
           for w,M in P.items() for b in (0,1)}
    assert len(P)==2**length
    assert all(np.all(M.sum(axis=1)==120**length) for M in P.values())
    return {w:int(np.trace(M)) for w,M in P.items()}

counts=Counter();target=[];witness=None;separating_word_count=Counter()
for D in reps:
    A,B=twirl(D),twirl(alt(D))
    if int(np.trace(A@A@A))!=int(np.trace(B@B@B)):
        continue
    counts['residual_k3']+=1
    GA=graph(A)
    if permutation_conjugate(GA,B):
        counts['permutation']+=1;continue
    if permutation_conjugate(GA,B.T):
        counts['transpose_only']+=1;continue
    counts['nonpermutation']+=1
    a3,b3=int(np.trace(A@A@A.T)),int(np.trace(B@B@B.T))
    if a3!=b3:
        counts['split_len3']+=1;continue
    counts['target']+=1
    # Check every word through length six, not just the SST representative.
    for L in range(2,7):
        ta,tb=traces(A,L),traces(B,L)
        assert ta==tb,('Q30 low-order residual mismatch',D,L)
    ta,tb=traces(A,7),traces(B,7)
    diffs={w:(ta[w],tb[w]) for w in ta if ta[w]!=tb[w]}
    counts['split_len7' if diffs else 'unsplit_len7']+=1
    separating_word_count[len(diffs)]+=1
    if diffs and witness is None:
        w=min(diffs)
        witness={'D':list(D),'alt_D':list(alt(D)),
                 'word':''.join('T' if bit else 'S' for bit in w),
                 'trace_D':diffs[w][0],'trace_alt_D':diffs[w][1],
                 'difference':diffs[w][0]-diffs[w][1],
                 'number_of_separating_words_for_pair':len(diffs)}
    target.append({'D':list(D),'alt_D':list(alt(D)),
                   'separating_words':len(diffs),
                   'first_word':''.join('T' if bit else 'S' for bit in min(diffs)) if diffs else None})
assert counts['residual_k3']==48,counts
assert counts['permutation']==4 and counts['transpose_only']==18,counts
assert counts['nonpermutation']==26 and counts['split_len3']==6 and counts['target']==20,counts
assert counts['split_len7']+counts['unsplit_len7']==20
assert sum(separating_word_count.values())==20
out={'task':'Q34','result':'THEOREM' if counts['split_len7'] else 'OBSTRUCTION',
     'source':'original Q3 geometric A5 twirl of primitive 64-state Q2 via Q28',
     'counts':dict(counts),'word_length':7,'words_per_pair':128,
     'exact_word_evaluations':20*2*128,
     'separating_word_counts':dict(sorted(separating_word_count.items())),
     'first_witness':witness,'target_pairs':target,
     'arithmetic':'int64 exact; all intermediate row sums <=120**7 and 64*120**7<2**63',
     'physical_ARFs':'not derived','elapsed_seconds':round(time.monotonic()-t0,2)}
print(json.dumps(out,indent=2,sort_keys=True))
