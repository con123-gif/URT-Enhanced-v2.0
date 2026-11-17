#!/usr/bin/env python3
"""Q161ac: native icosahedral 20-face source -> six parity-channel coefficients."""
from pathlib import Path
from runpy import run_path
from sympy import Matrix, Rational
p=Path(__file__).resolve().parents[1]/"2026-11-17_q161z_uniform_face_source"/"Q161Z_UNIFORM_FACE_SOURCE.py"
assert p.is_file(), "Q161z original face-incidence source missing"
d=run_path(str(p))
M=d["M"]; P=d["P"]; Q=d["Q"]
assert len(M)==64 and len(M[0])==20
S=Matrix.hstack(*[Matrix(P([(-1)**x.bit_count()*M[x][j] for x in range(64)])) for j in range(20)])
R=[Matrix.hstack(*[Matrix(Q(list(S[:,j]),i)) for j in range(20)]) for i in range(6)]
U=Matrix.hstack(*[r*Matrix.ones(20,1) for r in R])
assert U.rank()==6
B=Matrix(6,20,lambda i,j:(U[:,i].T*R[i][:,j])[0])
G=Rational(128,16875)*Matrix.eye(6)+Rational(256,50625)*Matrix.ones(6,6)
assert B.rank()==6 and len(B.nullspace())==14
assert all(B[i,j] in (0,Rational(8,225)) for i in range(6) for j in range(20))
assert all(sum(B[i,j]!=0 for j in range(20))==10 for i in range(6))
assert B*B.T==G
assert G.eigenvals()=={Rational(128,3375):1,Rational(128,16875):5}
assert B*Matrix.ones(20,1)==Rational(16,45)*Matrix.ones(6,1)
print("Q161ac EXACT PASS: native face-source six-channel rank 6, nullity 14; Gram eigenvalues 128/3375, 128/16875(x5)")
