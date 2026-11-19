#!/usr/bin/env python3
"""Exact source-range leverage from original Q161cb five-solid 50x8 operator."""
import importlib.util
from pathlib import Path
import sympy as S
source=Path(__file__).resolve().parents[1]/'2026-11-19_q161cb_native_source_gram'/'Q161CB_CERT.py'
spec=importlib.util.spec_from_file_location('q161cb_native',source)
m=importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
E,G=m.E,m.G
assert E.shape==(50,8) and G==S.simplify(E.T*E) and G.det()!=0
assert S.simplify(G.T-G)==S.zeros(8,8)
assert S.simplify(G.inv()*G-S.eye(8))==S.zeros(8,8)
expected=[S.Rational(549,965),S.Rational(1218,965),S.Rational(45447,45355),S.Rational(29293,9071),S.Rational(87879,45355)]
weights=[]
offset=0
for name,n in [('tetrahedron',4),('cube',8),('octahedron',6),('dodecahedron',20),('icosahedron',12)]:
    block=E[offset:offset+n,:]
    weight=S.simplify(S.trace(G.inv()*(block.T*block)))
    weights.append(weight)
    assert S.simplify(weight-expected[len(weights)-1])==0,(name,weight)
    offset+=n
assert offset==50 and S.simplify(sum(weights)-8)==0
print('Q161cd EXACT PASS: rank 8; five native source leverage traces',weights)
