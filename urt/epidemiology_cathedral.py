"""
Cathedral Epidemiology — SIR/SEIR Models, Herd Immunity, and δ★

Compartmental epidemic models and key epidemiological numbers contain
Cathedral integers in a striking way:

  SIR compartments         = D = 3          (S, I, R)            [EXACT]
  SEIR compartments        = D+1 = 4        (S, E, I, R)         [EXACT]
  Herd immunity threshold  = (D−1)/D = 2/3  (formula)            [EXACT given R₀=D]
  Measles R₀               ≈ N = 13         (R₀ ≈ 12–18 ≈ N)    [APPROXIMATE]
  Contact-tracing depth    ≈ D = 3          (trace 3 generations) [APPROXIMATE]
  Pandemic waves           ≈ D = 3          (observed 1918, COVID)[APPROXIMATE]
  Age groups (simple)      ≈ D = 3          (young/middle/old)    [APPROXIMATE]
  Mortality scaling dim    = D−1 = 2        (age + comorbidity)   [APPROXIMATE]

Key results:
  ─────────────────────────────────────────────────────────────────────
  SIR compartments = D = 3                   EXACT
  SEIR compartments = D+1 = 4                EXACT
  Herd immunity = (D−1)/D = 2/3             EXACT given R₀_herd = D
  Measles R₀ ≈ 12–18 ≈ N = 13              APPROXIMATE
  Pandemic waves ≈ D = 3                     APPROXIMATE
  ─────────────────────────────────────────────────────────────────────

Note: The SIR compartment count = D = 3 is exact arithmetic.
The herd immunity threshold = 1 − 1/R₀ is epidemiological formula;
setting R₀_conceptual = D yields threshold = (D−1)/D = 2/3 exactly.
"""

from math import sqrt, exp, isfinite
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── SIR model ────────────────────────────────────────────────────────────────
# Classic SIR: S (Susceptible), I (Infected), R (Recovered)
N_SIR_COMPARTMENTS = D       # = 3 [EXACT: three compartments]

# ── SEIR model ───────────────────────────────────────────────────────────────
# SEIR adds E (Exposed/latent) compartment before I
N_SEIR_COMPARTMENTS = D + 1  # = 4 [EXACT: four compartments]

# ── Epidemic threshold ───────────────────────────────────────────────────────
R0_CRITICAL = 1.0            # epidemic threshold (R₀ = 1)

# ── Conceptual R₀ = D = 3 → herd immunity threshold ─────────────────────────
R0_HERD_IMMUNITY = float(D)  # = 3.0 (conceptual herd-immunity reference R₀)

# ── Herd immunity threshold ──────────────────────────────────────────────────
# Standard formula: h = 1 − 1/R₀.  Setting R₀ = D = 3:
HERD_IMMUNITY_THRESHOLD = 1.0 - 1.0 / D  # = 2/3 = (D−1)/D ≈ 0.6667 [EXACT given R₀=D]

# ── Measles R₀ ──────────────────────────────────────────────────────────────
# Measles basic reproduction number ≈ 12–18; N=13 is inside this range
BASIC_REPRODUCTION_NUMBER_ICOS = N  # = 13 [APPROXIMATE]

# ── SIR phase-space dimension ────────────────────────────────────────────────
# S + I + R = N_total (1 constraint) → 2 free dimensions, but D=3 variables
SIR_PHASE_SPACE_DIM = D      # = 3 (number of state variables)

# ── Contact tracing depth ────────────────────────────────────────────────────
# Epidemiological field investigations typically trace D=3 generations
CONTACT_TRACING_DEPTH = D    # ≈ 3 [APPROXIMATE]

# ── Age groups ───────────────────────────────────────────────────────────────
# Simple age-stratified models use D=3 groups (young, middle-aged, old)
AGE_GROUPS_SIMPLE = D        # ≈ 3 [APPROXIMATE]

# ── Pandemic waves ───────────────────────────────────────────────────────────
# Many historical pandemics exhibit ≈ D=3 major waves (1918 flu, COVID-19)
N_PANDEMIC_WAVES = D         # ≈ 3 [APPROXIMATE]

# ── Mortality scaling dimension ──────────────────────────────────────────────
# Log-mortality risk scales primarily with D−1=2 key variables: age, comorbidity
MORTALITY_SCALING_DIM = D - 1  # = 2 [APPROXIMATE]

# ── Cathedral δ★-linked endemic equilibrium ─────────────────────────────────
# In a simple SIS model the endemic equilibrium fraction infected:
#   I★ = 1 − 1/R₀.  With R₀ = 1/δ★ ≈ 6.78:
ENDEMIC_INFECTED_FRAC = 1.0 - DELTA_STAR   # ≈ 0.8525 (I★ for R₀ = 1/δ★)
R0_DELTA_STAR = 1.0 / DELTA_STAR            # ≈ 6.779 (R₀ such that I★ = 1−δ★)

# ── Serial interval scaling ──────────────────────────────────────────────────
# Serial interval ∝ 1/γ_recover; number of infectious periods ≈ D=3 per cycle
N_INFECTIOUS_PERIODS = D     # ≈ 3 [APPROXIMATE]


# ── Functions ─────────────────────────────────────────────────────────────────

def sir_model() -> dict:
    """
    Classic SIR model — Cathedral connection summary.

    The SIR model partitions the population into exactly D=3 compartments:
    Susceptible, Infected, Recovered.

    Returns
    -------
    dict
        n_compartments, n_compartments_eq_D, equations, note.
    """
    return {
        "n_compartments":     N_SIR_COMPARTMENTS,
        "n_compartments_eq_D": N_SIR_COMPARTMENTS == D,
        "compartments":       ["S (Susceptible)", "I (Infected)", "R (Recovered)"],
        "n_compartments_formula": "D = 3",
        "dS_dt":              "−β·S·I",
        "dI_dt":              "+β·S·I − γ·I",
        "dR_dt":              "+γ·I",
        "basic_reproduction": "R₀ = β/γ",
        "epidemic_threshold": R0_CRITICAL,
        "note": (
            f"SIR has exactly D={D} compartments — EXACT arithmetic coincidence. "
            "The spatial dimension D=3 equals the number of SIR state variables."
        ),
        "status": "EXACT: N_SIR = D = 3",
    }


def seir_model() -> dict:
    """
    SEIR model with latent (Exposed) compartment — Cathedral connection.

    SEIR adds E (Exposed/latent) giving D+1=4 compartments.

    Returns
    -------
    dict
        n_compartments, n_compartments_eq_D1, note.
    """
    return {
        "n_compartments":       N_SEIR_COMPARTMENTS,
        "n_compartments_eq_D1": N_SEIR_COMPARTMENTS == D + 1,
        "compartments":         [
            "S (Susceptible)", "E (Exposed)",
            "I (Infected)", "R (Recovered)"
        ],
        "n_compartments_formula": "D+1 = 4",
        "basic_reproduction":   "R₀ = β/(σ+γ)·N",
        "latent_period":        "1/σ (mean latency before becoming infectious)",
        "note": (
            f"SEIR has D+1={D+1} compartments — EXACT arithmetic. "
            "Adding the latent class E to SIR gives D+1=4, matching spacetime dimensions."
        ),
        "status": "EXACT: N_SEIR = D+1 = 4",
    }


def herd_immunity() -> dict:
    """
    Herd immunity threshold — Cathedral connection.

    Standard formula: h = 1 − 1/R₀.
    Setting R₀ = D = 3 gives h = (D−1)/D = 2/3.

    Returns
    -------
    dict
        threshold, R0_ref, threshold_eq_D1_D, note.
    """
    thresh = 1.0 - 1.0 / D
    return {
        "threshold":           thresh,
        "R0_reference":        R0_HERD_IMMUNITY,
        "threshold_eq_D1_D":   abs(thresh - (D - 1) / D) < 1e-12,
        "threshold_formula":   f"1 − 1/D = 1 − 1/{D} = {thresh:.6f}",
        "D_value":             D,
        "measles_R0_approx":   BASIC_REPRODUCTION_NUMBER_ICOS,
        "measles_R0_range":    (12, 18),
        "measles_N_in_range":  12 <= BASIC_REPRODUCTION_NUMBER_ICOS <= 18,
        "note": (
            f"h = 1 − 1/R₀ = 1 − 1/{D} = {thresh:.4f} = (D−1)/D = 2/3 when R₀=D=3. "
            f"Measles R₀ ≈ 12–18; N={N}=13 sits inside this range [APPROXIMATE]. "
            "h = 2/3 is an EXACT formula consequence of R₀=D, not a first-principles derivation."
        ),
        "status": "EXACT given R₀=D; measles R₀≈N is APPROXIMATE",
    }


def epidemiology_summary() -> dict:
    """
    Consolidated Cathedral Epidemiology summary.

    Returns
    -------
    dict
        "sir", "seir", "herd", "key_results", "cathedral_integers".
    """
    sir = sir_model()
    seir = seir_model()
    herd = herd_immunity()
    return {
        "sir":  sir,
        "seir": seir,
        "herd": herd,
        "cathedral_integers": {
            "D": D, "N": N, "q": q,
            "delta_star": round(DELTA_STAR, 8),
            "phi": round(phi, 6),
        },
        "key_results": [
            f"SIR compartments = D = {D}  [EXACT]",
            f"SEIR compartments = D+1 = {D+1}  [EXACT]",
            f"Herd immunity threshold = (D−1)/D = {HERD_IMMUNITY_THRESHOLD:.4f} = 2/3  [EXACT given R₀=D]",
            f"Measles R₀ ≈ 12–18 ≈ N = {N}  [APPROXIMATE]",
            f"Pandemic waves ≈ D = {D}  [APPROXIMATE]",
            f"Contact tracing depth ≈ D = {D}  [APPROXIMATE]",
            f"Age groups (simple) ≈ D = {D}  [APPROXIMATE]",
            f"R₀(δ★) = 1/δ★ ≈ {R0_DELTA_STAR:.4f}  (endemic fraction 1−δ★)",
        ],
    }


def print_epidemiology_report() -> None:
    """Print a formatted Cathedral Epidemiology report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL EPIDEMIOLOGY REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  N={N}  D={D}  φ={phi:.6f}")
    print(sep)

    print(f"\n1. SIR COMPARTMENTS = D = {D}  [EXACT]")
    print(f"   S (Susceptible), I (Infected), R (Recovered)")
    print(f"   Spatial dimension D={D} = number of SIR compartments")

    print(f"\n2. SEIR COMPARTMENTS = D+1 = {D+1}  [EXACT]")
    print(f"   Adds E (Exposed/latent) compartment before infectious stage")
    print(f"   D+1={D+1} = spacetime dimensions = SEIR compartments")

    print(f"\n3. HERD IMMUNITY THRESHOLD  h = (D−1)/D  [EXACT given R₀=D]")
    print(f"   h = 1 − 1/R₀ = 1 − 1/{D} = {HERD_IMMUNITY_THRESHOLD:.6f}")
    print(f"   Setting R₀ = D = {D} gives h = (D−1)/D = 2/3 EXACTLY")

    print(f"\n4. MEASLES R₀ ≈ N = {N}  [APPROXIMATE]")
    print(f"   Historical range: 12–18; Cathedral prediction N=13 ∈ [12,18]")
    print(f"   Measles herd immunity: h = 1−1/13 = {1-1/N:.4f} ≈ 92.3%")

    print(f"\n5. PANDEMIC WAVES ≈ D = {D}  [APPROXIMATE]")
    print(f"   1918 influenza: 3 major waves; COVID-19: initial ~3 dominant waves")

    print(f"\n6. CATHEDRAL δ★ ENDEMIC POINT")
    print(f"   R₀(δ★) = 1/δ★ = {R0_DELTA_STAR:.4f}")
    print(f"   Endemic I★ = 1 − δ★ = {ENDEMIC_INFECTED_FRAC:.4f}")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [EXACT]          SIR = D = 3 compartments")
    print(f"  [EXACT]          SEIR = D+1 = 4 compartments")
    print(f"  [EXACT given R₀=D]  Herd immunity = 2/3 = (D−1)/D")
    print(f"  [APPROXIMATE]    Measles R₀ ≈ N = 13")
    print(f"  [APPROXIMATE]    Pandemic waves ≈ D = 3")
    print(sep)
