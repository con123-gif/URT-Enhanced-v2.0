#!/usr/bin/env python3
"""Q90 (Claude, 2026-11-13): exact sigma_1-clock Fourier energies of the original all-five P3 source.

After the Q88/Q89 recovery (``2026-11-13_q88_q89_engine_recovery``):

  (1) exact closed forms, in the radical tower, of the archived source norms (Q81 gave 35-digit mpmath values):
        ||h3||^2 = (1 + 2/sqrt5) (539116576348 - 164287376 sqrt579) / (3 * 193^2 * 16787^2)
        ||h5||^2 = (122294404990 + 2087425120 sqrt579) / (3^2 * 193^2 * 16787^2);
      the nested radical tau = sqrt(tr B + 2 sqrt det B) and rho = sqrt((5+sqrt5)/2) cancel;
  (2) h3 = lambda * v for a fixed rational vector v (im P3 is cut to a line by the three Q88 rows);
  (3) for each of the 8 selected dictionaries, with the isometric embedding U_h = M Ph / sqrt2, the sigma_1
      24-clock energies of the P3 source are E_6 = E_18 = ||h3||^2 / 2 and E_k = 0 for every other k (exact);
  (4) census over all 768 proper-A5 classes (same source, sigma_1 fixed): the normalised P3 spectrum takes
      exactly five values; the pure (k = 6, 18) one occurs on 64 classes = 8 Q24 orbits, one of them orbit 1;
  (5) the P5 source energies on the 8 selected dictionaries (exact; reported, nothing compared).

These are clock Fourier energies (eigenspaces of the sigma_1 permutation).  They are not the A5 quartet branch
weights (4,2,2,0) of Q82, and two clock modes are not four ARFs.  Nothing fitted; no SymPy; stdlib + numpy.
"""
import sys
from collections import Counter
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve()
sys.path.insert(0, str(HERE.parents[2]))
from cathedral_engine.certify import Certificate
from cathedral_engine import gate_a, histories
from cathedral_engine.clock import mode_energies, clock_multiplicities
from cathedral_engine.fields import RadicalTower
from cathedral_engine.source import exact_source, Q81_PRINTED

with Certificate("Q90_SOURCE_CLOCK_ENERGIES", __file__) as c:
    S = exact_source()
    T, st = S["T"], S["st"]
    h3, h5, n3, n5 = S["h3"], S["h5"], S["norm3"], S["norm5"]
    s579 = st.s3 * T.sqrt_rational(193)
    den3 = 3 * 193 ** 2 * 16787 ** 2
    closed3 = (1 + 2 * st.s5 / 5) * (539116576348 - 164287376 * s579) / den3
    closed5 = (122294404990 + 2087425120 * s579) / (3 * den3)
    c.check((n3 - closed3).is_zero(), "closed form of ||h3||^2")
    c.check((n5 - closed5).is_zero(), "closed form of ||h5||^2")
    used = set(T.names[i] for i in n3.generators_used() | n5.generators_used())
    c.check(used <= {"sqrt5", "sqrt3", "sqrt193"}, f"norms free of rho and tau: {used}")
    c.record("||h3||^2", f"(1 + 2/sqrt5)(539116576348 - 164287376 sqrt579)/(3*193^2*16787^2) = {T.decimal(n3, 40)}")
    c.record("||h5||^2", f"(122294404990 + 2087425120 sqrt579)/(3^2*193^2*16787^2) = {T.decimal(n5, 40)}")
    # certified algebraic degrees: minimal polynomials over Q in a tower proved to be a field
    T2 = RadicalTower(300)
    t5, t3, t193 = T2.sqrt(5), T2.sqrt(3), T2.sqrt(193)
    c.check(T2.certify_field(), "Q(sqrt5, sqrt3, sqrt193) has degree 8 (generators independent)")
    m3 = T2.minimal_polynomial((1 + 2 * t5 / 5) * (539116576348 - 164287376 * t3 * t193) / den3)
    m5 = T2.minimal_polynomial((122294404990 + 2087425120 * t3 * t193) / (3 * den3))
    def primitive(mp):
        from math import gcd, lcm
        L = 1
        for x in mp:
            L = lcm(L, x.denominator)
        ints = [int(x * L) for x in mp]
        g = 0
        for x in ints:
            g = gcd(g, x)
        return [x // g for x in ints]
    c.check(len(m3) == 5 and len(m5) == 3, "deg ||h3||^2 = 4, deg ||h5||^2 = 2 over Q")
    c.check(T.certify_field(), "the full source tower (7 radicals) is a field: every zero test above is complete")
    c.record("minimal polynomial of ||h3||^2 (integer, low -> high)", primitive(m3))
    c.record("minimal polynomial of ||h5||^2 (integer, low -> high)", primitive(m5))
    for key, val in (("norm3", n3), ("norm5", n5)):
        lo, hi = T.enclose(val)
        q = Fraction(Q81_PRINTED[key])
        c.check(max(abs(q - lo), abs(q - hi)) < Fraction(1, 10 ** 35), f"Q81 printed {key} agrees to its last digit")
    c.record("REVIEW Q81 numbers", "AGREE: both printed mpmath values are correct to every printed digit")

    # (2) the source line
    line = gate_a.source_line()
    c.check(len(line) == 1, "the three Q88 rows cut im P3 to a line")
    v = line[0]
    i0 = next(i for i in range(20) if v[i])
    lam = h3[i0] / v[i0]
    c.check(all((h3[i] - lam * v[i]).is_zero() for i in range(20)), "h3 = lambda v exactly")
    vv = sum((x * x for x in v), Fraction(0))
    c.check((lam * lam * vv - n3).is_zero(), "lambda^2 ||v||^2 = ||h3||^2")
    c.record("source line v (primitive integer)", [int(x * 1) if x.denominator == 1 else str(x) for x in v])

    # (3) the selected dictionaries: exact energies of the P3 and P5 sources
    sig = gate_a.sigma1()
    mult = clock_multiplicities(sig)
    c.check(mult == {k: (6 if k % 6 == 0 and k % 2 == 0 else (5 if k % 2 == 0 else 0)) for k in range(24)},
            "sigma_1 clock multiplicities 6/5/0 (Q69)")
    p5 = {}
    for D in gate_a.selected_dictionaries():
        E = mode_energies(gate_a.pull_back(h3, D), sig, T)          # raw M: divide by 2 for U_h
        for k in range(24):
            want = n3 if k in (6, 18) else 0
            c.check((E[k] - want).is_zero(), f"{D} P3 source: E_{k}")
        E5 = mode_energies(gate_a.pull_back(h5, D), sig, T)
        tot = sum((E5[k] for k in range(24)), T.zero())
        c.check((tot - 2 * n5).is_zero(), f"{D} P5 energies sum to ||M h5||^2 = 2 ||h5||^2")
        c.check(all(E5[k].is_zero() for k in range(24) if k % 4), f"{D} P5 source only in k = 0 mod 4")
        c.check((E5[0] - Fraction(5, 8) * 2 * n5).is_zero() and (E5[12] - Fraction(3, 8) * 2 * n5).is_zero()
                and all(E5[k].is_zero() for k in (4, 8, 16, 20)), f"{D} P5 source: E_0 = 5/8, E_12 = 3/8 of ||h5||^2")
        p5[D] = tuple(T.decimal(E5[k] / 2, 18) if not E5[k].is_zero() else "0" for k in range(0, 24, 4))
    c.check(len(set(p5.values())) == 1, "P5 energies identical on the 8 selected dictionaries")
    c.record("selected orbit, P3 source (U_h normalisation)",
             f"E_6 = E_18 = ||h3||^2/2 = {T.decimal(n3 / 2, 30)}; E_k = 0 otherwise; all 8 dictionaries")
    c.record("selected orbit, P5 source E_k, k = 0,4,...,20 (U_h normalisation)", next(iter(p5.values())))
    c.record("selected orbit, P5 source", "E_0 = (5/8)||h5||^2, E_12 = (3/8)||h5||^2, E_4 = E_8 = E_16 = E_20 = 0 (exact)")

    # (4) census over all 768 classes, on the rational line v (exact over Q(sqrt3))
    T3 = RadicalTower(200)
    norm = 2 * vv
    pats = Counter(); pure = []
    for D in histories.a5_classes():
        E = mode_energies(gate_a.pull_back(v, D), sig, T3)
        c.check(all(not E[k] for k in range(24) if k % 4 != 2), f"{D}: P3 source confined to k = 2 mod 4")
        pat = tuple(E[k] / norm for k in (2, 6, 10, 14, 18, 22))
        key = tuple(str(x) for x in pat)
        pats[key] += 1
        if all(not pat[j] for j in (0, 2, 3, 5)):
            pure.append(D)
    c.check(len(pats) == 5, f"five normalised spectra over the 768 classes (got {len(pats)})")
    c.record("768-class census (k = 2,6,10,14,18,22; fraction of ||h3||^2)",
             {k: n for k, n in sorted(pats.items(), key=lambda kv: -kv[1])})
    orbs = {histories.q24_orbit_classes(D) for D in pure}
    c.check(len(pure) == 64 and len(orbs) == 8 and all(o <= set(pure) for o in orbs), "pure spectrum: 64 classes = 8 Q24 orbits")
    c.check(set(gate_a.selected_dictionaries()) in [set(o) for o in orbs], "orbit 1 is one of them")
    allorbs = list(histories.q24_orbits())
    c.record("pure (k = 6,18) Q24 orbits (indices in q24_orbits())", sorted(allorbs.index(o) for o in orbs))
    c.record("pure orbits by minimal class representative", sorted(min(o) for o in orbs))
    c.record("selected orbit minimal representative", min(gate_a.selected_dictionaries()))
print("Q90_SOURCE_CLOCK_ENERGIES_PASS")
