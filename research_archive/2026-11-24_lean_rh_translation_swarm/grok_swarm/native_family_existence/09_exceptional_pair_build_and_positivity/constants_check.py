#!/usr/bin/env python3
"""Exact checks of the elementary inequalities behind run-9 positivity lemmas (pin 40e56ba).
Grids are exact rationals; these confirm the algebraic identities used, not the analytic inputs."""
from fractions import Fraction as F
import itertools
ok = True
def chk(name, cond):
    global ok; ok &= bool(cond); print(("ok  " if cond else "FAIL") + " " + name)
# three_four_one / comb_nonneg: x^2+y^2=1 => 3 + 4x + (x^2 - y^2) = 2(1+x)^2
pts = []
for m, n in itertools.product(range(-12, 13), repeat=2):   # rational points on the unit circle
    if m == 0 and n == 0: continue
    d = m * m + n * n; pts.append((F(m * m - n * n, d), F(2 * m * n, d)))
chk("comb_nonneg identity 3+4x+x^2-y^2 = 2(1+x)^2 on %d rational unit-circle points" % len(pts),
    all(x * x + y * y == 1 and 3 + 4 * x + (x * x - y * y) == 2 * (1 + x) ** 2 >= 0 for x, y in pts))
# neg_sum_logDeriv_nonneg / re_sum_nonneg: a,b in {±1}: 1 + a + b + ab = (1+a)(1+b) >= 0; nonunit: all 0
chk("re_sum_nonneg: 1+a+b+ab = (1+a)(1+b) >= 0 for a,b in {1,-1}", all(1 + a + b + a * b == (1 + a) * (1 + b) >= 0 for a in (1, -1) for b in (1, -1)))
# exists_bound geometry: sigma in (1,2] => |sigma - 3/2| <= 2/3 ; beta in [2/3,1) => |beta - 3/2| <= 5/6
chk("exists_bound: |sigma-3/2| <= 1/2 <= 2/3 for 1 < sigma <= 2", F(1, 2) <= F(2, 3) and abs(F(2) - F(3, 2)) <= F(2, 3) and abs(F(1) - F(3, 2)) <= F(2, 3))
chk("exists_bound: |beta-3/2| <= 5/6 for 2/3 <= beta < 1", abs(F(2, 3) - F(3, 2)) == F(5, 6) and abs(F(1) - F(3, 2)) < F(5, 6))
print("RESULT:", "all checks ok" if ok else "FAILURES")
raise SystemExit(0 if ok else 1)
