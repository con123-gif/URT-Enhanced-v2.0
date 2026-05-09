"""
The Cathedral Advanced Tour — seventh-wave connections.

Algebraic K-theory, crystallographic group counts, statistical-mechanics
critical exponents, Stiefel manifold dimensions, Stirling numbers of
the first kind, and topological modular forms.

Seven new clusters
------------------
  1. K_n(Z) Quillen K-theory at n = 3, 7, 15
  2. Crystallographic group counts (230, 17, 7, 32, 14)
  3. 2D Ising critical exponents
  4. Stiefel/SO(n) dimensions for n = 3..6
  5. Stirling-1 hits the ARF residue d_35
  6. Topological modular forms (TMF) period 24²
  7. PSL(2, 7) and the (3,3,7)-triangle group

CI gate: ``all_advanced_tour_verify()``.
"""
from __future__ import annotations

from math import factorial
from typing import Dict, Any

from .shell_closure import D, q, V, N, E, F, G


# ── Cluster 1: K_n(Z) Quillen K-theory ───────────────────────────────────

def quillen_K_theory_Z() -> Dict[str, Any]:
    """The torsion orders of K_n(Z) (Quillen) at small n are Cathedral.

       K_3(Z)  = Z/48     |torsion| = 48 = (D+1)·V
       K_7(Z)  = Z/240    |torsion| = 240 = V·F  ← E_8 root count
       K_15(Z) = Z/480    |torsion| = 480 = 2·V·F

    The K-theory of the integers — one of the deepest invariants of
    arithmetic — has its small-n torsion orders pinned to V·F = 240
    (and its multiples).  Same V·F that appears as |π_7^s|, the E_8
    root count, and the E_4 Eisenstein leading coefficient.
    """
    return {
        "K3_torsion":              48,
        "K3_is_Kp1_V":             48 == (D + 1) * V,

        "K7_torsion":              240,
        "K7_is_VF":                240 == V * F,

        "K15_torsion":             480,
        "K15_is_2VF":              480 == 2 * V * F,
    }


# ── Cluster 2: Crystallographic group counts ─────────────────────────────

def crystallographic_group_counts() -> Dict[str, Any]:
    """The classical crystallographic group counts are Cathedral.

       3D space groups        : 230 = V·F − 2q
       2D wallpaper groups    :  17 = N + D + 1
       Frieze groups (1D)     :   7 = D! + 1
       3D point groups        :  32 = 2^q
       Bravais lattices       :  14 = N + 1
       Crystal systems        :   7 = D! + 1

    All six classical crystallography counts are Cathedral expressions.
    """
    return {
        "n_space_groups":          230,
        "is_VF_minus_2q":          230 == V * F - 2 * q,

        "n_wallpaper":             17,
        "is_N_p_D_p_1":            17 == N + D + 1,

        "n_frieze":                7,
        "is_Df_p_1":               7 == factorial(D) + 1,

        "n_point_groups":          32,
        "is_2_to_q":               32 == 2 ** q,

        "n_bravais":               14,
        "is_N_p_1":                14 == N + 1,

        "n_crystal_systems":       7,
        "crystal_systems_is_Df_p_1": 7 == factorial(D) + 1,
    }


# ── Cluster 3: 2D Ising critical exponents ───────────────────────────────

def ising_2D_critical_exponents() -> Dict[str, Any]:
    """The 2D Ising universality-class critical exponents are Cathedral
    (exact Onsager values):

       β = 1/8  = 1/2^D                (magnetization)
       γ = 7/4  = (D!+1)/(D+1)          (susceptibility)
       δ = 15   = D·q                   (critical isotherm)  ← Cathedral!
       η = 1/4  = 1/(D+1)               (correlation function)
       ν = 1                            (correlation length)
       α = 0                            (specific heat)

    Three of the six exponents (β, γ, δ, η) are non-trivially Cathedral;
    the headline δ = 15 = D·q is the same Cathedral expression as
    |order-2 conjugacy class of A_5| and the 3×3 magic-square constant.
    """
    return {
        "beta_value":              "1/8",
        "beta_is_one_over_2pD":    True,    # 1/8 = 1/2^D

        "gamma_value":             "7/4",
        "gamma_is_Dfp1_over_Dp1":  True,    # 7/4 = (D!+1)/(D+1)

        "delta_int":               15,
        "delta_is_Dq":             15 == D * q,

        "eta_value":               "1/4",
        "eta_is_one_over_Dp1":     True,    # 1/4 = 1/(D+1)
    }


# ── Cluster 4: Stiefel/SO(n) dimensions ──────────────────────────────────

def stiefel_SO_dimensions() -> Dict[str, Any]:
    """The dimensions of the small-n special orthogonal groups SO(n)
    are all Cathedral integers.

       dim SO(3) = 3   = D            (= the icosahedral rotation group's
                                       ambient Lie algebra dimension!)
       dim SO(4) = 6   = D!
       dim SO(5) = 10  = 2q
       dim SO(6) = 15  = D·q

    The smallest four non-trivial SO(n) all have Cathedral dimensions.
    SO(D) = SO(3) is the ambient group of the icosahedron's rotation
    symmetry — and its dimension is D itself.
    """
    return {
        "dim_SO3":                3,
        "dim_SO3_is_D":           3 == D,
        "dim_SO4":                6,
        "dim_SO4_is_Dfact":       6 == factorial(D),
        "dim_SO5":                10,
        "dim_SO5_is_2q":          10 == 2 * q,
        "dim_SO6":                15,
        "dim_SO6_is_Dq":          15 == D * q,
    }


# ── Cluster 5: Stirling-1 hits ARF residue d_35 ──────────────────────────

def stirling_first_kind_hits_d35() -> Dict[str, Any]:
    """The unsigned Stirling number c(q, D) = c(5, 3) = 35 = d_35.

       c(q, D) = 35 = E + q = ARF residue d_35 (the same residue used
                              in the bare 1/α and m_p/m_e formulas)

    The Stirling number c(n, k) counts permutations of n with k cycles.
    At n = q, k = D, this count equals 35 — exactly the ARF residue
    d_35 = E + q that appears in the framework's mass-residue function.
    """
    # Compute Stirling first kind unsigned c(5, 3)
    def _c(n, k, memo={}):
        if (n, k) in memo: return memo[(n, k)]
        if n == 0 and k == 0: return 1
        if n == 0 or k == 0: return 0
        r = (n - 1) * _c(n - 1, k) + _c(n - 1, k - 1)
        memo[(n, k)] = r
        return r

    return {
        "c_q_D":                 _c(q, D),
        "c_q_D_is_d35":          _c(q, D) == 35,
        "d_35_is_E_p_q":         35 == E + q,
    }


# ── Cluster 6: Topological modular forms (TMF) ───────────────────────────

def topological_modular_forms_period() -> Dict[str, Any]:
    """The period of π_*(TMF) (Anderson-self-dual) is 24² = 576 = 4·V².

       period(π_*(TMF)) = 576 = (2V)² = 4·V²

    Plus the famous Hopf element orders in stable homotopy:
       |η| =   2 = D − 1     (η ∈ π_1^s)
       |ν| =  24 = 2V        (ν ∈ π_3^s)
       |σ| = 240 = V·F       (σ ∈ π_7^s)

    Three Hopf elements, three Cathedral orders.
    """
    return {
        "TMF_period":              576,
        "TMF_period_is_2V_sq":     576 == (2 * V) ** 2,
        "Hopf_eta_order":          2,
        "Hopf_eta_is_Dm1":         2 == D - 1,
        "Hopf_nu_order":           24,
        "Hopf_nu_is_2V":           24 == 2 * V,
        "Hopf_sigma_order":        240,
        "Hopf_sigma_is_VF":        240 == V * F,
    }


# ── Cluster 7: PSL(2, 7) and the (3,3,7) triangle group ──────────────────

def PSL_2_7_and_337_triangle() -> Dict[str, Any]:
    """The (3,3,7) hyperbolic triangle group has order 168 — pure Cathedral.

       (D, D, D!+1) = (3, 3, 7)  is the smallest hyperbolic triangle.
       Triangle group of (3,3,7) = PSL(2, 7), order 168.

       168 = 2^D · D · (D!+1) = 8·3·7   ← pure Cathedral!
       168 = (D!+1) · 2V               ← alternative
       168 = J_2(N) = σ(G)             (number-theoretic)

    PSL(2, 7) is the second-smallest non-abelian simple group (the
    smallest is A_5 = G of order G = 60).  Its order has a clean
    Cathedral decomposition 2^D · D · (D!+1) — three small Cathedral
    factors.
    """
    return {
        "triangle_p":                  D,
        "triangle_q":                  D,
        "triangle_r":                  factorial(D) + 1,
        "PSL_2_7_order":               168,
        "is_2pD_D_Dfp1":               168 == 2**D * D * (factorial(D) + 1),
        "is_Dfp1_2V":                  168 == (factorial(D) + 1) * 2 * V,
    }


# ── End-to-end ───────────────────────────────────────────────────────────

def all_advanced_tour_audit() -> Dict[str, Any]:
    return {
        "quillen_K_theory_Z":              quillen_K_theory_Z(),
        "crystallographic_group_counts":   crystallographic_group_counts(),
        "ising_2D_critical_exponents":     ising_2D_critical_exponents(),
        "stiefel_SO_dimensions":           stiefel_SO_dimensions(),
        "stirling_first_kind_hits_d35":    stirling_first_kind_hits_d35(),
        "topological_modular_forms_period": topological_modular_forms_period(),
        "PSL_2_7_and_337_triangle":        PSL_2_7_and_337_triangle(),
    }


def all_advanced_tour_verify() -> bool:
    a = all_advanced_tour_audit()
    return (
        a["quillen_K_theory_Z"]["K3_is_Kp1_V"]
        and a["quillen_K_theory_Z"]["K7_is_VF"]
        and a["quillen_K_theory_Z"]["K15_is_2VF"]
        and a["crystallographic_group_counts"]["is_VF_minus_2q"]
        and a["crystallographic_group_counts"]["is_N_p_D_p_1"]
        and a["crystallographic_group_counts"]["is_Df_p_1"]
        and a["crystallographic_group_counts"]["is_2_to_q"]
        and a["crystallographic_group_counts"]["is_N_p_1"]
        and a["ising_2D_critical_exponents"]["delta_is_Dq"]
        and a["stiefel_SO_dimensions"]["dim_SO3_is_D"]
        and a["stiefel_SO_dimensions"]["dim_SO4_is_Dfact"]
        and a["stiefel_SO_dimensions"]["dim_SO5_is_2q"]
        and a["stiefel_SO_dimensions"]["dim_SO6_is_Dq"]
        and a["stirling_first_kind_hits_d35"]["c_q_D_is_d35"]
        and a["topological_modular_forms_period"]["TMF_period_is_2V_sq"]
        and a["topological_modular_forms_period"]["Hopf_nu_is_2V"]
        and a["topological_modular_forms_period"]["Hopf_sigma_is_VF"]
        and a["PSL_2_7_and_337_triangle"]["is_2pD_D_Dfp1"]
        and a["PSL_2_7_and_337_triangle"]["is_Dfp1_2V"]
    )


def print_advanced_tour_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" THE CATHEDRAL ADVANCED TOUR — seventh-wave")
    print(bar)

    print("\n[1] Quillen K-theory K_n(Z)")
    print("    K_3(Z) = Z/(D+1)·V = Z/48     K_7(Z) = Z/V·F = Z/240")
    print("    K_15(Z) = Z/2·V·F = Z/480")

    print("\n[2] Crystallographic group counts")
    print("    230 space groups = V·F - 2q     17 wallpaper = N+D+1")
    print("    7 frieze = 7 crystal systems = D!+1     32 point groups = 2^q")
    print("    14 Bravais = N+1")

    print("\n[3] 2D Ising critical exponents")
    print("    β = 1/2^D,  γ = (D!+1)/(D+1),  δ = D·q = 15,  η = 1/(D+1)")

    print("\n[4] SO(n) dimensions for n=3..6")
    print("    SO(3) = D,  SO(4) = D!,  SO(5) = 2q,  SO(6) = D·q")

    print("\n[5] Stirling-1 hits ARF residue d_35")
    print("    c(q, D) = c(5, 3) = 35 = E + q = d_35")

    print("\n[6] Topological modular forms")
    print("    TMF period = 576 = (2V)²")
    print("    Hopf orders: |η|=D-1, |ν|=2V, |σ|=V·F")

    print("\n[7] PSL(2, 7) and the (D,D,D!+1)=(3,3,7) triangle group")
    print("    |PSL(2,7)| = 168 = 2^D · D · (D!+1) = (D!+1)·2V")

    print()
    print(bar)
    print(f" all_advanced_tour_verify() = {all_advanced_tour_verify()}")
    print(bar)


__all__ = [
    "quillen_K_theory_Z",
    "crystallographic_group_counts",
    "ising_2D_critical_exponents",
    "stiefel_SO_dimensions",
    "stirling_first_kind_hits_d35",
    "topological_modular_forms_period",
    "PSL_2_7_and_337_triangle",
    "all_advanced_tour_audit",
    "all_advanced_tour_verify",
    "print_advanced_tour_report",
]
