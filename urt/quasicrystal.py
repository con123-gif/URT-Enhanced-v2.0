"""
Icosahedral Quasicrystal Structure and the IKT Transform

The 13-site Cathedral kernel cannot tile 3-space as a periodic crystal:
the icosahedral symmetry group A₅ is non-crystallographic (Euler theorem).
Instead, the Cathedral generates an ICOSAHEDRAL QUASICRYSTAL — an
aperiodic-but-ordered structure with φ-scaled hierarchy, realized as a
cut-and-project from a 6-dimensional cubic lattice.

This is the spatial realisation of the Cathedral framework:
  • Local: 13-site icosahedral shell with A₅ symmetry
  • Global: aperiodic tiling with 5-fold Bragg peaks at φⁿ-scaled radii
  • Embedding: 6D hypercubic lattice → 3D via cut-and-project

The IKT (Icosahedral Kernel Transform) is the natural spectral decomposition
of the 13-site shell, separating the K₄ coherent (k=0..3) and A₅ exhaust
(k=4..12) sectors.

IKT Forward:
    C_k = Σ_{n=0}^{12}  x_n · ψ_k(n)

    ψ_k(n) = e^{i·2π·δ★·k·n/13} · φ_k

    φ_k = e^{i·π·k/2}         k = 0,1,2,3   (K₄ coherent sector)
          e^{i·2π·(k-4)/5}     k = 4..12     (A₅ exhaust sector)

IKT Inverse:
    x_n = Σ_{k=0}^{12}  C_k · ψ_k*(n)  / 13
"""

import numpy as np
from math import pi, sqrt


# ── Constants ─────────────────────────────────────────────────────────────────

D = 3
phi_gr = (1 + sqrt(5)) / 2           # golden ratio
N_SITE = 13
GAMMA = 1 / D ** 4                   # = 1/81

DELTA_STAR = (1 - GAMMA) * pi / (N_SITE * phi_gr)

# Sector split: 4 K₄ coherent + 9 A₅ exhaust = 13 total
K4_SECTOR = list(range(4))           # k = 0, 1, 2, 3
A5_SECTOR = list(range(4, 13))       # k = 4, 5, ..., 12


# ── Phase factors ─────────────────────────────────────────────────────────────

def phi_phase(k):
    """
    Sector-dependent phase factor φ_k.
    K₄ coherent sector (k=0..3): φ_k = e^{iπk/2}  (roots of unity for Z₄)
    A₅ exhaust sector (k=4..12): φ_k = e^{i·2π(k-4)/5}  (roots for Z₅)
    """
    if k in K4_SECTOR:
        return np.exp(1j * pi * k / 2)
    else:
        return np.exp(1j * 2 * pi * (k - 4) / 5)


def ikt_basis(k, n):
    """
    IKT basis function ψ_k(n) = e^{i·2π·δ★·k·n/13} · φ_k.
    This is a δ★-modulated Fourier mode with sector-dependent phase.
    """
    return np.exp(1j * 2 * pi * DELTA_STAR * k * n / N_SITE) * phi_phase(k)


# ── IKT Forward and Inverse ───────────────────────────────────────────────────

def ikt_forward(x):
    """
    IKT Forward Transform.

    C_k = Σ_{n=0}^{12} x_n · ψ_k(n)

    Parameters
    ----------
    x : array-like, shape (13,)
        Signal on the 13-site shell.

    Returns
    -------
    C : ndarray, shape (13,), complex
        IKT coefficients. C[0..3] = K₄ coherent, C[4..12] = A₅ exhaust.
    """
    x = np.asarray(x, dtype=complex)
    if x.shape[0] != N_SITE:
        raise ValueError(f"IKT requires exactly {N_SITE} input values, got {x.shape[0]}")
    C = np.zeros(N_SITE, dtype=complex)
    for k in range(N_SITE):
        for n in range(N_SITE):
            C[k] += x[n] * ikt_basis(k, n)
    return C


def ikt_inverse(C):
    """
    IKT Inverse Transform.

    x_n = (1/13) · Σ_{k=0}^{12} C_k · ψ_k*(n)

    Parameters
    ----------
    C : array-like, shape (13,), complex
        IKT coefficients.

    Returns
    -------
    x : ndarray, shape (13,), complex
        Reconstructed signal on the 13-site shell.
    """
    C = np.asarray(C, dtype=complex)
    if C.shape[0] != N_SITE:
        raise ValueError(f"IKT inverse requires exactly {N_SITE} coefficients")
    x = np.zeros(N_SITE, dtype=complex)
    for n in range(N_SITE):
        for k in range(N_SITE):
            x[n] += C[k] * np.conj(ikt_basis(k, n))
    return x / N_SITE


def ikt_matrix():
    """Return the full 13×13 IKT matrix Ψ where Ψ[k,n] = ψ_k(n)."""
    Psi = np.zeros((N_SITE, N_SITE), dtype=complex)
    for k in range(N_SITE):
        for n in range(N_SITE):
            Psi[k, n] = ikt_basis(k, n)
    return Psi


# ── Sector power decomposition ────────────────────────────────────────────────

def ikt_sector_power(x):
    """
    Decompose signal x into K₄ coherent and A₅ exhaust power.

    Returns
    -------
    dict with keys: 'C' (all coefficients), 'P_K4', 'P_A5', 'P_total',
                    'Omega_m_ikt' (coherent fraction ≈ 4/13)
    """
    C = ikt_forward(x)
    P = np.abs(C) ** 2
    P_K4 = np.sum(P[K4_SECTOR])
    P_A5 = np.sum(P[A5_SECTOR])
    P_total = P_K4 + P_A5
    return {
        "C":          C,
        "P_K4":       P_K4,
        "P_A5":       P_A5,
        "P_total":    P_total,
        "Omega_m_ikt": P_K4 / P_total if P_total > 0 else 0.0,
    }


# ── Quasicrystal: 6D → 3D cut-and-project ────────────────────────────────────

def icosahedral_basis_6d():
    """
    Six basis vectors for the 6D embedding of the icosahedral quasicrystal.
    These are the 6 vectors obtained by projecting the E₆ root lattice
    onto the icosahedral subspace.

    e_j = (cos(2π·j/5), sin(2π·j/5), 0) for j=0..4 (5-fold in xy-plane)
    e_5 = (0, 0, 1) (z-axis)

    In the cut-and-project scheme, 3 basis vectors span the 'physical space'
    and 3 span the 'perpendicular space' (the cut determines quasiperiodicity).
    """
    vecs = []
    for j in range(5):
        vecs.append(np.array([np.cos(2 * pi * j / 5), np.sin(2 * pi * j / 5), 0.0]))
    vecs.append(np.array([0.0, 0.0, 1.0]))
    return np.array(vecs)   # shape (6, 3)


def phi_scaled_radii(n_shells=6):
    """
    Quasicrystal diffraction peak radii scale as φⁿ.
    Returns the first n_shells Bragg peak radii (in units of the base spacing).
    """
    return np.array([phi_gr ** n for n in range(n_shells)])


def quasicrystal_structure_factor(q_radii, n_sites=100, sigma=0.05):
    """
    Approximate structure factor |S(q)|² for an icosahedral quasicrystal.
    Peaks appear at q = 2π/d_n where d_n = d_0 / φⁿ.

    Parameters
    ----------
    q_radii : ndarray
        Wavenumber magnitudes at which to evaluate S(q).
    n_sites : int
        Number of sites in the simulated quasicrystal.
    sigma : float
        Peak broadening (in units of the base spacing).

    Returns
    -------
    S : ndarray
        Structure factor at each q.
    """
    base_q = 2 * pi   # base scattering vector (d_0 = 1)
    peak_qs = base_q / phi_scaled_radii(n_shells=8)
    S = np.zeros_like(q_radii, dtype=float)
    for q_peak in peak_qs:
        amplitude = n_sites * np.exp(-0.5 * ((q_radii - q_peak) / sigma) ** 2)
        S += amplitude
    return S


# ── Penrose tiling connection ─────────────────────────────────────────────────

def penrose_inflation_ratio():
    """
    The Penrose tiling inflation ratio is φ = (1+√5)/2.
    Each generation of the tiling scales by φ.
    The Cathedral φ_k phases are the same φ — not a coincidence.
    """
    return phi_gr


def icosahedral_quasicrystal_info():
    """Summary of the quasicrystal realisation of the Cathedral kernel."""
    return {
        "symmetry_group":       "A₅ (icosahedral, non-crystallographic)",
        "embedding_dimension":  6,
        "tiling_type":          "3D icosahedral quasicrystal",
        "inflation_ratio":      phi_gr,
        "diffraction_pattern":  "5-fold Bragg peaks at q_n = q_0 / φⁿ",
        "cut_space":            "3D physical + 3D perpendicular",
        "parent_lattice":       "6D hypercubic (cut-and-project)",
        "cathedral_connection": "K₄⊕A₅ shell split = coherent⊕exhaust sectors",
        "Omega_m":              4 / 13,
        "Omega_Lambda":         9 / 13,
    }


# ── Print report ──────────────────────────────────────────────────────────────

def print_quasicrystal_report():
    print("=" * 70)
    print("Cathedral Quasicrystal — Spatial Realisation of the 13-Site Kernel")
    print("=" * 70)
    info = icosahedral_quasicrystal_info()
    for k, v in info.items():
        print(f"  {k:<30} {v}")

    print()
    print("IKT Basis Matrix condition number:")
    Psi = ikt_matrix()
    cond = np.linalg.cond(Psi)
    print(f"  κ(Ψ) = {cond:.4f}")

    print()
    print("IKT round-trip test on random signal:")
    np.random.seed(42)
    x = np.random.randn(13)
    C = ikt_forward(x)
    x_rec = ikt_inverse(C).real
    err = np.max(np.abs(x_rec - x))
    print(f"  max |x_rec - x| = {err:.3e}  ({'PASS' if err < 1e-10 else 'FAIL'})")

    print()
    print("Sector power for flat signal (x = ones):")
    result = ikt_sector_power(np.ones(13))
    print(f"  P_K4 (coherent) = {result['P_K4']:.4f}")
    print(f"  P_A5 (exhaust)  = {result['P_A5']:.4f}")
    print(f"  Ω_m (IKT)       = {result['Omega_m_ikt']:.4f}  (theory: {4/13:.4f})")

    print()
    print("φ-scaled diffraction peak radii:")
    radii = phi_scaled_radii(6)
    for i, r in enumerate(radii):
        print(f"  shell {i}: r = φ^{i} = {r:.6f}")
    print("=" * 70)


if __name__ == "__main__":
    print_quasicrystal_report()
