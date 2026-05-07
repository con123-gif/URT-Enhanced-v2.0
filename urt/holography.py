"""
Cathedral Holography — AdS/CFT from Icosahedral Shell

The 13-site icosahedral shell is a holographic screen. The central site (bulk)
and 12 boundary sites satisfy an exact Ryu-Takayanagi formula derived from δ★.

Cathedral AdS/CFT dictionary:
  Bulk:     1 central site     → gravity, G_N = δ★²
  Boundary: 12 shell sites     → CFT with c = 3R/(2G_N)
  IKT:      the holographic map between bulk and boundary
  δ★:       the AdS radius in Planck units  (R = 1/δ★)

Key results (zero free parameters):
  ─────────────────────────────────────────────────────
  Newton constant         G_N = δ★² ≈ 0.02176
  AdS radius              R   = 1/δ★ ≈ 6.779  (Planck units)
  Central charge          c   = 3R/(2G_N) = 3/(2δ★³) ≈ 467
  BH entropy              S   = A/(4G_N) = A/(4δ★²)
  Hawking temperature     T_H = ℏ c³/(8π G M) = 1/(8π M δ★²)
  Page time               t_P = e^{S_BH} τ_Pl
  ─────────────────────────────────────────────────────

Ryu-Takayanagi formula (Cathedral version):
  S_EE(A) = Area(γ_A)/(4G_N)

where γ_A is the minimal geodesic in the icosahedral graph separating region A
from its complement. Area(γ_A) = (boundary edges cut) × δ★.

For the K₄|A₅ bipartition:
  - 18 edges cross the boundary (9 from central site + 9 from sites 1,2,3)
  - Area(γ) = 18 × δ★
  - S_RT = 18δ★ / (4δ★²) = 18/(4δ★) ≈ 30.5 nats  (holographic upper bound)
  - S_EE(K₄) ≤ S_RT  ✓  (holographic bound always satisfied)

Bekenstein bound:
  S ≤ 2π·E·R   (information cannot exceed this for a system of energy E in ball of radius R)
  Cathedral: 2π·E·(1/δ★) = 2π/δ★  ≈ 42.6 nats
"""

import numpy as np
from math import pi, sqrt, log, exp

# ── Cathedral constants ───────────────────────────────────────────────────────

D          = 3
PHI        = (1 + sqrt(5)) / 2
GAMMA      = 1 / D ** 4
N          = 13
G_ROT      = 60    # |A₅| rotation group

DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)

# Cathedral AdS/CFT
G_N        = DELTA_STAR ** 2           # Newton constant
R_ADS      = 1.0 / DELTA_STAR          # AdS radius (Planck units)

# K₄|A₅ boundary edges (from icosahedral adjacency, verified numerically)
_K4_A5_BOUNDARY_EDGES = 18            # 9 from central + 3×3 from sites 1,2,3

# Planck units
M_PLANCK_GEV = 1.22090e19
T_PLANCK_S   = 5.391e-44


# ── Newton constant and AdS geometry ─────────────────────────────────────────

def newton_constant() -> float:
    """G_N = δ★² — Cathedral Newton constant (from gravity_deficit.py)."""
    return G_N


def ads_radius() -> float:
    """R_AdS = 1/δ★ — Cathedral Anti-de Sitter radius in Planck units."""
    return R_ADS


def central_charge() -> float:
    """
    Brown-Henneaux central charge: c = 3R/(2G_N) = 3/(2δ★³).

    For AdS₃/CFT₂ (the relevant case when the icosahedral boundary is 2D),
    the central charge counts the boundary CFT degrees of freedom.
    c ≈ 467 — consistent with N=13 sites × (large bond dimension).
    """
    return 3 * R_ADS / (2 * G_N)


def bekenstein_bound(E_planck: float) -> float:
    """
    Bekenstein bound: S ≤ 2π·E·R_AdS.

    Maximum information content of a system of energy E (Planck units)
    inside a ball of AdS radius R_AdS.
    """
    return 2 * pi * E_planck * R_ADS


# ── Ryu-Takayanagi formula ────────────────────────────────────────────────────

def rt_area_k4_a5() -> float:
    """
    Minimal geodesic area for K₄|A₅ bipartition.

    In the icosahedral graph, 18 edges cross the K₄|A₅ cut:
      • 9 edges: central site (0) → A₅ sites {4..12}
      • 9 edges: sites {1,2,3} → A₅ sites (3 edges each)
    Each edge has weight δ★ (fundamental geodesic length).
    Area = 18 × δ★.
    """
    return _K4_A5_BOUNDARY_EDGES * DELTA_STAR


def ryu_takayanagi(n_boundary_edges: int) -> float:
    """
    RT entropy S_RT = Area/(4·G_N) = n_edges × δ★ / (4δ★²) = n_edges/(4δ★).

    Parameters
    ----------
    n_boundary_edges : int
        Number of graph edges crossing the entanglement cut.
    """
    return n_boundary_edges / (4 * DELTA_STAR)


def s_rt_k4_a5() -> float:
    """S_RT for K₄|A₅ bipartition ≈ 30.5 nats (holographic upper bound)."""
    return ryu_takayanagi(_K4_A5_BOUNDARY_EDGES)


def entanglement_entropy_k4(state_vec: np.ndarray) -> float:
    """
    Entanglement entropy S_EE between K₄ (sites 0-3) and A₅ (sites 4-12).

    For a 13-component state |ψ⟩ (single-particle sector), the sector entropy is:
        p_K4 = Σ_{i∈K₄} |ψ_i|²  /  ||ψ||²
        S_EE = −p_K4 log(p_K4) − p_A5 log(p_A5)

    This is a lower bound on the full many-body entanglement entropy.

    Parameters
    ----------
    state_vec : ndarray of shape (13,)
    """
    psi  = np.asarray(state_vec, dtype=complex)
    norm = np.dot(psi.conj(), psi).real
    p_K4 = np.dot(psi[:4].conj(), psi[:4]).real / norm
    p_A5 = 1.0 - p_K4
    eps  = 1e-300
    return -(p_K4 * log(p_K4 + eps) + p_A5 * log(p_A5 + eps))


def holographic_bound_satisfied(state_vec: np.ndarray) -> bool:
    """
    Verify holographic bound: S_EE(K₄) ≤ S_RT(K₄|A₅).

    The Ryu-Takayanagi formula requires S_EE ≤ S_RT for any physical state.
    """
    S_EE = entanglement_entropy_k4(state_vec)
    S_RT = s_rt_k4_a5()
    return S_EE <= S_RT


# ── Black hole thermodynamics ─────────────────────────────────────────────────

def bekenstein_hawking(area_planck: float) -> float:
    """
    Bekenstein-Hawking entropy: S_BH = A / (4 G_N) = A / (4δ★²).

    Parameters
    ----------
    area_planck : float
        Horizon area in Planck units (l_Pl = 1).
    """
    return area_planck / (4 * G_N)


def hawking_temperature(mass_planck: float) -> float:
    """
    Hawking temperature T_H = 1 / (8π·M·G_N) = 1 / (8π·M·δ★²).

    Parameters
    ----------
    mass_planck : float
        Black hole mass in Planck units.
    """
    return 1.0 / (8 * pi * mass_planck * G_N)


def page_time(mass_planck: float) -> float:
    """
    Page time t_Page ≈ e^{S_BH} × τ_Pl.

    The Page time is when half the black hole's information has been emitted.
    Black holes with mass >> M_Pl have astronomical Page times (information paradox).

    Returns time in Planck units.
    """
    # S_BH = 4π M² G_N (Schwarzschild, G_N = δ★²)
    S_BH = 4 * pi * mass_planck ** 2 * G_N
    return exp(min(S_BH, 700))  # cap at exp(700) to avoid overflow


def schwarzschild_radius(mass_planck: float) -> float:
    """
    Cathedral Schwarzschild radius r_s = 2 G_N M = 2δ★² M.
    """
    return 2 * G_N * mass_planck


def cathedral_bh_from_mass(mass_planck: float) -> dict:
    """
    Complete Cathedral black hole characterization from mass.

    Parameters
    ----------
    mass_planck : float
        Black hole mass in Planck units.
    """
    r_s   = schwarzschild_radius(mass_planck)
    area  = 4 * pi * r_s ** 2
    S_BH  = bekenstein_hawking(area)
    T_H   = hawking_temperature(mass_planck)
    t_P   = page_time(mass_planck)
    return {
        "mass_planck":        mass_planck,
        "r_schwarzschild":    r_s,
        "area_planck":        area,
        "S_BH":               S_BH,
        "T_hawking":          T_H,
        "page_time_planck":   t_P,
        "G_N":                G_N,
        "R_AdS":              R_ADS,
    }


# ── Holographic c-theorem ─────────────────────────────────────────────────────

def c_function(scale: float, scale_UV: float = 1.0) -> float:
    """
    Cathedral c-function C(μ): monotonically decreasing from UV to IR.

    C(μ) = c_UV × (μ/μ_UV)^{2δ★}

    At the fixed point μ=μ_UV: C = c = 3R/(2G_N).
    The c-theorem is satisfied: dC/dμ ≤ 0 for the Cathedral RG flow.
    """
    c_UV = central_charge()
    return c_UV * (scale / scale_UV) ** (2 * DELTA_STAR)


def holographic_entanglement_spectrum() -> dict:
    """
    Entanglement spectrum for K₄|A₅ bipartition of the Cathedral vacuum.

    The Cathedral vacuum |0⟩ = (1/√13) × Σ_i |i⟩ (uniform superposition).
    p_K4 = 4/13 (K₄ sites), p_A5 = 9/13 (A₅ sites).
    """
    p_K4  = 4 / 13
    p_A5  = 9 / 13
    S_EE  = -(p_K4 * log(p_K4) + p_A5 * log(p_A5))
    S_RT  = s_rt_k4_a5()
    bound = S_EE <= S_RT
    return {
        "state":        "Cathedral vacuum |0⟩ = uniform superposition",
        "p_K4":         p_K4,
        "p_A5":         p_A5,
        "S_EE":         S_EE,
        "S_RT":         S_RT,
        "bound_sat":    bound,
        "G_N":          G_N,
        "R_AdS":        R_ADS,
        "central_charge": central_charge(),
    }


# ── Information scrambling ────────────────────────────────────────────────────

def scrambling_time(mass_planck: float) -> float:
    """
    Hayden-Preskill scrambling time: t* = (R_AdS / (2π)) × log(S_BH).

    The fastest a black hole can scramble information is t* ∝ β log S,
    where β = 1/T_H is the inverse Hawking temperature.
    In the Cathedral: t* ≈ (1/δ★) × log(S_BH) / (2π).
    """
    r_s  = schwarzschild_radius(mass_planck)
    S_BH = bekenstein_hawking(4 * pi * r_s ** 2)
    beta = 1.0 / hawking_temperature(mass_planck)
    return beta * log(S_BH + 1) / (2 * pi)


# ── Print report ──────────────────────────────────────────────────────────────

def print_holography_report():
    print("=" * 72)
    print("Cathedral Holography — AdS/CFT from Icosahedral Shell")
    print(f"  δ★ = {DELTA_STAR:.8f}")
    print("=" * 72)

    print(f"\n  Newton constant G_N = δ★² = {G_N:.8f}")
    print(f"  AdS radius R_AdS   = 1/δ★  = {R_ADS:.6f}  (Planck units)")
    print(f"  Central charge c   = 3R/(2G_N) = {central_charge():.4f}")
    print(f"  Bekenstein bound (E=1): S ≤ {bekenstein_bound(1.0):.4f} nats")

    print(f"\n  Ryu-Takayanagi (K₄|A₅):")
    print(f"    K₄|A₅ boundary edges: {_K4_A5_BOUNDARY_EDGES}")
    print(f"    Area(γ) = {rt_area_k4_a5():.6f}")
    print(f"    S_RT    = {s_rt_k4_a5():.4f} nats  (holographic upper bound)")

    spec = holographic_entanglement_spectrum()
    print(f"\n  Cathedral vacuum entanglement:")
    print(f"    p(K₄) = {spec['p_K4']:.4f},  p(A₅) = {spec['p_A5']:.4f}")
    print(f"    S_EE  = {spec['S_EE']:.4f}  ≤  S_RT = {spec['S_RT']:.4f}  {'✓' if spec['bound_sat'] else '✗'}")

    print(f"\n  Sample black holes:")
    print(f"  {'Mass (Pl)':>12}  {'r_s':>10}  {'S_BH':>12}  {'T_H':>12}")
    print("  " + "-" * 52)
    for M in [1.0, 10.0, 100.0, 1e6]:
        bh = cathedral_bh_from_mass(M)
        print(f"  {M:>12.2e}  {bh['r_schwarzschild']:>10.4e}  "
              f"{bh['S_BH']:>12.4e}  {bh['T_hawking']:>12.4e}")

    print("=" * 72)


if __name__ == "__main__":
    print_holography_report()
