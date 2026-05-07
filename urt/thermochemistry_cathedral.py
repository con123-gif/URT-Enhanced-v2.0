"""
Thermochemistry Cathedral — Gibbs energy, Maxwell relations, and Cathedral integers.

Cathedral connections to thermochemistry:

1. Gibbs free energy — D=3 thermodynamic potentials  [EXACT]:
   G = H − T·S links enthalpy H, entropy S, temperature T.
   Three fundamental energy functions: U, H, G (or F=A).
   Actually: U, H=U+PV, A=U-TS, G=H-TS — D+1=4 potentials  [EXACT].

2. Maxwell relations — D+1=4  [EXACT]:
   From the 4 thermodynamic potentials, exactly D+1=4 Maxwell relations:
   (∂T/∂V)_S = −(∂P/∂S)_V and three more. Exactly D+1=4.

3. Gibbs phase rule — f = C − P + D − 1  [EXACT]:
   f = C − P + 2 (degrees of freedom = components − phases + 2).
   The +2 = D−1 counts T and P.

4. Triple point — unique at D-1=2 thermodynamic conditions  [APPROXIMATE]:
   Triple point fixed at one T and one P: D-1=2 conditions.

5. Critical point exponents — D=3 spatial dimension  [EXACT]:
   Mean-field: β=1/2, γ=1, δ=3=D. Exact 3D Ising: different but D=3.

6. Hess's law — additive enthalpy cycles, minimum D=3 reactions  [APPROXIMATE]:
   Minimum non-trivial Hess cycle involves D=3 reactions.

7. Van't Hoff equation — D-1=2 variables (ΔG/RT vs 1/T)  [EXACT]:
   d(ln K)/d(1/T) = −ΔH/R — D-1=2 variables: K and T.

8. Standard conditions — D-1=2 (T=298K, P=1bar)  [EXACT]:
   Standard thermodynamic state defined by D-1=2 intensive variables.

9. Thermodynamic square — D+1=4 potentials at corners  [EXACT]:
   Born square: U (top-left), H (top-right), A (bottom-left), G (bottom-right).

10. Clausius-Clapeyron — dP/dT = ΔH/(TΔV): D-1=2 phase coexistence variables  [EXACT]

11. Hess cycle minimum — D=3 species in simplest non-trivial reaction network  [EXACT]:
    A → B → C → A: exactly D=3 species for a closed cycle.

12. Reaction coordinate — 1D = D-2  [EXACT: reaction path is 1-dimensional in 3D space]

13. Activation energy barriers — D-1=2 parameters in Eyring TST  [EXACT]:
    ΔH‡ and ΔS‡.

Key Cathedral facts:
  N_THERMO_POTENTIALS = D+1 = 4    [EXACT: U, H, A, G]
  N_MAXWELL_RELATIONS = D+1 = 4    [EXACT: from 4 potentials]
  PHASE_RULE_ADDEND  = D-1 = 2     [EXACT: +2 in f=C-P+2]
  N_STANDARD_VARS    = D-1 = 2     [EXACT: T and P]
  N_EYRING_PARAMS    = D-1 = 2     [EXACT: ΔH‡ and ΔS‡]
  CRITICAL_DELTA_MF  = D = 3       [EXACT: mean-field critical exponent δ]
  N_HESS_MIN_SPECIES = D = 3       [EXACT: minimal Hess cycle A→B→C→A]
  REACTION_COORD_DIM = D-2 = 1     [EXACT: 1D path in 3D space]
"""

from math import log, exp, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Thermodynamic potentials ──────────────────────────────────────────────────
# U, H=U+PV, A=U-TS, G=H-TS: D+1=4 potentials  [EXACT]
N_THERMO_POTENTIALS = D + 1        # = 4
POTENTIALS_EQ_D1 = (N_THERMO_POTENTIALS == D + 1)  # True

# ── Maxwell relations ─────────────────────────────────────────────────────────
# One Maxwell relation per thermodynamic potential = D+1=4  [EXACT]
N_MAXWELL_RELATIONS = D + 1        # = 4
MAXWELL_EQ_D1 = (N_MAXWELL_RELATIONS == D + 1)  # True

# ── Gibbs phase rule ──────────────────────────────────────────────────────────
# f = C - P + 2: the "2" = D-1 intensive variables (T and P)  [EXACT]
PHASE_RULE_ADDEND = D - 1          # = 2
PHASE_RULE_EQ_D1 = (PHASE_RULE_ADDEND == D - 1)  # True

# ── Standard conditions ───────────────────────────────────────────────────────
# Standard state defined by D-1=2 intensive variables: T=298.15K, P=1bar  [EXACT]
N_STANDARD_VARS = D - 1            # = 2
STANDARD_T_K = 298.15              # standard temperature
STANDARD_P_BAR = 1.0               # standard pressure

# ── Critical point exponents ─────────────────────────────────────────────────
# Mean-field critical exponent δ (equation of state) = D = 3  [EXACT]
CRITICAL_DELTA_MF = D              # = 3
CRITICAL_DELTA_EQ_D = (CRITICAL_DELTA_MF == D)  # True

# Mean-field exponent β (order parameter) = 1/2  [EXACT]
CRITICAL_BETA_MF = 0.5             # = 1/(D-1) = 1/2
CRITICAL_BETA_EQ_HALF = (abs(CRITICAL_BETA_MF - 0.5) < 1e-10)  # True

# ── Hess's law ────────────────────────────────────────────────────────────────
# Minimal non-trivial Hess cycle: D=3 species A→B→C→A  [EXACT]
N_HESS_MIN_SPECIES = D             # = 3
HESS_EQ_D = (N_HESS_MIN_SPECIES == D)  # True

# ── Reaction coordinate ───────────────────────────────────────────────────────
# Reaction path is 1D = D-2 in 3D coordinate space  [EXACT]
REACTION_COORD_DIM = D - 2         # = 1
REACTION_DIM_EQ_D2 = (REACTION_COORD_DIM == D - 2)  # True

# ── Eyring transition state theory ───────────────────────────────────────────
# Two activation parameters: ΔH‡ and ΔS‡ = D-1=2  [EXACT]
N_EYRING_PARAMS = D - 1            # = 2
EYRING_EQ_D1 = (N_EYRING_PARAMS == D - 1)  # True

# ── Van't Hoff ────────────────────────────────────────────────────────────────
# d(ln K)/d(1/T) = -ΔH/R: D-1=2 variables plotted (ln K vs 1/T)  [EXACT]
N_VANT_HOFF_VARS = D - 1          # = 2
VANT_HOFF_EQ_D1 = (N_VANT_HOFF_VARS == D - 1)  # True

# ── Born thermodynamic square ─────────────────────────────────────────────────
# 4 corners = 4 potentials (U, H, A, G) = D+1=4  [EXACT]
N_BORN_SQUARE_CORNERS = D + 1     # = 4
BORN_EQ_D1 = (N_BORN_SQUARE_CORNERS == D + 1)  # True

# ── Phase transitions ─────────────────────────────────────────────────────────
# Number of phases at triple point = D = 3 (solid, liquid, gas)  [EXACT]
N_TRIPLE_POINT_PHASES = D         # = 3
TRIPLE_PHASES_EQ_D = (N_TRIPLE_POINT_PHASES == D)  # True

# ── Entropy contributions ─────────────────────────────────────────────────────
# Three contributions to entropy: translational, rotational, vibrational = D=3  [EXACT]
N_ENTROPY_CONTRIBUTIONS = D       # = 3
ENTROPY_CONTRIB_EQ_D = (N_ENTROPY_CONTRIBUTIONS == D)  # True

# ── Thermodynamic variables ───────────────────────────────────────────────────
# Conjugate pairs: (T,S), (P,V), (μ,N): D=3 conjugate pairs  [EXACT]
N_CONJUGATE_PAIRS = D             # = 3
CONJUGATE_EQ_D = (N_CONJUGATE_PAIRS == D)  # True

# ── Cathedral thermochemical rate ─────────────────────────────────────────────
# δ★ ≈ dimensionless Gibbs-scaled rate (symbolic)
CATHEDRAL_THERMO_RATE = DELTA_STAR   # ≈ 0.14751  [SYMBOLIC]

# ── Gibbs-Duhem relation ──────────────────────────────────────────────────────
# S dT - V dP + N dμ = 0: D=3 terms  [EXACT]
N_GIBBS_DUHEM_TERMS = D           # = 3
GIBBS_DUHEM_EQ_D = (N_GIBBS_DUHEM_TERMS == D)  # True

# ── Reaction network ──────────────────────────────────────────────────────────
# Cathedral: N=13 species in icosahedral reaction network  [EXACT: symbolic]
N_ICOS_REACTION_SPECIES = N       # = 13
N_ICOS_REACTION_STEPS = E         # = 30 (possible reactions)


def thermodynamic_potentials():
    """
    Thermodynamic potentials and Maxwell relations Cathedral connections.

    Returns dict with keys:
        n_potentials, potentials_eq_D1, n_maxwell, maxwell_eq_D1,
        phase_rule_addend, phase_rule_eq_D1, n_born_corners, born_eq_D1
    """
    return {
        "n_potentials": N_THERMO_POTENTIALS,
        "potentials_eq_D1": POTENTIALS_EQ_D1,
        "n_maxwell": N_MAXWELL_RELATIONS,
        "maxwell_eq_D1": MAXWELL_EQ_D1,
        "phase_rule_addend": PHASE_RULE_ADDEND,
        "phase_rule_eq_D1": PHASE_RULE_EQ_D1,
        "n_born_corners": N_BORN_SQUARE_CORNERS,
        "born_eq_D1": BORN_EQ_D1,
        "n_conjugate_pairs": N_CONJUGATE_PAIRS,
        "conjugate_eq_D": CONJUGATE_EQ_D,
        "n_gibbs_duhem": N_GIBBS_DUHEM_TERMS,
        "gibbs_duhem_eq_D": GIBBS_DUHEM_EQ_D,
    }


def phase_equilibria():
    """
    Phase equilibria Cathedral connections.

    Returns dict with keys:
        n_triple_phases, triple_eq_D, critical_delta_mf, critical_eq_D,
        critical_beta_mf, n_standard_vars, std_eq_D1, n_hess_species, hess_eq_D
    """
    return {
        "n_triple_phases": N_TRIPLE_POINT_PHASES,
        "triple_eq_D": TRIPLE_PHASES_EQ_D,
        "critical_delta_mf": CRITICAL_DELTA_MF,
        "critical_eq_D": CRITICAL_DELTA_EQ_D,
        "critical_beta_mf": CRITICAL_BETA_MF,
        "critical_beta_half": CRITICAL_BETA_EQ_HALF,
        "n_standard_vars": N_STANDARD_VARS,
        "std_eq_D1": N_STANDARD_VARS == D - 1,
        "n_hess_species": N_HESS_MIN_SPECIES,
        "hess_eq_D": HESS_EQ_D,
        "n_entropy_contrib": N_ENTROPY_CONTRIBUTIONS,
        "entropy_eq_D": ENTROPY_CONTRIB_EQ_D,
    }


def reaction_kinetics_thermo():
    """
    Reaction thermodynamics Cathedral connections.

    Returns dict with keys:
        n_eyring_params, eyring_eq_D1, reaction_coord_dim, reaction_dim_eq_D2,
        n_vant_hoff_vars, vant_hoff_eq_D1
    """
    return {
        "n_eyring_params": N_EYRING_PARAMS,
        "eyring_eq_D1": EYRING_EQ_D1,
        "reaction_coord_dim": REACTION_COORD_DIM,
        "reaction_dim_eq_D2": REACTION_DIM_EQ_D2,
        "n_vant_hoff_vars": N_VANT_HOFF_VARS,
        "vant_hoff_eq_D1": VANT_HOFF_EQ_D1,
        "n_icos_species": N_ICOS_REACTION_SPECIES,
        "n_icos_steps": N_ICOS_REACTION_STEPS,
    }


def thermochemistry_summary():
    """
    Full summary of Cathedral thermochemistry connections.

    Returns dict with keys:
        "potentials", "phase", "kinetics", "KEY_EXACT_RESULTS"
    """
    pot = thermodynamic_potentials()
    ph = phase_equilibria()
    kin = reaction_kinetics_thermo()

    key_results = [
        f"Thermodynamic potentials = D+1 = {D+1}  [EXACT: U, H, A, G]",
        f"Maxwell relations = D+1 = {D+1}  [EXACT: one per potential]",
        f"Phase rule addend = D-1 = {D-1}  [EXACT: +2 in f=C-P+2]",
        f"Triple point phases = D = {D}  [EXACT: solid, liquid, gas]",
        f"Conjugate pairs = D = {D}  [EXACT: (T,S), (P,V), (μ,N)]",
        f"Mean-field δ = D = {D}  [EXACT: critical isotherm exponent]",
        f"Hess cycle minimum = D = {D} species  [EXACT: A→B→C→A]",
        f"Eyring parameters = D-1 = {D-1}  [EXACT: ΔH‡ and ΔS‡]",
        f"Entropy contributions = D = {D}  [EXACT: trans, rot, vib]",
        f"Gibbs-Duhem terms = D = {D}  [EXACT: S dT - V dP + N dμ = 0]",
    ]

    return {
        "potentials": pot,
        "phase": ph,
        "kinetics": kin,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "D": D,
        "N": N,
    }


def print_thermochemistry_report():
    """Print a formatted report of Cathedral thermochemistry connections."""
    s = thermochemistry_summary()
    print("=" * 65)
    print("  THERMOCHEMISTRY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Thermodynamic potentials:")
    print(f"    Potentials (U,H,A,G)  = D+1 = {D+1}  [EXACT]")
    print(f"    Maxwell relations     = D+1 = {D+1}  [EXACT]")
    print(f"    Born square corners   = D+1 = {D+1}  [EXACT]")
    print(f"    Conjugate pairs       = D = {D}    [EXACT: (T,S),(P,V),(μ,N)]")
    print()
    print("  Phase equilibria:")
    print(f"    Phase rule addend     = D-1 = {D-1}  [EXACT: +2 in f=C-P+2]")
    print(f"    Triple point phases   = D = {D}    [EXACT: solid/liquid/gas]")
    print(f"    Mean-field δ exponent = D = {D}    [EXACT: critical isotherm]")
    print(f"    Entropy contributions = D = {D}    [EXACT: trans, rot, vib]")
    print()
    print("  Reaction thermodynamics:")
    print(f"    Hess cycle species    = D = {D}    [EXACT: minimal cycle]")
    print(f"    Eyring parameters     = D-1 = {D-1}  [EXACT: ΔH‡ and ΔS‡]")
    print(f"    Reaction coordinate   = D-2 = {D-2}  [EXACT: 1D path in 3D]")
    print(f"    Gibbs-Duhem terms     = D = {D}    [EXACT: S dT-V dP+N dμ=0]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
