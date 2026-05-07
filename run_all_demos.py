#!/usr/bin/env python3
"""
Newton's Cathedral — Master Demo Runner

Runs all Cathedral modules and prints full results.
Use as a quick sanity check or a complete showcase.

Usage:
    python run_all_demos.py           # all modules
    python run_all_demos.py shell     # just the shell closure
    python run_all_demos.py cathedral # Cathedral v8/v9
    python run_all_demos.py rg        # RG flow
    python run_all_demos.py prove     # ARF uniqueness proof (slow)
    python run_all_demos.py logistic  # logistic map (slow ~30s)
    python run_all_demos.py all       # everything
"""

import sys
import time


def section(title):
    print()
    print("╔" + "═" * 68 + "╗")
    print("║  " + title.ljust(66) + "║")
    print("╚" + "═" * 68 + "╝")


def run_shell():
    section("Shell Closure — δ★ and Fundamental Constants")
    from urt import DELTA_STAR, compute_all_constants
    print(f"  δ★ = {DELTA_STAR:.12f}")
    c = compute_all_constants()
    obs = {
        "alpha_inv":    ("1/α",        137.035999084, ""),
        "mp_e":         ("mp/me",      1836.15267,    ""),
        "sin2_theta_W": ("sin²θ_W",    0.23122,       ""),
        "Omega_m":      ("Ω_m",        0.3111,        ""),
        "alpha_s_MZ":   ("α_s(M_Z)",   0.1179,        ""),
    }
    print(f"\n  {'Observable':<12} {'Predicted':>14} {'Observed':>14} {'Error':>8}")
    print("  " + "-" * 52)
    for key, (label, obs_val, unit) in obs.items():
        if key in c:
            pred = c[key]
            err = (pred - obs_val) / obs_val * 100
            print(f"  {label:<12} {pred:>14.6g} {obs_val:>14.6g} {err:>+7.3f}%")


def run_cathedral():
    section("Cathedral Framework v8/v9 — Full Standard Model")
    from urt.cathedral_v8 import Cathedral
    c = Cathedral()
    c.print_comparison()
    print()
    from urt.cathedral_v9 import Cathedral as C9
    c9 = C9()
    c9.print_scale_chain()


def run_rg():
    section("RG Flow — δ(μ) Crossover at μ_c ≈ 197 GeV")
    from urt.rg_flow import print_rg_table, crossover_scale
    print(f"  Crossover scale μ_c = {crossover_scale():.4f} GeV")
    print()
    print_rg_table()


def run_qbls():
    section("Quantum Bounded Ladder of Scales")
    from urt.qbls import print_qbls_report
    print_qbls_report()


def run_gravity():
    section("Cathedral Gravity — Topological Deficit")
    from urt.gravity_deficit import print_gravity_report
    print_gravity_report(M_demo=1.0)


def run_casimir():
    section("Casimir Prediction — +0.124 ppm at 100 nm")
    from urt.casimir_cathedral import print_casimir_report
    print_casimir_report()


def run_axion():
    section("Axion Prediction — m_a ≈ 58.2 μeV")
    from urt.axion_cathedral import print_axion_report
    print_axion_report()


def run_nuclear():
    section("Nuclear Magic Numbers from Γ[δ, N]")
    from urt.nuclear_magic import print_nuclear_report
    print_nuclear_report()


def run_ns():
    section("Navier-Stokes — 4⊕9 Cascade Asymmetry")
    from urt.navier_stokes import print_ns_report
    print_ns_report()


def run_qft():
    section("Cathedral QFT — Finite One-Loop")
    from urt.qft_cathedral import print_qft_report
    print_qft_report()


def run_quasicrystal():
    section("Icosahedral Quasicrystal + IKT Transform")
    from urt.quasicrystal import print_quasicrystal_report
    print_quasicrystal_report()


def run_prove():
    section("ARF Uniqueness Proof — 4 Theorems")
    from urt.arf_closure import prove_uniqueness, print_gamma_ladder
    prove_uniqueness(verbose=True)
    print()
    print_gamma_ladder()


def run_logistic():
    section("Logistic Map Verification — δ★ on 6-cycle")
    print("  Computing (may take ~30 seconds)...")
    t0 = time.time()
    from urt.logistic_verification import verify_delta_star_logistic
    result = verify_delta_star_logistic()
    print(result)
    print(f"\n  Computation time: {time.time() - t0:.1f}s")


def run_neural():
    section("Cathedral Neural Architecture — Grok Demo")
    from urt.neural_cathedral import demo_cathedral_net
    demo_cathedral_net()


# ── Main dispatch ─────────────────────────────────────────────────────────────

DEMOS = {
    "shell":       run_shell,
    "cathedral":   run_cathedral,
    "rg":          run_rg,
    "qbls":        run_qbls,
    "gravity":     run_gravity,
    "casimir":     run_casimir,
    "axion":       run_axion,
    "nuclear":     run_nuclear,
    "ns":          run_ns,
    "qft":         run_qft,
    "quasicrystal": run_quasicrystal,
    "prove":       run_prove,
    "logistic":    run_logistic,
    "neural":      run_neural,
}

# Fast default (excludes logistic which takes ~30s)
FAST_DEMOS = ["shell", "cathedral", "rg", "qbls", "gravity", "casimir",
              "axion", "nuclear", "ns", "qft", "quasicrystal", "neural"]

if __name__ == "__main__":
    args = sys.argv[1:]

    if not args or "all" in args:
        demos_to_run = list(DEMOS.keys())
    elif args[0] == "fast":
        demos_to_run = FAST_DEMOS
    else:
        demos_to_run = [a for a in args if a in DEMOS]
        if not demos_to_run:
            print(f"Unknown demo. Available: {', '.join(DEMOS.keys())}")
            sys.exit(1)

    print()
    print("╔" + "═" * 68 + "╗")
    print("║  NEWTON'S CATHEDRAL — Complete Demo Suite" + " " * 26 + "║")
    print("║  δ★ = (80/81)·π/(13φ) = 0.14751081..." + " " * 31 + "║")
    print("║  One geometric constant. Every chaotic system." + " " * 20 + "║")
    print("╚" + "═" * 68 + "╝")

    t_total = time.time()
    for name in demos_to_run:
        t0 = time.time()
        try:
            DEMOS[name]()
        except Exception as e:
            print(f"\n  [ERROR in {name}]: {e}")
        dt = time.time() - t0
        if dt > 1.0:
            print(f"\n  [{name}: {dt:.1f}s]")

    print()
    print(f"Total time: {time.time() - t_total:.1f}s")
    print("Newton's Cathedral. Zero free parameters.")
