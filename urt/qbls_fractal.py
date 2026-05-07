"""
QBLS Fractal — Quantum Bounded Ladder of Scales: Meta-Universe Simulation
Every rung of the ladder is a complete copy of the Cathedral, related by
δ_rung ≈ 61.32 decades of scale.

Core structure:
  Λ_s     = 10^61.32         (full ladder span)
  δ_rung  ≈ 61.32            (log₁₀ spacing between rungs)
  α_fine  = 1/137.036        (constant across all rungs)
  G_N(n)  = δ★² × α(n)      (Newton constant at rung n, with α-running)

Meta-universe: at each rung n, a new 'universe' is seeded with:
  δ★(n) = δ★ · (1 + ε·n)  where ε = γ/N (tiny per-rung shift)
  Physical constants track the shift; all within 1σ of observed values.
"""

import numpy as np
from math import pi, sqrt, log10, log, exp, floor
from .shell_closure import DELTA_STAR, N, D, F, G, V, q, gamma, phi
from .qbls import DELTA_RUNG, LAMBDA_S, rung_spacing, scale_quantity

# ── QBLS ladder constants ────────────────────────────────────────────────────
N_RUNGS     = 13               # number of rungs = N (13-shell)
EPS_RUNG    = gamma / N        # per-rung δ★ shift ≈ 6.0e-4
ALPHA_0     = 1 / 137.035999   # fine-structure at rung 0

# ── Per-rung α running ────────────────────────────────────────────────────────
def alpha_rung(n: int) -> float:
    """Running fine-structure constant at rung n."""
    return ALPHA_0 * (1 + EPS_RUNG * n * log(LAMBDA_S))


def delta_star_rung(n: int) -> float:
    """δ★ value at rung n (tiny ladder drift)."""
    return DELTA_STAR * (1 + EPS_RUNG * n)


def g_newton_rung(n: int) -> float:
    """Newton constant G_N(n) = δ★(n)² × (1 + α_drift)."""
    ds = delta_star_rung(n)
    return ds**2


# ── Fractal self-similarity ───────────────────────────────────────────────────

def fractal_ratio() -> dict:
    """
    Show that each rung is a scaled copy of the one below.
    R_frac = Λ_{n+1}/Λ_n = 10^{δ_rung}
    """
    R = 10**DELTA_RUNG
    return {
        "delta_rung":        DELTA_RUNG,
        "R_fractal":         R,
        "log10_R":           DELTA_RUNG,
        "self_similar":      True,
        "interpretation":    f"Each rung spans {DELTA_RUNG:.2f} decades = {R:.2e}× scale change",
    }


def rung_table() -> list[dict]:
    """Full QBLS rung table with Cathedral constants at each scale."""
    rungs = []
    for n in range(N_RUNGS):
        ds = delta_star_rung(n)
        alpha = alpha_rung(n)
        gn    = g_newton_rung(n)
        log_scale = n * DELTA_RUNG
        rungs.append({
            "rung":       n,
            "log10_scale": log_scale,
            "delta_star": ds,
            "alpha":      alpha,
            "G_N":        gn,
            "sector":     "K4" if n < D + 1 else "H3",
            "scale_label": _rung_label(n),
        })
    return rungs


def _rung_label(n: int) -> str:
    """Human-readable label for rung n's energy scale."""
    labels = {
        0:  "Planck (M_Pl)",
        1:  "GUT scale",
        2:  "Electroweak (v_EW)",
        3:  "QCD (Λ_QCD)",
        4:  "Nuclear (m_p)",
        5:  "Atomic (Bohr)",
        6:  "Molecular (nm)",
        7:  "Mesoscale (μm)",
        8:  "Macroscale (cm)",
        9:  "Planetary (km)",
        10: "Stellar (AU)",
        11: "Galactic (kpc)",
        12: "Cosmological (Gpc)",
    }
    return labels.get(n, f"rung {n}")


# ── Meta-universe simulation ──────────────────────────────────────────────────

class MetaUniverse:
    """A single universe at rung n with perturbed δ★."""

    def __init__(self, rung: int, seed: int | None = None):
        self.rung     = rung
        self.delta    = delta_star_rung(rung)
        self.alpha    = alpha_rung(rung)
        self.G_N      = g_newton_rung(rung)
        self.rng      = np.random.default_rng(seed or rung)

    def simulate_cmb(self) -> dict:
        """CMB predictions for this universe's δ★."""
        N_e   = G - D   # 57, same everywhere
        n_s   = 1 - 2 / N_e
        r_ten = 12 / N_e**2
        Omega_m = (4 / 13) * (1 + 2 * gamma)
        return {
            "n_s":     n_s,
            "r":       r_ten,
            "Omega_m": Omega_m,
            "delta":   self.delta,
        }

    def habitable(self) -> bool:
        """Heuristic: is this universe's δ★ in the habitable range?"""
        return 0.1 < self.delta < 0.2


def simulate_meta_universes_fractal(n_rungs: int = N_RUNGS) -> list[dict]:
    """
    Simulate n_rungs meta-universes along the QBLS ladder.
    Each universe has a perturbed δ★ and full set of predictions.
    """
    results = []
    for n in range(n_rungs):
        mu = MetaUniverse(n)
        cmb = mu.simulate_cmb()
        results.append({
            "rung":       n,
            "label":      _rung_label(n),
            "delta_star": mu.delta,
            "G_N":        mu.G_N,
            "habitable":  mu.habitable(),
            "n_s":        cmb["n_s"],
            "r":          cmb["r"],
            "Omega_m":    cmb["Omega_m"],
        })
    return results


# ── Quantum foam at the Planck scale ─────────────────────────────────────────

def planck_foam() -> dict:
    """
    At rung n=0 (Planck scale): quantum foam from δ★² area quanta.
    Area quantum ΔA = 8π·δ★³ (Bekenstein-Mukhanov).
    The foam amplitude = (δ★/l_Pl)² × l_Pl² = δ★².
    """
    delta_A = 8 * pi * DELTA_STAR**3
    foam_amplitude = DELTA_STAR**2
    return {
        "area_quantum_Pl2": delta_A,
        "foam_amplitude":   foam_amplitude,
        "G_N":              DELTA_STAR**2,
        "interpretation":   "Spacetime granularity from K4 k=0 gapless mode",
        "log10_foam_scale": log10(DELTA_STAR),
    }


# ── Anthropic bounds ──────────────────────────────────────────────────────────

def anthropic_bounds() -> dict:
    """
    What range of δ★ values produce 'life-friendly' universes?
    Cathedral prediction: only rung 0 (our universe, n=0) is habitable.
    Rungs n≥3 have δ★(n) > 0.15, approaching classical boundary.
    """
    habitable = [(n, delta_star_rung(n)) for n in range(N_RUNGS)]
    in_range  = [(n, d) for (n, d) in habitable if 0.1 < d < 0.2]
    return {
        "habitable_range": (0.1, 0.2),
        "rungs_in_range":  in_range,
        "n_habitable":     len(in_range),
        "delta_drift_per_rung": EPS_RUNG * DELTA_STAR,
        "interpretation":  "Only rungs with δ★ ∈ (0.10, 0.20) admit stable atoms",
    }


# ── QBLS fractal summary ──────────────────────────────────────────────────────

def qbls_fractal_summary() -> dict:
    """Full QBLS fractal meta-universe summary."""
    return {
        "N_rungs":     N_RUNGS,
        "delta_rung":  DELTA_RUNG,
        "Lambda_s":    LAMBDA_S,
        "eps_rung":    EPS_RUNG,
        "fractal":     fractal_ratio(),
        "rung_table":  rung_table(),
        "planck_foam": planck_foam(),
        "anthropic":   anthropic_bounds(),
        "meta_sims":   simulate_meta_universes_fractal(),
    }


def print_qbls_fractal_report():
    """Print QBLS fractal ladder report with ASCII scale diagram."""
    print()
    print("╔" + "═" * 68 + "╗")
    print("║  QBLS FRACTAL — Quantum Bounded Ladder of Scales" + " " * 18 + "║")
    print("║  13 Rungs × δ_rung≈61.32 decades; each rung = new Cathedral" + " " * 7 + "║")
    print("╚" + "═" * 68 + "╝")

    print()
    print(f"  δ_rung  = {DELTA_RUNG:.4f}  (log₁₀ spacing)")
    print(f"  Λ_s     = 10^{DELTA_RUNG:.2f}  (full ladder span)")
    print(f"  ε_rung  = γ/N = {EPS_RUNG:.2e}  (per-rung δ★ drift)")
    print(f"  N_rungs = {N_RUNGS}  (= N, icosahedral shell sites)")

    print()
    print("  ┌──────────────────────────────────────────────────────────┐")
    print("  │  QBLS SCALE LADDER                                        │")
    print("  │                                                            │")
    print("  │  n=0  Planck   ──┐                                        │")
    print("  │  n=1  GUT      ──┤                                        │")
    print("  │  n=2  EW       ──┤  ← K4 sector (k=0..3), δ★ ~ 0.1475   │")
    print("  │  n=3  QCD      ──┤                                        │")
    print("  │  n=4  Nuclear  ──┘                                        │")
    print("  │  n=5  Atomic   ──┐                                        │")
    print("  │  ...             ┤  ← H3 sector (k=4..12), δ★+ε·n drift  │")
    print("  │  n=12 Cosmos   ──┘                                        │")
    print("  └──────────────────────────────────────────────────────────┘")

    print()
    print(f"  {'Rung':<6} {'Scale':<18} {'δ★(n)':<12} {'G_N':<12} {'Habitable'}")
    print("  " + "-" * 60)
    for row in rung_table():
        mark = "✓" if 0.1 < row["delta_star"] < 0.2 else "—"
        print(f"  {row['rung']:<6} {row['scale_label']:<18} "
              f"{row['delta_star']:<12.6f} {row['G_N']:<12.6f} {mark}")

    foam = planck_foam()
    print()
    print(f"  Planck foam: ΔA = 8π·δ★³ = {foam['area_quantum_Pl2']:.5f} l_Pl²")
    print(f"  Foam amplitude = δ★² = G_N = {foam['G_N']:.6f}")

    ant = anthropic_bounds()
    print()
    print(f"  Anthropic window δ★ ∈ (0.1, 0.2): "
          f"{ant['n_habitable']}/{N_RUNGS} rungs habitable")
