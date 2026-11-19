#!/usr/bin/env python3
"""Q161ck: native five-solid source inversion defect; exact SymPy certificate."""
import importlib.util
from pathlib import Path
import sympy as S
src=Path(__file__).resolve().parents[1]/"2026-11-19_q161cb_native_source_gram"/"Q161CB_CERT.py"
spec=importlib.util.spec_from_file_location("native_q161cb",src)
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
E,G=mod.E,mod.G
sizes=[4,8,6,20,12]; start=0; blocks=[]
for n in sizes:
    blocks.append(E[start:start+n,:]);start+=n
assert start==50 and G==S.simplify(E.T*E)
F=S.Matrix.vstack(*blocks[1:])
H=S.simplify(F.T*F)
assert F.shape==(46,8)
assert H[:3,3:]==S.zeros(3,5)
assert H[:3,:3]==S.Rational(46,3)*S.eye(3)
T=S.simplify(blocks[0].T*blocks[0])
M=S.simplify(G[:3,3:])
assert M==T[:3,3:] and M.rank()==3
assert S.simplify(M*M.T)==S.Rational(32,27)*S.eye(3)
# The four centrally symmetric solids admit exact inversion on their original coordinates.
for name,points in mod.solids[1:]:
    a=S.Matrix(points)
    pairs=[next(j for j in range(len(points)) if all(S.simplify(a[i,k]+a[j,k])==0 for k in range(3))) for i in range(len(points))]
    assert all(pairs[pairs[i]]==i for i in range(len(points)))
    assert all(i!=pairs[i] for i in range(len(points)))
assert all(not any(all(S.simplify(u[k]+v[k])==0 for k in range(3)) for v in mod.solids[0][1]) for u in mod.solids[0][1])
print("Q161ck EXACT PASS: 46 antipodal vertices; odd-even Gram zero without tetrahedron; tetrahedral rank-3 mixing; MM^T=32/27 I3")
