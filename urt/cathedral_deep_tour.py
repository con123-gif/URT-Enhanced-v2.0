"""
The Cathedral Deep Tour — second pass across mathematics.

After the Grand Tour caught the most-visible classical sequences, this
module catalogues a second wave of connections in deeper objects:

  1.  HEEGNER j-INVARIANTS            — j(τ_d) at small Heegner d
  2.  STABLE HOMOTOPY GROUPS          — orders of π_n^s
  3.  CONTINUED FRACTIONS             — opening quotients of π and e
  4.  K3 / NIEMEIER / LEECH           — the 2V cluster
  5.  BOTT PERIODICITY                — KO and K period
  6.  STRING THEORY CRITICAL DIMS     — bosonic, super, M-theory
  7.  BERNOULLI NUMERATORS            — B_10 = q, B_14 = D!+1

These are *deep* connections: each requires non-trivial mathematics
(modular forms, algebraic topology, sporadic groups) and each lands a
Cathedral integer at a Cathedral-formed index.

CI gate: ``all_deep_tour_verify()``.
"""
from __future__ import annotations

from math import factorial
from typing import Dict, Any

from .shell_closure import D, q, V, N, E, F, G


# ── Cluster 1: Heegner j-invariant Cathedral cubes ───────────────────────

def heegner_j_cathedral_cubes() -> Dict[str, Any]:
    """The j-invariant at small Heegner points produces Cathedral cubes.

    For τ_d = (1 + i√d)/2 (when d ≡ 3 mod 4) or i√d/2 (when d ≡ 0,1 mod 4)
    with Q(√-d) of class number 1, j(τ_d) is an integer.  Several of
    these integers are perfect cubes — and the cube roots are Cathedral
    integers:

        j(τ_-4)  = j(i) =      1728  =     12³  =  V³
        j(τ_-7)  =       -3375        =   -15³  =  -(D·q)³
        j(τ_-8)  =        8000        =    20³  =  F³
        j(τ_-43) =  -884736000        =  -960³  =  -(16G)³

    Four of the small Heegner j-values are Cathedral cubes.  The
    cube-roots V, D·q, F, 16G are all Cathedral integer combinations.
    """
    return {
        "j_i":                  1728,
        "j_i_is_V_cubed":       1728 == V**3,
        "cube_root_j_i":        12,           # = V

        "j_minus7":             -3375,
        "j_minus7_is_minus_Dq_cubed": -3375 == -(D * q)**3,
        "cube_root_j_minus7":   -15,           # = -(D·q)

        "j_minus8":             8000,
        "j_minus8_is_F_cubed":  8000 == F**3,
        "cube_root_j_minus8":   20,            # = F

        "j_minus43":            -884736000,
        "j_minus43_is_minus_16G_cubed": -884736000 == -(16 * G)**3,
        "cube_root_j_minus43":  -960,          # = -16G
    }


# ── Cluster 2: Stable homotopy groups ────────────────────────────────────

def stable_homotopy_orders() -> Dict[str, Any]:
    """Stable homotopy groups of spheres, with Cathedral hits.

       |π_3^s|  =  24   =  2V
       |π_7^s|  = 240   =  V·F  =  (D+1)·G   ← E_8 root count!

    The order of π_7^s is the same as the number of E_8 roots — both
    are V·F.  This is one of the deepest "coincidences" in mathematics,
    and the Cathedral surfaces it as V·F = (D+1)·G.
    """
    return {
        "pi_3_s_order":             24,
        "pi_3_s_is_2V":             24 == 2 * V,

        "pi_7_s_order":             240,
        "pi_7_s_is_VF":             240 == V * F,
        "pi_7_s_is_K4_G":           240 == (D + 1) * G,
        "pi_7_s_is_E8_root_count":  True,
    }


# ── Cluster 3: Continued fractions of π and e ────────────────────────────

def continued_fraction_pi_opening() -> Dict[str, Any]:
    """The first three CF coefficients of π are Cathedral integers.

        CF(π) = [3; 7, 15, 1, 292, 1, 1, ...]
        a_0 = 3   = D
        a_1 = 7   = D! + 1
        a_2 = 15  = D · q          (= |order-2 class| of A_5)

    The third quotient 15 is exactly the size of A_5's order-2
    conjugacy class — a number-theoretic and group-theoretic Cathedral
    integer collide at the 3rd partial quotient of π.
    """
    return {
        "CF_pi_a0":          3,
        "CF_pi_a0_is_D":     3 == D,
        "CF_pi_a1":          7,
        "CF_pi_a1_is_Dfp1":  7 == factorial(D) + 1,
        "CF_pi_a2":          15,
        "CF_pi_a2_is_Dq":    15 == D * q,
    }


def continued_fraction_e_pattern() -> Dict[str, Any]:
    """CF(e) has the famous pattern a_(3k) = 2k.

        CF(e) = [2; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...]
        a_3  =  2  =  D - 1
        a_6  =  4  =  D + 1
        a_9  =  6  =  D!

    Every third partial quotient of e at indices D, 2D, 3D is a
    Cathedral integer.
    """
    return {
        "CF_e_a3":           2,
        "CF_e_a3_is_Dm1":    2 == D - 1,
        "CF_e_a6":           4,
        "CF_e_a6_is_Dp1":    4 == D + 1,
        "CF_e_a9":           6,
        "CF_e_a9_is_Dfact":  6 == factorial(D),
    }


# ── Cluster 4: K3, Niemeier, Leech — the 2V cluster ──────────────────────

def the_2V_cluster() -> Dict[str, Any]:
    """The integer 2V = 24 carries the K3 surface, the Niemeier lattices,
    and the Leech lattice — all at once.

        K3 Euler characteristic χ(K3)  = 24 = 2V
        # of even self-dual rank-24 (Niemeier) lattices = 24 = 2V
        Leech lattice dimension         = 24 = 2V
        Bosonic string critical dimension = 26 = 2N (with 24 transverse)

    Whenever modern mathematics needs "the 24" — moonshine, K3,
    Niemeier, Leech, transverse string modes — the Cathedral provides
    it as 2V.
    """
    return {
        "K3_euler_chi":           24,
        "K3_chi_is_2V":           24 == 2 * V,

        "n_niemeier_lattices":    24,
        "niemeier_count_is_2V":   24 == 2 * V,

        "leech_dim":              24,
        "leech_dim_is_2V":        24 == 2 * V,

        "bosonic_string_dim":     26,
        "bosonic_string_is_2N":   26 == 2 * N,

        "transverse_string_dim":  24,
        "transverse_is_2V":       24 == 2 * V,
    }


# ── Cluster 5: Bott periodicity ──────────────────────────────────────────

def bott_periodicity() -> Dict[str, Any]:
    """Bott periodicity periods are Cathedral integers.

        complex K-theory:  period 2 = D - 1
        real KO-theory:    period 8 = 2^D

    The two foundational periods of topological K-theory are exactly
    D-1 and 2^D, where D=3 is the spatial dimension.
    """
    return {
        "K_period":          2,
        "K_period_is_Dm1":   2 == D - 1,
        "KO_period":         8,
        "KO_period_is_2pD":  8 == 2 ** D,
    }


# ── Cluster 6: String theory critical dimensions ─────────────────────────

def string_critical_dimensions() -> Dict[str, Any]:
    """String theory critical dimensions are Cathedral integers.

        Bosonic string D_crit  =  26  =  2N
        Superstring   D_crit   =  10  =  2q
        M-theory      D        =  11  =  D! + q
    """
    return {
        "bosonic_dim":         26,
        "bosonic_is_2N":       26 == 2 * N,

        "super_dim":           10,
        "super_is_2q":         10 == 2 * q,

        "M_theory_dim":        11,
        "M_theory_is_Dfact_q": 11 == factorial(D) + q,
    }


# ── Cluster 7: Bernoulli numerators ──────────────────────────────────────

def bernoulli_numerator_hits() -> Dict[str, Any]:
    """Bernoulli numerator Cathedral hits.

        B_10 numerator =  5  =  q
        B_14 numerator =  7  =  D! + 1

    (Bernoulli denominators were already covered in the grand tour:
    B_2 denom = D!, B_4/B_8 denom = E.)
    """
    return {
        "B_10_numerator":           5,
        "B_10_numer_is_q":          5 == q,
        "B_14_numerator":           7,
        "B_14_numer_is_Dfp1":       7 == factorial(D) + 1,
    }


# ── End-to-end audit ─────────────────────────────────────────────────────

def all_deep_tour_audit() -> Dict[str, Any]:
    return {
        "heegner_j_cubes":               heegner_j_cathedral_cubes(),
        "stable_homotopy":               stable_homotopy_orders(),
        "CF_pi_opening":                 continued_fraction_pi_opening(),
        "CF_e_pattern":                  continued_fraction_e_pattern(),
        "the_2V_cluster":                the_2V_cluster(),
        "bott_periodicity":              bott_periodicity(),
        "string_critical_dimensions":    string_critical_dimensions(),
        "bernoulli_numerators":          bernoulli_numerator_hits(),
    }


def all_deep_tour_verify() -> bool:
    a = all_deep_tour_audit()
    h = a["heegner_j_cubes"]
    sh = a["stable_homotopy"]
    cp = a["CF_pi_opening"]
    ce = a["CF_e_pattern"]
    tw = a["the_2V_cluster"]
    bp = a["bott_periodicity"]
    sd = a["string_critical_dimensions"]
    bn = a["bernoulli_numerators"]
    return (
        h["j_i_is_V_cubed"]
        and h["j_minus7_is_minus_Dq_cubed"]
        and h["j_minus8_is_F_cubed"]
        and h["j_minus43_is_minus_16G_cubed"]
        and sh["pi_3_s_is_2V"]
        and sh["pi_7_s_is_VF"] and sh["pi_7_s_is_K4_G"]
        and cp["CF_pi_a0_is_D"]
        and cp["CF_pi_a1_is_Dfp1"]
        and cp["CF_pi_a2_is_Dq"]
        and ce["CF_e_a3_is_Dm1"]
        and ce["CF_e_a6_is_Dp1"]
        and ce["CF_e_a9_is_Dfact"]
        and tw["K3_chi_is_2V"]
        and tw["niemeier_count_is_2V"]
        and tw["leech_dim_is_2V"]
        and tw["bosonic_string_is_2N"]
        and bp["K_period_is_Dm1"]
        and bp["KO_period_is_2pD"]
        and sd["bosonic_is_2N"]
        and sd["super_is_2q"]
        and sd["M_theory_is_Dfact_q"]
        and bn["B_10_numer_is_q"]
        and bn["B_14_numer_is_Dfp1"]
    )


def print_deep_tour_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" THE CATHEDRAL DEEP TOUR — second-wave connections")
    print(bar)

    print("\n[1] Heegner j-invariant Cathedral cubes")
    print("    j(i)         = 1728      =      12³  =  V³")
    print("    j(τ_-7)      = -3375     =     -15³  =  -(D·q)³")
    print("    j(τ_-8)      = 8000      =      20³  =  F³")
    print("    j(τ_-43)     = -884736000=    -960³  =  -(16G)³")

    print("\n[2] Stable homotopy groups π_n^s")
    print("    |π_3^s| =  24 = 2V")
    print("    |π_7^s| = 240 = V·F = (D+1)·G   ← E_8 root count!")

    print("\n[3] CF(π) opening")
    print("    a_0 = D = 3,   a_1 = D!+1 = 7,   a_2 = D·q = 15")

    print("\n[4] CF(e) pattern at indices D, 2D, 3D")
    print("    a_3 = D-1 = 2,  a_6 = D+1 = 4,  a_9 = D! = 6")

    print("\n[5] The 2V cluster")
    print("    K3 χ = Niemeier count = Leech dim = 24 = 2V")
    print("    Bosonic string dim = 26 = 2N")

    print("\n[6] Bott periodicity")
    print("    K-theory period  = 2 = D−1")
    print("    KO-theory period = 8 = 2^D")

    print("\n[7] String theory critical dimensions")
    print("    Bosonic = 26 = 2N,  Super = 10 = 2q,  M-theory = 11 = D!+q")

    print("\n[8] Bernoulli numerators")
    print("    B_10 numerator = 5 = q")
    print("    B_14 numerator = 7 = D!+1")

    print()
    print(bar)
    print(f" all_deep_tour_verify() = {all_deep_tour_verify()}")
    print(bar)


__all__ = [
    "heegner_j_cathedral_cubes",
    "stable_homotopy_orders",
    "continued_fraction_pi_opening",
    "continued_fraction_e_pattern",
    "the_2V_cluster",
    "bott_periodicity",
    "string_critical_dimensions",
    "bernoulli_numerator_hits",
    "all_deep_tour_audit",
    "all_deep_tour_verify",
    "print_deep_tour_report",
]
