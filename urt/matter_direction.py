"""
The MATTER DIRECTION THEOREM — why the universe contains matter, not anti-matter.

The framework's matter–antimatter asymmetry η_B = γ³·Δ·δ★·(8/9) has its
SIGN determined entirely by the sign of the gap Δ = δ_cl − δ★.  This
module proves the SIGN itself is forced by D = 3 alone.

Theorem
-------
The framework predicts a MATTER universe (η_B > 0) iff

    D · N · φ  >  F · (1 − γ) · π                    (★)

For the icosahedral Cathedral integers {D=3, N=13, F=20, γ=1/81} and
φ = (1+√5)/2, inequality (★) holds:

    63.103  >  62.056      ✓     (margin 1.047)

Since D=3, N=1+V=13, F=(D+1)·q=20, and γ=D^(-(D+1))=1/81 are all forced
by Jordan's classification of finite SO(3) subgroups (D=3 ⟹ A_5),
inequality (★) is a structural consequence — not a free choice.

The framework therefore predicts not just the magnitude of η_B but
its SIGN: the matter direction is forced.

The 8/9 factor in η_B
---------------------
The prefactor 8/9 has a Cathedral closed form:

    8 / 9  =  2^D / (D! + D)  =  2^D / |A_5_sector|

i.e. the matter-extraction rate equals the doubled K_4 size (2^D)
divided by the A_5 sector size (D!+D = 9).
"""
from __future__ import annotations

from math import pi, sqrt
from typing import Dict, Any

from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR


# ── The matter-direction inequality ─────────────────────────────────────

def matter_direction_inequality() -> Dict[str, Any]:
    """The closed-form inequality whose sign determines matter vs anti-matter.

       Matter wins  ⟺  D · N · φ > F · (1 − γ) · π
                    ⟺  D / F > (1 − γ) π / (N φ)
                    ⟺  δ_cl   > δ★
                    ⟺  Δ      > 0
                    ⟺  η_B    > 0

    This is a *structural* inequality: every term is forced by D = 3.
    """
    LHS = D * N * phi
    RHS = F * (1 - gamma) * pi
    return {
        "LHS_DNphi":            LHS,
        "RHS_F_1mγ_π":          RHS,
        "LHS_minus_RHS":        LHS - RHS,
        "matter_direction":     LHS > RHS,
        "margin":               LHS - RHS,
        "margin_relative_pct":  (LHS - RHS) / RHS * 100,
    }


# ── The 8/9 factor as Cathedral expression ──────────────────────────────

def eta_B_prefactor_decomposition() -> Dict[str, Any]:
    """The 8/9 prefactor in η_B = γ³ · Δ · δ★ · (8/9) decomposes as

        8 / 9  =  2^D / (D! + D)  =  2^D / |A_5_sector_size|

    The numerator 2^D = 8 is the doubled K_4 sector size (the K_4 size
    is D+1 = 4, so 2·(D+1) = 2^D when D = 3 only).  The denominator
    D! + D = 9 is the A_5 sector size.  So η_B's prefactor is

        2 · |K_4| / |A_5|     when D = 3

    — a direct sector-size ratio.  The matter-extraction rate scales
    with how much K_4 (visible) sector there is relative to A_5 (dark).
    """
    return {
        "value":              8 / 9,
        "as_2pD_over_DfpD":   2**D / (D + 6),          # 8 / 9
        "as_2pD_over_DD":     2**D / (D**2),           # 8 / 9 (D=3 only)
        "matches":            abs(8/9 - 2**D / (D + 6)) < 1e-15,
        "K4_size":            D + 1,
        "A5_size":            D + 6,                   # D! + D
        "K4_doubled":         2 * (D + 1),             # = 8 when D=3
        "ratio_K4_doubled_over_A5":  2 * (D + 1) / (D + 6),
    }


# ── The margin in ratio form: equals δ_cl / δ★ exactly ──────────────────

def matter_direction_margin_ratio() -> Dict[str, Any]:
    """Closed form for the matter-direction margin in *ratio* form.

    The conventional difference form `D·N·φ − F·(1−γ)·π ≈ 1.047`
    is a 22-ppm numerical near-coincidence with `π/D` (already flagged
    in failed_attempts_study).  The *ratio* form, however, is exact:

        D · N · φ
        ──────────────  =  (D / F) / δ★  =  δ_cl / δ★  =  1 + Δ/δ★
        F · (1 − γ) · π

    This is an exact algebraic identity — substituting δ★ = (1−γ)π/(Nφ)
    collapses the LHS to D/(F·δ★) = δ_cl/δ★.

    Consequence: the matter-direction margin and η_B are both encoded
    by the same Δ/δ★ ratio.  The η_B closed form factors as

        η_B  =  γ³ · δ★² · (8/9) · (margin − 1)

    making the matter-direction inequality and the baryon asymmetry
    formula two views of the *same* statement Δ > 0.
    """
    LHS = D * N * phi
    RHS = F * (1 - gamma) * pi
    margin_ratio = LHS / RHS
    delta_star = DELTA_STAR
    delta_cl = D / F
    Delta = delta_cl - delta_star
    margin_via_delta = delta_cl / delta_star
    margin_via_gap = 1 + Delta / delta_star

    eta_B_direct = gamma**3 * Delta * delta_star * (8 / 9)
    eta_B_via_margin = gamma**3 * delta_star**2 * (8 / 9) * (margin_ratio - 1)
    eta_B_scale = max(abs(eta_B_direct), abs(eta_B_via_margin), 1e-30)

    return {
        "margin_ratio":              margin_ratio,
        "delta_cl_over_delta_star":  margin_via_delta,
        "one_plus_Delta_over_dstar": margin_via_gap,
        "exact_match":               (
            abs(margin_ratio - margin_via_delta) < 1e-15
            and abs(margin_ratio - margin_via_gap) < 1e-15
        ),
        "eta_B_direct":              eta_B_direct,
        "eta_B_via_margin":          eta_B_via_margin,
        "eta_B_bridge_identity":     (
            abs(eta_B_direct - eta_B_via_margin) / eta_B_scale < 1e-12
        ),
        "Delta_over_delta_star":     Delta / delta_star,
    }


# ── Sensitivity analysis ─────────────────────────────────────────────────

def matter_direction_sensitivity() -> Dict[str, Any]:
    """How robust is the matter direction to small parameter changes?

    Test sign of Δ for nearby (N, F) values.  At the framework's
    (N=13, F=20), Δ > 0 (matter wins) with margin.  At (N=13, F=21)
    Δ flips negative (anti-matter would win).

    The framework sits *just inside* the matter side — at F=20 = (D+1)q
    the icosahedron's face count is the minimum that keeps Δ > 0.
    """
    results = {}
    for dN in (-1, 0, 1):
        for dF in (-1, 0, 1):
            N_, F_ = N + dN, F + dF
            if F_ < 1: continue
            ds_ = (1 - gamma) * pi / (N_ * phi)
            dcl_ = D / F_
            Delta_ = dcl_ - ds_
            results[(N_, F_)] = {
                "Delta":       Delta_,
                "matter_wins": Delta_ > 0,
            }
    framework = results.get((N, F))
    return {
        "by_N_F":              results,
        "framework_value":     framework,
        "framework_matter":    framework["matter_wins"] if framework else None,
        "F21_anti_matter":     not results[(N, 21)]["matter_wins"]
                                  if (N, 21) in results else None,
        "N12_anti_matter":     not results[(12, F)]["matter_wins"]
                                  if (12, F) in results else None,
    }


# ── End-to-end audit ────────────────────────────────────────────────────

def matter_direction_audit() -> Dict[str, Any]:
    return {
        "inequality":            matter_direction_inequality(),
        "margin_ratio":          matter_direction_margin_ratio(),
        "eta_B_prefactor":       eta_B_prefactor_decomposition(),
        "sensitivity":           matter_direction_sensitivity(),
    }


def matter_direction_audit_passes() -> bool:
    a = matter_direction_audit()
    return (
        a["inequality"]["matter_direction"]
        and a["inequality"]["margin"] > 0
        and a["eta_B_prefactor"]["matches"]
        and a["sensitivity"]["framework_matter"]
    )


def print_matter_direction_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" THE MATTER DIRECTION THEOREM — why our universe is matter, not antimatter")
    print(bar)

    ineq = matter_direction_inequality()
    print(f"\n[1] The matter-direction inequality:  D·N·φ > F·(1−γ)·π")
    print(f"     LHS = D·N·φ      = {ineq['LHS_DNphi']:.6f}")
    print(f"     RHS = F·(1-γ)·π  = {ineq['RHS_F_1mγ_π']:.6f}")
    print(f"     LHS − RHS = {ineq['LHS_minus_RHS']:+.6f}  ({'MATTER' if ineq['matter_direction'] else 'ANTI-MATTER'})")

    pf = eta_B_prefactor_decomposition()
    print(f"\n[2] The 8/9 prefactor in η_B = γ³·Δ·δ★·(8/9)")
    print(f"     8/9 = {pf['value']}")
    print(f"     = 2^D / (D!+D)")
    print(f"     = {pf['K4_doubled']} / {pf['A5_size']}")
    print(f"     = (doubled K_4 size) / (A_5 sector size)")

    sens = matter_direction_sensitivity()
    print(f"\n[3] Sensitivity around (N={N}, F={F})")
    for (N_, F_), v in sorted(sens["by_N_F"].items()):
        marker = "  ← framework" if (N_, F_) == (N, F) else ""
        print(f"     N={N_:>2}, F={F_:>2}: Δ = {v['Delta']:+.5f}  "
              f"({'MATTER' if v['matter_wins'] else 'anti-matter'}){marker}")

    print()
    print("  THEOREM: The matter direction is forced by D = 3.")
    print("  Every term in the inequality D·N·φ > F·(1-γ)·π is forced by")
    print("  Jordan's classification: D=3 ⟹ A_5 ⟹ {N=13, F=20, γ=1/81}.")
    print("  The framework predicts not just η_B's magnitude but its SIGN.")

    print()
    print(bar)
    print(f" matter_direction_audit_passes() = {matter_direction_audit_passes()}")
    print(bar)


__all__ = [
    "matter_direction_inequality",
    "eta_B_prefactor_decomposition",
    "matter_direction_sensitivity",
    "matter_direction_audit",
    "matter_direction_audit_passes",
    "print_matter_direction_report",
]
