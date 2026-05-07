"""
Cathedral Solar System — Planetary Resonances and Titius-Bode from δ★

The Solar System embeds several Cathedral integers in its geometry:

  Venus/Earth period ratio ≈ 1/φ (within 0.4%)  — same φ as in δ★!
  Venus:Earth near-resonance 13:8  — 13 = N (icosahedral sites)
  Neptune:Pluto resonance 3:2      — 3 = D, 2 = D−1
  Jupiter Lagrange L4/L5 at ±60°  — 60 = G = |A₅| (icosahedral rotation group)
  Laplace resonance Io:Europa:Ganymede = 4:2:1 — 4 = D+1

Key numerical results (exact vs approximate labelled):
  ─────────────────────────────────────────────────────────────────────
  T_Venus / T_Earth        = 0.6152     ≈ 1/φ = 0.6180   (Δ ≈ 0.46%)   APPROX
  13 T_Venus / T_Earth     = 7.998      ≈ 8               (Δ ≈ 0.02%)   NEAR-EXACT
  Neptune:Pluto resonance  = 3:2        = D:(D−1)                         EXACT label
  Lagrange L4/L5 angle     = 60°        = G degrees                       EXACT
  Io:Europa:Ganymede       = 4:2:1      = (D+1):D:(D−1)                   EXACT label
  ─────────────────────────────────────────────────────────────────────

Titius-Bode rule: a_n = 0.4 + 0.3×2^n [AU]
  The factor 2 (doubling) matches the icosahedral shell binary structure,
  but this connection is SPECULATIVE — Titius-Bode itself is empirical and
  lacks a first-principles derivation.

Important: these connections are presented as numerological correspondences.
Only the Lagrange ±60° result has a rigorous geometric underpinning
(equilateral triangle in the restricted three-body problem).
"""

from math import sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Physical / astronomical constants ─────────────────────────────────────────

AU_METERS   = 1.496e11      # 1 AU in metres
T_EARTH_K   = 255.0         # Earth effective temperature (no greenhouse) [K]
T_VENUS_K   = 240.0         # Venus effective temperature (no greenhouse) [K]

# ── Orbital periods [Earth years] ─────────────────────────────────────────────

T_MERCURY = 0.2408
T_VENUS   = 0.6152
T_EARTH   = 1.0000
T_MARS    = 1.8808
T_JUPITER = 11.862
T_SATURN  = 29.457
T_URANUS  = 84.011
T_NEPTUNE = 164.8
T_PLUTO   = 248.0    # approximate

# ── Semi-major axes [AU] ──────────────────────────────────────────────────────

A_MERCURY = 0.387
A_VENUS   = 0.723
A_EARTH   = 1.000
A_MARS    = 1.524
A_BELT    = 2.77    # asteroid belt centre
A_JUPITER = 5.203
A_SATURN  = 9.537
A_URANUS  = 19.19
A_NEPTUNE = 30.07

# ── Cathedral resonance constants ─────────────────────────────────────────────

# The golden ratio 1/φ matches the Venus/Earth period ratio to 0.46 %
# (APPROXIMATE: not derived from first principles, numerological)
VENUS_EARTH_PERIOD_RATIO   = T_VENUS / T_EARTH     # = 0.6152  (measured)
PHI_INVERSE                = 1.0 / phi             # = 0.6180...
VENUS_EARTH_PHI_DEVIATION  = abs(VENUS_EARTH_PERIOD_RATIO - PHI_INVERSE) / PHI_INVERSE

# 13:8 near-resonance: 13 Venus years ≈ 8 Earth years  (N=13 exact!)
VENUS_13_EARTH = 13 * T_VENUS   # ≈ 7.998 Earth years
VENUS_EARTH_RESONANCE_N   = N            # = 13 (the numerator in the near-resonance)
VENUS_EARTH_RESONANCE_8   = 8            # denominator  (Fibonacci partner of 13)
VENUS_RESONANCE_DEVIATION = abs(VENUS_13_EARTH - 8.0) / 8.0   # ≈ 0.025 %

# Neptune:Pluto 3:2 mean-motion resonance
NEPTUNE_PLUTO_RATIO        = 3.0 / 2.0   # = D / (D-1)  (EXACT label, not derived)
NEPTUNE_PLUTO_OBSERVED     = T_PLUTO / T_NEPTUNE  # ≈ 1.506 ≈ 3/2

# Jupiter Lagrange L4/L5: equilateral triangle → ±60° exactly
LAGRANGE_ANGLE_DEG         = 60.0        # degrees, EXACT geometry
LAGRANGE_EQUALS_G          = (LAGRANGE_ANGLE_DEG == float(G))   # True: 60 = G = |A₅|

# Laplace resonance: Io:Europa:Ganymede ≈ 4:2:1
# Their mean motions satisfy n_Io − 3n_Europa + 2n_Ganymede = 0
# Period ratios: T_Europa/T_Io ≈ 2, T_Ganymede/T_Io ≈ 4
LAPLACE_RATIO_OUTER  = 4   # = D + 1
LAPLACE_RATIO_MIDDLE = 2   # = D - 1
LAPLACE_RATIO_INNER  = 1

# Jupiter:Saturn 5:2 near-resonance (Great Inequality)
# T_Saturn / T_Jupiter ≈ 2.483 ≈ 5/2
JUPITER_SATURN_OBSERVED = T_SATURN / T_JUPITER   # ≈ 2.483
JUPITER_SATURN_RATIO    = 5.0 / 2.0             # = q / (D-1) (APPROX, 0.68% off)
JUPITER_SATURN_DEVIATION = abs(JUPITER_SATURN_OBSERVED - JUPITER_SATURN_RATIO) / JUPITER_SATURN_RATIO


# ── Functions ─────────────────────────────────────────────────────────────────

def orbital_resonances() -> dict:
    """
    Compile known mean-motion resonances and their Cathedral integer labels.

    The integer ratios D, D-1, D+1, N, q appear in several resonances,
    but these are labelled as APPROXIMATE or SPECULATIVE where applicable.

    Returns
    -------
    dict
        Keys: resonance name → sub-dict with ratio, cathedral_label, deviation,
        exact (bool), note.
    """
    return {
        "venus_earth_13_8": {
            "observed_ratio":   round(13 * T_VENUS / T_EARTH, 6),
            "cathedral_ratio":  "13:8 = N:Fibonacci(N-1)",
            "N_label":          N,
            "deviation_pct":    round(VENUS_RESONANCE_DEVIATION * 100, 4),
            "exact":            False,
            "note":             "Near-resonance: 13 Venus orbits ≈ 8 Earth orbits (Δ≈0.025%)",
        },
        "neptune_pluto_3_2": {
            "observed_ratio":   round(NEPTUNE_PLUTO_OBSERVED, 4),
            "cathedral_ratio":  "3:2 = D:(D-1)",
            "D_label":          D,
            "deviation_pct":    round(abs(NEPTUNE_PLUTO_OBSERVED - 3.0/2.0) / (3.0/2.0) * 100, 3),
            "exact":            False,
            "note":             "Well-known 3:2 orbital resonance (Plutino family)",
        },
        "laplace_4_2_1": {
            "ratio":            [LAPLACE_RATIO_OUTER, LAPLACE_RATIO_MIDDLE, LAPLACE_RATIO_INNER],
            "cathedral_ratio":  "4:2:1 = (D+1):(D-1):1",
            "D_label":          D,
            "exact":            False,
            "note":             "Io:Europa:Ganymede Laplace resonance (approximate label)",
        },
        "jupiter_saturn_5_2": {
            "observed_ratio":   round(JUPITER_SATURN_OBSERVED, 4),
            "cathedral_ratio":  "5:2 = q:(D-1)",
            "q_label":          q,
            "deviation_pct":    round(JUPITER_SATURN_DEVIATION * 100, 3),
            "exact":            False,
            "note":             "Great Inequality; q=5 is Catalan C_3 = Cathedral q",
        },
    }


def titius_bode() -> dict:
    """
    Titius-Bode empirical rule: a_n = 0.4 + 0.3 × 2^n [AU].

    The 0.3-AU scale and doubling factor (2) are purely empirical;
    no rigorous Cathedral derivation exists.  This function computes
    predicted vs observed semi-major axes and notes the discrepancy.

    Returns
    -------
    dict
        'predictions': list of dicts per planet/body with predicted,
        observed, deviation_pct.
        'note': honesty disclaimer.
    """
    tb_sequence = {
        # planet: (n, observed_AU)
        "Mercury": (-float('inf'), A_MERCURY),  # n → -∞, a_0 = 0.4
        "Venus":   (0, A_VENUS),
        "Earth":   (1, A_EARTH),
        "Mars":    (2, A_MARS),
        "Belt":    (3, A_BELT),
        "Jupiter": (4, A_JUPITER),
        "Saturn":  (5, A_SATURN),
        "Uranus":  (6, A_URANUS),
        "Neptune": (7, A_NEPTUNE),
    }

    predictions = []
    for planet, (n, obs) in tb_sequence.items():
        if n == float('-inf'):
            pred = 0.4
        else:
            pred = 0.4 + 0.3 * (2 ** n)
        dev = abs(pred - obs) / obs * 100
        predictions.append({
            "planet":        planet,
            "n":             n if n != float('-inf') else "−∞",
            "predicted_AU":  round(pred, 3),
            "observed_AU":   round(obs, 3),
            "deviation_pct": round(dev, 1),
        })

    return {
        "predictions": predictions,
        "note": (
            "Titius-Bode is purely empirical (fails for Neptune, Pluto). "
            "The doubling factor 2 = D-1 is noted but NOT derived from Cathedral. "
            "Connection is SPECULATIVE."
        ),
        "speculative_D_connection": f"2 = D-1 = {D}-1 (spatial dimension minus 1)",
    }


def venus_earth_phi() -> dict:
    """
    Venus / Earth period ratio ≈ 1/φ (golden ratio in δ★).

    This is the strongest Solar System–Cathedral connection:
    T_Venus / T_Earth = 0.6152  vs  1/φ = 0.6180  (Δ ≈ 0.46 %).
    The 13:8 near-resonance (Fibonacci numbers, 13=N) is accurate to 0.025 %.

    Returns
    -------
    dict
        Numerical comparison, deviation, status.
    """
    return {
        "T_Venus_yr":                  T_VENUS,
        "T_Earth_yr":                  T_EARTH,
        "ratio_measured":              round(VENUS_EARTH_PERIOD_RATIO, 6),
        "phi_inverse":                 round(PHI_INVERSE, 6),
        "phi":                         round(phi, 6),
        "deviation_pct":               round(VENUS_EARTH_PHI_DEVIATION * 100, 3),
        "13_Venus_years":              round(VENUS_13_EARTH, 4),
        "13_Venus_approx_8_Earth":     round(VENUS_RESONANCE_DEVIATION * 100, 4),
        "N_13_connection":             f"13 Venus orbits ≈ 8 Earth orbits; 13 = N = icosahedral sites",
        "fibonacci_pair":              "(8, 13) are consecutive Fibonacci numbers",
        "status":                      "APPROXIMATE — not derived from Cathedral first principles",
        "strongest_connection":        "13:8 resonance (Δ≈0.025%) uses N=13 exactly",
    }


def lagrange_geometry() -> dict:
    """
    Jupiter's Trojan asteroids sit at L4/L5 Lagrange points, ±60° from Jupiter.

    The equilateral triangle geometry (60°) is EXACT mathematics of the
    restricted three-body problem.  The Cathedral connection:
      60° = G degrees = |A₅| = order of the icosahedral rotation group.

    Returns
    -------
    dict
        Lagrange angle, G value, equality flag, derivation status.
    """
    return {
        "lagrange_angle_deg":     LAGRANGE_ANGLE_DEG,
        "G_icosahedral":          G,
        "angle_equals_G":         LAGRANGE_EQUALS_G,
        "G_meaning":              "|A₅| = order of icosahedral rotation group",
        "trojan_asteroid_groups": ["L4 Greeks", "L5 Trojans"],
        "derivation":             (
            "EXACT: equilateral triangle → 60° is rigorous. "
            "Cathedral label: 60 = G = |A₅|. "
            "However, the three-body problem does not invoke A₅ symmetry; "
            "the numerical coincidence 60°=G is noted as SPECULATIVE."
        ),
        "jupiter_trojan_count_approx": 13000,   # known Trojans > 1 km
    }


def solar_summary() -> dict:
    """
    Consolidated summary of Solar System – Cathedral connections.

    Returns
    -------
    dict
        All sub-results plus accuracy classification.
    """
    res = orbital_resonances()
    tb  = titius_bode()
    vep = venus_earth_phi()
    lag = lagrange_geometry()

    return {
        "resonances":         res,
        "titius_bode":        tb,
        "venus_earth_phi":    vep,
        "lagrange":           lag,
        "cathedral_integers": {
            "D": D, "N": N, "q": q, "G": G, "phi": round(phi, 6),
            "delta_star": round(DELTA_STAR, 8),
        },
        "accuracy_table": {
            "13_Venus_8_Earth":    "0.025% — strongest, N=13",
            "Venus_T_vs_phi_inv":  "0.46%  — approximate, same phi as in delta_star",
            "Neptune_Pluto_3_2":   "0.4%   — approximate, D:D-1 label",
            "Lagrange_60_deg":     "exact  — rigorous 3-body geometry, G=60 label",
            "Titius_Bode":         "speculative — no first-principles derivation",
        },
    }


def print_solar_report() -> None:
    """Print a formatted Solar System – Cathedral resonances report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL SOLAR SYSTEM REPORT")
    print(f"  δ★ = {DELTA_STAR:.8f}   φ = {phi:.8f}   N = {N}   G = {G}")
    print(sep)

    # Venus/Earth phi connection
    print("\n1. VENUS/EARTH PERIOD RATIO vs φ⁻¹")
    print(f"   T_Venus / T_Earth  = {VENUS_EARTH_PERIOD_RATIO:.6f}")
    print(f"   1/φ                = {PHI_INVERSE:.6f}")
    print(f"   Deviation          = {VENUS_EARTH_PHI_DEVIATION*100:.3f}%  [APPROXIMATE]")
    print(f"   13 Venus orbits    = {VENUS_13_EARTH:.4f} Earth years ≈ 8 (Δ = {VENUS_RESONANCE_DEVIATION*100:.4f}%)")
    print(f"   Cathedral: 13 = N  [near-resonance APPROXIMATE, Δ ≈ 0.025%]")

    # Lagrange
    print("\n2. JUPITER LAGRANGE POINTS L4/L5")
    print(f"   Angle = ±60°  =  G = |A₅| = {G}  [rigorous 3-body geometry]")
    print(f"   Cathedral label 60° = G is SPECULATIVE (geometry doesn't use A₅)")

    # Resonances
    print("\n3. MEAN-MOTION RESONANCES")
    res = orbital_resonances()
    for name, r in res.items():
        dev = r.get("deviation_pct", "?")
        print(f"   {name:30s}  Δ = {dev}%  [{r['note'][:50]}]")

    # Neptune:Pluto
    print(f"\n4. NEPTUNE:PLUTO = {NEPTUNE_PLUTO_OBSERVED:.4f} ≈ 3/2 = D:(D-1) = {D}:{D-1}")

    # Titius-Bode
    print("\n5. TITIUS-BODE  a_n = 0.4 + 0.3 × 2^n  [AU]  (SPECULATIVE)")
    tb = titius_bode()
    print(f"   {'Planet':10s}  {'Pred [AU]':10s}  {'Obs [AU]':10s}  {'Δ%':6s}")
    for p in tb["predictions"][:6]:
        print(f"   {p['planet']:10s}  {p['predicted_AU']:10.3f}  {p['observed_AU']:10.3f}  {p['deviation_pct']:6.1f}")

    print(f"\n   Speculative: factor 2 = D-1 = {D}-1 (no Cathedral derivation)")

    print(f"\n{'SUMMARY':^64}")
    print(f"  Strongest: 13 Venus ≈ 8 Earth years (Δ=0.025%), 13=N exact")
    print(f"  Golden φ in Venus period (Δ=0.46%), same φ as in δ★")
    print(f"  Lagrange ±60° = G = |A₅| (rigorous angle, speculative label)")
    print(sep)
