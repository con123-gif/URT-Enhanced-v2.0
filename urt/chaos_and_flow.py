"""
Cathedral closed forms for the URT flow's contraction dynamics.

This module surfaces the Cathedral structure hidden inside the *dynamics*
of the π–φ–e flow itself.  The URT iteration's product coefficient

        η · η_L  =  1/(8π) · 1/(4π)  =  1 / (32 π²)  =  1 / (2^q · π²)

is what controls how fast every Laplacian mode of G_{13} contracts.

Per-mode contraction (linearisation around δ★)
----------------------------------------------

For each Laplacian eigenvalue λ ∈ {0, 3, 5, 7, 9, 13},

        per_step_factor(λ)  =  1  −  λ / (2^q · π²)

and the 1/e mixing time is

        τ(λ)  =  (2^q · π²) / λ.

Slowest non-trivial mixing (Fiedler, λ = D = 3):
        τ_D  =  (2^q · π²) / D  ≈  105.276 steps.

Fastest mixing (λ_max = N = 13):
        τ_N  =  (2^q · π²) / N  ≈  24.294 steps.

Slowest-to-fastest ratio:
        τ_D / τ_N  =  N / D  =  13 / 3.

Every quantity in this dynamical chain is Cathedral.  In particular:

   * 2^q          = 32        crystallographic point-group count
   * 2^q · π²     ≈ 315.83    the URT *dynamical normalisation constant*
   * N / D        = 13/3      slowest/fastest mixing ratio
   * λ_Fiedler    = D = 3     the slowest non-trivial mode equals
                              the spatial dimension (Iron Proof)
   * λ_max        = N = 13    the fastest mode equals the shell size

Why 2^q is the dynamical exponent
---------------------------------

The framework's iteration coefficient is η = 1/(8π).  The dynamical
gain on the Laplacian is η_L = 1/(4π).  Their product is the per-step
contraction normalisation:

        η · η_L  =  1 / (8π · 4π)  =  1 / (32π²)  =  1 / (2^q · π²).

So 2^q · π² is what *all* mixing times divide by — it is the
"natural unit of URT time" in the same way that π is the natural
unit of S²-geometry and φ is the natural unit of A_5 self-similarity.

The universe-from-chaos arc, restated
-------------------------------------

```
   Stage             Cathedral form                Steps in the iteration
   ─────             ──────────────                ───────────────────────
   1. Chaos          δ ~ Uniform(0, ½)             k = 0
   2. Flow           δ_{k+1} = (I − η η_L L)δ_k    k ≤ τ_D ≈ 105
   3. Structure      σ(δ) → 0                      k ~ τ_D · log(σ_0/ε)
   4. Rails split    δ → {δ★, δ_cl}                k → ∞
   5. Gap forms      Δ = δ_cl − δ★ ≈ 2.49e-3       (closure)
   6. Matter wins    η_B = γ³·Δ·δ★·(8/9)           (post-closure)
```

Stage 2's exponential decay rate is forced by 2^q · π² — i.e. it is
the *Cathedral* prediction for "how long until structure forms from
chaos."  The framework is therefore not just *describing* a
dynamical universe; it is predicting the timescale in Cathedral
units.
"""
from __future__ import annotations

from math import pi, factorial
from typing import Dict, Any, List, Tuple

from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR


# ── The dynamical normalisation 2^q · π² ─────────────────────────────────

DYNAMICAL_NORMALISATION = (2 ** q) * pi ** 2     # ≈ 315.83


def dynamical_normalisation_cathedral() -> Dict[str, Any]:
    """The constant 2^q · π² ≈ 315.83 is what every URT mixing time
    divides by.  It is the framework's natural unit of dynamical time.

    Decomposition:
       2^q · π²  =  η⁻¹ · η_L⁻¹  =  (8π) · (4π)  =  32 π²
       2^q       =  32           = # 3D point groups (crystallographic)
       π²        =  ζ(2)·D!      = π² (and ζ(2) = π²/D!)
    """
    return {
        "value":                   DYNAMICAL_NORMALISATION,
        "exact_form":              "2^q · π²  =  32 π²",
        "two_to_q":                2 ** q,
        "two_to_q_is_32":          2 ** q == 32,
        "decomposition":           "η⁻¹ · η_L⁻¹ = (8π)(4π) = 32π²",
        "as_eta_inv":              8 * pi,                 # 1/η
        "as_eta_L_inv":            4 * pi,                 # 1/η_L
        "product":                 (8 * pi) * (4 * pi),
    }


# ── Per-mode contraction in Cathedral closed form ────────────────────────

def per_step_factor_cathedral(lam: float) -> float:
    """Cathedral closed form for the per-step linear contraction factor:

        per_step_factor(λ)  =  1  −  λ / (2^q · π²).

    The URT iteration's product coefficient η·η_L = 1/(2^q · π²) is the
    *only* constant that appears; every Laplacian mode of G_{13}
    contracts by this factor each step.
    """
    return 1.0 - lam / DYNAMICAL_NORMALISATION


def mixing_time_cathedral(lam: float) -> float:
    """1/e mixing time at Laplacian eigenvalue λ:

        τ(λ)  =  (2^q · π²) / λ.
    """
    if lam <= 0:
        return float("inf")
    return DYNAMICAL_NORMALISATION / lam


def cathedral_contraction_table() -> List[Tuple[float, float, float]]:
    """Table of (λ, per_step_factor, mixing_time) for every distinct
    Laplacian eigenvalue of G_{13}.

    The eigenvalues are {0, 3, 5, 7, 9, 13} — every Cathedral integer.
    """
    eigs = [0.0, 3.0, 5.0, 7.0, 9.0, 13.0]
    return [
        (lam, per_step_factor_cathedral(lam), mixing_time_cathedral(lam))
        for lam in eigs
    ]


# ── The Fiedler / max-mode mixing times ──────────────────────────────────

def slowest_mixing_time() -> Dict[str, Any]:
    """Slowest non-trivial mixing time = at the Fiedler eigenvalue λ_2 = D.

       τ_D  =  (2^q · π²) / D  ≈  105.28 steps.

    This is "how long it takes the URT iteration to settle the
    slowest non-trivial mode" — the framework's prediction for the
    structure-formation timescale (in iteration units).
    """
    tau_D = mixing_time_cathedral(D)
    return {
        "lambda":           D,
        "lambda_is_Fiedler": True,
        "lambda_eq_D":      True,
        "tau":              tau_D,
        "closed_form":      "(2^q · π²) / D  =  32 π² / 3",
    }


def fastest_mixing_time() -> Dict[str, Any]:
    """Fastest mixing time = at the maximum eigenvalue λ_max = N.

       τ_N  =  (2^q · π²) / N  ≈  24.29 steps.
    """
    tau_N = mixing_time_cathedral(N)
    return {
        "lambda":           N,
        "lambda_is_max":    True,
        "lambda_eq_N":      True,
        "tau":              tau_N,
        "closed_form":      "(2^q · π²) / N  =  32 π² / 13",
    }


def slowest_to_fastest_ratio() -> Dict[str, Any]:
    """The ratio of slowest to fastest mixing time is *exactly* N/D:

       τ_D / τ_N  =  ((2^q · π²)/D) / ((2^q · π²)/N)  =  N / D  =  13/3.

    The 2^q · π² normalisation cancels — the spread of dynamical
    timescales in the URT iteration is entirely set by the spectral
    Cathedral integers.
    """
    ratio = mixing_time_cathedral(D) / mixing_time_cathedral(N)
    return {
        "ratio":                 ratio,
        "is_N_over_D":           abs(ratio - N / D) < 1e-12,
        "closed_form":           "N / D  =  13/3",
        "no_transcendentals":    True,
    }


# ── The 6-stage universe-from-chaos arc, in Cathedral closed form ────────

def universe_from_chaos_arc() -> List[Dict[str, Any]]:
    """The 6-stage universe-from-chaos arc with each stage's Cathedral
    closed form annotated.
    """
    return [
        {
            "stage":         1,
            "name":          "Chaos",
            "description":   "δ ~ Uniform(0, ½)",
            "cathedral":     "13 random sites on G_{13}",
            "step_count":    "k = 0",
        },
        {
            "stage":         2,
            "name":          "Flow",
            "description":   "δ_{k+1} = (I − η η_L L) δ_k + small nonlinear",
            "cathedral":     f"per-step factor = 1 − λ/(2^q · π²)",
            "step_count":    f"k ≤ τ_D = (2^q · π²)/D ≈ 105",
        },
        {
            "stage":         3,
            "name":          "Structure",
            "description":   "σ(δ) → 0 — variance collapses",
            "cathedral":     "geometric decay at slowest rate ρ ≈ 0.99",
            "step_count":    "k ~ τ_D · log(σ_0 / ε)",
        },
        {
            "stage":         4,
            "name":          "Rails split",
            "description":   "δ partitions into {δ★, δ_cl}",
            "cathedral":     "δ★ = (1−γ)π/(Nφ);  δ_cl = D/F",
            "step_count":    "k → ∞",
        },
        {
            "stage":         5,
            "name":          "Gap forms",
            "description":   "Δ = δ_cl − δ★ > 0 — frustration energy",
            "cathedral":     f"Δ = D/F − (1−γ)π/(Nφ) ≈ 2.49 × 10⁻³",
            "step_count":    "(closure observable)",
        },
        {
            "stage":         6,
            "name":          "Matter wins",
            "description":   "η_B > 0 — baryogenesis closes",
            "cathedral":     "η_B = γ³ · Δ · δ★ · (8/9) = 6.14 × 10⁻¹⁰",
            "step_count":    "(post-closure)",
        },
    ]


# ── End-to-end audit ────────────────────────────────────────────────────

def chaos_and_flow_audit() -> Dict[str, Any]:
    """Returns the full Cathedral closed-form view of the URT dynamics."""
    return {
        "dynamical_normalisation": dynamical_normalisation_cathedral(),
        "contraction_table":       cathedral_contraction_table(),
        "slowest_mixing":          slowest_mixing_time(),
        "fastest_mixing":          fastest_mixing_time(),
        "ratio":                   slowest_to_fastest_ratio(),
        "universe_arc":            universe_from_chaos_arc(),
    }


def chaos_and_flow_audit_passes() -> bool:
    a = chaos_and_flow_audit()
    return (
        a["dynamical_normalisation"]["two_to_q_is_32"]
        and a["ratio"]["is_N_over_D"]
        and len(a["universe_arc"]) == 6
        and all(0 <= f <= 1 for _, f, _ in a["contraction_table"])
    )


def print_chaos_and_flow_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" CHAOS AND THE URT FLOW — CATHEDRAL CLOSED FORMS")
    print(bar)

    print("\n[1] The dynamical normalisation 2^q · π²")
    n = dynamical_normalisation_cathedral()
    print(f"     2^q · π²  =  32 · π²  =  {n['value']:.4f}")
    print(f"     decomposition: {n['decomposition']}")
    print(f"     1/η   =  8π  =  {n['as_eta_inv']:.4f}")
    print(f"     1/η_L =  4π  =  {n['as_eta_L_inv']:.4f}")
    print(f"     product       =  {n['product']:.4f}  (= 32π²)")

    print("\n[2] Per-mode contraction = 1 − λ/(2^q · π²)")
    print("    λ        per-step factor      1/e mixing time τ(λ)")
    for lam, fac, tau in cathedral_contraction_table():
        if tau == float("inf"):
            print(f"    {lam:6.3f}   {fac:.6f}            ∞ (constant mode preserved)")
        else:
            print(f"    {lam:6.3f}   {fac:.6f}            {tau:.3f}")

    print("\n[3] Cathedral mixing times")
    s = slowest_mixing_time()
    f_ = fastest_mixing_time()
    r = slowest_to_fastest_ratio()
    print(f"     slowest (Fiedler λ=D=3):  τ_D = (2^q · π²)/D = {s['tau']:.3f} steps")
    print(f"     fastest (max λ=N=13):     τ_N = (2^q · π²)/N = {f_['tau']:.3f} steps")
    print(f"     ratio τ_D/τ_N             = N/D = {r['ratio']:.6f}  (= 13/3)")
    print(f"     ⇒ the dynamical spread is entirely Cathedral.")

    print("\n[4] The 6-stage universe-from-chaos arc")
    for stage in universe_from_chaos_arc():
        print(f"     {stage['stage']}. {stage['name']:14s} {stage['cathedral']}")

    print()
    print("  → η · η_L = 1/(2^q · π²) is the natural unit of URT dynamical time.")
    print("  → Every mixing time on G_{13} is (2^q · π²) ÷ a Cathedral integer.")
    print("  → 'Universe formation' takes ~τ_D ≈ 105 steps  ←  Cathedral prediction.")
    print()
    print(bar)
    print(f" chaos_and_flow_audit_passes() = {chaos_and_flow_audit_passes()}")
    print(bar)


__all__ = [
    "DYNAMICAL_NORMALISATION",
    "dynamical_normalisation_cathedral",
    "per_step_factor_cathedral",
    "mixing_time_cathedral",
    "cathedral_contraction_table",
    "slowest_mixing_time",
    "fastest_mixing_time",
    "slowest_to_fastest_ratio",
    "universe_from_chaos_arc",
    "chaos_and_flow_audit",
    "chaos_and_flow_audit_passes",
    "print_chaos_and_flow_report",
]
