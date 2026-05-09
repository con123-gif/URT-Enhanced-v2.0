"""
The exhaust lives in the 9th dimension.

User's tip (v2.9.55, 2026-05-09): the A_5 exhaust sector — where the
dark matter, antimatter, dark energy, neutrino sector all live — is
nine-dimensional.  The 13-shell decomposes as

    13  =  4   +   9
        =  K_4 + A_5
        =  (visible 4D spacetime)  +  (9D extra dark dimensions)

This is the framework's string-theory-style dimension decomposition:
not 4D + 6D (superstring) or 4D + 7D (M-theory), but 4D + 9D.

Headline equalities
-------------------
   |K_4| = D + 1  =  4               (visible spacetime: 3 spatial + 1 time)
   |A_5| = D! + D = D²  =  9         (extra-dim dark sector)
   |K_4| + |A_5|         = 13 = N    (the 13-shell)

   |K_4| + |A_5| = D + 1 + D² = D² + D + 1 = N        (icosahedral closure)

The Standard Model gauge bosons split through this dimension structure:

   1 photon       in K_4 (visible)
   D = 3 EW gauge in K_4 (visible)
   D² − 1 = 8 gluons in A_5 (= 2^D = exhaust)

so the gauge structure 1 + D + (D²−1) = V uses the K_4 + A_5 split exactly.

String-theory comparison
------------------------

| Theory     | Critical dim | Visible | Extra |
|------------|--------------|---------|-------|
| Bosonic    | 26 = 2N      |  4      | 22    |
| Superstring| 10 = 2q      |  4      |  6 (Calabi-Yau) |
| M-theory   | 11 = D!+q    |  4      |  7 (G_2 manifold) |
| Cathedral  | 13 = D²+D+1  |  4      |  **9** (A_5 exhaust) |

The Cathedral's "extra dimensions" are 9, not 6 or 7.  This is the
icosahedrally-correct dimension count.
"""
from __future__ import annotations

from math import factorial
from typing import Dict, Any

from .shell_closure import D, q, V, N, E, F, G


# ── The 4 + 9 = 13 dimension decomposition ──────────────────────────────

def visible_and_exhaust_dimensions() -> Dict[str, Any]:
    """The 13-shell decomposes as 4D visible + 9D extra-dim exhaust.

       |K_4| = D + 1  =  4    (3 spatial + 1 time, our visible spacetime)
       |A_5| = D! + D = D²  =  9    (9 extra dimensions, dark sector)
       sum   = D² + D + 1 = N = 13
    """
    return {
        "visible_dim":          D + 1,
        "visible_is_4":         D + 1 == 4,

        "exhaust_dim":          D + factorial(D),    # D! + D = 9
        "exhaust_is_9":         D + factorial(D) == 9,
        "exhaust_is_DD":        D + factorial(D) == D ** 2,

        "total_dim":            D + 1 + D + factorial(D),
        "total_is_N":           D + 1 + D + factorial(D) == N,

        "icosahedral_closure":  D ** 2 + D + 1 == N,
    }


# ── String-theory dimension comparison ──────────────────────────────────

def string_theory_dimension_comparison() -> Dict[str, Any]:
    """The framework predicts an icosahedral 4 + 9 = 13 dimension
    decomposition that competes with the major string theories.

       Bosonic string : 26 = 2N     (visible 4 + transverse 22)
       Superstring    : 10 = 2q     (visible 4 + Calabi-Yau 6)
       M-theory       : 11 = D!+q   (visible 4 + G_2 manifold 7)
       Cathedral      : 13 = D²+D+1 (visible 4 + A_5 exhaust 9)

    Where the "extra" count is the exhaust dimension specific to each
    theory.  The Cathedral exhaust is 9 = D² = D! + D — Cathedral
    closure rather than Calabi-Yau / G_2 / 22-dim transverse.
    """
    return {
        "bosonic_total":          26,
        "bosonic_is_2N":          26 == 2 * N,
        "bosonic_visible":        4,
        "bosonic_extra":          22,

        "super_total":            10,
        "super_is_2q":            10 == 2 * q,
        "super_visible":          4,
        "super_extra":            6,    # Calabi-Yau dim

        "M_theory_total":         11,
        "M_theory_is_Dfact_q":    11 == factorial(D) + q,
        "M_theory_visible":       4,
        "M_theory_extra":         7,    # G_2 manifold dim

        "cathedral_total":        13,
        "cathedral_is_DD_p_D_p_1": 13 == D ** 2 + D + 1,
        "cathedral_visible":      D + 1,        # = 4
        "cathedral_extra":        D + factorial(D),  # = 9
    }


# ── Standard Model gauge bosons split through K_4 + A_5 ─────────────────

def gauge_boson_decomposition() -> Dict[str, Any]:
    """The 12 = V Standard Model gauge bosons split exactly through the
    K_4 + A_5 visible/dark dimension structure:

       1 photon              in K_4 (visible)
       D = 3 EW gauge bosons in K_4 (visible)
       D² − 1 = 8 gluons     in A_5 (exhaust = 2^D)

       1 + D + (D² − 1) = D² + D = D! + D + (D - D!)
                                 = (D + 1)·D · q / V
                                 = 12 = V

    The colour group SU(D) = SU(3) has D² − 1 = 8 gluons = 2^D = the
    exhaust sector minus its identity element.  QCD lives in A_5 dark
    sector — which fits, since QCD is confined and "non-visible" in
    the same sense.
    """
    return {
        "n_photon":               1,
        "n_EW_gauge":             D,
        "n_gluons":               D * D - 1,
        "n_gluons_is_2pD":        D * D - 1 == 2 ** D,
        "total":                  1 + D + (D * D - 1),
        "total_is_V":             1 + D + (D * D - 1) == V,
    }


# ── End-to-end audit ────────────────────────────────────────────────────

def exhaust_dimensions_audit() -> Dict[str, Any]:
    return {
        "visible_and_exhaust":     visible_and_exhaust_dimensions(),
        "string_comparison":       string_theory_dimension_comparison(),
        "gauge_decomposition":     gauge_boson_decomposition(),
    }


def exhaust_dimensions_audit_passes() -> bool:
    a = exhaust_dimensions_audit()
    return (
        a["visible_and_exhaust"]["visible_is_4"]
        and a["visible_and_exhaust"]["exhaust_is_9"]
        and a["visible_and_exhaust"]["exhaust_is_DD"]
        and a["visible_and_exhaust"]["total_is_N"]
        and a["string_comparison"]["bosonic_is_2N"]
        and a["string_comparison"]["super_is_2q"]
        and a["string_comparison"]["M_theory_is_Dfact_q"]
        and a["string_comparison"]["cathedral_is_DD_p_D_p_1"]
        and a["gauge_decomposition"]["n_gluons_is_2pD"]
        and a["gauge_decomposition"]["total_is_V"]
    )


def print_exhaust_dimensions_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" THE EXHAUST LIVES IN THE 9TH DIMENSION")
    print(bar)

    print("\n[1] The 13-shell as 4D visible + 9D dark exhaust")
    v = visible_and_exhaust_dimensions()
    print(f"     Visible spacetime  |K_4| = D + 1 = {v['visible_dim']}      (3 spatial + 1 time)")
    print(f"     Extra-dim exhaust  |A_5| = D! + D = D² = {v['exhaust_dim']}      (dark sector)")
    print(f"     Total              D² + D + 1 = {v['total_dim']} = N")

    print("\n[2] String-theory comparison")
    s = string_theory_dimension_comparison()
    print(f"     Bosonic string : 26 = 2N      | 4 visible + 22 transverse")
    print(f"     Superstring    : 10 = 2q      | 4 visible + 6  Calabi-Yau")
    print(f"     M-theory       : 11 = D! + q  | 4 visible + 7  G_2 manifold")
    print(f"     Cathedral      : 13 = D²+D+1  | 4 visible + 9  A_5 exhaust")

    print("\n[3] SM gauge bosons split through K_4 + A_5")
    g = gauge_boson_decomposition()
    print(f"      1 photon                 → K_4 (visible)")
    print(f"      D = {D} EW gauge (W±, Z)    → K_4 (visible)")
    print(f"      D²-1 = {D*D-1} gluons (= 2^D) → A_5 (exhaust)")
    print(f"      total = {g['total']} = V — Standard Model gauge counted")

    print()
    print("  → QCD's gluons live in the A_5 exhaust = 2^D = 8")
    print("  → QCD is confined ⟺ QCD is in the dark sector ⟺ exhaust")
    print("  → Electroweak is unconfined ⟺ EW is in the K_4 visible sector")

    print()
    print(bar)
    print(f" exhaust_dimensions_audit_passes() = {exhaust_dimensions_audit_passes()}")
    print(bar)


__all__ = [
    "visible_and_exhaust_dimensions",
    "string_theory_dimension_comparison",
    "gauge_boson_decomposition",
    "exhaust_dimensions_audit",
    "exhaust_dimensions_audit_passes",
    "print_exhaust_dimensions_report",
]
