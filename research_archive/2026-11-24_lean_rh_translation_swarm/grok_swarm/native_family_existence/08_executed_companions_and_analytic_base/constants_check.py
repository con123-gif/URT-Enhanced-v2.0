#!/usr/bin/env python3
"""Exact-rational checks of the arithmetic in the run-8 reconstructions (pin 40e56ba).
Only the arithmetic used by the human proofs; analytic inputs are not checked. FLOAT lines use floats with a margin."""
from fractions import Fraction as F
import math
ok = True
def chk(name, cond):
    global ok; ok &= bool(cond); print(("ok  " if cond else "FAIL") + " " + name)
Ts = [F(2)] + [F(2) + F(k, 7) for k in range(1, 200)]
# ZetaLocal.norm_zeta1_le: |w-1|<=T, |w|<=2T, Re w>=1/2 => |zeta - w/(w-1)| <= |w|/Re w <= 2|w| <= 4T
chk("norm_zeta1_le: T*(4T) + 2T <= 5T^2 for T=|t|+2 >= 2 (grid)", all(T * 4 * T + 2 * T <= 5 * T * T for T in Ts))
chk("norm_zeta1_le, w = 1 case: 1 <= 5T^2", all(1 <= 5 * T * T for T in Ts))
chk("norm_zeta1_le: |w|/Re w <= 2|w| when Re w >= 1/2", 1 / F(1, 2) == 2)
chk("le_norm_zeta1: (Re-1)/Re at Re=3/2 is 1/3; times |w-1|>=1/2 gives 1/6", (F(3, 2) - 1) / F(3, 2) * F(1, 2) == F(1, 6))
chk("ZetaLocal: 5 <= T^5/6 for T >= 2 (so 5T^2/|zeta1(c)| <= T^7)", all(5 <= T ** 5 / 6 for T in Ts))
chk("FLOAT ZetaLocal: 1 + 7 log T <= 9 log T needs log 2 = %.6f >= 1/2" % math.log(2), math.log(2) - 0.5 > 1e-3)
chk("ZetaLocal unit-disc geometry: |c+z-1| <= 1/2 + |t| + 1 <= T ; |c+z| <= 3/2+|t|+1 <= 2T", all(F(1, 2) + (T - 2) + 1 <= T and F(3, 2) + (T - 2) + 1 <= 2 * T for T in Ts))
# ZetaLeft.norm_emE_le
chk("emE: Re(w-4) = -3 - Re s <= -9/8 iff Re s >= -15/8", -3 - F(-15, 8) == F(-9, 8))
ok_poly = all(abs(t ** 3 - F(3, 2) * t ** 2 + t / 2) / 6 <= 1 for t in [F(k, 1000) for k in range(0, 1000)])
chk("emE: |(t^3 - 3t^2/2 + t/2)/6| <= 1 on t in [0,1) (grid of 1000)", ok_poly)
Rs = [F(1)] + [F(1) + F(k, 5) for k in range(1, 100)]
Ks = [F(0), F(1), F(9), F(40)]
chk("norm_sub_one_mul_riemannZeta_le: 1 + R/2 + R^2/12 + R^4 K <= (3+K) R^5 for R>=1 (grid)",
    all(1 + R / 2 + R * R / 12 + R ** 4 * K <= (3 + K) * R ** 5 for R in Rs for K in Ks))
chk("ZetaLeft range: -7/4 >= -15/8 (lemma applies on Re s >= -7/4)", F(-7, 4) > F(-15, 8))
# DirichletTail.norm_LFunction_sub_sum_le
qs = [F(q) for q in range(1, 30)]; rs = [F(k, 3) for k in range(0, 30)]
chk("DirichletTail: q(|s|/sigma) + q = q(1+|s|/sigma) <= 2q(1+|s|/sigma)", all(q * r + q == q * (1 + r) <= 2 * q * (1 + r) for q in qs for r in rs))
# LLower
chk("LLower.tsum_one_div_rpow_le: 1 + 1/(sigma-1) = sigma/(sigma-1)", all(1 + 1 / (s - 1) == s / (s - 1) for s in [F(3, 2), F(2), F(11, 10)]))
print("RESULT:", "all checks ok" if ok else "FAILURES")
raise SystemExit(0 if ok else 1)
