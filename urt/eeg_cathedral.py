"""
Cathedral EEG — Brainwave Bands and Neural Oscillations from δ★

The EEG frequency taxonomy, neural avalanche statistics, and 40 Hz gamma
oscillation all contain Cathedral integers:

  α/β boundary = N = 13 Hz     (EXACT by international clinical convention)
  Avalanche exponent = −D/2 = −3/2  (EXACT: sandpile criticality, D=3)
  40 Hz gamma  = 8×q = 8×5     (EXACT arithmetic; 40 = 8q)
  α/θ center ratio ≈ φ          (APPROXIMATE: 10.5/6 = 1.75, φ=1.618, Δ≈8%)
  Schumann × φ ≈ N/… ≈ 13       (APPROXIMATE and SPECULATIVE)

Key connections (labelled by status):
  ─────────────────────────────────────────────────────────────────────
  α-band upper limit = N = 13 Hz            [EXACT — clinical definition]
  β-band lower limit = N = 13 Hz            [EXACT — same boundary]
  Neural avalanche P(s) ∝ s^{−D/2}         [EXACT label; D/2=3/2 known]
  40 Hz gamma = 8·q = 8·5                  [EXACT arithmetic]
  1/f noise exponent = 1 at criticality     [known physics, no Cathedral
                                             derivation of the coefficient]
  Kuramoto K_c (13-node icos. graph)        [from consciousness.py]
  α/θ center ratio ≈ φ                      [APPROXIMATE, Δ≈8%]
  Schumann fundamental 7.83 Hz              [no clean Cathedral relation]
  ─────────────────────────────────────────────────────────────────────

IMPORTANT: The α/β boundary = 13 Hz is a *definition* by the IFSECN/
clinical EEG community — it is not a discovery.  Cathedral simply notes
that the chosen value coincides with N=13.
"""

from math import pi, sqrt, log, exp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── EEG frequency bands [Hz] — clinical / IFSECN standard ─────────────────────

DELTA_BAND  = (0.5, 4.0)    # δ-band: deep sleep, SWS
THETA_BAND  = (4.0, 8.0)    # θ-band: hippocampal memory
ALPHA_BAND  = (8.0, 13.0)   # α-band: relaxed wakefulness — upper = N = 13 Hz!
BETA_BAND   = (13.0, 30.0)  # β-band: active thinking    — lower = N = 13 Hz!
GAMMA_BAND  = (30.0, 100.0) # γ-band: attention, binding

# α/β boundary = N = 13 Hz (EXACT: clinical definition coincides with N=13)
ALPHA_BETA_BOUNDARY_HZ = float(N)   # = 13.0 Hz

# ── 40 Hz gamma oscillation = 8 × q ──────────────────────────────────────────
# 40 Hz is the dominant binding-related gamma frequency (Galambos 1981, etc.)
# Cathedral: 40 = 8 × q = 8 × 5  (EXACT arithmetic)
GAMMA_40_HZ     = 8 * q           # = 40
GAMMA_40_Q_CHECK = (GAMMA_40_HZ == 40)   # True

# ── Neural avalanche power law ────────────────────────────────────────────────
# Criticality in neural networks: P(avalanche size s) ∝ s^{−3/2}
# Beggs & Plenz 2003 empirically found exponent −3/2 = −D/2
AVALANCHE_EXPONENT = -D / 2.0    # = −1.5  (EXACT: D/2 = 3/2)

# ── 1/f noise at criticality ──────────────────────────────────────────────────
# EEG power spectral density P(f) ∝ f^{−β_eeg}
# At criticality / self-organised criticality: β_eeg = 1 (1/f noise)
# β_eeg in real EEG ≈ 1.0–2.5 depending on state/electrode
F_NOISE_EXPONENT = 1.0    # at exact criticality
# Cathedral note: 1/f^1 is 'pink noise', exponent between white (0) and Brownian (2)

# ── Kuramoto critical coupling for 13-node icosahedral graph ─────────────────
# From consciousness.py: K_c = δ★ / Ω̄  where Ω̄ is mean natural frequency
# Numerical value from full eigenvalue analysis: K_c ≈ 1.2773
K_C_KURAMOTO = 1.2773       # critical coupling (see consciousness.py for derivation)
SYNC_ORDER_RESTING = DELTA_STAR ** 2   # speculative resting-state synchrony measure

# ── Schumann resonance ────────────────────────────────────────────────────────
# Earth's Schumann resonances: cavity modes of Earth-ionosphere waveguide
# f_n ≈ 10.6 × √(n(n+1))  Hz,  n = 1, 2, 3, …
SCHUMANN_MODES = [10.6 * sqrt(n * (n + 1)) for n in range(1, 6)]
SCHUMANN_FUNDAMENTAL_HZ = 7.83   # Hz (empirical; formula gives 10.6*√2 ≈ 14.99, rough)
# Note: more accurate formula gives f_1 ≈ 7.83 Hz due to finite ionosphere height
SCHUMANN_MODES_EMPIRICAL = [7.83, 14.3, 20.8, 27.3, 33.8]   # Hz

# φ × SCHUMANN_FUNDAMENTAL ≈ 12.67 ≈ N (approximate, speculative)
SCHUMANN_PHI_PRODUCT = phi * SCHUMANN_FUNDAMENTAL_HZ
SCHUMANN_PHI_DEVIATION = abs(SCHUMANN_PHI_PRODUCT - N) / N   # ≈ 2.5%

# ── Frequency band center frequencies and ratios ─────────────────────────────
DELTA_CENTER  = (DELTA_BAND[0]  + DELTA_BAND[1])  / 2   # = 2.25 Hz
THETA_CENTER  = (THETA_BAND[0]  + THETA_BAND[1])  / 2   # = 6.0  Hz
ALPHA_CENTER  = (ALPHA_BAND[0]  + ALPHA_BAND[1])  / 2   # = 10.5 Hz
BETA_CENTER   = (BETA_BAND[0]   + BETA_BAND[1])   / 2   # = 21.5 Hz
GAMMA_CENTER  = (GAMMA_BAND[0]  + GAMMA_BAND[1])  / 2   # = 65.0 Hz

# Ratios of centre frequencies
RATIO_ALPHA_THETA   = ALPHA_CENTER / THETA_CENTER    # = 10.5/6 = 1.75
PHI_DEVIATION_AT   = abs(RATIO_ALPHA_THETA - phi) / phi   # ≈ 8.2% off φ

# Ratios of band boundaries (lower edges)
RATIO_THETA_DELTA_LO  = THETA_BAND[0]  / DELTA_BAND[0]   # = 4.0/0.5 = 8  = 2^3
RATIO_ALPHA_THETA_LO  = ALPHA_BAND[0]  / THETA_BAND[0]   # = 8.0/4.0 = 2  = D-1
RATIO_BETA_ALPHA_LO   = BETA_BAND[0]   / ALPHA_BAND[0]   # = 13.0/8.0 = 1.625
RATIO_GAMMA_BETA_LO   = GAMMA_BAND[0]  / BETA_BAND[0]    # = 30.0/13.0 ≈ 2.31

# ── Functions ─────────────────────────────────────────────────────────────────

def eeg_bands() -> dict:
    """
    EEG frequency bands with Cathedral annotations.

    Returns
    -------
    dict
        Each band (name, range, centre, cathedral_connection, status).
    """
    return {
        "delta":  {
            "range_hz":           DELTA_BAND,
            "centre_hz":          DELTA_CENTER,
            "cathedral_note":     "δ symbol shared with δ★; deep-sleep ground state hypothesis",
            "status":             "SPECULATIVE — symbolic coincidence (consciousness.py claim)",
        },
        "theta":  {
            "range_hz":           THETA_BAND,
            "centre_hz":          THETA_CENTER,
            "cathedral_note":     "Hippocampal θ ~8 Hz ≈ upper boundary of θ-band",
            "status":             "APPROXIMATE",
        },
        "alpha":  {
            "range_hz":           ALPHA_BAND,
            "centre_hz":          ALPHA_CENTER,
            "upper_boundary_hz":  ALPHA_BAND[1],
            "upper_equals_N":     (ALPHA_BAND[1] == N),
            "cathedral_note":     f"Upper limit = N = {N} Hz (clinical definition)",
            "status":             "EXACT — α/β boundary = 13 Hz = N",
        },
        "beta":   {
            "range_hz":           BETA_BAND,
            "centre_hz":          BETA_CENTER,
            "lower_boundary_hz":  BETA_BAND[0],
            "lower_equals_N":     (BETA_BAND[0] == N),
            "cathedral_note":     f"Lower limit = N = {N} Hz (same boundary as α upper)",
            "status":             "EXACT — β lower = 13 Hz = N",
        },
        "gamma":  {
            "range_hz":           GAMMA_BAND,
            "centre_hz":          GAMMA_CENTER,
            "gamma_40":           GAMMA_40_HZ,
            "gamma_40_formula":   f"8 × q = 8 × {q} = {GAMMA_40_HZ}",
            "cathedral_note":     f"Binding gamma 40 Hz = 8q = 8×{q} Hz",
            "status":             "EXACT arithmetic: 40 = 8×q; physical peak is approximate",
        },
    }


def frequency_ratios() -> dict:
    """
    Ratios between EEG band centres and boundaries.

    Returns
    -------
    dict
        Alpha/theta ratio, phi comparison, boundary ratios, status.
    """
    return {
        "alpha_center_hz":          ALPHA_CENTER,
        "theta_center_hz":          THETA_CENTER,
        "alpha_over_theta_center":  round(RATIO_ALPHA_THETA, 4),
        "phi_value":                round(phi, 6),
        "alpha_theta_phi_deviation_pct": round(PHI_DEVIATION_AT * 100, 2),
        "status_alpha_theta":       "APPROXIMATE — 1.75 vs φ=1.618 (Δ≈8%), not convincing",
        "boundary_ratios": {
            "theta_lo / delta_lo":  round(RATIO_THETA_DELTA_LO, 3),
            "alpha_lo / theta_lo":  round(RATIO_ALPHA_THETA_LO, 3),
            "beta_lo  / alpha_lo":  round(RATIO_BETA_ALPHA_LO, 3),
            "gamma_lo / beta_lo":   round(RATIO_GAMMA_BETA_LO, 3),
        },
        "D_minus_1":   D - 1,    # = 2
        "note": (
            f"α_lo/θ_lo = {RATIO_ALPHA_THETA_LO} = D-1 = {D}-1 = 2 [EXACT at boundaries]. "
            f"α/θ centres ratio = 1.75 ≈ φ at 8% accuracy [APPROXIMATE]."
        ),
    }


def neural_avalanche() -> dict:
    """
    Neural avalanche statistics at criticality.

    At the critical point (SOC), the distribution of avalanche sizes follows
    P(s) ∝ s^{−3/2} = s^{−D/2} with D=3 (spatial dimension of brain tissue).
    Beggs & Plenz (2003) measured exponent −1.5 in cortical slices.

    Returns
    -------
    dict
        Exponent, Cathedral D/2 formula, measured value, note.
    """
    return {
        "avalanche_exponent":   AVALANCHE_EXPONENT,    # = −1.5
        "D_over_2":             D / 2.0,               # = 1.5
        "exponent_formula":     f"−D/2 = −{D}/2 = −{D/2}",
        "measured_beggs_plenz": -1.5,
        "agreement":            abs(AVALANCHE_EXPONENT - (-1.5)) < 1e-10,
        "branching_parameter":  1.0,   # σ = 1 at criticality
        "duration_exponent":    -2.0,  # P(T) ∝ T^{-2} at criticality
        "f_noise_exponent":     F_NOISE_EXPONENT,
        "note": (
            "Avalanche exponent = −D/2 = −3/2 is exact given D=3. "
            "The value −3/2 is a known result from mean-field SOC theory "
            "(Zapperi et al. 1995); Cathedral provides the D=3 label."
        ),
        "status":               "EXACT label: −D/2 = −3/2; physics independently established",
    }


def schumann_resonance() -> dict:
    """
    Earth-ionosphere Schumann resonances and their Cathedral proximity.

    f_n ≈ 7.83, 14.3, 20.8, 27.3, 33.8 Hz (empirical).
    φ × f_1 = φ × 7.83 ≈ 12.67 ≈ N=13 (Δ ≈ 2.5%) — APPROXIMATE/SPECULATIVE.

    Returns
    -------
    dict
        Modes, phi_product, deviation, status.
    """
    return {
        "schumann_fundamental_hz":  SCHUMANN_FUNDAMENTAL_HZ,
        "schumann_modes_hz":        SCHUMANN_MODES_EMPIRICAL,
        "phi_times_fundamental":    round(SCHUMANN_PHI_PRODUCT, 4),
        "N_value":                  N,
        "phi_N_deviation_pct":      round(SCHUMANN_PHI_DEVIATION * 100, 2),
        "alpha_band_overlap":       (SCHUMANN_MODES_EMPIRICAL[0] < ALPHA_BAND[1]),
        "note": (
            f"φ × 7.83 ≈ {SCHUMANN_PHI_PRODUCT:.2f} ≈ N=13 Hz (Δ={SCHUMANN_PHI_DEVIATION*100:.1f}%). "
            "This is SPECULATIVE — Schumann resonances depend on cavity geometry "
            "and are not derived from Cathedral constants."
        ),
        "status":                   "SPECULATIVE / APPROXIMATE",
    }


def kuramoto_eeg() -> dict:
    """
    Kuramoto synchronisation model on the 13-node icosahedral graph.

    The critical coupling K_c and resting-state order parameter r_rest
    characterise the conscious/unconscious phase transition.
    See consciousness.py for the full simulation.

    Returns
    -------
    dict
        K_c, r_rest, icosahedral_graph_N, delta_star_connection, note.
    """
    return {
        "K_c_kuramoto":         K_C_KURAMOTO,
        "icosahedral_nodes":    N,
        "spectral_gap":         D,           # λ₂ = D = 3 (see quantum_chaos.py)
        "r_rest_estimate":      round(SYNC_ORDER_RESTING, 6),
        "r_rest_formula":       "δ★² (speculative estimate)",
        "alpha_band_Hz":        ALPHA_BAND,
        "alpha_upper_eq_N":     True,
        "delta_star":           round(DELTA_STAR, 8),
        "note": (
            "K_c ≈ 1.2773 derived from icosahedral adjacency eigenvalues. "
            "r_rest = δ★² is a speculative assignment. "
            "α-band upper = N = 13 Hz is exact (clinical definition)."
        ),
    }


def eeg_summary() -> dict:
    """
    Consolidated summary of EEG – Cathedral connections.

    Returns
    -------
    dict
        All sub-results plus accuracy table.
    """
    return {
        "bands":          eeg_bands(),
        "ratios":         frequency_ratios(),
        "avalanche":      neural_avalanche(),
        "schumann":       schumann_resonance(),
        "kuramoto":       kuramoto_eeg(),
        "cathedral_integers": {
            "N": N, "D": D, "q": q, "phi": round(phi, 6),
            "delta_star": round(DELTA_STAR, 8),
        },
        "key_results": {
            "alpha_beta_boundary":  f"α/β = {ALPHA_BETA_BOUNDARY_HZ} Hz = N = {N}  [EXACT definition]",
            "avalanche_exponent":   f"−D/2 = −{D/2} = −3/2  [EXACT; Beggs-Plenz 2003]",
            "gamma_40_Hz":          f"40 Hz = 8×q = 8×{q}  [EXACT arithmetic]",
            "alpha_theta_ratio":    f"α/θ centres = {RATIO_ALPHA_THETA:.3f} ≈ φ = {phi:.3f}  [APPROX, Δ≈8%]",
            "schumann_phi":         f"φ×f_Sch = {SCHUMANN_PHI_PRODUCT:.2f} ≈ N=13  [SPECULATIVE, Δ≈2.5%]",
        },
    }


def print_eeg_report() -> None:
    """Print a formatted Cathedral EEG report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL EEG BRAINWAVE REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  N={N}  D={D}  q={q}  φ={phi:.6f}")
    print(sep)

    # EEG bands
    print("\n1. EEG FREQUENCY BANDS")
    print(f"   {'Band':8s}  {'Range (Hz)':16s}  {'Centre (Hz)':12s}  Note")
    bands_data = [
        ("δ", DELTA_BAND,  DELTA_CENTER,  "deep sleep"),
        ("θ", THETA_BAND,  THETA_CENTER,  "hippocampal memory"),
        ("α", ALPHA_BAND,  ALPHA_CENTER,  f"← upper = N = {N} Hz  [EXACT]"),
        ("β", BETA_BAND,   BETA_CENTER,   f"← lower = N = {N} Hz  [EXACT]"),
        ("γ", GAMMA_BAND,  GAMMA_CENTER,  "binding/attention"),
    ]
    for band, rng, ctr, note in bands_data:
        print(f"   {band:8s}  {str(rng):16s}  {ctr:12.1f}  {note}")

    # 40 Hz gamma
    print(f"\n2. 40 Hz GAMMA = 8 × q = 8 × {q} = {GAMMA_40_HZ} Hz  [EXACT arithmetic]")
    print(f"   q = {q} = Cathedral icosahedral dimension (superstring dim / 2)")

    # Neural avalanche
    print(f"\n3. NEURAL AVALANCHE  P(s) ∝ s^{{−D/2}} = s^{{−{D}/{2}}} = s^{{-1.5}}")
    print(f"   EXACT: D=3 spatial dimension → exponent = −3/2")
    print(f"   Beggs & Plenz 2003: measured −1.5 in cortical slices")
    print(f"   Duration exponent: P(T) ∝ T^{{−2}}  (mean-field SOC)")

    # Frequency ratios
    print(f"\n4. FREQUENCY RATIOS")
    print(f"   α/θ centres = {ALPHA_CENTER}/{THETA_CENTER} = {RATIO_ALPHA_THETA:.4f}")
    print(f"   φ           = {phi:.4f}  (deviation = {PHI_DEVIATION_AT*100:.1f}%)  [APPROXIMATE]")
    print(f"   α_lo/θ_lo   = {RATIO_ALPHA_THETA_LO} = D−1 = {D}-1  [EXACT at boundaries]")

    # Schumann
    print(f"\n5. SCHUMANN RESONANCE  f₁ = {SCHUMANN_FUNDAMENTAL_HZ} Hz")
    print(f"   φ × f₁ = {phi:.4f} × {SCHUMANN_FUNDAMENTAL_HZ} = {SCHUMANN_PHI_PRODUCT:.2f}")
    print(f"   N = {N} Hz  →  deviation = {SCHUMANN_PHI_DEVIATION*100:.1f}%  [SPECULATIVE]")

    # Kuramoto
    print(f"\n6. KURAMOTO (13-node icosahedral graph)")
    print(f"   K_c ≈ {K_C_KURAMOTO}  (critical coupling for N={N} oscillators)")
    print(f"   Spectral gap λ₂ = D = {D}  (icosahedral, see quantum_chaos.py)")

    print(f"\n{'SUMMARY (3 key results)':^64}")
    print(f"  [EXACT]   α/β boundary = N = {N} Hz (clinical definition)")
    print(f"  [EXACT]   Avalanche exponent = −D/2 = −{D/2} (Beggs-Plenz)")
    print(f"  [EXACT]   40 Hz = 8 × q = 8 × {q}")
    print(f"  [APPROX]  α/θ center ratio = 1.75 ≈ φ (Δ≈8%)")
    print(sep)
