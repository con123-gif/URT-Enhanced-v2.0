#!/usr/bin/env python3
"""Exact-rational checks of the numerical constants in the three proofs reconstructed in
06_zero_free_regions (pin 40e56ba). Checks only the rational coefficient identities and
inequalities that the human proofs use; the analytic inputs are not checked here."""
from fractions import Fraction as F
ok = True
def chk(name, cond):
    global ok; ok &= bool(cond); print(("ok  " if cond else "FAIL") + " " + name)
# --- T-1c inv_le_log (LFunctionConjEqZero.lean:173), sigma = 1 + 8 delta, zero at 1 - delta + i gamma
d = F(1, 21)
chk("delta<=1/21 => sigma=1+8delta<=2", 1 + 8 * d <= 2)
chk("delta<=1/21 => zero in disc |w-(3/2+i gamma)|<=5/6 (1/2+delta<=5/6)", F(1, 2) + d <= F(5, 6))
chk("Re 1/(sigma-1) = 1/(8 delta) and Re 1/(9 delta) at gamma: coefficient 4/9 - 3/8 = 5/72", F(4, 9) - F(3, 8) == F(5, 72))
chk("case chi^2 != 1: 72/5*(3 C0 + 6 C1) <= 300 (C0 + C1)  [3*72/5, 6*72/5 <= 300]", 3 * F(72, 5) <= 300 and 6 * F(72, 5) <= 300)
# small subcase: 2 gamma^2 <= 81 delta^2 ; both rho, conj rho in disc centred 3/2: (1/2+delta)^2 + gamma^2 <= 25/36
chk("small subcase disc: (1/2+1/21)^2 + 81/2*(1/21)^2 <= 25/36", (F(1, 2) + d) ** 2 + F(81, 2) * d ** 2 <= F(25, 36))
chk("small subcase: 2/27 bound needs 243 delta^2 >= 2(81 delta^2+gamma^2) <=> 81 delta^2 >= 2 gamma^2  [243-162=81]", 243 - 2 * 81 == 81)
chk("small subcase: 2*(2/27) - 1/8 = 5/216", 2 * F(2, 27) - F(1, 8) == F(5, 216))
chk("small subcase: 216/5 <= 300", F(216, 5) <= 300)
chk("large subcase: 8d/(64d^2+4g^2) <= 4/(81 d) <=> 392 d^2 <= 16 g^2; holds when g^2 > 81/2 d^2 (16*81/2=648>=392)", 16 * F(81, 2) >= 392)
chk("large subcase: 3/8 - 4/9 + 4/81 = -13/648", F(3, 8) - F(4, 9) + F(4, 81) == F(-13, 648))
chk("large subcase: 648/13*5 <= 300 and 648/13*4 <= 300", F(648, 13) * 5 <= 300 and F(648, 13) * 4 <= 300)
chk("zero_free_region: c<=1/42, L>1/2 => c/L < 1/21", F(1, 42) / F(1, 2) == F(1, 21))
# --- T-1b zeta lemma (ZeroFreePrincipal.lean:128): K = 9C+5 >= 5, c1 = 1/(28K), delta = 1/(2K)
chk("K>=5 => delta=1/(2K)<=1/10", F(1, 2 * 5) <= F(1, 10))
chk("K>=5 => c1/L <= 1/140 (L>=1)", F(1, 28 * 5) <= F(1, 140))
chk("1/140 <= 1/3 so beta >= 2/3", F(1, 140) <= F(1, 3))
chk("3/(sigma-1) = 3L/delta = 6KL", 3 * 2 == 6)
chk("final: 7K(1/(2K)+1/(28K)) = 15/4 < 4", F(7, 2) + F(7, 28) == F(15, 4) and F(15, 4) < 4)
# --- three_four_one kernel: 3 + 4cos + cos2 = 2(1+cos)^2 on the unit circle (sampled exact rational points)
pts = [(F(a * a - b * b, a * a + b * b), F(2 * a * b, a * a + b * b)) for a in range(-6, 7) for b in range(-6, 7) if (a, b) != (0, 0)]
chk("3+4x+(x^2-y^2) = 2(1+x)^2 >= 0 at %d exact rational unit-circle points" % len(pts),
    all(3 + 4 * x + (x * x - y * y) == 2 * (1 + x) ** 2 and x * x + y * y == 1 for x, y in pts))
print("RESULT:", "all checks ok" if ok else "FAILURES")
raise SystemExit(0 if ok else 1)
