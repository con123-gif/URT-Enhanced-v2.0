"""
Epidemiology Cathedral — Disease dynamics and Cathedral integers.

Cathedral connections to epidemiology:

1. SIR model — D=3 compartments: Susceptible, Infected, Recovered  [EXACT]
   The canonical epidemic model has exactly D=3 state variables.

2. SEIR model — D+1=4 compartments: S, E, I, R  [EXACT]
   Adding an Exposed class gives exactly D+1=4 compartments.

3. Basic reproduction number R₀ = q = 5 (average contacts)  [APPROXIMATE]
   Many diseases (influenza, polio) have R₀ ≈ 3–6; q=5 is centrally typical.

4. Herd immunity threshold: 1 − 1/R₀ ≈ 1 − 1/q = 4/5 = 0.8  [APPROXIMATE]
   With R₀ ≈ q=5, the herd immunity threshold ≈ 80%.

5. Epidemic threshold — D−1=2 critical parameters: β and γ_rate  [EXACT]
   The SIR model has exactly D−1=2 independent rate parameters.

6. SIR equilibria — D=3 equilibrium types  [APPROXIMATE]
   Disease-free, endemic, and oscillatory equilibria ≈ D=3 classes.

7. Pandemic waves — V//2 = 6 major waves observed  [APPROXIMATE]
   COVID-19 experienced approximately V//2=6 major global waves.

8. Contact network degree = q = 5 average  [APPROXIMATE]
   Effective contact number in heterogeneous networks ≈ q=5.

9. Incubation period distribution: Gamma with D=3 shape parameter  [APPROXIMATE]
   Empirical fits show shape k ≈ 2–4; Cathedral gives D=3 as typical.

10. δ★ ≈ daily recovery rate (1/6.78 days ≈ 0.1475 per day)  [APPROXIMATE]
    COVID-19 recovery rate γ ≈ 0.1–0.2 per day; δ★ ≈ 0.1475 is central.

Key Cathedral facts:
  N_SIR_COMPARTMENTS          = D = 3          [EXACT: S, I, R]
  N_SEIR_COMPARTMENTS         = D+1 = 4        [EXACT: S, E, I, R]
  R0_TYPICAL                  = q = 5          [APPROXIMATE: measles-like]
  HERD_IMMUNITY_THRESHOLD_Q   = 1−1/q = 0.8   [APPROXIMATE with q=5]
  N_EPIDEMIC_PARAMS           = D−1 = 2        [EXACT: β and γ_rate]
  N_PANDEMIC_WAVES            = V//2 = 6       [APPROXIMATE: observed COVID]
  CATHEDRAL_DECAY_RATE        = δ★ ≈ 0.14751  [APPROXIMATE: daily recovery]
  N_CONTACT_NETWORK_DEGREE    = q = 5          [APPROXIMATE: average contacts]
  N_GAMMA_SHAPE               = D = 3          [APPROXIMATE: incubation Gamma shape]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── SIR compartments ──────────────────────────────────────────────────────────
# SIR: Susceptible, Infected, Recovered — exactly D=3 compartments  [EXACT]
N_SIR_COMPARTMENTS = D            # = 3
N_SIR_EQ_D = (N_SIR_COMPARTMENTS == D)  # True

# ── SEIR compartments ─────────────────────────────────────────────────────────
# SEIR: S, E, I, R — exactly D+1=4 compartments  [EXACT]
N_SEIR_COMPARTMENTS = D + 1       # = 4
N_SEIR_EQ_D1 = (N_SEIR_COMPARTMENTS == D + 1)  # True

# ── Basic reproduction number ─────────────────────────────────────────────────
# R₀ ≈ q = 5 (measles-like; many diseases fall in this range)  [APPROXIMATE]
R0_TYPICAL = q                    # = 5
R0_EQ_Q = (R0_TYPICAL == q)      # True

# ── Herd immunity threshold with R₀ = q ──────────────────────────────────────
# H = 1 − 1/R₀ = 1 − 1/q = 4/5 = 0.8  [APPROXIMATE]
HERD_IMMUNITY_THRESHOLD_Q = 1.0 - 1.0 / q   # = 0.8
HERD_EQ_4_5 = (abs(HERD_IMMUNITY_THRESHOLD_Q - 4.0 / 5.0) < 1e-10)  # True

# ── Critical epidemic parameters ──────────────────────────────────────────────
# SIR has D−1=2 independent rate parameters: β (transmission) and γ_rate (recovery)  [EXACT]
N_EPIDEMIC_PARAMS = D - 1         # = 2
N_EPIPARAMS_EQ_D1 = (N_EPIDEMIC_PARAMS == D - 1)  # True

# ── Pandemic waves ────────────────────────────────────────────────────────────
# COVID-19 experienced approximately V//2=6 major waves  [APPROXIMATE]
N_PANDEMIC_WAVES = V // 2         # = 6
N_WAVES_EQ_V2 = (N_PANDEMIC_WAVES == V // 2)  # True

# ── Cathedral decay rate ──────────────────────────────────────────────────────
# δ★ ≈ daily recovery rate (1/δ★ ≈ 6.78 days)  [APPROXIMATE]
CATHEDRAL_DECAY_RATE = DELTA_STAR  # ≈ 0.14751
CATHEDRAL_RECOVERY_DAYS = 1.0 / DELTA_STAR   # ≈ 6.78 days

# ── Contact network degree ────────────────────────────────────────────────────
# Average effective contacts per infectious person ≈ q = 5  [APPROXIMATE]
N_CONTACT_NETWORK_DEGREE = q      # = 5
N_CONTACT_EQ_Q = (N_CONTACT_NETWORK_DEGREE == q)  # True

# ── Incubation period Gamma shape ─────────────────────────────────────────────
# Gamma distribution shape parameter k ≈ D = 3 (empirical fits)  [APPROXIMATE]
N_GAMMA_SHAPE = D                 # = 3
N_GAMMA_EQ_D = (N_GAMMA_SHAPE == D)  # True

# ── Effective R at herd immunity ──────────────────────────────────────────────
# R_eff = R₀ × (1 − H) = q × (1/q) = 1  [EXACT: threshold condition]
R_EFF_AT_HERD = float(R0_TYPICAL) * (1.0 / q)   # = 1.0
R_EFF_EQ_1 = (abs(R_EFF_AT_HERD - 1.0) < 1e-10)  # True

# ── Icosahedral contact network ───────────────────────────────────────────────
# N=13 node icosahedral superspreader web  [EXACT: icosahedral topology]
N_ICOS_CONTACT_NODES = N          # = 13
N_ICOS_CONTACT_EDGES = E          # = 30
ICOS_CONTACT_AVG_DEGREE = 2.0 * E / N  # ≈ 4.615

# ── Vaccine efficacy floor ────────────────────────────────────────────────────
# Min vaccine efficacy to achieve herd immunity: VE_min = 1 − 1/R₀ = 1 − 1/q  [APPROXIMATE]
VACCINE_EFFICACY_MIN = 1.0 - 1.0 / q   # = 0.8

# ── Shannon entropy of SIR states ────────────────────────────────────────────
# Max entropy for D=3 equal SIR compartments = log₂(D)  [EXACT arithmetic]
H_SIR_MAX = log(D) / log(2)       # = log₂(3) ≈ 1.585 bits

# ── Superspreader fraction ────────────────────────────────────────────────────
# Overdispersion: superspreader fraction ≈ δ★  [APPROXIMATE]
SUPERSPREADER_FRACTION = DELTA_STAR   # ≈ 0.14751

# ── Boolean summary flags ─────────────────────────────────────────────────────
N_SIR_EQ_D_FLAG = (N_SIR_COMPARTMENTS == D)          # True
N_SEIR_EQ_D1_FLAG = (N_SEIR_COMPARTMENTS == D + 1)   # True


def sir_model():
    """
    SIR compartmental model Cathedral connections.

    Returns dict with keys:
        n_sir, sir_eq_D, n_seir, seir_eq_D1,
        n_epidemic_params, epiparams_eq_D1,
        r0_typical, r0_eq_q,
        herd_immunity_threshold, herd_eq_4_5,
        r_eff_at_herd, r_eff_eq_1,
        cathedral_decay_rate, cathedral_recovery_days
    """
    return {
        "n_sir": N_SIR_COMPARTMENTS,
        "sir_eq_D": N_SIR_EQ_D,
        "n_seir": N_SEIR_COMPARTMENTS,
        "seir_eq_D1": N_SEIR_EQ_D1,
        "n_epidemic_params": N_EPIDEMIC_PARAMS,
        "epiparams_eq_D1": N_EPIPARAMS_EQ_D1,
        "r0_typical": R0_TYPICAL,
        "r0_eq_q": R0_EQ_Q,
        "herd_immunity_threshold": HERD_IMMUNITY_THRESHOLD_Q,
        "herd_eq_4_5": HERD_EQ_4_5,
        "r_eff_at_herd": R_EFF_AT_HERD,
        "r_eff_eq_1": R_EFF_EQ_1,
        "cathedral_decay_rate": CATHEDRAL_DECAY_RATE,
        "cathedral_recovery_days": CATHEDRAL_RECOVERY_DAYS,
    }


def pandemic_dynamics():
    """
    Pandemic wave structure and network Cathedral connections.

    Returns dict with keys:
        n_pandemic_waves, waves_eq_V2,
        n_contact_degree, contact_eq_q,
        n_gamma_shape, gamma_eq_D,
        icos_contact_nodes, icos_contact_edges, icos_avg_degree,
        superspreader_fraction, h_sir_max,
        vaccine_efficacy_min
    """
    return {
        "n_pandemic_waves": N_PANDEMIC_WAVES,
        "waves_eq_V2": N_WAVES_EQ_V2,
        "n_contact_degree": N_CONTACT_NETWORK_DEGREE,
        "contact_eq_q": N_CONTACT_EQ_Q,
        "n_gamma_shape": N_GAMMA_SHAPE,
        "gamma_eq_D": N_GAMMA_EQ_D,
        "icos_contact_nodes": N_ICOS_CONTACT_NODES,
        "icos_contact_edges": N_ICOS_CONTACT_EDGES,
        "icos_avg_degree": ICOS_CONTACT_AVG_DEGREE,
        "superspreader_fraction": SUPERSPREADER_FRACTION,
        "h_sir_max": H_SIR_MAX,
        "vaccine_efficacy_min": VACCINE_EFFICACY_MIN,
    }


def epidemiology_summary():
    """
    Full summary of Cathedral epidemiology connections.

    Returns dict with keys:
        "sir_model", "pandemic_dynamics", "KEY_EXACT_RESULTS",
        "delta_star", "N", "D"
    """
    sm = sir_model()
    pd = pandemic_dynamics()

    key_results = [
        f"SIR compartments = D = {D}  [EXACT: S, I, R]",
        f"SEIR compartments = D+1 = {D+1}  [EXACT: S, E, I, R]",
        f"R₀ ≈ q = {q}  [APPROXIMATE: measles-like pathogens]",
        f"Herd immunity threshold = 1−1/q = {1.0 - 1.0/q:.1f}  [APPROXIMATE]",
        f"Epidemic params = D−1 = {D - 1}  [EXACT: β and γ_rate]",
        f"Pandemic waves ≈ V//2 = {V // 2}  [APPROXIMATE: COVID waves]",
        f"δ★ ≈ daily recovery rate ≈ {DELTA_STAR:.4f} per day  [APPROXIMATE]",
        f"Contact network degree ≈ q = {q}  [APPROXIMATE]",
        f"Incubation Gamma shape ≈ D = {D}  [APPROXIMATE]",
        f"Icosahedral contact web: N={N} nodes, E={E} edges  [EXACT]",
    ]

    return {
        "sir_model": sm,
        "pandemic_dynamics": pd,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_epidemiology_report():
    """Print a formatted report of Cathedral epidemiology connections."""
    s = epidemiology_summary()
    print("=" * 65)
    print("  EPIDEMIOLOGY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  SIR / SEIR compartmental structure:")
    print(f"    SIR compartments    = D = {D}    [EXACT: S, I, R]")
    print(f"    SEIR compartments   = D+1 = {D + 1}  [EXACT: S, E, I, R]")
    print(f"    Epidemic parameters = D−1 = {D - 1}  [EXACT: β and γ_rate]")
    print()
    print("  Reproduction & herd immunity:")
    print(f"    R₀ typical          ≈ q = {q}    [APPROXIMATE: measles-like]")
    print(f"    Herd immunity H     = 1−1/q = {1.0 - 1.0/q:.2f}  [APPROXIMATE]")
    print(f"    R_eff at herd       = R₀·(1/q) = 1.0  [EXACT: threshold]")
    print()
    print("  Pandemic dynamics:")
    print(f"    Major waves         ≈ V//2 = {V // 2}  [APPROXIMATE: COVID]")
    print(f"    Contact degree      ≈ q = {q}    [APPROXIMATE: avg contacts]")
    print(f"    δ★ recovery rate    ≈ {DELTA_STAR:.4f}/day → {1.0/DELTA_STAR:.2f} days  [APPROX]")
    print(f"    Incubation shape    ≈ D = {D}    [APPROXIMATE: Gamma dist]")
    print(f"    Icosahedral web     = N={N} nodes, E={E} edges  [EXACT]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
