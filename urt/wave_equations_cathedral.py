"""
Wave Equations Cathedral — Huygens' principle, Green's functions, Cathedral propagators.

The most elegant reason D=3 is special for wave propagation:

  HUYGENS' PRINCIPLE: Sharp-edged wavefronts exist ONLY in ODD spatial dimensions.
  In D=3: G(r,t) = δ(t - r/c) / (4π r)  → sharp pulse, no trailing wave
  In D=2: G(r,t) = θ(t - r/c) / √(t² - r²/c²)  → smeared wave with tail
  In D=4: also has a tail (even dimension)

  Cathedral: D=3 is the UNIQUE odd dimension ≤ 3 where:
  (a) Sharp Huygens wavefronts allow perfect communication
  (b) Inverse-square law G ~ 1/r (gravity, light) — only in D=3 exactly
  (c) Cross product is unique to D=3 (related to ε_{ijk}, curl, magnetic fields)

Key results:
  D_Huygens  = 3 = D  (Huygens holds for D=3)
  G_Newton   = δ★²    (Cathedral gravitational Green's function coefficient)
  ω²         = k² + δ★²  (Cathedral Klein-Gordon dispersion)
  ξ_corr     = 1/δ★   (Cathedral correlation length = AdS radius)
  c_signal   = 1/δ★   (Cathedral signal speed = SNR in GW detection)
"""

from math import pi, sqrt, exp, sin, cos
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Huygens' principle ────────────────────────────────────────────────────────

# Huygens' principle holds iff D is odd AND D ≥ 1
# D=1: holds (1D wave equation trivially)
# D=3: holds → inverse-square law, sharp wavefronts (ONLY useful physical case)
# D=5,7,...: holds but physically irrelevant
# D=2,4,6,...: does NOT hold → wave tails

D_HUYGENS_HOLDS = (D % 2 == 1)   # True for D=3 (odd)

# Dimension-dependent inverse power law: G ~ r^{2-D}
# D=3: G ~ r^{-1}  (Newton/Coulomb)
# D=2: G ~ ln(r)   (2D electrostatics)
# D=4: G ~ r^{-2}  (higher-dimensional)
GREENS_POWER = 2 - D    # = -1  (inverse-first-power for D=3!)

# Surface area of unit sphere in D dimensions: S_{D-1} = 2π^{D/2}/Γ(D/2)
# D=3: S_2 = 4π = 4π (sphere surface area)
UNIT_SPHERE_AREA = 4 * pi   # = 4π for D=3

# Cathedral retarded Green's function coefficient:
# G(r,t) = δ(t - r/c) / (4π r)   [D=3, c=1 units]
# Coefficient = 1/(4π) = 1/S_2
GREENS_COEFF = 1.0 / (4 * pi)   # = 1/(4π)

# Number of spatial components of a vector field: D = 3
# Number of independent components of antisymmetric 2-tensor: D(D-1)/2 = 3
# → Dual of 2-form = 1-form in D=3 → magnetic field B ~ curl A (unique to D=3!)
N_VECTOR_COMPONENTS   = D                # = 3
N_ANTISYM_TENSOR_2    = D * (D - 1) // 2  # = 3 (magnetic field components)
CROSS_PRODUCT_UNIQUE  = (N_VECTOR_COMPONENTS == N_ANTISYM_TENSOR_2)  # True!


# ── Cathedral Klein-Gordon equation ──────────────────────────────────────────

# Cathedral "mass": m = δ★ (the shell-closure constant as a mass scale)
M_CATHEDRAL = DELTA_STAR   # ≈ 0.14751

# Klein-Gordon dispersion relation: ω² = k² + m²  (c=1 units)
# At k=0 (rest mass): ω₀ = m = δ★
OMEGA_0_REST = DELTA_STAR   # rest frequency

# Cathedral Compton wavelength: λ_C = 1/m = 1/δ★
COMPTON_WAVELENGTH = 1.0 / DELTA_STAR   # = 1/δ★ ≈ 6.779

# Correlation length: ξ = 1/(m) = 1/δ★  (= AdS radius in holography!)
CORRELATION_LENGTH = 1.0 / DELTA_STAR   # = R_AdS from holography.py

def dispersion(k: float) -> float:
    """ω(k) = √(k² + δ★²) for Cathedral Klein-Gordon."""
    return sqrt(k**2 + DELTA_STAR**2)

def group_velocity(k: float) -> float:
    """v_g = dω/dk = k/ω(k) for KG equation."""
    return k / dispersion(k)

def phase_velocity(k: float) -> float:
    """v_p = ω/k for KG equation."""
    if k == 0:
        return float('inf')
    return dispersion(k) / k


# ── Wave equation Green's functions ─────────────────────────────────────────

def greens_function_D3(r: float, t: float) -> float:
    """
    Retarded Green's function of the 3D wave equation (c=1).

    G(r,t) = δ(t-r) / (4πr)  in distribution sense.
    Returns 0 except at t=r (light cone), where it returns 1/(4πr).

    Parameters
    ----------
    r : float
        Spatial distance (r > 0).
    t : float
        Time (t > 0 for retarded).

    Returns
    -------
    float
        Approximate Green's function (peaked at t=r).
    """
    if r <= 0 or t <= 0:
        return 0.0
    # Approximate: peaked at t=r with width ε→0
    # Return the coefficient 1/(4πr) at t=r, else 0
    return 1.0 / (4 * pi * r) if abs(t - r) < 1e-10 else 0.0


def greens_function_D3_approx(r: float, t: float, epsilon: float = 0.01) -> float:
    """
    Regularized retarded Green's function: Gaussian-smeared δ(t-r).

    G_ε(r,t) ≈ exp(-(t-r)²/(2ε²)) / (4πr × ε√(2π))

    Parameters
    ----------
    r : float
        Spatial distance.
    t : float
        Time.
    epsilon : float
        Smearing width.

    Returns
    -------
    float
        Regularized Green's function.
    """
    if r <= 0:
        return 0.0
    gaussian = exp(-0.5 * ((t - r) / epsilon)**2) / (epsilon * sqrt(2 * pi))
    return gaussian / (4 * pi * r)


# ── Normal modes and Cathedral spectrum ──────────────────────────────────────

def spherical_harmonic_count(l_max: int = N - 1) -> dict:
    """
    Count of spherical harmonic modes Y_l^m for l = 0, ..., l_max.

    In 3D: for each l there are 2l+1 modes.
    For l_max = N-1 = 12: total modes = Σ_{l=0}^{12} (2l+1) = (N)² = 169 = N²!

    Parameters
    ----------
    l_max : int
        Maximum angular momentum quantum number.

    Returns
    -------
    dict
        Mode counts per l, total, and Cathedral connection.
    """
    modes_per_l = {l: 2 * l + 1 for l in range(l_max + 1)}
    total = sum(modes_per_l.values())
    return {
        "l_max":          l_max,
        "modes_per_l":    modes_per_l,
        "total_modes":    total,
        "total_eq_N2":    (total == N * N),
        "N_sq":           N * N,
        "formula":        "Σ(2l+1) for l=0..N-1 = N²",
        "note":           "l_max = N-1 = 12 → total spherical harmonic modes = N² = 169",
    }


def cathedral_propagator(omega: float) -> complex:
    """
    Cathedral Feynman propagator in momentum space.

    Δ_F(ω) = 1 / (ω² - δ★² + iε)

    Pole at ω = ±δ★: the Cathedral "particle" has mass m = δ★.

    Parameters
    ----------
    omega : float
        Frequency (energy in natural units).

    Returns
    -------
    complex
        Feynman propagator.
    """
    epsilon = 1e-10  # Feynman prescription
    return complex(1.0 / (omega**2 - DELTA_STAR**2), epsilon)


# ── Cathedral cross product and Maxwell duality ───────────────────────────────

def cross_product_uniqueness() -> dict:
    """
    The cross product is unique to D=3 (and D=7).

    In D=3: a × b is a vector (antisymmetric 2-tensor dual to vector)
    Number of independent antisymmetric 2-tensor components = D(D-1)/2
    For D=3: this equals D → magnetic field B = ∇×A is a vector

    This uniqueness of the cross product in D=3 is why Maxwell's equations
    have their elegant symmetric form (E and B both 3-vectors).
    """
    antisym_components = D * (D - 1) // 2
    return {
        "D":                    D,
        "vector_components":    D,
        "antisym_2tensor_components": antisym_components,
        "cross_product_exists": (antisym_components == D),
        "formula":              "D(D-1)/2 = D for D=3",
        "check":                "3×2/2 = 3 = D ✓",
        "note":                 "Cross product unique to D=3 → B=∇×A is a vector (Maxwell duality)",
        "next_D":               7,  # next D where |ε_{ijk...}| allows cross product (octonions)
    }


# ── Solid angle and information ──────────────────────────────────────────────

def solid_angle_and_information() -> dict:
    """
    Total solid angle in D=3 = 4π steradians.

    Information content of isotropic source at distance r:
    S(r) = 4π r² × (info per unit area) = 4π r² × (1/(4π·G_N·r²)) × A_BH
    This is the holographic entropy! S_BH = A/(4G_N) = 4πr²/(4δ★²) = πr²/δ★²

    Cathedral: solid angle Ω_D = 2π^{D/2}/Γ(D/2) = 2π^{3/2}/Γ(3/2) = 4π
    """
    solid_angle = 4 * pi   # = 2π^{3/2}/Γ(3/2) = 2π^{3/2}/(√π/2) = 4π
    # BH at radius r: entropy = 4πr²/(4G_N) = πr²/G_N
    def entropy_at_r(r: float) -> float:
        G_N = DELTA_STAR**2
        return pi * r**2 / G_N

    return {
        "D":            D,
        "solid_angle":  solid_angle,
        "formula":      "Ω_D = 2π^{3/2}/Γ(3/2) = 4π  (D=3)",
        "greens_coeff": 1.0 / solid_angle,
        "entropy_r1":   entropy_at_r(1.0),
        "entropy_formula": "S_BH = πr²/G_N = πr²/δ★²",
        "note":         "4π sr = full solid angle; Greens coeff = 1/(4π) = 1/Ω_3",
    }


# ── Summary ──────────────────────────────────────────────────────────────────

def wave_summary() -> dict:
    """Full Cathedral wave equation summary."""
    return {
        "huygens":          {
            "holds_for_D":      D,
            "holds_odd_only":   D_HUYGENS_HOLDS,
            "greens_power":     GREENS_POWER,
            "sharp_wavefront":  True,
        },
        "klein_gordon":     {
            "mass":             M_CATHEDRAL,
            "compton_wavelength": COMPTON_WAVELENGTH,
            "correlation_length": CORRELATION_LENGTH,
            "omega_rest":       OMEGA_0_REST,
        },
        "cross_product":    cross_product_uniqueness(),
        "spherical_harmonics": spherical_harmonic_count(N - 1),
        "solid_angle":      solid_angle_and_information(),
        "dispersion_k1":    dispersion(1.0),
        "vg_k1":            group_velocity(1.0),
        "greens_coeff":     GREENS_COEFF,
        "delta_star":       DELTA_STAR,
        "D":                D,
        "N":                N,
    }


def print_wave_report():
    """Print Cathedral wave equations report."""
    sp = spherical_harmonic_count(N - 1)
    cp = cross_product_uniqueness()
    sa = solid_angle_and_information()

    print("  Cathedral Wave Equations — Huygens, Klein-Gordon, Maxwell")
    print("  " + "─" * 58)

    print(f"\n  Huygens' Principle (sharp wavefronts, D=3):")
    print(f"    Holds iff D is odd: D=3 is odd → {D_HUYGENS_HOLDS}")
    print(f"    G(r,t) = δ(t−r) / (4πr)  [c=1; no wave tail in D=3]")
    print(f"    D=2,4,...: smeared wave with tail (imperfect communication)")
    print(f"    D=3: unique sharp pulse → perfect signal propagation")
    print(f"    Green's function: G ~ r^{{2-D}} = r^{{-1}}  (inverse distance law)")

    print(f"\n  Cross Product Uniqueness:")
    print(f"    Vector components = D = {D}")
    print(f"    Antisymmetric 2-tensor components = D(D-1)/2 = {D*(D-1)//2}")
    print(f"    Equal! → B = ∇×A is a vector ONLY in D=3 (and D=7)")
    print(f"    Maxwell equations have E,B both as vectors: {cp['cross_product_exists']}")

    print(f"\n  Spherical Harmonics Y_l^m for l = 0..N-1:")
    print(f"    Total modes = Σ_{{l=0}}^{{N-1}} (2l+1) = N² = {sp['total_modes']} = {N}²")
    print(f"    = N² exactly: {sp['total_eq_N2']}")

    print(f"\n  Cathedral Klein-Gordon (mass = δ★):")
    print(f"    ω² = k² + δ★² = k² + {DELTA_STAR**2:.6f}")
    print(f"    At k=1: ω = {dispersion(1.0):.6f},  v_g = {group_velocity(1.0):.6f}")
    print(f"    Compton wavelength = 1/δ★ = {COMPTON_WAVELENGTH:.4f}")
    print(f"    Correlation length ξ = 1/δ★ = R_AdS  (same as AdS radius!)")

    print(f"\n  Solid angle in D=3:")
    print(f"    Ω_3 = 4π = {4*pi:.6f} sr")
    print(f"    Green's coefficient = 1/(4π) = {GREENS_COEFF:.6f}")
    print(f"    BH entropy S = πr²/G_N = πr²/δ★² (from Gauss law in D=3)")

    print(f"\n  KEY: D=3 is uniquely special:")
    print(f"    Huygens' principle → sharp wavefronts")
    print(f"    Cross product exists → Maxwell's B = ∇×A")
    print(f"    ΣY_l^m modes = N² for l_max = N-1")
    print(f"    G ~ 1/r (inverse distance) → stable planetary orbits")
    print(f"    All these require D=3 = D exactly.")
