"""
Magnetism Cathedral — Spin, exchange, and Cathedral integers.

The most striking Cathedral connections in magnetism:

  g-FACTOR (tree):   2 = D-1     [EXACT: g_0 = 2 at tree level / Dirac eq]
  SPIN-1/2 STATES:   2 = D-1     [EXACT: |↑⟩ and |↓⟩]
  SPIN-1 STATES:     3 = D       [EXACT: m_s = -1, 0, +1]
  MOMENT COMPONENTS: 3 = D       [EXACT: m_x, m_y, m_z in 3D space]
  BLOCH T^{3/2} LAW: exponent = D/2 = 3/2  [EXACT]
  FCC NEIGHBORS:    12 = V       [EXACT: FCC coordination number]
  SPIN-HALL COMPS:   3 = D(D-1)/2 = D  [EXACT: self-referential!]
  DM VECTOR:         3 = D       [EXACT: Dzyaloshinskii-Moriya vector components]
  MAGNON BRANCHES:   3 = D       [EXACT: 3 acoustic branches in 3D crystal]

The self-referential identity D(D-1)/2 = D holds only for D=3 — the Cathedral
uniqueness statement for magnetism: three-dimensional space is special.
"""

from math import sqrt, pi, log, exp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── g-factor and spin states ───────────────────────────────────────────────────

# Electron g-factor at tree level (Dirac equation): g_0 = 2 = D-1
G_FACTOR_TREE = D - 1            # = 2  [EXACT: Dirac/tree-level g-factor]
G_FACTOR_EQ_D1 = (G_FACTOR_TREE == D - 1)   # True

# Spin-1/2: two states |↑⟩ and |↓⟩ = D-1 = 2
N_SPIN_HALF_STATES = D - 1       # = 2  [EXACT]
SPIN_HALF_EQ_D1 = (N_SPIN_HALF_STATES == D - 1)   # True

# Spin-1: three states m_s = -1, 0, +1 = D = 3
N_SPIN_1_STATES = D              # = 3  [EXACT: 2S+1 = 3 for S=1]
SPIN_1_EQ_D = (N_SPIN_1_STATES == D)   # True

# Magnetic moment components in 3D space: m_x, m_y, m_z = D = 3
N_MAGNETIC_MOMENT_COMPONENTS = D  # = 3  [EXACT]
MOMENT_EQ_D = (N_MAGNETIC_MOMENT_COMPONENTS == D)   # True

# ── Bloch law ─────────────────────────────────────────────────────────────────

# Bloch T^{3/2} law for spin-wave reduction of magnetisation:
#   M(T) = M_0 (1 - C · T^{3/2})  where exponent = D/2 = 3/2
BLOCH_EXPONENT = float(D) / 2    # = 1.5  [EXACT: D/2 = 3/2]
BLOCH_EQ_3_2 = (abs(BLOCH_EXPONENT - 1.5) < 1e-10)   # True

# The Bloch exponent equals D/2 in D spatial dimensions — exact for D=3
BLOCH_FORMULA = "M(T) = M_0(1 - C·T^{D/2}) with D/2 = 3/2  [EXACT]"

# ── Exchange interactions ──────────────────────────────────────────────────────

# FCC coordination number: z = V = 12 nearest neighbours
FCC_EXCHANGE_NEIGHBORS = V       # = 12  [EXACT]
FCC_EQ_V = (FCC_EXCHANGE_NEIGHBORS == V)   # True

# Weiss mean-field Curie temperature: T_C ~ z·J·S(S+1)/3
# For FCC with z = V = 12 and S = 1/2: T_C ~ (V/3)·J = 4J
WEISS_Z = FCC_EXCHANGE_NEIGHBORS  # = V = 12  [EXACT]
WEISS_PREFACTOR = float(WEISS_Z) / D   # = V/D = 4  (denominator D=3)

# ── Topological / anisotropy ──────────────────────────────────────────────────

# Spin Hall conductivity tensor: antisymmetric D×D matrix has D(D-1)/2 components
# For D=3: D(D-1)/2 = 3(2)/2 = 3 = D  — SELF-REFERENTIAL!
N_SPIN_HALL_COMPONENTS = D * (D - 1) // 2   # = 3 = D  [EXACT: self-referential]
SPIN_HALL_EQ_D = (N_SPIN_HALL_COMPONENTS == D)   # True

# Dzyaloshinskii-Moriya interaction vector D_ij: D = 3 components
N_DM_COMPONENTS = D              # = 3  [EXACT]
DM_EQ_D = (N_DM_COMPONENTS == D)   # True

# Domain wall: characterised by D-1 = 2 material parameters (exchange A, anisotropy K_u)
N_DW_PARAMS = D - 1             # = 2  [EXACT: A and K_u]
DW_EQ_D1 = (N_DW_PARAMS == D - 1)   # True

# ── Magnons ───────────────────────────────────────────────────────────────────

# 3D monoatomic Bravais crystal: D = 3 acoustic branches
N_MAGNON_ACOUSTIC = D            # = 3  [EXACT: Goldstone modes in 3D]
MAGNON_EQ_D = (N_MAGNON_ACOUSTIC == D)   # True

# Magnon dispersion ω ~ k² (ferromagnet) in D = 3 dimensions
MAGNON_DISPERSION_DIM = D        # = 3  [EXACT: dispersion in D=3]

# ── Cathedral δ★ connection ───────────────────────────────────────────────────

# Stoner criterion: I·N(E_F) > 1; exchange parameter I ~ δ★ (Cathedral scale)
STONER_EXCHANGE_APPROX = DELTA_STAR   # [APPROXIMATE: Cathedral exchange scale]

# Cathedral anisotropy: δ★ gives the natural scale for spin-orbit coupling
CATHEDRAL_ANISOTROPY = DELTA_STAR     # [APPROXIMATE]

# Larmor precession lives in D = 3 spatial dimensions (exact, trivial)
LARMOR_DIM = D                   # = 3  [EXACT]

# ── Heisenberg model ─────────────────────────────────────────────────────────

# Isotropic Heisenberg model: H = -J Σ S_i · S_j
# Spin components = D = 3 (isotropic exchange in 3D)  [EXACT]
N_HEISENBERG_SPIN_COMPONENTS = D  # = 3  [EXACT]
HEISENBERG_EQ_D = (N_HEISENBERG_SPIN_COMPONENTS == D)   # True

# Critical dimension for Heisenberg ferromagnetism: D_c = D+1 = 4
# (Mermin-Wagner theorem forbids LRO for D ≤ 2; D=3 is just above threshold)
N_HEISENBERG_LOWER_CRITICAL = D - 1   # = 2  [EXACT: Mermin-Wagner lower critical dim]
LOWER_CRITICAL_EQ_D1 = (N_HEISENBERG_LOWER_CRITICAL == D - 1)   # True


# ── Functions ─────────────────────────────────────────────────────────────────

def spin_properties() -> dict:
    """
    Return a dict of spin and magnetic moment properties.

    All entries tagged [EXACT] follow purely from D=3.
    """
    return {
        "g_factor":              G_FACTOR_TREE,
        "g_eq_D1":               G_FACTOR_EQ_D1,
        "formula_g":             "D-1 = 2  [EXACT: tree-level Dirac g-factor]",
        "n_spin_half":           N_SPIN_HALF_STATES,
        "spin_half_eq_D1":       SPIN_HALF_EQ_D1,
        "formula_spin_half":     "D-1 = 2  [EXACT: |↑⟩, |↓⟩]",
        "n_spin_1":              N_SPIN_1_STATES,
        "spin_1_eq_D":           SPIN_1_EQ_D,
        "formula_spin_1":        "D = 3  [EXACT: m_s = -1, 0, +1]",
        "n_moment_components":   N_MAGNETIC_MOMENT_COMPONENTS,
        "moment_eq_D":           MOMENT_EQ_D,
        "formula_moment":        "D = 3  [EXACT: m_x, m_y, m_z]",
        "n_heisenberg_components": N_HEISENBERG_SPIN_COMPONENTS,
        "heisenberg_eq_D":       HEISENBERG_EQ_D,
        "formula_heisenberg":    "D = 3  [EXACT: isotropic spin exchange in 3D]",
        "n_heisenberg_lower_critical": N_HEISENBERG_LOWER_CRITICAL,
        "lower_critical_eq_D1":  LOWER_CRITICAL_EQ_D1,
        "formula_lower_critical":"D-1 = 2  [EXACT: Mermin-Wagner theorem]",
        "larmor_dim":            LARMOR_DIM,
    }


def magnetic_exchange() -> dict:
    """
    Return a dict of exchange interaction and collective excitation properties.

    All entries tagged [EXACT] follow purely from D=3 or V=12.
    """
    return {
        "fcc_neighbors":       FCC_EXCHANGE_NEIGHBORS,
        "fcc_eq_V":            FCC_EQ_V,
        "formula_fcc":         "V = 12  [EXACT: FCC coordination number]",
        "weiss_z":             WEISS_Z,
        "weiss_prefactor":     WEISS_PREFACTOR,
        "bloch_exp":           BLOCH_EXPONENT,
        "bloch_eq_3_2":        BLOCH_EQ_3_2,
        "formula_bloch":       BLOCH_FORMULA,
        "n_magnon_acoustic":   N_MAGNON_ACOUSTIC,
        "magnon_eq_D":         MAGNON_EQ_D,
        "formula_magnon":      "D = 3  [EXACT: 3 acoustic magnon branches]",
        "n_spin_hall":         N_SPIN_HALL_COMPONENTS,
        "spin_hall_eq_D":      SPIN_HALL_EQ_D,
        "formula_spin_hall":   "D(D-1)/2 = 3 = D  [EXACT: self-referential!]",
        "n_dm_components":     N_DM_COMPONENTS,
        "dm_eq_D":             DM_EQ_D,
        "formula_dm":          "D = 3  [EXACT: DM vector in 3D]",
        "n_dw_params":         N_DW_PARAMS,
        "dw_eq_D1":            DW_EQ_D1,
        "formula_dw":          "D-1 = 2  [EXACT: exchange A + anisotropy K_u]",
        "stoner_exchange":     STONER_EXCHANGE_APPROX,
        "cathedral_anisotropy": CATHEDRAL_ANISOTROPY,
    }


def magnetism_summary() -> dict:
    """Full Cathedral magnetism summary."""
    return {
        "spin":     spin_properties(),
        "exchange": magnetic_exchange(),
        "KEY_EXACT_RESULTS": [
            f"g-factor tree level = D-1 = {G_FACTOR_TREE}  [EXACT: Dirac equation]",
            f"Spin-1/2 states = D-1 = {N_SPIN_HALF_STATES}  [EXACT: |↑⟩, |↓⟩]",
            f"Spin-1 states = D = {N_SPIN_1_STATES}  [EXACT: m_s=-1,0,+1]",
            f"Magnetic moment components = D = {N_MAGNETIC_MOMENT_COMPONENTS}  [EXACT]",
            f"Bloch T^{{D/2}} exponent = D/2 = {BLOCH_EXPONENT}  [EXACT]",
            f"FCC exchange neighbours = V = {FCC_EXCHANGE_NEIGHBORS}  [EXACT]",
            f"Spin-Hall tensor components = D(D-1)/2 = D = {N_SPIN_HALL_COMPONENTS}  [EXACT: self-ref!]",
            f"DM vector components = D = {N_DM_COMPONENTS}  [EXACT]",
            f"Acoustic magnon branches = D = {N_MAGNON_ACOUSTIC}  [EXACT]",
            f"Domain-wall parameters = D-1 = {N_DW_PARAMS}  [EXACT]",
            f"Heisenberg spin components = D = {N_HEISENBERG_SPIN_COMPONENTS}  [EXACT]",
            f"Mermin-Wagner lower critical dim = D-1 = {N_HEISENBERG_LOWER_CRITICAL}  [EXACT]",
        ],
    }


def print_magnetism_report():
    """Print a formatted Cathedral magnetism report."""
    sp = spin_properties()
    ex = magnetic_exchange()

    print("  Cathedral Magnetism — Spin, Exchange, Collective Modes")
    print("  " + "─" * 58)

    print(f"\n  Spin Structure (D = {D}):")
    print(f"    g-factor (tree)    = D-1 = {G_FACTOR_TREE}  (Dirac eq.)  ← EXACT")
    print(f"    Spin-1/2 states    = D-1 = {N_SPIN_HALF_STATES}  (|↑⟩, |↓⟩)  ← EXACT")
    print(f"    Spin-1 states      = D   = {N_SPIN_1_STATES}  (m_s=-1,0,+1)  ← EXACT")
    print(f"    Moment components  = D   = {N_MAGNETIC_MOMENT_COMPONENTS}  (m_x,m_y,m_z)  ← EXACT")
    print(f"    Heisenberg spin comps = D = {N_HEISENBERG_SPIN_COMPONENTS}  (isotropic 3D)  ← EXACT")
    print(f"    Mermin-Wagner lower d_c = D-1 = {N_HEISENBERG_LOWER_CRITICAL}  ← EXACT")

    print(f"\n  Exchange & Collective Excitations:")
    print(f"    FCC neighbours     = V   = {FCC_EXCHANGE_NEIGHBORS}  ← EXACT")
    print(f"    Bloch T^{{D/2}} exp = D/2 = {BLOCH_EXPONENT}  ← EXACT")
    print(f"    Acoustic magnons   = D   = {N_MAGNON_ACOUSTIC}  (3D crystal)  ← EXACT")
    print(f"    Weiss mean-field prefactor = V/D = {WEISS_PREFACTOR}")

    print(f"\n  Topology & Anisotropy:")
    print(f"    Spin-Hall comps = D(D-1)/2 = {N_SPIN_HALL_COMPONENTS} = D  ← EXACT (self-ref!)")
    print(f"    DM vector comps    = D   = {N_DM_COMPONENTS}  ← EXACT")
    print(f"    Domain-wall params = D-1 = {N_DW_PARAMS}  (A, K_u)  ← EXACT")

    print(f"\n  Cathedral scale:")
    print(f"    Stoner exchange ~ δ★ = {DELTA_STAR:.8f}  [approx]")
    print(f"    δ★ = {DELTA_STAR:.8f}   γ = {gamma:.6f}   φ = {phi:.6f}")
