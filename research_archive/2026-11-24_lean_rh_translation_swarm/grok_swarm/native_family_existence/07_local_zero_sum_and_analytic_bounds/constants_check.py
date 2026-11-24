#!/usr/bin/env python3
"""Exact-rational (Fraction) checks of the numerical steps in the run-7 reconstructions (pin 40e56ba).
Analytic inputs are NOT checked; only the arithmetic the human proofs use. Two transcendental facts are
checked with floats and a stated margin (marked FLOAT)."""
from fractions import Fraction as F
import math, itertools
ok = True
def chk(name, cond):
    global ok; ok &= bool(cond); print(("ok  " if cond else "FAIL") + " " + name)
# --- LogDerivZeros.main (NormOneSubConjMul.lean:125)
# Cauchy radius (R-r)/2 around z with |z|<=r; Borel-Caratheodory bound 2K|u|/(R-|u|) with |u|<=(R+r)/2
grid = [F(a, 20) for a in range(1, 20)]
bad = 0
for r, R in itertools.combinations(grid, 2):
    if not (0 < r < R < 1): continue
    rho = (R - r) / 2
    umax = (R + r) / 2                       # |u| <= |z| + rho <= r + rho
    if umax != r + rho or R - umax != rho: bad += 1
    bc = 2 * umax / (R - umax)               # BC factor (times K); source bounds |u| <= R in numerator
    if 2 * R / rho / rho != 8 * R / (R - r) ** 2: bad += 1
    if not (bc <= 2 * R / rho): bad += 1
chk("Cauchy/Borel-Caratheodory radius arithmetic: (2KR/rho)/rho = 8RK/(R-r)^2, rho=(R-r)/2, R-|u|>=rho (all r<R on 1/20 grid)", bad == 0)
bad = 0
for c1, c2, L in itertools.product([F(1, 7), F(1, 2), F(3)], [F(1, 9), F(1), F(5)], [F(0), F(1, 3), F(4), F(50)]):
    for N in range(0, 200):
        if N > L / c1: break
        if not (1 + L + N * c2 <= (1 + c2 / c1) * (1 + L)): bad += 1
        if not (N <= (1 / c1 + (8) * (1 + c2 / c1)) * (1 + L)): bad += 1
chk("K = 1+L+N c2 <= (1+c1^-1 c2)(1+L) and N <= C(1+L) whenever N <= L/c1 (sampled exact grid)", bad == 0)
# --- PrincipalLogDeriv (NegReLogDerivPrincipalLFunctionLe.lean)
chk("|p^-s| <= 1/2 and |1-p^-s| >= 1/2 give |logDeriv factor| <= (1/2 log p)/(1/2) = log p", F(1, 2) / F(1, 2) == 1)
# --- DirichletDeriv.exists_norm_deriv_LFunction_le
chk("FLOAT log 4 = %.6f >= 1.38 (margin %.4f)" % (math.log(4), math.log(4) - 1.38), math.log(4) - 1.38 > 1e-3)
L0 = F(138, 100)
chk("L>=1.38: circle radius 1/(4L); Re z >= 1-1/L-1/(4L) >= 1-2/L (i.e. 5/4 <= 2)", F(5, 4) <= 2)
chk("L>=1.38: Re z >= 1 - 5/(4L) >= 1/20", 1 - F(5, 4) / L0 >= F(1, 20))
chk("L>=1.38: |z| <= 1 + 1/(4L) <= 2", 1 + 1 / (4 * L0) <= 2)
chk("Cauchy: (84 e^2 L)/(1/(4L)) = 336 e^2 L^2  [84*4=336]", 84 * 4 == 336)
chk("norm_LFunction_le: e^2(1+log q) + 82 e^2 <= 84 e^2 L when log q <= L, L >= 1  [83+L <= 84L]", all(83 + L <= 84 * L for L in [F(1), F(138, 100), F(10)]))
chk("tail: 2q(1+40)(e^2/q) = 82 e^2 ; |s|/Re s <= 2/(1/20) = 40", 2 * (1 + 40) == 82 and F(2) / F(1, 20) == 40)
# --- LOneLower.inv_le_norm_LFunction_one
chk("FLOAT e^-1 = %.6f >= 1/3 (margin %.4f)" % (math.exp(-1), math.exp(-1) - 1 / 3), math.exp(-1) - 1 / 3 > 1e-3)
bad = 0
for q in range(1, 500):
    M = 6 * q
    if not (F(M, 3) - q == q and F(M * M) == 36 * q * q and F(q, M * M) == F(1, 36 * q)): bad += 1
chk("M = 6q: M/3 - q = q and q/M^2 = 1/(36q) for q = 1..499", bad == 0)
print("RESULT:", "all checks ok" if ok else "FAILURES")
raise SystemExit(0 if ok else 1)
