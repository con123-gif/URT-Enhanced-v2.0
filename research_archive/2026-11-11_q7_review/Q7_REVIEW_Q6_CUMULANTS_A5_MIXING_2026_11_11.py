#!/usr/bin/env python3
"""Q7 [review]: independent check of Theorems 1-2 of
`2026-11-10_urt_arf_forward/new_gate/URT_Q6_CUMULANTS_AND_A5_MIXING_THEOREMS_2026_11_10.md`.

Independent: imports none of the reviewed scripts. Exact rational arithmetic (fractions.Fraction) throughout.

Theorem 1 (finite inverse and all-order cumulant recursion) is tested by:
  (a) Q^6 = P exactly, P Q = Q P = P (Q doubly stochastic);
  (b) (I-Q)(I+Q+...+Q^5) b = b for centred b;
  (c) the stated recursion for lambda_n, r_n, K_n (implemented here from the statement) against EXACT finite-time
      cumulants of S_n = sum_{i<n} g(X_i) for the stationary chain, computed by exact truncated power series of
      E exp(t S_n) = P T(t)^n 1, T = diag(e^{tg}) Q. For several non-i.i.d. six-bit sources, K_j = kappa_j(S_{n+1}) - kappa_j(S_n)
      exactly once n is past the memory length, for j = 2..4 (and j = 6 for the Rademacher check).
Theorem 2 (A5 mixture is not ergodic) is tested by:
  (d) exact arithmetic of mu = 71/48, Var_5 = 1493/5760, 3 Var_5 = 1493/1920 from the archived K2 rates;
  (e) the mixture law kappa4_mix = mean kappa4_i + 3 Var_I(Var_i) on five exactly computable chain sources with unequal
      K2: the mixture fourth cumulant is exactly quadratic in n for large n with leading coefficient 3 Var_5(K2).
"""
from __future__ import annotations

import json
import sys
from fractions import Fraction as F
from math import comb
from pathlib import Path

HERE = Path(__file__).resolve().parent
NS = 64
DEG = 6


def Qapply(f):
    return [(f[(2 * h) % NS] + f[(2 * h + 1) % NS]) / 2 for h in range(NS)]


def mean(f):
    return sum(f, F(0)) / NS


def bit(h, k):
    return (h >> k) & 1


# ---------- (a), (b)
def check_Q6():
    for e in range(NS):
        f = [F(int(h == e)) for h in range(NS)]
        x = f
        for _ in range(6):
            x = Qapply(x)
        assert all(v == F(1, 64) for v in x), "Q^6 != P"
    colsum = [sum(F(1, 2) for h in range(NS) for j in ((2 * h) % NS, (2 * h + 1) % NS) if j == c) for c in range(NS)]
    assert all(c == 1 for c in colsum), "Q not doubly stochastic"
    b = [F((h * 37) % 11) for h in range(NS)]; m = mean(b); b = [v - m for v in b]
    y = list(b); acc = list(b)
    for _ in range(5):
        y = Qapply(y); acc = [a + v for a, v in zip(acc, y)]
    res = [a - q for a, q in zip(acc, Qapply(acc))]
    assert res == b, "(I-Q)(I+...+Q^5) b != b"


# ---------- (c) the stated recursion
def recursion_cumulants(g, nmax):
    lam = [F(1)]
    r = [[F(1)] * NS]
    for n in range(1, nmax + 1):
        A = [F(0)] * NS
        for k in range(1, n + 1):
            Qr = Qapply(r[n - k])
            A = [a + comb(n, k) * (gh ** k) * q for a, gh, q in zip(A, g, Qr)]
        ln = mean(A)
        lam.append(ln)
        c = list(A)
        for k in range(1, n + 1):
            c = [cv - comb(n, k) * lam[k] * rv for cv, rv in zip(c, r[n - k])]
        y = list(c); acc = list(c)
        for _ in range(5):
            y = Qapply(y); acc = [a + v for a, v in zip(acc, y)]
        r.append(acc)
    K = [F(0)] * (nmax + 1)
    for n in range(1, nmax + 1):
        K[n] = lam[n] - sum(comb(n - 1, j - 1) * K[j] * lam[n - j] for j in range(1, n))
    return K


# ---------- exact finite-time cumulants
def series_exp(a, deg):
    out = [F(0)] * (deg + 1); term = F(1)
    for k in range(deg + 1):
        out[k] = term; term = term * a / (k + 1)
    return out


def series_mul(x, y, deg):
    z = [F(0)] * (deg + 1)
    for i, xi in enumerate(x):
        if xi:
            for j in range(deg + 1 - i):
                z[i + j] += xi * y[j]
    return z


def finite_moments(g, n, deg):
    eg = [series_exp(gh, deg) for gh in g]
    v = [[F(1)] + [F(0)] * deg for _ in range(NS)]
    for _ in range(n):
        Qv = [[(v[(2 * h) % NS][k] + v[(2 * h + 1) % NS][k]) / 2 for k in range(deg + 1)] for h in range(NS)]
        v = [series_mul(eg[h], Qv[h], deg) for h in range(NS)]
    M = [sum((v[h][k] for h in range(NS)), F(0)) / NS for k in range(deg + 1)]   # E exp(tS) coefficients
    return [M[k] * fact(k) for k in range(deg + 1)]


def moments_to_cumulants(mom):
    deg = len(mom) - 1
    kap = [F(0)] * (deg + 1)
    for m in range(1, deg + 1):
        kap[m] = mom[m] - sum(comb(m - 1, j - 1) * kap[j] * mom[m - j] for j in range(1, m))
    return kap


def finite_cumulants(g, n, deg):
    return moments_to_cumulants(finite_moments(g, n, deg))


def fact(k):
    out = 1
    for i in range(2, k + 1):
        out *= i
    return out


def centred(g):
    m = mean(g)
    return [x - m for x in g]


SOURCES = {
    "rademacher_bit2": [F(2 * bit(h, 2) - 1) for h in range(NS)],
    "product_bits_0_3": centred([F(bit(h, 0) * bit(h, 3)) for h in range(NS)]),
    "popcount": centred([F(bin(h).count("1")) for h in range(NS)]),
    "asymmetric": centred([F(bit(h, 0) + 2 * bit(h, 1) * bit(h, 5) - 3 * bit(h, 4) * bit(h, 2) * bit(h, 0)) for h in range(NS)]),
}


def main() -> int:
    out: dict = {}
    check_Q6()
    out["Q6_equals_P_and_finite_inverse"] = True

    rec = {}
    for name, g in SOURCES.items():
        deg = 6 if name == "rademacher_bit2" else 4
        K = recursion_cumulants(g, deg)
        n0 = 6 * deg + 2
        k1, k2 = finite_cumulants(g, n0, deg), finite_cumulants(g, n0 + 1, deg)
        diffs = [k2[j] - k1[j] for j in range(deg + 1)]
        agree = all(diffs[j] == K[j] for j in range(2, deg + 1))
        rec[name] = {"K_recursion": [str(K[j]) for j in range(2, deg + 1)], "agrees_with_exact_finite_time": agree}
        assert agree, (name, [str(x) for x in K], [str(x) for x in diffs])
    assert rec["rademacher_bit2"]["K_recursion"][::2] == ["1", "-2", "16"]
    out["theorem1_recursion_vs_exact_finite_time"] = rec

    v = [F(67, 48), F(33, 16), F(25, 24), F(33, 16), F(5, 6)]
    mu = sum(v) / 5; var = sum(x * x for x in v) / 5 - mu * mu
    out["theorem2_arithmetic"] = {"mu": str(mu), "Var5": str(var), "3Var5": str(3 * var)}
    assert (mu, var, 3 * var) == (F(71, 48), F(1493, 5760), F(1493, 1920))

    # (e) mixture law on five exactly computable sources with distinct K2
    five = [SOURCES["product_bits_0_3"], SOURCES["popcount"], SOURCES["asymmetric"],
            centred([F(bit(h, 1) * bit(h, 4)) for h in range(NS)]),
            centred([F(bit(h, 0) + bit(h, 5)) for h in range(NS)])]
    K2 = [recursion_cumulants(g, 2)[2] for g in five]
    m2 = sum(K2) / 5; var2 = sum(x * x for x in K2) / 5 - m2 * m2
    mix, law = [], []
    for n in (30, 31, 32, 33):
        moms = [finite_moments(g, n, 4) for g in five]
        mixed = moments_to_cumulants([sum(m[k] for m in moms) / 5 for k in range(5)])   # the mixture's own law
        mix.append(mixed[4])
        ks = [moments_to_cumulants(m) for m in moms]
        s2 = [k[2] for k in ks]; ms = sum(s2) / 5
        law.append(sum(k[4] for k in ks) / 5 + 3 * (sum(x * x for x in s2) / 5 - ms * ms))
    second = [mix[i + 2] - 2 * mix[i + 1] + mix[i] for i in range(2)]
    out["mixture_law"] = {"K2_rates": [str(x) for x in K2], "Var_I(K2)": str(var2),
                          "total_cumulance_law_exact": all(a == b for a, b in zip(mix, law)),
                          "second_difference_of_kappa4_mix": [str(x) for x in second], "expected_6Var": str(6 * var2)}
    assert var2 > 0 and all(a == b for a, b in zip(mix, law)) and all(s == 6 * var2 for s in second)

    print(json.dumps(out, indent=2))
    (HERE / "Q7_REVIEW_Q6_CUMULANTS_A5_MIXING_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: Q^6 = P and the finite inverse; the stated recursion equals exact finite-time cumulant rates for four "
          "non-trivial sources; 71/48, 1493/5760, 1493/1920 exact; mixture kappa4 is exactly quadratic with coefficient 3 Var(K2).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
