"""
Renormalisation Group flow for the Cathedral/URT framework.

δ(μ) = (1 − w(μ))·δ_IR + w(μ)·δ★
w(μ)  = σ(P_RG · ln(μ/μ_c))       sigmoid crossover

P_RG = (6N + 5)/30 = 83/30 ≈ 2.767
μ_c  = (7/5)/γ + (5/4)·π²/δ_eff  ≈ 197 GeV
"""

import numpy as np
from math import pi, log


def rg_flow(mu_GeV, delta_star=0.14751, delta_IR=0.15, N=13, gamma=1/81):
    """
    Return δ(μ) at energy scale mu_GeV.
    Interpolates between δ_IR (classical, IR) and δ★ (quantum, UV).
    """
    D, F = 3, 20
    phi = (1 + 5**0.5) / 2
    d80 = 4 * F
    d64 = (D + 1) ** D
    d79 = d80 - 1
    d63 = 60 + D

    delta_eff = delta_star - (delta_star**3 / d63) - (2 * gamma / d80)

    P_RG = (6 * N + 5) / 30
    mu_c = (7 / 5) * (1 / gamma) + (5 / 4) * (pi**2 / delta_eff)

    x = P_RG * log(mu_GeV / mu_c)
    w = 1.0 / (1.0 + np.exp(-x))
    return float((1 - w) * delta_IR + w * delta_star)


def crossover_scale(gamma=1/81):
    """Return μ_c (GeV) — the electroweak crossover scale."""
    D, F = 3, 20
    delta_star = (1 - gamma) * pi / (13 * (1 + 5**0.5) / 2)
    d63, d80 = 63, 80
    delta_eff = delta_star - (delta_star**3 / d63) - (2 * gamma / d80)
    return (7 / 5) / gamma + (5 / 4) * pi**2 / delta_eff


def running_alpha_inv(mu_GeV, alpha0_inv=137.036, N_f=5):
    """1-loop running of 1/α from μ=0 to μ."""
    b0 = (4 / 3) * N_f - 22 / 3
    return alpha0_inv + b0 / (2 * pi) * log(mu_GeV / 0.511e-3)


def running_alpha_s(mu_GeV, alpha_s_MZ=0.1180, M_Z=91.188):
    """1-loop running of α_s."""
    N_c, N_f = 3, 5
    b0 = (11 * N_c - 2 * N_f) / (12 * pi)
    t = log(mu_GeV / M_Z)
    return alpha_s_MZ / (1 + alpha_s_MZ * b0 * t)


def print_rg_table():
    scales = [
        (1e-3,   "m_e"),
        (0.938,  "m_p"),
        (1.0,    "1 GeV"),
        (4.18,   "m_b"),
        (91.2,   "M_Z"),
        (125.0,  "m_H"),
        (172.7,  "m_t"),
        (197.0,  "μ_c (Cathedral)"),
        (246.0,  "v_EW"),
        (1e4,    "10 TeV"),
        (1e16,   "M_GUT"),
    ]
    print(f"{'Scale':>20}  {'μ (GeV)':>12}  {'δ(μ)':>10}  {'1/α(μ)':>10}  {'α_s(μ)':>10}")
    print("-" * 70)
    for mu, label in scales:
        d = rg_flow(mu)
        a = running_alpha_inv(mu)
        s = running_alpha_s(mu) if mu >= 1.0 else float("nan")
        print(f"{label:>20}  {mu:>12.3e}  {d:>10.6f}  {a:>10.4f}  {s:>10.5f}")


if __name__ == "__main__":
    print("=" * 70)
    print(f"Crossover scale μ_c = {crossover_scale():.4f} GeV")
    print("=" * 70)
    print_rg_table()
