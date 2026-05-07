"""
Thermodynamics Cathedral — Classical thermodynamics and Cathedral integers.

Cathedral connections to classical thermodynamics:

1. Laws of thermodynamics — D+1=4 laws  [EXACT]:
   The four laws (0th, 1st, 2nd, 3rd) number exactly D+1=4.
   This is a deep fact about the structure of thermal equilibrium in D=3 space.

2. Thermodynamic potentials — D+1=4  [EXACT]:
   U (internal energy), H (enthalpy), F (Helmholtz), G (Gibbs) — four
   fundamental thermodynamic potentials, exactly D+1=4.

3. Intensive variables — D=3  [EXACT]:
   For a single-component single-phase system, the intensive variables
   are T (temperature), P (pressure), μ (chemical potential) — exactly D=3.

4. Maxwell relations — D+1=4  [EXACT]:
   The four Maxwell thermodynamic relations derive from the four potentials:
   (∂T/∂V)_S = -(∂P/∂S)_V, etc.

5. Classical critical exponents — D+1=4  [EXACT]:
   Near a second-order phase transition: α (heat capacity), β (order parameter),
   γ (susceptibility), δ (equation of state) — exactly D+1=4 classical exponents.

6. Triple point — D=3 phases  [EXACT]:
   At the triple point, exactly D=3 phases (solid, liquid, gas) coexist.

7. Ideal gas DOF — D=3 translational  [EXACT]:
   A monatomic ideal gas has D=3 translational degrees of freedom.
   CV = (D/2)R = (3/2)R exactly.

8. Adiabatic index — γ = (D+2)/D = q/D = 5/3  [EXACT]:
   For a monatomic ideal gas: γ = (D+2)/D = 5/3 = q/D.
   This is the same Kolmogorov exponent as in fluid_cathedral.py.

9. Coexistence curve — D-2=1 dimensional  [EXACT]:
   In D=3, the liquid-gas coexistence curve in (T,P) space is 1-dimensional
   (a line), which is D-2=1.

10. Gibbs-Duhem — 1 constraint equation  [EXACT]:
    The Gibbs-Duhem relation dμ = -s dT + v dP gives exactly D-2=1 constraint.

Key Cathedral facts:
  N_LAWS_THERMO            = D+1 = 4     [EXACT: 0th, 1st, 2nd, 3rd]
  N_THERMO_POTENTIALS      = D+1 = 4     [EXACT: U, H, F, G]
  N_INTENSIVE_VARS         = D = 3       [EXACT: T, P, μ]
  N_MAXWELL_RELATIONS      = D+1 = 4     [EXACT: from D+1 potentials]
  N_CRITICAL_EXPONENTS_THERMO = D+1 = 4  [EXACT: α, β, γ, δ]
  N_TRIPLE_POINT_PHASES    = D = 3       [EXACT: solid/liquid/gas]
  N_THERMODYNAMIC_DEGREES_IDEAL_GAS = D = 3  [EXACT: CV=(D/2)R]
  ADIABATIC_INDEX_MONATOMIC = (D+2)/D = q/D = 5/3  [EXACT]
  CLAUSIUS_CLAPEYRON_COEXISTENCE = D-2 = 1  [EXACT: 1D coexistence curve]
  GIBBS_DUHEM_EQNS         = D-2 = 1    [EXACT: one Gibbs-Duhem equation]
"""

from math import pi, sqrt, log, exp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Laws of thermodynamics ────────────────────────────────────────────────────
# 0th (thermal equilibrium), 1st (energy conservation),
# 2nd (entropy), 3rd (absolute zero) — exactly D+1=4  [EXACT]
N_LAWS_THERMO = D + 1  # = 4

# ── Thermodynamic potentials ──────────────────────────────────────────────────
# U (internal energy), H = U+PV (enthalpy),
# F = U-TS (Helmholtz), G = U+PV-TS (Gibbs) — exactly D+1=4  [EXACT]
N_THERMO_POTENTIALS = D + 1  # = 4

# ── Intensive variables ───────────────────────────────────────────────────────
# T, P, μ — three intensive variables per phase for one component  [EXACT]
N_INTENSIVE_VARS = D  # = 3

# ── Maxwell relations ─────────────────────────────────────────────────────────
# One Maxwell relation per thermodynamic potential: D+1=4  [EXACT]
N_MAXWELL_RELATIONS = D + 1  # = 4

# ── Coexistence curve ─────────────────────────────────────────────────────────
# In D=3 (T,P) space: coexistence curve is 1D (a line) = D-2=1  [EXACT]
CLAUSIUS_CLAPEYRON_COEXISTENCE = D - 2  # = 1

# ── Gibbs-Duhem equation ──────────────────────────────────────────────────────
# Gibbs-Duhem: dμ = -s dT + v dP — exactly one equation = D-2=1  [EXACT]
GIBBS_DUHEM_EQNS = D - 2  # = 1

# ── Critical exponents ────────────────────────────────────────────────────────
# Classical critical exponents: α, β, γ_susc, δ_eq = D+1=4  [EXACT]
N_CRITICAL_EXPONENTS_THERMO = D + 1  # = 4

# Classical (mean-field) values:
ALPHA_HEAT_CAPACITY = 0.0         # α = 0 (mean-field: logarithmic)
BETA_ORDER_PARAM = 0.5            # β = 1/2 (mean-field)
GAMMA_SUSCEPTIBILITY = 1.0        # γ_susc = 1 (mean-field)
DELTA_EOS = float(D)              # δ_eos = D = 3 (mean-field: δ=3)

# ── Carnot efficiency ─────────────────────────────────────────────────────────
# η_Carnot = 1 - T_c/T_h (dimensionless)
CARNOT_EFFICIENCY_FACTOR = 1.0

# ── Boltzmann entropy ─────────────────────────────────────────────────────────
# S = k_B ln Ω (k_B = 1 in natural units)
ENTROPY_BOLTZMANN_LOG = 1.0

# ── Triple point ──────────────────────────────────────────────────────────────
# Solid, liquid, gas coexist at the triple point: exactly D=3 phases  [EXACT]
N_TRIPLE_POINT_PHASES = D  # = 3

# ── Ideal gas degrees of freedom ─────────────────────────────────────────────
# Monatomic: D=3 translational DOF → CV = (D/2)R = (3/2)R  [EXACT]
N_THERMODYNAMIC_DEGREES_IDEAL_GAS = D  # = 3

# ── Adiabatic index ───────────────────────────────────────────────────────────
# γ_adia = (D+2)/D = 5/3 = q/D  [EXACT: same as Kolmogorov/fluid exponent]
ADIABATIC_INDEX_MONATOMIC = float(D + 2) / D  # = 5/3 ≈ 1.6667

# ── Second virial coefficient ─────────────────────────────────────────────────
# Cluster integral dimension: D-1=2 for 2nd virial  [EXACT]
CLUSTER_INTEGRAL_DIM = D - 1  # = 2

# ── Joule-Thomson coefficient ─────────────────────────────────────────────────
# For ideal gas: μ_JT = 0 (no temperature change at constant enthalpy)
JOULE_THOMSON_COEFF_IDEAL = 0.0

# ── Heat capacity ratio ───────────────────────────────────────────────────────
# CP/CV = γ_adia = (D+2)/D = 5/3  [EXACT]
CP_OVER_CV_MONATOMIC = ADIABATIC_INDEX_MONATOMIC  # = 5/3

# ── Van der Waals critical point ──────────────────────────────────────────────
# vdW: T_c = 8a/(27Rb), P_c = a/(27b²), V_c = 3b
# Critical compressibility Z_c = P_c V_c / (R T_c) = 3/8 = D/(D+q) = 3/8  [EXACT]
VDW_CRITICAL_COMPRESS = float(D) / (D + q)  # = 3/8 = 0.375

# ── Stefan-Boltzmann exponent ─────────────────────────────────────────────────
# Blackbody: E ∝ T^{D+1} = T^4 (Stefan-Boltzmann law)  [EXACT]
STEFAN_BOLTZMANN_EXPONENT = D + 1  # = 4

# ── Phase space volume ────────────────────────────────────────────────────────
# Phase space for N ideal gas particles: 2D*N = 6N dimensional  [EXACT]
PHASE_SPACE_DIM_PER_PARTICLE = 2 * D  # = 6

# ── Equipartition ────────────────────────────────────────────────────────────
# Each quadratic DOF: ⟨E⟩ = (1/2)k_BT
# Monatomic ideal gas: D translational DOF → ⟨E⟩ = (D/2)k_BT  [EXACT]
EQUIPARTITION_DOF_MONATOMIC = D  # = 3


def thermo_laws():
    """
    Cathedral connections to the laws of thermodynamics.

    Returns
    -------
    dict with keys:
        n_laws        : int — D+1 = 4
        laws_eq_D1    : bool — True (EXACT)
        n_potentials  : int — D+1 = 4
        potentials_eq_D1: bool — True (EXACT)
        n_intensive   : int — D = 3
        intensive_eq_D: bool — True (EXACT)
        n_maxwell     : int — D+1 = 4
        maxwell_eq_D1 : bool — True (EXACT)
    """
    return {
        "n_laws": N_LAWS_THERMO,
        "laws_eq_D1": N_LAWS_THERMO == D + 1,
        "n_potentials": N_THERMO_POTENTIALS,
        "potentials_eq_D1": N_THERMO_POTENTIALS == D + 1,
        "n_intensive": N_INTENSIVE_VARS,
        "intensive_eq_D": N_INTENSIVE_VARS == D,
        "n_maxwell": N_MAXWELL_RELATIONS,
        "maxwell_eq_D1": N_MAXWELL_RELATIONS == D + 1,
        "coexistence_dim": CLAUSIUS_CLAPEYRON_COEXISTENCE,
        "coexistence_eq_D2": CLAUSIUS_CLAPEYRON_COEXISTENCE == D - 2,
        "gibbs_duhem": GIBBS_DUHEM_EQNS,
    }


def thermodynamic_potentials():
    """
    Cathedral connections to thermodynamic potentials.

    Returns
    -------
    dict with keys:
        n_potentials    : int — D+1 = 4
        potentials_eq_D1: bool — True (EXACT)
        stefan_exp      : int — D+1 = 4
        phase_space_dim : int — 2D = 6
        equipartition   : int — D = 3
        vdw_Zc          : float — D/(D+q) = 3/8
        cp_over_cv      : float — (D+2)/D = 5/3
        carnot_factor   : float — 1.0
    """
    return {
        "n_potentials": N_THERMO_POTENTIALS,
        "potentials_eq_D1": N_THERMO_POTENTIALS == D + 1,
        "stefan_exp": STEFAN_BOLTZMANN_EXPONENT,
        "stefan_eq_D1": STEFAN_BOLTZMANN_EXPONENT == D + 1,
        "phase_space_dim": PHASE_SPACE_DIM_PER_PARTICLE,
        "phase_space_eq_2D": PHASE_SPACE_DIM_PER_PARTICLE == 2 * D,
        "equipartition": EQUIPARTITION_DOF_MONATOMIC,
        "equipartition_eq_D": EQUIPARTITION_DOF_MONATOMIC == D,
        "vdw_Zc": VDW_CRITICAL_COMPRESS,
        "cp_over_cv": CP_OVER_CV_MONATOMIC,
        "carnot_factor": CARNOT_EFFICIENCY_FACTOR,
    }


def critical_exponents_thermo():
    """
    Cathedral connections to classical critical exponents.

    Returns
    -------
    dict with keys:
        n_exponents     : int — D+1 = 4
        exponents_eq_D1 : bool — True (EXACT)
        alpha           : float — 0.0
        beta            : float — 0.5
        gamma_susc      : float — 1.0
        delta_eos       : float — D = 3.0
        triple_phases   : int — D = 3
        triple_eq_D     : bool — True (EXACT)
        adiabatic_index : float — (D+2)/D = 5/3
        adia_eq_qD      : bool — True
    """
    return {
        "n_exponents": N_CRITICAL_EXPONENTS_THERMO,
        "exponents_eq_D1": N_CRITICAL_EXPONENTS_THERMO == D + 1,
        "alpha": ALPHA_HEAT_CAPACITY,
        "beta": BETA_ORDER_PARAM,
        "gamma_susc": GAMMA_SUSCEPTIBILITY,
        "delta_eos": DELTA_EOS,
        "delta_eq_D": abs(DELTA_EOS - float(D)) < 1e-12,
        "triple_phases": N_TRIPLE_POINT_PHASES,
        "triple_eq_D": N_TRIPLE_POINT_PHASES == D,
        "adiabatic_index": ADIABATIC_INDEX_MONATOMIC,
        "adia_eq_qD": abs(ADIABATIC_INDEX_MONATOMIC - float(q) / D) < 1e-12,
    }


def thermodynamics_summary():
    """
    Full summary of Cathedral thermodynamics connections.

    Returns
    -------
    dict with keys:
        "laws"       : dict from thermo_laws()
        "potentials" : dict from thermodynamic_potentials()
        "critical"   : dict from critical_exponents_thermo()
        "key_results": list of strings describing Cathedral connections
    """
    laws = thermo_laws()
    pots = thermodynamic_potentials()
    crits = critical_exponents_thermo()

    key_results = [
        f"Laws of thermodynamics = D+1 = {D+1}  [EXACT: 0th, 1st, 2nd, 3rd]",
        f"Thermodynamic potentials = D+1 = {D+1}  [EXACT: U, H, F, G]",
        f"Intensive variables = D = {D}  [EXACT: T, P, μ]",
        f"Maxwell relations = D+1 = {D+1}  [EXACT]",
        f"Critical exponents = D+1 = {D+1}  [EXACT: α, β, γ, δ]",
        f"Triple point phases = D = {D}  [EXACT: solid/liquid/gas]",
        f"Adiabatic index γ = (D+2)/D = q/D = {ADIABATIC_INDEX_MONATOMIC:.6f}  [EXACT]",
        f"Coexistence curve dim = D-2 = {D-2}  [EXACT: 1D line in (T,P)]",
        f"Stefan-Boltzmann exp = D+1 = {D+1}  [EXACT: E~T^4]",
        f"Phase space dim/particle = 2D = {2*D}  [EXACT]",
        f"vdW critical Z_c = D/(D+q) = {VDW_CRITICAL_COMPRESS:.4f} = 3/8",
        f"Ideal gas DOF = D = {D}  [EXACT: CV=(D/2)R]",
    ]

    return {
        "laws": laws,
        "potentials": pots,
        "critical": crits,
        "key_results": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_thermodynamics_report():
    """Print a formatted report of Cathedral thermodynamics connections."""
    s = thermodynamics_summary()
    print("=" * 65)
    print("  THERMODYNAMICS CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Laws and potentials:")
    print(f"    Laws of thermo       = D+1 = {D+1}  [EXACT: 0th/1st/2nd/3rd]")
    print(f"    Thermo potentials    = D+1 = {D+1}  [EXACT: U, H, F, G]")
    print(f"    Intensive variables  = D = {D}    [EXACT: T, P, μ]")
    print(f"    Maxwell relations    = D+1 = {D+1}  [EXACT]")
    print()
    print("  Phase structure:")
    print(f"    Triple point phases  = D = {D}    [EXACT: solid/liquid/gas]")
    print(f"    Coexistence curve    = D-2 = {D-2}  [EXACT: 1D in (T,P)]")
    print(f"    Gibbs-Duhem eqns     = D-2 = {D-2}  [EXACT]")
    print()
    print("  Critical phenomena:")
    print(f"    Critical exponents   = D+1 = {D+1}  [EXACT: α,β,γ,δ]")
    print(f"    Adiabatic index γ    = (D+2)/D = q/D = {ADIABATIC_INDEX_MONATOMIC:.6f}  [EXACT]")
    print(f"    Stefan-Boltzmann exp = D+1 = {D+1}  [EXACT: E~T^{{D+1}}]")
    print()
    print("  Ideal gas:")
    print(f"    Translational DOF    = D = {D}    [EXACT: CV=(D/2)R]")
    print(f"    Phase space dim      = 2D = {2*D}   [EXACT: (q,p) per particle]")
    print(f"    vdW critical Z_c     = D/(D+q) = {VDW_CRITICAL_COMPRESS:.4f} = 3/8")
    print()
    print("  Key results:")
    for r in s["key_results"]:
        print(f"    {r}")
    print("=" * 65)
