"""Q161aa exact Gram certificate for Q161z native golden icosahedral face readouts."""
from pathlib import Path
from runpy import run_path
from fractions import Fraction
from sympy import Matrix, Rational
source = Path(__file__).resolve().parents[1] / "2026-11-17_q161z_uniform_face_source" / "Q161Z_UNIFORM_FACE_SOURCE.py"
assert source.is_file(), "Original Q161z source unavailable"
d = run_path(str(source))
pw = d["pw"]
R = Matrix.hstack(*(Matrix([(pw[x]+pw[x^(1<<i)])/2 for x in range(64)]) for i in range(6)))
G = R.T * R
expected = Rational(64,225)*Matrix.eye(6) + Rational(16,225)*Matrix.ones(6,6)
assert G == expected
assert G.rank() == 6
assert G.eigenvals() == {Rational(32,45):1, Rational(64,225):5}
assert G.det() == Rational(32,45)*Rational(64,225)**5
assert all(sum(R[:,i]) == 0 for i in range(6))
print("Q161aa EXACT PASS: Gram=(64/225)I+(16/225)J; eigenvalues 32/45 (1), 64/225 (5)")
