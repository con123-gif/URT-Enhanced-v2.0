#!/usr/bin/env python3
"""Q161cf exact subset-rank classification of original Q161ce five-solid source."""
import importlib.util
from pathlib import Path
from itertools import combinations
import sympy as S
p=Path(__file__).resolve().parents[1]/'2026-11-19_q161ce_source_deletion'/'Q161CE_CERT.py'
spec=importlib.util.spec_from_file_location('q161ce_native',p)
m=importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
assert len(m.blocks)==5 and [b.rows for b in m.blocks]==[4,8,6,20,12]
def rank(ids):
 g=S.zeros(8)
 for i in ids:g+=m.blocks[i].T*m.blocks[i]
 return g.rank()
observed={k:{''.join(map(str,ids)):rank(ids) for ids in combinations(range(5),k)} for k in range(1,6)}
assert observed[1]=={'0':3,'1':6,'2':5,'3':8,'4':8}
assert observed[2]=={'01':6,'02':8,'03':8,'04':8,'12':8,'13':8,'14':8,'23':8,'24':8,'34':8}
assert all(v==8 for k in (3,4,5) for v in observed[k].values())
assert sum(map(len,observed.values()))==31
print('Q161cf EXACT PASS: all 31 native nonempty block subsets:',observed)
