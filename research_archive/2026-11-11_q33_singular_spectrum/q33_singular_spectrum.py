#!/usr/bin/env python3
"""Q33 exact Gram characteristic-polynomial census of the native Q3 A5 twirl.

Uses original Q28, which imports Q3's geometric icosahedral A5 action and
primitive 64-history Q2; no synthetic operators or physical inputs.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import json,runpy,time
import numpy as np
import sympy as sp

t0=time.time()
root=Path(__file__).resolve().parents[1]
source=root/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'
assert source.is_file(),source
with redirect_stdout(StringIO()):
    ns=runpy.run_path(str(source))
perms,Q,bits,reps,alt=(ns[x] for x in ('perms','Q','bits','reps','alt'))
assert len(perms)==60 and len(reps)==96
assert np.all(Q.sum(axis=1)==2)

def S_of(D):
    code=((bits^np.array([z&1 for z in D],dtype=np.int64)) <<
          np.array([z//2 for z in D],dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64)
    inverse[code]=np.arange(64)
    X=Q[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:S+=X[np.ix_(p,p)]
    assert S.min()>=0
    assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
    return S

def mixed(A):
    # Tr(S^2 S^T), Q30's first non-spectral distinguishing word.
    return int(np.trace((A@A)@A.T))

residual=[]
for D in reps:
    A,B=S_of(D),S_of(alt(D))
    if int(np.trace((A@A)@A))==int(np.trace((B@B)@B)):
        residual.append(D)
assert len(residual)==48
counts=Counter()
gram_polynomials=set()
first=None
for D in residual:
    A,B=S_of(D),S_of(alt(D))
    GA,GB=A@A.T,B@B.T
    assert np.all(GA.sum(axis=1)==14400) and np.all(GB.sum(axis=1)==14400)
    # SymPy's charpoly is exact over ZZ; no numerical eigensolver/tolerance.
    pa=tuple(sp.Matrix(GA.tolist()).charpoly().all_coeffs())
    pb=tuple(sp.Matrix(GB.tolist()).charpoly().all_coeffs())
    split=(pa!=pb)
    mixed_split=(mixed(A)!=mixed(B))
    counts[(mixed_split,split)]+=1
    assert not split,('Gram singular-spectrum witness',D)
    gram_polynomials.add(pa)
    if first is None:
        first={'D':list(D),'Tr_G':int(np.trace(GA)),
               'Tr_G2':int(np.trace(GA@GA))}
assert counts==Counter({(False,False):42,(True,False):6}),counts
assert len(gram_polynomials)==31,len(gram_polynomials)
assert first=={'D':[0,2,4,6,8,11],'Tr_G':32640,'Tr_G2':219678720},first
print(json.dumps({
 'task':'Q33','result':'OBSTRUCTION',
 'residual_pairs_tested':48,'gram_charpoly_equal':48,
 'Q30_nonpermutation_unseparated_target_covered':20,
 'target_singular_spectrum_separations':0,
 'Q30_SST_separated_but_singular_equal':6,
 'distinct_gram_charpolys':len(gram_polynomials),
 'first_exact_moments':first,
 'method':'exact integer Gram matrices and SymPy ZZ characteristic polynomials',
 'scope':'native 64-history Q2 and icosahedral A5 twirl; no physical ARFs',
 'seconds':round(time.time()-t0,2)
},sort_keys=True,indent=2))
