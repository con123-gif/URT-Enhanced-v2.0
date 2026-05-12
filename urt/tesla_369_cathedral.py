"""
Tesla 3-6-9 in Cathedral form.

The numbers `{3, 6, 9}` famously associated with Tesla's "key to the
universe" remark are, in the Cathedral framework, the three canonical
functions of `D = 3`:

        3 = D                          (spatial dimension; Fiedler λ)
        6 = D!  = T_D                  (first perfect number; |S_3|)
        9 = D² = D! + D                (A_5 exhaust sector size)

This module collects the closed-form identities the triplet satisfies
inside the framework.  None of them are mystical — every entry is a
verifiable integer identity reducing to the seven Cathedral integers
{D, q, V, N, E, F, G} and γ = D^{−(D+1)} = 1/81.

The catalogue (13 identities + 1 uniqueness theorem)
----------------------------------------------------

Pairwise sums and small compounds:
    3 + 6           = D²              = 9
    3 + 9           = V               = 12
    6 + 9           = D · q           = 15        (3×3 magic-square constant)
    3 + 6 + 9       = 2 · D²          = 18
    3 · 9           = D^D             = 27        (spherical-harmonics dim Y_N)
    6 · 9           = 2 · D^D         = 54
    3 · 6 · 9       = 2 / γ           = 162

Higher-power sums:
    3³ + 6³ + 9³    = V / γ           = 972
    3² + 6² + 9²    = D² · (N + 1)    = 126       (Bravais-lattice scaling)
    3⁴ + 6⁴ + 9⁴    = (2/γ) · (D!+1)² = 7938

Bilinear Tesla compounds (genuinely new):
    3 + 6 · 9       = G − D = N_e     = 57        (inflation e-fold count)
    3 · 6 + 9       = D^D             = 27        (D^D as a Tesla bilinear)
    (3 + 9) · 6     = D! · V          = 72        (= tr(L_{G_13}))

Cumulative extension (figurate numbers):
    T_3 + T_6 + T_9 = D! · V          = 72        (= tr(L_{G_13}))
    P_3 + P_6 + P_9 = V · (D·q) = D·G = 180

Self-similar D-power tower:
    {D¹, D², D³, D⁴} = {D, D², D^D, 1/γ} = {3, 9, 27, 81}
    (D! = 6 is the unique non-power Cathedral integer in {3, 6, 9})

Spectral reading on L_{G_13}:
    3 = Fiedler eigenvalue λ₂        (mult D − 1 = 2)
    6 = multiplicity of λ = q        (the A_5 dominant block)
    9 = rank-1 boundary eigenvalue

γ-ladder intersection:
    γ-ladder exponents = {D, q, D², (D+1)^D, −(D!+1)} = {3, 5, 9, 64, −7}
    intersection with {3, 6, 9}      = {3, 9}  (D and D²)

Uniqueness theorem:
    `{D, D!, D²}` is an arithmetic progression iff `T_D = D!`,
    which holds only at `D ∈ {1, 3}`.  D = 3 is the unique
    non-trivial dimension where the Tesla triplet is an AP with
    common difference D.

Headline novelty (BREAKTHROUGH-grade)
-------------------------------------

The inflation e-fold count is a Tesla-bilinear:

        N_e_efolds  =  G − D  =  3 + 6 · 9   =  57

so the Planck spectral index reads

        n_s  =  1 − 2 / N_e  =  1 − 2 / (3 + 6·9)  =  55/57  ≈  0.9649

— the Planck 2018 value.  Tesla's bilinear `D + D!·D²` is the
inflation-sector closed form already living inside the framework.
"""
from __future__ import annotations

from collections import Counter
from fractions import Fraction
from math import factorial
from typing import Any, Dict, List, Tuple

from .shell_closure import D, q, V, N, E, F, G

# γ = D^{−(D+1)} = 1/81 — Cathedral entropy reciprocal
GAMMA = Fraction(1, D ** (D + 1))

# The Tesla triplet, as Cathedral compounds
TESLA_3 = D                # 3
TESLA_6 = factorial(D)     # 6
TESLA_9 = D * D            # 9


# ── helpers ──────────────────────────────────────────────────────────────


def _T(n: int) -> int:
    """Triangular number T_n = n(n+1)/2."""
    return n * (n + 1) // 2


def _P(n: int) -> int:
    """Pentagonal number P_n = n(3n − 1)/2."""
    return n * (3 * n - 1) // 2


def _digital_root(n: int) -> int:
    n = abs(n)
    while n >= 10:
        n = sum(int(d) for d in str(n))
    return n


# ── 1. The Tesla triplet as Cathedral compounds ──────────────────────────


def tesla_triplet_cathedral() -> Dict[str, Tuple[int, str, bool]]:
    """The three Tesla numbers expressed as Cathedral compounds.

    Each entry is `(value, cathedral_form, holds)`.
    """
    return {
        "three_is_D":       (TESLA_3, "D",           TESLA_3 == D),
        "six_is_Dfact":     (TESLA_6, "D!",          TESLA_6 == factorial(D)),
        "nine_is_Dsq":      (TESLA_9, "D² = D! + D", TESLA_9 == D * D == factorial(D) + D),
    }


# ── 2. Pairwise / small compounds ────────────────────────────────────────


def pairwise_compounds() -> Dict[str, Tuple[int, int, bool]]:
    """Pairwise sums and products of {3, 6, 9} that land on Cathedral integers."""
    return {
        # 3 + 6 = D²
        "3_plus_6":      (3 + 6,    D * D,        3 + 6 == D * D),
        # 3 + 9 = V
        "3_plus_9":      (3 + 9,    V,            3 + 9 == V),
        # 6 + 9 = D·q (3×3 magic-square constant)
        "6_plus_9":      (6 + 9,    D * q,        6 + 9 == D * q),
        # 3 + 6 + 9 = 2·D²
        "sum_3_6_9":     (3 + 6 + 9, 2 * D * D,   3 + 6 + 9 == 2 * D * D),
        # 3 · 9 = D^D
        "3_times_9":     (3 * 9,    D ** D,       3 * 9 == D ** D),
        # 6 · 9 = 2·D^D
        "6_times_9":     (6 * 9,    2 * D ** D,   6 * 9 == 2 * D ** D),
        # 3 · 6 · 9 = 2/γ
        "prod_3_6_9":    (3 * 6 * 9, 2 * D ** (D + 1),
                          3 * 6 * 9 == 2 * D ** (D + 1)),
    }


# ── 3. Higher-power sums ─────────────────────────────────────────────────


def higher_power_sums() -> Dict[str, Tuple[int, int, bool]]:
    """Sums of 2nd/3rd/4th powers of {3, 6, 9}."""
    sq  = 3 ** 2 + 6 ** 2 + 9 ** 2
    cub = 3 ** 3 + 6 ** 3 + 9 ** 3
    qrt = 3 ** 4 + 6 ** 4 + 9 ** 4
    return {
        # 3² + 6² + 9² = D² · (N + 1) = D² · #Bravais
        "sum_squares":   (sq,  D * D * (N + 1),       sq  == D * D * (N + 1)),
        # 3³ + 6³ + 9³ = V / γ
        "sum_cubes":     (cub, V * D ** (D + 1),      cub == V * D ** (D + 1)),
        # 3⁴ + 6⁴ + 9⁴ = (2/γ) · (D!+1)²
        "sum_fourths":   (qrt, 2 * D ** (D + 1) * (factorial(D) + 1) ** 2,
                          qrt == 2 * D ** (D + 1) * (factorial(D) + 1) ** 2),
    }


# ── 4. Bilinear Tesla compounds (the genuinely new ones) ─────────────────


def bilinear_compounds() -> Dict[str, Tuple[int, int, bool, str]]:
    """Tesla bilinear forms `a + b·c` that hit Cathedral compounds.

    Each entry is `(value, target, holds, meaning)`.
    """
    return {
        # 3 + 6·9 = G − D = N_e_efolds  → drives n_s = 1 − 2/57
        "three_plus_six_times_nine":
            (3 + 6 * 9, G - D, 3 + 6 * 9 == G - D,
             "inflation e-fold count: n_s = 1 − 2/(3 + 6·9) = 0.9649"),
        # 3·6 + 9 = D^D
        "three_times_six_plus_nine":
            (3 * 6 + 9, D ** D, 3 * 6 + 9 == D ** D,
             "spherical-harmonics dim Y_N as Tesla bilinear"),
        # (3 + 9) · 6 = D! · V = tr(L_{G_13})
        "three_plus_nine_times_six":
            ((3 + 9) * 6, factorial(D) * V, (3 + 9) * 6 == factorial(D) * V,
             "Laplacian trace as Tesla bilinear"),
    }


def n_s_from_tesla_bilinear() -> Fraction:
    """Spectral index n_s = 1 − 2/(3 + 6·9) = 1 − 2/57 = 55/57."""
    return Fraction(1) - Fraction(2, 3 + 6 * 9)


# ── 5. Figurate-number extensions ────────────────────────────────────────


def triangular_extension() -> Dict[str, Tuple[int, int, bool]]:
    """T_3 + T_6 + T_9 = D! · V = tr(L_{G_13})."""
    t3, t6, t9 = _T(3), _T(6), _T(9)
    return {
        "T_3_eq_Dfact":      (t3, factorial(D),         t3 == factorial(D)),
        "T_6_eq_D_Dfact_p1": (t6, D * (factorial(D) + 1),
                              t6 == D * (factorial(D) + 1)),
        "T_9_eq_Dsq_q":      (t9, D * D * q,            t9 == D * D * q),
        "sum_T_eq_Dfact_V":  (t3 + t6 + t9, factorial(D) * V,
                              t3 + t6 + t9 == factorial(D) * V),
    }


def pentagonal_extension() -> Dict[str, Tuple[int, int, bool]]:
    """P_3 + P_6 + P_9 = V · (D·q) = D · G."""
    p3, p6, p9 = _P(3), _P(6), _P(9)
    return {
        "P_3_eq_V":          (p3, V,         p3 == V),
        "P_6_eq_ARFd51":     (p6, 51,        p6 == 51),     # pentagonal quartet
        "P_9_eq_Dsq_N":      (p9, D * D * N, p9 == D * D * N),
        "sum_P_eq_V_Dq":     (p3 + p6 + p9, V * D * q,
                              p3 + p6 + p9 == V * D * q),
        "sum_P_eq_DG":       (p3 + p6 + p9, D * G,
                              p3 + p6 + p9 == D * G),
    }


# ── 6. D-power tower ─────────────────────────────────────────────────────


def d_power_tower() -> Dict[str, Any]:
    """{D¹, D², D³, D⁴} = {D, D², D^D, 1/γ} = {3, 9, 27, 81}.

    D! = 6 is the unique non-power Cathedral integer between D and D².
    """
    tower = [D ** k for k in (1, 2, 3, 4)]
    expected = [D, D * D, D ** D, D ** (D + 1)]
    return {
        "tower":            tower,
        "expected":         expected,
        "matches":          tower == expected == [3, 9, 27, 81],
        "Dfact_position":   "between D¹=3 and D²=9 (non-power)",
        "Dfact_value":      factorial(D),
    }


# ── 7. Spectral reading on L_{G_13} ──────────────────────────────────────


# Canonical spectrum of L_{G_13} as recorded by `urt.spectrum_cathedral`.
_SPEC_G13 = (0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13)


def spectral_reading() -> Dict[str, Any]:
    """The three Tesla numbers reading L_{G_13} as eigenvalue / multiplicity / eigenvalue."""
    mult = Counter(_SPEC_G13)
    return {
        "spectrum":          list(_SPEC_G13),
        "multiplicities":    dict(sorted(mult.items())),
        # 3 IS an eigenvalue (the Fiedler λ₂) with multiplicity D − 1 = 2
        "three_is_Fiedler_eigenvalue":   (3 in mult and mult[3] == D - 1),
        # 6 = D! IS the multiplicity of λ = q
        "six_is_mult_of_q":              (mult.get(q, 0) == factorial(D)),
        # 9 IS an eigenvalue with multiplicity 1 (rank-1 K_4/A_5 boundary)
        "nine_is_rank_1_eigenvalue":     (mult.get(9, 0) == 1),
    }


# ── 8. γ-ladder intersection ─────────────────────────────────────────────


# γ-ladder exponents from the ARF Cathedral (urt.arf_cathedral)
_GAMMA_LADDER = (D, q, D * D, (D + 1) ** D, -(factorial(D) + 1))


def gamma_ladder_intersection() -> Dict[str, Any]:
    """γ-ladder exponents intersected with {3, 6, 9}."""
    ladder = list(_GAMMA_LADDER)
    trio = {3, 6, 9}
    hits = [k for k in ladder if k in trio]
    return {
        "gamma_ladder_exponents":   ladder,
        "intersection_with_trio":   hits,
        "hits":                     {3: "α-correction γ^D",
                                     9: "EW vev γ^{D²}"},
        "expected":                 [D, D * D],
        "matches":                  hits == [D, D * D],
    }


# ── 9. Digital-root closure ──────────────────────────────────────────────


def digital_root_closure() -> Dict[str, Any]:
    """Every power of {3, 6, 9} of degree ≥ 2 has digital root 9 = D².

    This is a consequence of 3·3 ≡ 0 (mod 9), but in the framework's
    self-referential setting the digital root collapsing to 9 = D²
    is structurally intrinsic — γ = 1/9² makes 9 the framework's
    natural mod base.
    """
    out = {}
    for base in (3, 6, 9):
        out[f"base_{base}"] = [_digital_root(base ** k) for k in range(1, 8)]
    # The structural claim
    out["claim"] = "digital_root(base^k) = 9 for all k ≥ 2"
    out["holds"] = all(
        _digital_root(base ** k) == 9
        for base in (3, 6, 9) for k in range(2, 8)
    )
    return out


# ── 10. AP-uniqueness theorem (T_D = D! ⟺ D ∈ {1, 3}) ───────────────────


def ap_uniqueness_table(max_D: int = 8) -> List[Dict[str, Any]]:
    """Table of {d, d!, d²} for d = 1..max_D with AP-status."""
    rows = []
    for d in range(1, max_D + 1):
        triple = (d, factorial(d), d * d)
        diffs = (triple[1] - triple[0], triple[2] - triple[1])
        is_ap = diffs[0] == diffs[1]
        rows.append({
            "D":         d,
            "triple":    triple,
            "diffs":     diffs,
            "T_D":       _T(d),
            "Dfact":     factorial(d),
            "is_AP":     is_ap,
            "T_eq_fact": _T(d) == factorial(d),
        })
    return rows


def ap_uniqueness_holds() -> bool:
    """T_D = D! holds only at D ∈ {1, 3} (within D = 1..8)."""
    rows = ap_uniqueness_table(8)
    where = [r["D"] for r in rows if r["T_eq_fact"]]
    return where == [1, 3]


# ── Aggregate audit ──────────────────────────────────────────────────────


def all_tesla_369_identities() -> Dict[str, Any]:
    """Every identity in this module in one structured dict."""
    return {
        "triplet":         tesla_triplet_cathedral(),
        "pairwise":        pairwise_compounds(),
        "higher_powers":   higher_power_sums(),
        "bilinear":        bilinear_compounds(),
        "triangular":      triangular_extension(),
        "pentagonal":      pentagonal_extension(),
        "d_power_tower":   d_power_tower(),
        "spectral":        spectral_reading(),
        "gamma_ladder":    gamma_ladder_intersection(),
        "digital_root":    digital_root_closure(),
        "ap_uniqueness":   {
            "rows":   ap_uniqueness_table(8),
            "holds":  ap_uniqueness_holds(),
        },
        "headline":        {
            "name":      "n_s as a Tesla bilinear",
            "formula":   "n_s = 1 − 2 / (D + D!·D²) = 1 − 2/(3 + 6·9) = 1 − 2/57",
            "value":     float(n_s_from_tesla_bilinear()),
            "expected":  0.9649122807017544,
        },
    }


def tesla_369_audit_passes() -> bool:
    """Every Cathedral identity catalogued in this module holds."""
    # 1. Triplet
    if not all(v[2] for v in tesla_triplet_cathedral().values()):
        return False
    # 2. Pairwise compounds
    if not all(v[2] for v in pairwise_compounds().values()):
        return False
    # 3. Higher powers
    if not all(v[2] for v in higher_power_sums().values()):
        return False
    # 4. Bilinear compounds
    if not all(v[2] for v in bilinear_compounds().values()):
        return False
    # 5. Figurate extensions
    if not all(v[2] for v in triangular_extension().values()):
        return False
    if not all(v[2] for v in pentagonal_extension().values()):
        return False
    # 6. D-power tower
    if not d_power_tower()["matches"]:
        return False
    # 7. Spectral reading
    sp = spectral_reading()
    if not (sp["three_is_Fiedler_eigenvalue"]
            and sp["six_is_mult_of_q"]
            and sp["nine_is_rank_1_eigenvalue"]):
        return False
    # 8. γ-ladder intersection
    if not gamma_ladder_intersection()["matches"]:
        return False
    # 9. Digital-root closure
    if not digital_root_closure()["holds"]:
        return False
    # 10. AP uniqueness
    if not ap_uniqueness_holds():
        return False
    # 11. n_s headline check
    if n_s_from_tesla_bilinear() != Fraction(55, 57):
        return False
    return True


def print_tesla_369_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" TESLA 3-6-9 IN CATHEDRAL FORM")
    print(bar)

    print("\n[1] Triplet as Cathedral compounds")
    for k, (val, form, holds) in tesla_triplet_cathedral().items():
        print(f"     {k:18s}  = {val:>4}   ({form})   {holds}")

    print("\n[2] Pairwise compounds")
    for k, (val, target, holds) in pairwise_compounds().items():
        print(f"     {k:18s}  = {val:>5}   target = {target:>5}   {holds}")

    print("\n[3] Higher-power sums")
    for k, (val, target, holds) in higher_power_sums().items():
        print(f"     {k:18s}  = {val:>5}   target = {target:>5}   {holds}")

    print("\n[4] Bilinear Tesla compounds  (the genuinely new ones)")
    for k, (val, target, holds, meaning) in bilinear_compounds().items():
        print(f"     {k:30s}  = {val:>4}  ↔  {target:>4}   {holds}")
        print(f"        ↳ {meaning}")

    print("\n[5] Triangular extension")
    for k, (val, target, holds) in triangular_extension().items():
        print(f"     {k:22s}  = {val:>5}   target = {target:>5}   {holds}")

    print("\n[6] Pentagonal extension")
    for k, (val, target, holds) in pentagonal_extension().items():
        print(f"     {k:22s}  = {val:>5}   target = {target:>5}   {holds}")

    print("\n[7] D-power tower {3, 9, 27, 81}")
    pt = d_power_tower()
    print(f"     {{D¹,D²,D³,D⁴}} = {pt['tower']}   "
          f"matches {{D, D², D^D, 1/γ}}: {pt['matches']}")

    print("\n[8] Spectral reading on L_{G_13}")
    sp = spectral_reading()
    print(f"     spec = {sp['spectrum']}")
    print(f"     3 = Fiedler eigenvalue ......... {sp['three_is_Fiedler_eigenvalue']}")
    print(f"     6 = mult(λ = q) ................ {sp['six_is_mult_of_q']}")
    print(f"     9 = rank-1 eigenvalue .......... {sp['nine_is_rank_1_eigenvalue']}")

    print("\n[9] γ-ladder intersection")
    gl = gamma_ladder_intersection()
    print(f"     γ-ladder exponents = {gl['gamma_ladder_exponents']}")
    print(f"     intersection with {{3,6,9}} = {gl['intersection_with_trio']}   "
          f"matches {{D, D²}}: {gl['matches']}")

    print("\n[10] AP uniqueness   ({D, D!, D²} is AP ⟺ T_D = D!)")
    for r in ap_uniqueness_table(6):
        flag = "AP" if r["is_AP"] else "  "
        print(f"      D={r['D']}: {{{r['triple'][0]:>3},{r['triple'][1]:>4},"
              f"{r['triple'][2]:>4}}}  diffs={r['diffs']}  T_D=D!: "
              f"{r['T_eq_fact']}  {flag}")
    print(f"      ⟹ unique non-trivial AP at D = 3.   holds = {ap_uniqueness_holds()}")

    print("\n[★] HEADLINE — n_s as a Tesla bilinear")
    ns = n_s_from_tesla_bilinear()
    print(f"     N_e_efolds  = G − D = 3 + 6·9 = {3 + 6 * 9}")
    print(f"     n_s         = 1 − 2/(3 + 6·9) = {ns} ≈ {float(ns):.7f}")
    print(f"     Planck 2018 ≈ 0.9649")

    print()
    print(bar)
    print(f" tesla_369_audit_passes() = {tesla_369_audit_passes()}")
    print(bar)


__all__ = [
    # Constants
    "GAMMA",
    "TESLA_3", "TESLA_6", "TESLA_9",
    # Identity blocks
    "tesla_triplet_cathedral",
    "pairwise_compounds",
    "higher_power_sums",
    "bilinear_compounds",
    "triangular_extension",
    "pentagonal_extension",
    "d_power_tower",
    "spectral_reading",
    "gamma_ladder_intersection",
    "digital_root_closure",
    "ap_uniqueness_table",
    "ap_uniqueness_holds",
    "n_s_from_tesla_bilinear",
    # Audit
    "all_tesla_369_identities",
    "tesla_369_audit_passes",
    "print_tesla_369_report",
]
