#!/usr/bin/env python3
"""Q161cj: exact five-solid scalar-block-charge commutant of native Q161cb source projector."""
from itertools import combinations
from pathlib import Path
import importlib.util
import sympy as S
src=Path(__file__).resolve().parents[1]/"2026-11-19_q161cb_native_source_gram"/"Q161CB_CERT.py"
spec=importlib.util.spec_from_file_location("native_q161cb",src)
mod=importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
E,G=mod.E,mod.G
assert E.shape==(50,8) and G.det()!=0 and G==S.simplify(E.T*E)
sizes=[4,8,6,20,12]; names=["tetrahedron","cube","octahedron","dodecahedron","icosahedron"]
blocks=[];offset=0
for n in sizes:
    blocks.append(E[offset:offset+n,:]);offset+=n
assert offset==50
Gi=G.inv()
expected={
(0,1):S.Rational(107094,931225),(0,2):S.Rational(20808,931225),
(0,3):S.Rational(37677,186245),(0,4):S.Rational(113031,931225),
(1,2):S.Rational(55656,931225),(1,3):S.Rational(93714,186245),
(1,4):S.Rational(281142,931225),(2,3):S.Rational(172821432,411415205),
(2,4):S.Rational(518464296,2057076025),(3,4):S.Rational(324569949,411415205)}
for i,j in combinations(range(5),2):
    A=blocks[i].T*blocks[i];B=blocks[j].T*blocks[j]
    norm2=S.simplify(S.trace(Gi*A*Gi*B))
    assert norm2==expected[(i,j)] and norm2>0,(i,j,norm2)
print("Q161cj EXACT PASS: 10/10 nonzero native projector cross-blocks; scalar-block charge commutant one-dimensional")
