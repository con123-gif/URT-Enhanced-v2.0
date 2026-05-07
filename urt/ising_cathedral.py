"""
Ising Cathedral — Ising model on the icosahedral graph.

Each vertex of the icosahedron has exactly q=5 nearest neighbors.
The coordination number q=5 forces a specific critical temperature.

Key results:
  T_c (mean field) = J·q/k_B = 5J  (coordination z = q = 5)
  T_c (Bethe)      = J / arctanh(1/√q) ≈ J/arctanh(1/√5) ≈ 1.955J
  K_c = J/(k_B T_c) = arctanh(1/√q) ≈ 0.5116
  Magnetisation below T_c: m(T) = tanh(q·K·m)   (self-consistency)

  The Ising partition function on the icosahedral graph:
    Z = Σ_{σ} exp(K Σ_{<ij>} σᵢσⱼ)  where K = J/(k_B T)
    Sum over E=30 bonds in the icosahedral graph.

  Cathedral connection:
    q = 5 = coordination number AND pentagonal symmetry
    E = 30 = number of Ising bonds = icosahedral edges
    N = 13 = sites INCLUDING the central site (shell model)
    Ising phase transition at K_c = arctanh(1/√q) ≈ 0.5116
    Compare: arctanh(δ★) ≈ 0.1488 — the δ★ value on the tanh curve
"""

from math import pi, sqrt, log, exp, tanh, atanh, cosh, sinh
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Icosahedral graph parameters ─────────────────────────────────────────────

# Icosahedron: 12 vertices, 30 edges, coordination z = 5
N_ISING   = V      # = 12 vertices (outer shell; or 13 including center)
Z_COORD   = q      # = 5 nearest neighbors per vertex
E_BONDS   = E      # = 30 bonds (edges of icosahedron)


# ── Critical temperature (Bethe approximation) ────────────────────────────────

# Bethe lattice critical coupling: K_c = arctanh(1/√(z-1)) = arctanh(1/√(q-1))
# For coordination z = q = 5: K_c = arctanh(1/√4) = arctanh(1/2) = ln(3)/2 ≈ 0.5493
# But more precisely for the Bethe approximation on coordination-z lattice:
# K_c^{Bethe} = (1/2) × ln((z)/(z-2)) for z ≥ 3
K_C_BETHE = 0.5 * log(Z_COORD / (Z_COORD - 2))   # = 0.5 × ln(5/3) ≈ 0.2554

# Mean-field critical coupling: K_c^{MF} = 1/z = 1/q
K_C_MF    = 1.0 / Z_COORD    # = 1/5 = 0.200

# Exact 2D square lattice (Onsager 1944): K_c = ln(1+√2)/2 ≈ 0.4407 (reference)
K_C_ONSAGER = 0.5 * log(1 + sqrt(2))

# δ★ on the tanh curve: tanh(K) = δ★
K_DELTA_STAR = atanh(DELTA_STAR)   # ≈ 0.1488

# Ratio of δ★ to Bethe K_c:
KAPPA_RATIO = K_DELTA_STAR / K_C_BETHE   # ≈ 0.583 (below criticality)


# ── Self-consistent magnetisation ────────────────────────────────────────────

def magnetisation(K: float, tol: float = 1e-12, max_iter: int = 1000) -> float:
    """
    Self-consistent magnetisation m for Ising model on coordination-z graph.

    Mean-field equation: m = tanh(z · K · m)
    Iterate to fixed point starting from m₀ = 0.5.

    Parameters
    ----------
    K : float
        Coupling K = J/(k_B T). K > K_c^MF = 1/z for non-zero solution.
    tol : float
        Convergence tolerance.
    max_iter : int
        Maximum iterations.

    Returns
    -------
    float
        Self-consistent magnetisation m ∈ [0, 1]. Zero above T_c.
    """
    if K <= K_C_MF:
        return 0.0
    m = 0.5
    for _ in range(max_iter):
        m_new = tanh(Z_COORD * K * m)
        if abs(m_new - m) < tol:
            return m_new
        m = m_new
    return m


def critical_exponents() -> dict:
    """
    Mean-field critical exponents for the icosahedral Ising model.

    MF theory gives exact exponents for d > d_c = 4.
    The icosahedral graph has effective dimension d_eff ≈ ln(z)/ln(z-1) ≈ 2.58
    (Bethe lattice dimension estimate).

    Standard MF: β=1/2, γ=1, δ=3, α=0, ν=1/2.
    """
    d_eff = log(Z_COORD) / log(Z_COORD - 1)   # Bethe dimension ≈ 2.58
    return {
        "z_coordination":   Z_COORD,
        "d_effective":      d_eff,
        "beta_exp":         0.5,      # m ~ (T_c - T)^{1/2}
        "gamma_exp":        1.0,      # χ ~ |T - T_c|^{-1}
        "delta_exp":        3.0,      # m ~ h^{1/3} at T_c
        "alpha_exp":        0.0,      # C_V ~ const (MF logarithm)
        "nu_exp":           0.5,      # ξ ~ |T - T_c|^{-1/2}
        "eta_exp":          0.0,      # G(r) ~ r^{-(d-2+η)} with η=0
        "note":             "Mean-field exponents exact for d > 4; icosahedral d_eff ≈ 2.58",
    }


# ── Partition function (small exact calculation) ──────────────────────────────

def ising_partition_small(K: float, n_sites: int = 4) -> dict:
    """
    Exact Ising partition function for a small ring of n_sites spins.

    Z = 2^n (2 cosh(K))^n / 2  for a ring (transfer matrix).
    For n-site ring: Z = (2 cosh(K))^n + (2 sinh(K))^n

    Parameters
    ----------
    K : float
        Coupling K = J/(k_B T).
    n_sites : int
        Number of spins in the ring.

    Returns
    -------
    dict
        Z, free energy F, entropy S, magnetisation m.
    """
    Z = (2 * cosh(K))**n_sites + (2 * sinh(K))**n_sites
    F = -log(Z)  # free energy (k_B T = 1)
    # Entropy: S = -∂F/∂T|_V = K × ∂F/∂K + F  (rough)
    # Exact: S = log Z + K × d(log Z)/dK
    dlogZ = n_sites * (tanh(K) + 1.0/tanh(K) * (2*sinh(K))**n_sites/(Z)) if Z > 0 else 0
    S = log(Z) + K * n_sites * tanh(K)  # approximate
    return {
        "K": K,
        "n_sites": n_sites,
        "Z": Z,
        "F": F,
        "S_approx": S,
        "formula": "Z = (2cosh K)^n + (2sinh K)^n  (ring/periodic BC)",
    }


# ── Cathedral connection: δ★ on the spin curve ───────────────────────────────

def delta_star_on_spin_curve() -> dict:
    """
    Where does δ★ sit on the Ising magnetisation curve?

    For the self-consistent equation m = tanh(z·K·m):
    - Below T_c: tanh'(0) = z·K > 1, non-zero solution exists
    - The fixed-point derivative: slope = z·K·sech²(z·K·m)

    δ★ as a coupling: K = arctanh(δ★) ≈ 0.1488
    This is below K_c^{MF} = 0.2 — the system is in the PARAMAGNETIC phase
    at K = arctanh(δ★), consistent with δ★ being a small coupling.

    But δ★ has a special role: tanh(K_δ★) = δ★ exactly.
    → The "Cathedral spin" magnetisation = δ★ × (z·K correction)
    """
    K_d = K_DELTA_STAR
    m_d = magnetisation(K_d)
    fixed_pt_slope = Z_COORD * K_d  # slope at m=0
    return {
        "K_delta_star":      K_d,
        "delta_star":        DELTA_STAR,
        "tanh_K_delta":      tanh(K_d),
        "tanh_eq_delta_star": abs(tanh(K_d) - DELTA_STAR) < 1e-12,
        "m_at_K_delta":      m_d,
        "slope_at_origin":   fixed_pt_slope,
        "paramagnetic":      fixed_pt_slope < 1,
        "K_c_MF":            K_C_MF,
        "K_c_Bethe":         K_C_BETHE,
        "note":              "tanh(K) = δ★ exactly; system is paramagnetic at Cathedral coupling",
    }


# ── Ising on icosahedral graph ────────────────────────────────────────────────

def icosahedral_ising() -> dict:
    """
    Full Ising model parameters for the icosahedral graph.

    Icosahedron: 12 vertices, 30 edges, coordination z=5.
    Mean-field T_c, Bethe T_c, and Cathedral coupling K_δ★.
    """
    # Magnetisation curve sampled at several K values
    K_vals = [0.1, K_C_MF, K_C_BETHE, 0.5, 1.0]
    m_vals = [magnetisation(K) for K in K_vals]

    return {
        "graph":            "Icosahedron",
        "N_sites":          N_ISING,
        "z_coordination":   Z_COORD,
        "z_equals_q":       (Z_COORD == q),
        "E_bonds":          E_BONDS,
        "E_equals_30":      (E_BONDS == E),
        "K_c_MF":           K_C_MF,
        "K_c_Bethe":        K_C_BETHE,
        "K_c_Onsager_ref":  K_C_ONSAGER,
        "K_delta_star":     K_DELTA_STAR,
        "magnetisation_curve": {K: m for K, m in zip(K_vals, m_vals)},
        "critical_exponents": critical_exponents(),
        "delta_star_spin":  delta_star_on_spin_curve(),
        "note":             "z=q=5, E=30=E, N=12=V — icosahedron IS the Ising lattice",
    }


def ising_summary() -> dict:
    """Full Ising Cathedral summary."""
    return {
        "icosahedral": icosahedral_ising(),
        "K_c_MF":      K_C_MF,
        "K_c_Bethe":   K_C_BETHE,
        "K_delta_star": K_DELTA_STAR,
        "delta_star":  DELTA_STAR,
        "z":           Z_COORD,
        "N_sites":     N_ISING,
        "E_bonds":     E_BONDS,
        "q":           q,
        "gamma":       gamma,
        "key_relation": "tanh(K_δ★) = δ★  (Cathedral coupling lives on the spin curve)",
    }


def print_ising_report():
    """Print Cathedral Ising model report."""
    dss = delta_star_on_spin_curve()
    ce  = critical_exponents()

    print("  Ising Model on the Icosahedral Graph")
    print("  " + "─" * 52)

    print(f"\n  Graph: Icosahedron")
    print(f"    Vertices (spins): V = {N_ISING}")
    print(f"    Edges (bonds):    E = {E_BONDS} = 30 → z = 2E/V = {2*E_BONDS//N_ISING} = q = {q}")
    print(f"    Coordination:     z = q = {Z_COORD}  (pentagonal!)")

    print(f"\n  Critical Couplings:")
    print(f"    K_c (mean-field) = 1/z     = 1/{Z_COORD} = {K_C_MF:.6f}")
    print(f"    K_c (Bethe)      = ½ln(z/(z-2)) = ½ln(5/3) = {K_C_BETHE:.6f}")
    print(f"    K_c (Onsager,2D) = ½ln(1+√2) = {K_C_ONSAGER:.6f}  (reference)")

    print(f"\n  δ★ on the Ising spin curve:")
    print(f"    K_δ★ = arctanh(δ★) = {K_DELTA_STAR:.6f}")
    print(f"    tanh(K_δ★) = {dss['tanh_K_delta']:.12f}")
    print(f"    = δ★ exactly: {dss['tanh_eq_delta_star']}")
    print(f"    System is paramagnetic at K_δ★ (slope z·K = {dss['slope_at_origin']:.4f} < 1)")

    print(f"\n  Magnetisation m = tanh(z·K·m):")
    for K_val in [0.15, K_C_MF, K_C_BETHE, 0.5, 1.0]:
        m = magnetisation(K_val)
        phase = "ordered" if m > 0.01 else "para"
        print(f"    K = {K_val:.4f}:  m = {m:.6f}  ({phase})")

    print(f"\n  Critical exponents (MF, d_eff ≈ {ce['d_effective']:.2f}):")
    print(f"    β = {ce['beta_exp']},  γ = {ce['gamma_exp']},  δ = {ce['delta_exp']},  ν = {ce['nu_exp']}")

    print(f"\n  Key Cathedral connection:")
    print(f"    z = q = {q}: same pentagonal number in coordination AND in δ★ formula")
    print(f"    E = {E_BONDS}: every icosahedral edge is an Ising bond")
    print(f"    tanh(K) = δ★: Cathedral constant sits on the spin self-consistency curve")
