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


def run_periodic():
    section("Periodic Table — Madelung Rule from δ★")
    from urt.periodic_table import print_madelung_table
    print_madelung_table()


def run_holography():
    section("Holography — AdS/CFT: G_N=δ★², c≈467, RT Entropy")
    from urt.holography import print_holography_report
    print_holography_report()


def run_consciousness():
    section("Consciousness — Kuramoto on Icosahedral Graph")
    from urt.consciousness import print_consciousness_report
    print_consciousness_report()


def run_prime():
    section("Prime Spectral — Laplacian ↔ Riemann Zeros")
    from urt.prime_spectral import print_spectral_report
    print_spectral_report()


def run_metamaterials():
    section("Metamaterials — Photonic Crystal & Drug Binding")
    from urt.metamaterials import print_metamaterial_report
    print_metamaterial_report()


def run_swarm():
    section("Swarm Intelligence — 13-Agent Icosahedral Formation")
    from urt.swarm_intelligence import print_swarm_report
    print_swarm_report()


def run_gw():
    section("Gravitational Waves — IKT Detection & Ringdown")
    from urt.gravitational_waves import print_gw_report
    print_gw_report()


def run_gravity_cathedral():
    section("Cathedral Gravity — K4 Gapless Mode, G_N=δ★², Area Quantum")
    from urt.gravity_cathedral import print_gravity_cathedral_report
    print_gravity_cathedral_report(M_demo=1e4)


def run_neutrinos():
    section("Neutrinos — PMNS from 13-Shell, Σm_ν≈60 meV, δ_CP=208°")
    from urt.neutrinos import print_neutrino_report
    print_neutrino_report()


def run_vacuum():
    section("Vacuum — Why Something Rather Than Nothing (δ=0 unstable)")
    from urt.vacuum_instability import print_vacuum_report
    print_vacuum_report()


def run_forces():
    section("Force Structure — K4⊕H3 Decomposition, GUT Unification")
    from urt.force_structure import print_force_structure_report
    print_force_structure_report()


def run_topology():
    section("Cathedral Topology — Holonomy Vortex, RG Flow, Gravitational Deficit")
    from urt.cathedral_topology import print_topology_report
    print_topology_report()


def run_pi_phi_e():
    section("π–φ–e Flow — Unique Geometric Derivation of URT Coefficients")
    from urt.pi_phi_e_flow import print_pi_phi_e_report
    print_pi_phi_e_report()


def run_electroweak():
    section("Electroweak Sector — K4 k=2: W/Z/Higgs, sin²θ_W=0.23122")
    from urt.electroweak import print_electroweak_report
    print_electroweak_report()


def run_cosmology():
    section("Cosmology Cathedral — CMB: n_s=0.96491, Ω_m=0.3153, σ₈=0.811")
    from urt.cosmology_cathedral import print_cosmology_report
    print_cosmology_report()


def run_uniqueness():
    section("Uniqueness Proof — 4 Lemmas: δ★ is the UNIQUE fixed point")
    from urt.uniqueness_proof import print_uniqueness_report
    print_uniqueness_report()


def run_prime181():
    section("Prime 181 — Corollary 11.1: Multiplicative Completion of 13-Shell")
    from urt.prime181 import print_prime181_report
    print_prime181_report()


def run_ckm_pmns():
    section("CKM + PMNS — Full Mixing: δ_CP=197°, λ_C=0.22537, J_PMNS")
    from urt.ckm_pmns import print_ckm_pmns_report
    print_ckm_pmns_report()


def run_canonical():
    section("CanonicalV4Gem — ta-URT: Ω=9/13, τ_stab=0.001211")
    from urt.canonical_v4gem import print_canonical_v4gem_report
    print_canonical_v4gem_report()


def run_qbls_fractal():
    section("QBLS Fractal — 13-Rung Meta-Universe Ladder (Planck→Cosmos)")
    from urt.qbls_fractal import print_qbls_fractal_report
    print_qbls_fractal_report()


def run_iron_proof():
    section("Iron Proof — Bulletproof Uniqueness: D=3→A₅→N=13→δ★, 0 free params")
    from urt.iron_proof import print_iron_proof_report
    print_iron_proof_report()


# ── Main dispatch ─────────────────────────────────────────────────────────────

DEMOS = {
    "shell":        run_shell,
    "cathedral":    run_cathedral,
    "rg":           run_rg,
    "qbls":         run_qbls,
    "gravity":      run_gravity,
    "casimir":      run_casimir,
    "axion":        run_axion,
    "nuclear":      run_nuclear,
    "ns":           run_ns,
    "qft":          run_qft,
    "quasicrystal": run_quasicrystal,
    "prove":        run_prove,
    "logistic":     run_logistic,
    "neural":       run_neural,
    "periodic":     run_periodic,
    "holography":   run_holography,
    "consciousness": run_consciousness,
    "prime":        run_prime,
    "metamaterials": run_metamaterials,
    "swarm":        run_swarm,
    "gw":           run_gw,
    "gravity_cat":  run_gravity_cathedral,
    "neutrinos":    run_neutrinos,
    "vacuum":       run_vacuum,
    "forces":       run_forces,
    "pi_phi_e":     run_pi_phi_e,
    "topology":     run_topology,
    "electroweak":  run_electroweak,
    "cosmology":    run_cosmology,
    "uniqueness":   run_uniqueness,
    "prime181":     run_prime181,
    "ckm_pmns":     run_ckm_pmns,
    "canonical":    run_canonical,
    "qbls_fractal": run_qbls_fractal,
    "iron_proof":   run_iron_proof,
}

# Fast default (excludes logistic which takes ~30s)
FAST_DEMOS = ["shell", "cathedral", "rg", "qbls", "gravity", "casimir",
              "axion", "nuclear", "ns", "qft", "quasicrystal", "neural",
              "periodic", "holography", "consciousness", "prime",
              "metamaterials", "swarm", "gw",
              "gravity_cat", "neutrinos", "vacuum", "forces", "pi_phi_e", "topology",
              "electroweak", "cosmology", "uniqueness", "prime181",
              "ckm_pmns", "canonical", "qbls_fractal", "iron_proof"]

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
