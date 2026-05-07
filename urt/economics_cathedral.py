"""
Cathedral Economics — Power Laws, Market Microstructure, and δ★

Financial markets and economic distributions display power laws whose
exponents contain Cathedral integers:

  Pareto 80/20 exponent ≈ δ★       (APPROXIMATE: log(0.8)/log(0.2)≈0.1386≈δ★, Δ≈6%)
  Fat tail exponent     = D = 3     (Mantegna-Stanley 1994; equity returns)
  Hurst exponent        = (D+1)/(2D) = 2/3  (long-range correlations)
  σ_Cathedral = δ★√2 ≈ 0.2086      (same as metamaterial n_eff in metamaterials.py)
  1/√N spread ≈ 0.277              (bid-ask spread scaling with N=13 venues)

Key results (exact vs approximate labelled):
  ─────────────────────────────────────────────────────────────────────
  log(0.8)/log(0.2) ≈ 0.1386 ≈ δ★=0.1475  (Δ ≈ 6%)     APPROXIMATE
  Mantegna-Stanley tail α = D = 3           (Δ = 0%)      EXACT label
  H = (D+1)/(2D) = 4/6 = 2/3               (formula)     APPROXIMATE
  Bid-ask ∝ 1/√N = 1/√13                   (formula)     APPROXIMATE
  Kelly f★ = 1−2δ★ ≈ 0.705                 (formula)     EXACT given p=1−δ★
  σ_C = δ★√2 = 0.2086                      (formula)     EXACT from δ★
  ─────────────────────────────────────────────────────────────────────

IMPORTANT: The Pareto/δ★ correspondence (6% difference) is a numerological
observation, not a prediction.  The Mantegna-Stanley exponent D=3 is an
empirical finding from equities; D=3 also being the spatial dimension is
a known physics fact, not a Cathedral derivation.
"""

from math import log, sqrt, exp, pi, isfinite
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Pareto / 80-20 rule ───────────────────────────────────────────────────────
# The 80/20 rule: top 20% own 80% of wealth.
# Pareto CDF: F(x) = 1 − (x_min/x)^α_P
# Condition: 20% of population (x > P_80) holds 80% of total.
# This gives: α_P = log(0.8) / log(0.2) (standard derivation)
PARETO_8020    = log(0.8) / log(0.2)     # ≈ 0.13862...
PARETO_DELTA_RATIO = PARETO_8020 / DELTA_STAR   # ≈ 0.939
PARETO_DELTA_DEV   = abs(PARETO_8020 - DELTA_STAR) / DELTA_STAR   # ≈ 6.0 %

# More general Pareto: with α_P = 1 + δ★ (shape parameter above 1)
PARETO_SHAPE_ABOVE1 = 1.0 + DELTA_STAR   # ≈ 1.1475 (thin tail)

# ── Hurst exponent ────────────────────────────────────────────────────────────
# H > 0.5: persistent (trending markets)
# H < 0.5: anti-persistent (mean-reverting)
# Cathedral formula: H = (D+1)/(2D)
H_CATHEDRAL = (D + 1) / (2 * D)   # = 4/6 = 2/3 ≈ 0.6667
# Many equity markets show H ≈ 0.55–0.75 (Peters 1994, Lo 1991)
H_RANDOM_WALK = 0.5   # reference: Brownian motion

# ── Fat tail exponent (Mantegna-Stanley) ─────────────────────────────────────
# Equity return distribution P(r > x) ∝ x^{-α_tail} where α_tail ≈ 3
# Mantegna & Stanley (1995 Nature): α_tail = 3 = D for several stock indices
TAIL_EXPONENT = float(D)   # = 3.0

# ── Bid-ask spread ────────────────────────────────────────────────────────────
# Market microstructure: with N independent trading venues or N noise traders,
# relative spread σ_spread ∝ 1/√N  (Kyle 1985 type scaling)
SPREAD_RELATIVE = 1.0 / sqrt(N)   # = 1/√13 ≈ 0.2774

# ── Kelly criterion ───────────────────────────────────────────────────────────
# For win probability p, loss probability q_bet = 1−p, even odds b=1:
# f★ = p − q_bet = 2p − 1
# Cathedral: set p = 1 − δ★ (win probability), q_bet = δ★:
KELLY_WIN_PROB   = 1.0 - DELTA_STAR    # ≈ 0.8525
KELLY_LOSE_PROB  = DELTA_STAR          # ≈ 0.1475
KELLY_FRACTION   = KELLY_WIN_PROB - KELLY_LOSE_PROB   # = 1 − 2δ★ ≈ 0.7050
# For even-money bets: f★ = p − q_bet = 1 − 2δ★

# ── Cathedral volatility ─────────────────────────────────────────────────────
# σ_Cathedral = δ★ × √2  (same value as metamaterial effective refractive index)
SIGMA_CATHEDRAL = DELTA_STAR * sqrt(2)   # ≈ 0.2086

# ── Zipf's law ───────────────────────────────────────────────────────────────
# Frequency of k-th ranked item ∝ k^{-ζ} where ζ ≈ 1
ZIPF_EXPONENT = 1.0   # ζ = 1 (Zipf 1949)
# Cathedral label: ζ = D/D = 1 (trivial; noted as coincidence)

# ── Gini coefficient ─────────────────────────────────────────────────────────
# For Pareto with shape α: Gini = 1/(2α − 1) for α > 1/2
# Using α_P = 1 + δ★ (shape above 1):
GINI_PARETO = 1.0 / (2 * (1.0 + DELTA_STAR) - 1.0)   # = 1/(1 + 2δ★) ≈ 0.7720

# ── Black-Scholes Cathedral volatility annualised return ────────────────────
# Annual return μ_BS for at-the-money option at T=1 year, σ=σ_Cathedral:
# d₁ = (μ + σ²/2) / σ  (for S=K, r=0)
def _black_scholes_d1(mu_annual: float, sigma: float, T: float = 1.0) -> float:
    """d₁ for ATM Black-Scholes option."""
    return (mu_annual + 0.5 * sigma**2) * sqrt(T) / sigma

# ── Functions ─────────────────────────────────────────────────────────────────

def pareto_analysis() -> dict:
    """
    Pareto / 80-20 analysis and comparison with δ★.

    The 80/20 Pareto exponent log(0.8)/log(0.2) ≈ 0.1386 is compared to
    δ★ ≈ 0.1475 (difference ≈ 6%).  This is a numerological observation.

    Returns
    -------
    dict
        pareto_8020, delta_star, ratio, deviation_pct, gini, note.
    """
    # Pareto α for exactly 1% owning 50%:
    # (0.01)^α = 0.50 → α = log(0.50)/log(0.01)
    pareto_1pct_50 = log(0.50) / log(0.01)   # ≈ 0.150 ≈ δ★ (Δ≈2%)!

    return {
        "pareto_8020":          round(PARETO_8020, 6),
        "delta_star":           round(DELTA_STAR, 8),
        "ratio_pareto_delta":   round(PARETO_DELTA_RATIO, 5),
        "deviation_pct":        round(PARETO_DELTA_DEV * 100, 2),
        "pareto_1pct_50pct":    round(pareto_1pct_50, 6),
        "delta_dev_1pct_50":    round(abs(pareto_1pct_50 - DELTA_STAR) / DELTA_STAR * 100, 2),
        "gini_cathedral":       round(GINI_PARETO, 4),
        "gini_formula":         f"1/(1 + 2δ★) = 1/(1 + 2×{DELTA_STAR:.5f}) ≈ {GINI_PARETO:.4f}",
        "note": (
            f"log(0.8)/log(0.2) = {PARETO_8020:.5f} ≈ δ★ = {DELTA_STAR:.5f} (Δ≈{PARETO_DELTA_DEV*100:.1f}%). "
            f"Closer match: 1% owns 50% → exponent {pareto_1pct_50:.5f} ≈ δ★ (Δ≈{abs(pareto_1pct_50-DELTA_STAR)/DELTA_STAR*100:.1f}%). "
            "Both are APPROXIMATE / numerological — no first-principles derivation."
        ),
        "status":               "APPROXIMATE — 6% and 2% deviations respectively",
    }


def hurst_analysis() -> dict:
    """
    Hurst exponent and long-range correlations in financial markets.

    H = (D+1)/(2D) = 4/6 = 2/3 ≈ 0.667 is the Cathedral prediction.
    Many equity markets show H ≈ 0.55–0.75.

    Returns
    -------
    dict
        H_cathedral, H_random_walk, formula, empirical_range, note.
    """
    return {
        "H_cathedral":      round(H_CATHEDRAL, 6),
        "H_formula":        f"(D+1)/(2D) = ({D}+1)/(2×{D}) = {D+1}/{2*D}",
        "H_random_walk":    H_RANDOM_WALK,
        "excess_over_rw":   round(H_CATHEDRAL - H_RANDOM_WALK, 6),
        "empirical_range":  (0.55, 0.75),
        "in_empirical_range": (0.55 <= H_CATHEDRAL <= 0.75),
        "D_value":          D,
        "note": (
            f"H = (D+1)/(2D) = {H_CATHEDRAL:.4f}: persistent (trending) regime. "
            "Many stock indices show H ≈ 0.55–0.75 (Peters 1994). "
            "This is an APPROXIMATE / structural match; not a precise prediction."
        ),
        "status":           "APPROXIMATE — formula is plausible but not derived",
    }


def market_microstructure() -> dict:
    """
    Market microstructure: bid-ask spread and Cathedral volatility.

    Returns
    -------
    dict
        spread_relative, N_venues, sigma_cathedral, note.
    """
    return {
        "spread_relative":     round(SPREAD_RELATIVE, 6),
        "spread_formula":      f"1/√N = 1/√{N} = {SPREAD_RELATIVE:.5f}",
        "N_venues":            N,
        "sigma_cathedral":     round(SIGMA_CATHEDRAL, 6),
        "sigma_formula":       f"δ★√2 = {DELTA_STAR:.6f}×√2 = {SIGMA_CATHEDRAL:.6f}",
        "sigma_same_as_neff":  True,   # see metamaterials.py: n_eff = δ★√2
        "annualised_vol_pct":  round(SIGMA_CATHEDRAL * 100, 2),
        "bs_d1_mu_zero":       round(_black_scholes_d1(0.0, SIGMA_CATHEDRAL), 4),
        "note": (
            f"σ_Cathedral = δ★√2 = {SIGMA_CATHEDRAL:.4f} ≈ 20.9% annual volatility. "
            "This equals the metamaterial effective refractive index n_eff. "
            "Bid-ask spread ∝ 1/√N is a Kyle-model approximation, not derived from Cathedral."
        ),
        "status":              "σ_C = δ★√2 is EXACT formula; market application APPROXIMATE",
    }


def kelly_criterion() -> dict:
    """
    Kelly criterion (optimal log-wealth growth) with Cathedral probabilities.

    Setting win probability p = 1−δ★ and loss probability q = δ★
    (even-odds bet, b=1), the Kelly fraction is:
    f★ = p − q = 1 − 2δ★ ≈ 0.705.

    Returns
    -------
    dict
        win_prob, loss_prob, kelly_fraction, note.
    """
    # Growth rate at Kelly fraction
    log_growth = (
        KELLY_WIN_PROB * log(1 + KELLY_FRACTION) +
        KELLY_LOSE_PROB * log(1 - KELLY_FRACTION)
    )

    return {
        "win_probability":   round(KELLY_WIN_PROB, 6),
        "loss_probability":  round(KELLY_LOSE_PROB, 6),
        "delta_star":        round(DELTA_STAR, 8),
        "kelly_fraction":    round(KELLY_FRACTION, 6),
        "kelly_formula":     "f★ = 1 − 2δ★  (even-odds, p=1−δ★)",
        "log_growth_rate":   round(log_growth, 8),
        "note": (
            f"f★ = 1−2δ★ = {KELLY_FRACTION:.4f} is the EXACT formula given p = 1−δ★ = {KELLY_WIN_PROB:.4f}. "
            "The assignment p = 1−δ★ is SPECULATIVE (no market mechanism derived)."
        ),
        "status":            "EXACT given p=1−δ★; probability assignment is SPECULATIVE",
    }


def tail_distribution() -> dict:
    """
    Fat-tail distribution in equity returns (Mantegna-Stanley).

    P(|r| > x) ∝ x^{-α_tail} where α_tail ≈ 3 = D for many markets.

    Returns
    -------
    dict
        tail_exponent, D_label, empirical_source, note.
    """
    # Stable Lévy distribution: α_Lévy ∈ (0,2]; Gaussian is α_Lévy=2
    # α_tail = 3 is OUTSIDE stable Lévy range → finite variance
    # Interpreted as a truncated power law
    return {
        "tail_exponent":         TAIL_EXPONENT,   # = 3 = D
        "D_value":               D,
        "formula":               "α_tail = D = 3",
        "empirical_source":      "Mantegna & Stanley (1995 Nature): α ≈ 1.4−4 for stocks",
        "typical_range":         (1.4, 4.0),
        "D_in_typical_range":    (1.4 <= TAIL_EXPONENT <= 4.0),
        "gaussian_alpha":        "∞ (Gaussian = thin tail)",
        "power_law_prob":        "P(r > x) ∝ x^{-3} = x^{-D}",
        "moment_condition":      "D=3: variance finite; skewness exists; kurtosis diverges",
        "note": (
            "α_tail = D = 3 is an empirical coincidence: the spatial dimension "
            "numerically matches equity tail exponents measured by Mantegna-Stanley. "
            "No first-principles derivation; labelled EXACT arithmetic match only."
        ),
        "status":               "APPROXIMATE — D=3 within empirical range; not derived",
    }


def economics_summary() -> dict:
    """
    Consolidated summary of Economics – Cathedral connections.

    Returns
    -------
    dict
        All sub-results plus key-results accuracy table.
    """
    return {
        "pareto":             pareto_analysis(),
        "hurst":              hurst_analysis(),
        "microstructure":     market_microstructure(),
        "kelly":              kelly_criterion(),
        "tail":               tail_distribution(),
        "cathedral_integers": {
            "D": D, "N": N, "q": q,
            "delta_star": round(DELTA_STAR, 8),
            "phi": round(phi, 6),
        },
        "key_results": {
            "pareto_8020_vs_delta":    f"log(0.8)/log(0.2)={PARETO_8020:.5f}≈δ★ [APPROX Δ≈6%]",
            "tail_exponent_D":         f"α_tail = D = {D}  [APPROX label, Mantegna-Stanley]",
            "hurst_cathedral":         f"H = (D+1)/(2D) = {H_CATHEDRAL:.4f}  [APPROX formula]",
            "sigma_cathedral":         f"σ_C = δ★√2 = {SIGMA_CATHEDRAL:.4f} = n_eff (metamaterials) [EXACT]",
            "kelly_fraction":          f"f★ = 1−2δ★ = {KELLY_FRACTION:.4f}  [EXACT given p=1−δ★]",
            "bid_ask_spread":          f"∝ 1/√N = 1/√{N} = {SPREAD_RELATIVE:.4f}  [APPROX formula]",
        },
    }


def print_economics_report() -> None:
    """Print a formatted Cathedral Economics report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL ECONOMICS REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  N={N}  D={D}  φ={phi:.6f}")
    print(sep)

    # Pareto
    print(f"\n1. PARETO 80/20 RULE vs δ★")
    print(f"   Exponent  log(0.8)/log(0.2) = {PARETO_8020:.6f}")
    print(f"   δ★                           = {DELTA_STAR:.6f}")
    print(f"   Deviation                    = {PARETO_DELTA_DEV*100:.2f}%  [APPROXIMATE]")
    pareto_1_50 = log(0.50) / log(0.01)
    print(f"   Better: 1% owns 50% → α = {pareto_1_50:.5f} ≈ δ★ (Δ≈{abs(pareto_1_50-DELTA_STAR)/DELTA_STAR*100:.1f}%)")
    print(f"   Gini (shape=1+δ★) = {GINI_PARETO:.4f}")

    # Hurst
    print(f"\n2. HURST EXPONENT  H = (D+1)/(2D) = ({D}+1)/(2×{D})")
    print(f"   H_Cathedral = {H_CATHEDRAL:.6f}  (vs H=0.5 for random walk)")
    print(f"   Empirical equity range: 0.55–0.75; H_C={H_CATHEDRAL:.3f} is in range [APPROX]")

    # Tail
    print(f"\n3. FAT TAIL EXPONENT  (Mantegna-Stanley 1995 Nature)")
    print(f"   α_tail = D = {int(TAIL_EXPONENT)}  P(|r|>x) ∝ x^{{-{int(TAIL_EXPONENT)}}}")
    print(f"   Moment condition: variance finite; kurtosis diverges")
    print(f"   Status: D=3 numerically matches measured α≈3 [APPROX label]")

    # Volatility
    print(f"\n4. CATHEDRAL VOLATILITY  σ_C = δ★√2 = {SIGMA_CATHEDRAL:.6f}")
    print(f"   Annualised: {SIGMA_CATHEDRAL*100:.2f}%  (typical equity vol ≈ 15–25%)")
    print(f"   σ_C = n_eff (metamaterial refractive index) — same formula!")

    # Bid-ask spread
    print(f"\n5. BID-ASK SPREAD  ∝ 1/√N = 1/√{N} = {SPREAD_RELATIVE:.4f}")
    print(f"   Kyle (1985) microstructure: spread ∝ 1/√(# liquidity providers)")

    # Kelly
    print(f"\n6. KELLY CRITERION  p = 1−δ★ = {KELLY_WIN_PROB:.4f}")
    print(f"   f★ = 1 − 2δ★ = {KELLY_FRACTION:.4f}  (even-odds optimal bet fraction)")
    print(f"   Log-growth rate at f★: {KELLY_WIN_PROB*log(1+KELLY_FRACTION) + KELLY_LOSE_PROB*log(1-KELLY_FRACTION):.6f}")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [APPROX, Δ≈6%]  Pareto 80/20 ≈ δ★")
    print(f"  [APPROX label]   α_tail = D = 3 (Mantegna-Stanley)")
    print(f"  [APPROX formula] H = 2/3 = (D+1)/(2D)")
    print(f"  [EXACT]          σ_C = δ★√2 (same as metamaterial n_eff)")
    print(f"  [EXACT given p]  Kelly f★ = 1−2δ★ (p=1−δ★ is speculative)")
    print(sep)
