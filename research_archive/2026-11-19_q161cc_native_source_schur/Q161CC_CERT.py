#!/usr/bin/env python3
"""Exact Schur reduction of original Q161cb five-solid 50x8 source moments."""
import importlib.util
from pathlib import Path
import sympy as S
source=Path(__file__).resolve().parents[1]/'2026-11-19_q161cb_native_source_gram'/'Q161CB_CERT.py'
spec=importlib.util.spec_from_file_location('q161cb_native',source)
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
E,G=m.E,m.G
assert E.shape==(50,8) and G==S.simplify(E.T*E)
A=G[:3,:3];B=G[:3,3:];C=G[3:,3:]
assert A==S.Rational(50,3)*S.eye(3)
assert B.shape==(3,5) and B.rank()==3
assert S.simplify(B*B.T)==S.Rational(32,27)*S.eye(3)
assert S.simplify(C-S.diag(S.Rational(94,15),S.Rational(94,15),*([S.Rational(104,15)]*3)))==S.zeros(5)
S5=S.simplify(C-B.T*A.inv()*B)
assert S5==S.diag(S.Rational(94,15),S.Rational(94,15),*([S.Rational(1544,225)]*3))
assert S.simplify(S5.det())==S.Rational(94,15)**2*S.Rational(1544,225)**3
assert S.simplify(G.det()-A.det()*S5.det())==0
assert S.simplify(A.inv()*B*C.inv()*B.T)==S.Rational(2,195)*S.eye(3)
left=S.simplify(G.inv()*E.T)
assert S.simplify(left*E)==S.eye(8)
R=S.simplify(E[:,3:]-E[:,:3]*A.inv()*B)
assert S.simplify(E[:,:3].T*R)==S.zeros(3,5)
assert S.simplify(R.T*R-S5)==S.zeros(5)
print('Q161cc EXACT PASS: rank(B)=3; Schur=(94/15)x2,(1544/225)x3; canonical squared correlations=2/195 x3; exact dual verified')
