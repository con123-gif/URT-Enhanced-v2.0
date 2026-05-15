"""
Recipe Audit — Stage 1/2/3 of the unified-recipe investigation.

For every observable in cathedral_v9.py + predictions_registry.py:
  - extract the closed form
  - parameterize it by (prefactor template, γ-exponent, π-power, φ-power, trig, correction)
  - try candidate unifying templates A/B/C and record fit quality

Outputs:
  docs/RECIPE_INVENTORY.md            (the full per-observable inventory)
  docs/UNIFIED_RECIPE_AUDIT.md        (template fitting + DOF accounting)
"""
from __future__ import annotations
import math
from math import pi, sqrt, log, exp, atan, asin, sin, cos, tan
from fractions import Fraction
from dataclasses import dataclass, field
from typing import Callable, Optional, List, Dict, Any

# ── Cathedral primitives ──────────────────────────────────────────────────
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0 / 81.0
PHI   = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL   = D / F                                    # 0.15
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)            # 0.14751
DELTA      = DELTA_CL - DELTA_STAR                     # 0.00249
ETA        = (log(2.0) - (D*D) / N) / log(2.0)          # 0.00141

# ARF residues
d63 = G + D                          # 63
d79 = 4*F - 1                        # 79
d64 = (D + 1)**D                     # 64
d35 = E + q                          # 35
d51 = G - D*D                        # 51

D_EFF = DELTA_STAR - DELTA_STAR**3 / d63 - 2.0 * GAMMA / (4*F)
R_ALPHA = 3.0 / (d64 * PHI) + 1.0 / (d79 * PHI**2)
R_MASS  = 3.0 / d35 * DELTA_STAR**2 - 4.0 / d51 * pi**3

# anchor (the *one* observed input)
RHO_LAMBDA_GeV4 = (2.34e-3 * 1e-9) ** 4
LAMBDA_OVER_MPL4 = D / (D+1)**2 * GAMMA**64
M_PL_GeV = (RHO_LAMBDA_GeV4 / LAMBDA_OVER_MPL4) ** 0.25
V_EW_GeV = pi * M_PL_GeV * GAMMA**9 * cos(pi / V)
Y_E      = GAMMA**3 * pi / 2.0 * (1.0 - DELTA_STAR**2 / pi)
M_E_GeV  = Y_E * V_EW_GeV / sqrt(2.0)
M_P_GeV  = ((D+1) * D**3 * (N+D+1) + 2*DELTA_CL - DELTA_STAR) * M_E_GeV


# ── Observable inventory ─────────────────────────────────────────────────
@dataclass
class Obs:
    name:           str
    closed_form:    str          # symbolic
    predicted:      float
    observed:       Optional[float]
    units:          str = ""
    notes:          str = ""
    # parameterised features (filled in by classifier):
    gamma_exp:      Optional[int] = None
    pi_exp:         Optional[int] = None
    phi_exp:        Optional[int] = None
    has_trig:       bool = False
    has_delta_star: bool = False
    has_correction: bool = False
    prefactor_kind: str = ""     # "rational", "polynomial", "transcendental"
    category:       str = ""     # "scale", "ratio", "angle", "rate", "cosmology"

    def relerr(self) -> Optional[float]:
        if self.observed is None or self.observed == 0:
            return None
        return (self.predicted - self.observed) / self.observed


# Build inventory by replaying the v9 Cathedral class formulas:
def build_inventory() -> List[Obs]:
    inv: List[Obs] = []

    # Scale chain ----------------------------------------------------------
    inv.append(Obs("Lambda/M_Pl^4",
                   "D/(D+1)^2 * gamma^64",
                   LAMBDA_OVER_MPL4, 1.35e-123, "",
                   "single absolute prediction; defines γ-ladder exponent k=64 for Λ",
                   gamma_exp=64, pi_exp=0, phi_exp=0, prefactor_kind="rational", category="scale"))
    inv.append(Obs("M_Pl",
                   "(rho_Lambda / (D/(D+1)^2 * gamma^64))^(1/4)",
                   M_PL_GeV, 1.2209e19, "GeV",
                   "derived from rho_Lambda and Lambda/M_Pl^4",
                   gamma_exp=-16, pi_exp=0, phi_exp=0, prefactor_kind="rational", category="scale"))
    inv.append(Obs("v_EW",
                   "pi * M_Pl * gamma^9 * cos(pi/V)",
                   V_EW_GeV, 246.22, "GeV",
                   "γ-ladder k=9 + trig cos(π/V)",
                   gamma_exp=9, pi_exp=1, phi_exp=0, has_trig=True,
                   prefactor_kind="rational", category="scale"))
    inv.append(Obs("m_e",
                   "y_e * v_EW / sqrt(2), y_e = gamma^3 * pi/2 * (1 - delta_star^2/pi)",
                   M_E_GeV, 5.110e-4, "GeV",
                   "γ-ladder k=3 with δ★² correction",
                   gamma_exp=3, pi_exp=1, phi_exp=0, has_delta_star=True, has_correction=True,
                   prefactor_kind="rational", category="scale"))
    inv.append(Obs("m_p",
                   "((D+1)*D^3*(N+D+1) + 2*delta_cl - delta_star) * m_e",
                   M_P_GeV, 0.93827, "GeV",
                   "Cathedral integer 1836 + small δ correction",
                   gamma_exp=0, pi_exp=0, phi_exp=0, has_delta_star=True,
                   prefactor_kind="polynomial", category="scale"))

    # QED / Gauge ----------------------------------------------------------
    val = (N*N - E - 2) + D_EFF**2 / pi**2 + R_ALPHA
    inv.append(Obs("1/alpha",
                   "(N^2 - E - 2) + delta_eff^2/pi^2 + R_alpha",
                   val, 137.035999, "",
                   "Cathedral integer 137 + 2 corrections (δ★²/π², R_α)",
                   gamma_exp=0, pi_exp=-2, phi_exp=-1,
                   has_delta_star=True, has_correction=True,
                   prefactor_kind="polynomial", category="ratio"))
    val = val - (N - D - 1) - 2.0 * DELTA_STAR / pi
    inv.append(Obs("1/alpha(M_Z)",
                   "1/alpha - (N-D-1) - 2*delta_star/pi",
                   val, 127.952, "",
                   "1/α with subtraction shift",
                   gamma_exp=0, pi_exp=-1, phi_exp=0,
                   has_delta_star=True, has_correction=True,
                   prefactor_kind="polynomial", category="ratio"))
    val = (D / N) * (1.0 + GAMMA / (2.0 * pi))
    inv.append(Obs("sin2_theta_W",
                   "(D/N) * (1 + gamma/(2*pi))",
                   val, 0.23122, "",
                   "γ-ladder k=1 prefactor with γ correction",
                   gamma_exp=1, pi_exp=-1, phi_exp=0,
                   prefactor_kind="rational", category="ratio"))
    val = DELTA_STAR * (q - 1) / q
    inv.append(Obs("alpha_s(M_Z)",
                   "delta_star * (q-1)/q",
                   val, 0.1179, "",
                   "pure δ★ × rational Cathedral",
                   gamma_exp=0, pi_exp=0, phi_exp=0,
                   has_delta_star=True,
                   prefactor_kind="rational", category="ratio"))

    # Leptons -------------------------------------------------------------
    val = D * (G + D**2) * (1.0 - 12.0 * ETA / N)
    inv.append(Obs("m_mu/m_e",
                   "D*(G + D^2) * (1 - 12*eta/N)",
                   val, 206.76828, "",
                   "Cathedral integer 207 with η correction",
                   gamma_exp=0, pi_exp=0, phi_exp=0,
                   has_correction=True,
                   prefactor_kind="polynomial", category="ratio"))
    val = (N + D + (D + 1) / q) * (1.0 + 11.0 * ETA / N)
    inv.append(Obs("m_tau/m_mu",
                   "(N+D+(D+1)/q) * (1 + 11*eta/N)",
                   val, None, "",  # implicit
                   "η correction structure",
                   gamma_exp=0, pi_exp=0, phi_exp=0,
                   has_correction=True,
                   prefactor_kind="rational", category="ratio"))
    val = (D + 1) * D**3 * (N + D + 1) + 2.0 * DELTA_CL - DELTA_STAR
    inv.append(Obs("m_p/m_e",
                   "(D+1)*D^3*(N+D+1) + 2*delta_cl - delta_star",
                   val, 1836.15267, "",
                   "Cathedral integer 1836 + small δ correction",
                   gamma_exp=0, pi_exp=0, phi_exp=0,
                   has_delta_star=True,
                   prefactor_kind="polynomial", category="ratio"))

    # Quarks (relative to m_p) --------------------------------------------
    inv.append(Obs("m_u",  "2*pi*Delta*delta_star * m_p",
                   2.0*pi*DELTA*DELTA_STAR*M_P_GeV, 2.16e-3, "GeV",
                   "Δ × δ★ structure", pi_exp=1, has_delta_star=True, category="scale"))
    inv.append(Obs("m_d",  "2*Delta * m_p",
                   2.0*DELTA*M_P_GeV, 4.67e-3, "GeV",
                   "Δ only", has_delta_star=True, category="scale"))
    inv.append(Obs("m_s",  "8*gamma * m_p",
                   8.0*GAMMA*M_P_GeV, 93.4e-3, "GeV",
                   "γ-ladder k=1", gamma_exp=1, category="scale"))
    inv.append(Obs("m_c",  "(D+1)/D * (1+gamma) * m_p",
                   (D+1)/D * (1+GAMMA) * M_P_GeV, 1.27, "GeV",
                   "γ-ladder k=1 correction", gamma_exp=1, category="scale"))
    inv.append(Obs("m_b",  "((D+1) + delta_cl*D) * m_p",
                   ((D+1) + DELTA_CL*D) * M_P_GeV, 4.18, "GeV",
                   "δ_cl × Cathedral linear", has_delta_star=True, category="scale"))
    inv.append(Obs("m_t",  "(N^2 + D*q) * m_p",
                   (N**2 + D*q) * M_P_GeV, 172.69, "GeV",
                   "pure Cathedral integer 184·m_p", category="scale"))

    # EW bosons + Higgs ---------------------------------------------------
    # Need g_2 etc — replay from cathedral_v9
    s2 = (D/N) * (1.0 + GAMMA/(2.0*pi))
    a_MZ = 1.0 / val  # noqa: F841 -- use after constructing
    a_MZ = 1.0 / (137.035999084 - (N - D - 1) - 2.0 * DELTA_STAR / pi)
    g2 = 4.0 * pi * a_MZ / s2
    gp2 = g2 * s2 / (1.0 - s2)
    mW = 0.5 * sqrt(g2) * V_EW_GeV
    mZ = 0.5 * sqrt(g2 + gp2) * V_EW_GeV
    inv.append(Obs("m_W",  "0.5*sqrt(g2)*v_EW", mW, 80.379, "GeV",
                   "from v_EW + α(M_Z) + sin²θ_W", gamma_exp=9, has_trig=True, category="scale"))
    inv.append(Obs("m_Z",  "0.5*sqrt(g2+gp2)*v_EW", mZ, 91.188, "GeV",
                   "from v_EW + couplings", gamma_exp=9, has_trig=True, category="scale"))
    lam_H = DELTA_STAR * (D + 1) * N * (1.0 + GAMMA) / (F * D)
    mH = sqrt(2.0 * lam_H) * V_EW_GeV
    inv.append(Obs("m_H",  "sqrt(2*lambda_H)*v_EW; lambda_H=delta_star*(D+1)*N*(1+gamma)/(F*D)",
                   mH, 125.25, "GeV",
                   "δ★ × Cathedral rational × v_EW", gamma_exp=9, has_delta_star=True, category="scale"))

    # QCD -----------------------------------------------------------------
    inv.append(Obs("f_pi", "m_p * (D-1)/D * delta_star",
                   M_P_GeV * (D-1)/D * DELTA_STAR, None, "GeV",
                   "pure δ★ × rational", has_delta_star=True, category="scale"))
    val = M_P_GeV * DELTA_STAR * (1.0 - GAMMA - 2.0*q*ETA)
    inv.append(Obs("m_pi", "m_p * delta_star * (1 - gamma - 2*q*eta)",
                   val, 0.13957, "GeV",
                   "δ★ with γ+η corrections",
                   has_delta_star=True, has_correction=True, gamma_exp=1, category="scale"))
    val = M_P_GeV * GAMMA * F * (1.0 - DELTA_STAR * pi / q)
    inv.append(Obs("Lambda_QCD", "m_p * gamma*F * (1 - delta_star*pi/q)",
                   val, 0.210, "GeV",
                   "γ × F × δ★·π correction",
                   gamma_exp=1, pi_exp=1, has_delta_star=True, has_correction=True, category="scale"))

    # CKM -----------------------------------------------------------------
    val = D/N * (1.0 - (D+1)/(N*V))
    inv.append(Obs("sin_theta_C", "(D/N)*(1-(D+1)/(N*V))",
                   val, 0.22500, "",
                   "pure Cathedral rational", category="ratio",
                   prefactor_kind="rational"))
    val = PHI/2.0 * (1.0 + 2.0*GAMMA)
    inv.append(Obs("A_CKM", "phi/2 * (1 + 2*gamma)",
                   val, 0.836, "",
                   "phi × Cathedral", phi_exp=1, gamma_exp=1, category="ratio"))
    val = sin(pi/F)
    inv.append(Obs("rho_bar", "sin(pi/F)",
                   val, 0.159, "",
                   "trig of π/F", pi_exp=1, has_trig=True, category="ratio"))

    # PMNS / neutrinos -----------------------------------------------------
    val = atan((N+1)/(N*PHI)) * (1.0 - 2.0*GAMMA/pi) * 180.0/pi
    inv.append(Obs("theta_12_deg", "atan((N+1)/(N*phi))*(1-2*gamma/pi)*180/pi",
                   val, 33.41, "deg",
                   "atan + γ correction", pi_exp=-1, phi_exp=-1, gamma_exp=1,
                   has_trig=True, has_correction=True, category="angle"))
    val = asin(DELTA_STAR) * (1.0 + 6.0*ETA) * 180.0/pi
    inv.append(Obs("theta_13_deg", "asin(delta_star)*(1+6*eta)*180/pi",
                   val, 8.54, "deg",
                   "asin(δ★) + η correction",
                   has_delta_star=True, has_correction=True, has_trig=True, category="angle"))
    val = asin(sqrt((F+V)/(G-1)) * (1.0 + 2.0*GAMMA)) * 180.0/pi
    inv.append(Obs("theta_23_deg", "asin(sqrt((F+V)/(G-1))*(1+2*gamma))*180/pi",
                   val, 49.1, "deg",
                   "asin sqrt(rational) + γ correction",
                   has_trig=True, gamma_exp=1, has_correction=True, category="angle"))
    val = float((D+1)*F + (N-D-1)*N)
    inv.append(Obs("delta_CP_deg", "(D+1)*F + (N-D-1)*N",
                   val, 197.0, "deg",
                   "exact Cathedral integer 197", category="angle",
                   prefactor_kind="polynomial"))

    # Neutrino masses (delicate)
    M_E_eV = M_E_GeV * 1e9
    m2 = (2.0/(4*N+1)) * PHI * DELTA_STAR * GAMMA**3 * M_E_eV
    inv.append(Obs("m_2", "(2/(4N+1))*phi*delta_star*gamma^3 * m_e",
                   m2, None, "eV",
                   "irreducible denominator 4N+1", gamma_exp=3, phi_exp=1,
                   has_delta_star=True, category="scale"))
    m3 = ((5*N-6)/(4*N+1)) * DELTA_STAR * GAMMA**3 / pi * M_E_eV
    inv.append(Obs("m_3", "((5N-6)/(4N+1))*delta_star*gamma^3/pi * m_e",
                   m3, None, "eV",
                   "irreducible denominator 4N+1, numerator 5N-6", gamma_exp=3, pi_exp=-1,
                   has_delta_star=True, category="scale"))
    inv.append(Obs("sum_m_nu", "(m_2 + m_3)*1000",
                   (m2 + m3) * 1000.0, 58.9, "meV",
                   "sum of neutrino masses", gamma_exp=3, category="scale"))

    # Cosmology -----------------------------------------------------------
    Om = (1 + D)/N * (1.0 + 2.0*GAMMA)
    inv.append(Obs("Omega_m", "(D+1)/N * (1 + 2*gamma)", Om, 0.3153, "",
                   "4/13 × γ correction; the K_4 fraction", gamma_exp=1, category="cosmology"))
    OmB = Om * (2.0*DELTA_CL - DELTA_STAR) * (1.0 + 2.0*GAMMA)
    inv.append(Obs("Omega_b", "Omega_m * (2*delta_cl - delta_star) * (1+2*gamma)",
                   OmB, 0.0493, "",
                   "small (δ_cl - δ★/2) factor with γ correction",
                   gamma_exp=1, has_delta_star=True, category="cosmology"))
    sig8 = DELTA_STAR * (N-2)/2.0
    inv.append(Obs("sigma_8", "delta_star*(N-2)/2", sig8, 0.8111, "",
                   "pure δ★ × Cathedral", has_delta_star=True, category="cosmology"))
    H0r = float(N)/V
    inv.append(Obs("H_0 ratio (alt)", "N/V", H0r, 73.04/67.36, "",
                   "second closed form for H0 ratio", category="cosmology"))
    eb = GAMMA**3 * DELTA * DELTA_STAR * 8.0/9.0
    inv.append(Obs("eta_B", "gamma^3 * Delta * delta_star * 8/9", eb, 6.1e-10, "",
                   "γ-ladder k=3 with Δ·δ★ + 4/9 fingerprint", gamma_exp=3, has_delta_star=True,
                   category="ratio"))

    # Inflation -----------------------------------------------------------
    ne = G - D
    ns = 1.0 - 2.0/ne
    rt = 12.0/ne**2
    inv.append(Obs("n_s", "1 - 2/(G-D)", ns, 0.9649, "",
                   "rational in Cathedral integers", category="ratio",
                   prefactor_kind="rational"))
    inv.append(Obs("r_tensor", "12/(G-D)^2", rt, None, "",
                   "rational in Cathedral integers", category="ratio"))
    A_s = (ne**2 * (D+1)**3 * q * 32.0/9.0 * pi**4 * GAMMA**9 * cos(pi/V)**4)
    inv.append(Obs("A_s", "(G-D)^2 *(D+1)^3 *q* 32/9 *pi^4 *gamma^9 *cos^4(pi/V)",
                   A_s, 2.10e-9, "",
                   "γ-ladder k=9 with rich Cathedral prefactor and cos^4(π/V) trig",
                   gamma_exp=9, pi_exp=4, has_trig=True, category="scale"))

    # Dark + gravity -----------------------------------------------------
    inv.append(Obs("m_DM_keV", "m_p * gamma^3 * 1e6", M_P_GeV*GAMMA**3*1e6, None, "keV",
                   "γ-ladder k=3", gamma_exp=3, category="scale"))
    inv.append(Obs("G_N(Planck)", "delta_star^2", DELTA_STAR**2, None, "",
                   "δ★² geometric", has_delta_star=True, category="ratio"))

    # GUT ---------------------------------------------------------------
    inv.append(Obs("M_GUT", "(D+1)*v_EW*gamma^(-7)",
                   (D+1)*V_EW_GeV*GAMMA**(-7), 3.73e16, "GeV",
                   "negative γ-exponent k=-7", gamma_exp=-7, category="scale"))

    # Falsifiable predictions ------------------------------------------
    inv.append(Obs("r_p (proton charge radius)",
                   "4*hbar_c/m_p", 4*0.197327/M_P_GeV, 0.8409, "fm",
                   "Compton-style", category="scale"))

    # Add a few more from predictions_registry
    inv.append(Obs("Casimir DF/F @ 100 nm",
                   "(a0/d)^2 * (D+1)/(D!+D) = (a0/d)^2 * 4/9",
                   1.245e-7, None, "ppm-scale",
                   "4/9 fingerprint",
                   prefactor_kind="rational", category="ratio"))

    return inv


# ── Templates ────────────────────────────────────────────────────────────

# Template A:  O_pred = P(D,q,V,N,E,F,G) * gamma^k * pi^a * phi^b
# where P is rational (numerator/denominator are small Cathedral polynomials).

# Template B:  O_pred = P * gamma^k * pi^a * phi^b * (1 + c1*delta_star^2 + c2*gamma + c3*eta)
# allows ONE small correction factor of a fixed shape

# Template C:  O_pred = T(P/Q * pi^a * phi^b * delta_star^c) * gamma^k * Cathedral_int
# T is one of {id, sin, cos, tan, atan, asin}

# We measure: for each observable, can we find (P, k, a, b) such that
# template A reproduces the v9 formula to <1% rel-err using only Cathedral
# integers in P (numerator/denominator each a *single product* of
# Cathedral primitives — i.e. extremely tight)?

# Build "Cathedral basis": small integer multiples of products of {D,q,V,N,E,F,G,1}
CATH_INTS = {
    'D':D,'q':q,'V':V,'N':N,'E':E,'F':F,'G':G,'1':1,
    'D+1':D+1,'D-1':D-1,'N+1':N+1,'N-1':N-1,'V/2':V/2,
    'D!':6,'q!':120,'D^D':27,'N^2':169,'D+q':D+q,'2D':2*D,'2N':2*N,
    'D!+1':7,'D!+D':9,'4F':80,'4N+1':53,'5N-6':59,'G-D':57,
    'F+V':32,'G-1':59,'G+D':63,'N+D+1':17,'N-D-1':9,
    'D+1)^D':64, 'D*N':39, 'D!*V':72, 'V*F':240,
}


def template_A_fits(o: Obs) -> Dict[str, Any]:
    """
    Search for (gamma_exp, pi_exp, phi_exp, prefactor_rational) such that
    P * gamma^k * pi^a * phi^b reproduces o.predicted to <1% rel-err,
    where P is restricted to (cathedral int)/(cathedral int).
    """
    target = o.predicted
    best = None
    cints = list(CATH_INTS.items())
    # γ-ladder exponents allowed: the published canonical set
    gamma_exps = [-16, -7, -1, 0, 1, 2, 3, 5, 7, 9, 64]
    pi_exps = [-4, -2, -1, 0, 1, 2, 4]
    phi_exps = [-2, -1, 0, 1, 2]

    for k in gamma_exps:
        for a in pi_exps:
            for b in phi_exps:
                base = GAMMA**k * pi**a * PHI**b
                if base == 0:
                    continue
                P_needed = target / base
                # try P = num/den with num,den ∈ CATH_INTS basis
                for n_name, n_val in cints:
                    for d_name, d_val in cints:
                        if d_val == 0:
                            continue
                        ratio = n_val / d_val
                        if ratio == 0:
                            continue
                        rel = (ratio - P_needed) / P_needed if P_needed != 0 else float('inf')
                        if abs(rel) < 0.01:
                            cand = (abs(rel), k, a, b, n_name, d_name, ratio)
                            if best is None or cand < best:
                                best = cand

    if best is None:
        return {'fit': False, 'best_relerr': None}
    return {'fit': True,
            'gamma_exp': best[1], 'pi_exp': best[2], 'phi_exp': best[3],
            'numerator': best[4], 'denominator': best[5],
            'rel_err': best[0]}


def template_B_fits(o: Obs) -> Dict[str, Any]:
    """Template A + ONE small correction:  (1 + c1*delta_star + c2*gamma + c3*eta)
    where c1,c2,c3 ∈ {-2,-1,0,1,2} (small integers).
    """
    target = o.predicted
    best = None
    cints = list(CATH_INTS.items())
    gamma_exps = [-16, -7, -1, 0, 1, 2, 3, 5, 7, 9, 64]
    pi_exps = [-4, -2, -1, 0, 1, 2, 4]
    phi_exps = [-2, -1, 0, 1, 2]
    coefs = [-2, -1, 0, 1, 2]

    for k in gamma_exps:
        for a in pi_exps:
            for b in phi_exps:
                base = GAMMA**k * pi**a * PHI**b
                if base == 0: continue
                for c1 in coefs:
                    for c2 in coefs:
                        for c3 in coefs:
                            corr = 1.0 + c1*DELTA_STAR + c2*GAMMA + c3*ETA
                            if corr == 0: continue
                            P_needed = target / (base * corr)
                            for n_name, n_val in cints:
                                for d_name, d_val in cints:
                                    if d_val == 0: continue
                                    ratio = n_val / d_val
                                    if ratio == 0: continue
                                    rel = (ratio - P_needed) / P_needed if P_needed != 0 else float('inf')
                                    if abs(rel) < 0.005:
                                        cand = (abs(rel), k, a, b, c1, c2, c3, n_name, d_name)
                                        if best is None or cand < best:
                                            best = cand

    if best is None:
        return {'fit': False, 'best_relerr': None}
    return {'fit': True,
            'gamma_exp': best[1], 'pi_exp': best[2], 'phi_exp': best[3],
            'corrections': (best[4], best[5], best[6]),
            'numerator': best[7], 'denominator': best[8],
            'rel_err': best[0]}


def template_C_fits(o: Obs) -> Dict[str, Any]:
    """Template C: trig wrapper.  O_pred = T(argument) * Cathedral_prefactor
    where T ∈ {id, sin, cos, atan, asin}, argument = P/Q * pi^a or similar.

    Limited search — we just check whether the observable is well-described
    by ONE of the trig classes.
    """
    return {'note': 'template-C is a structural classification; see has_trig flag.'}


# ── DOF accounting ──────────────────────────────────────────────────────
def template_A_DOF_per_observable() -> float:
    """Effective DOF = log2 of # distinct expressions reachable by template A.
    Choices: gamma_exp ∈ 11 values, pi_exp ∈ 7, phi_exp ∈ 5, num/den each ∈ |CATH_INTS|.
    """
    n_gamma = 11
    n_pi    = 7
    n_phi   = 5
    n_cints = len(CATH_INTS)
    total = n_gamma * n_pi * n_phi * n_cints * n_cints
    return math.log2(total)


def template_B_DOF_per_observable() -> float:
    n_gamma = 11
    n_pi    = 7
    n_phi   = 5
    n_cints = len(CATH_INTS)
    n_coef  = 5  # {-2,-1,0,1,2}
    total = n_gamma * n_pi * n_phi * n_coef**3 * n_cints * n_cints
    return math.log2(total)


def information_delivered(rel_err: Optional[float]) -> float:
    """Shannon-style info: bits in matching observation to rel-err precision."""
    if rel_err is None or rel_err == 0:
        return 0.0
    return math.log2(1.0 / abs(rel_err))


# ── Main ────────────────────────────────────────────────────────────────
def run_audit():
    inv = build_inventory()
    print(f"Inventory: {len(inv)} observables")

    # Template A fit
    fits_A = []
    for o in inv:
        if o.observed is None:
            fits_A.append(None)
            continue
        res = template_A_fits(o)
        fits_A.append(res)

    # Template B fit (only on those Template A missed)
    fits_B = []
    for i, o in enumerate(inv):
        if o.observed is None:
            fits_B.append(None)
            continue
        if fits_A[i] and fits_A[i].get('fit'):
            fits_B.append(None)
            continue
        res = template_B_fits(o)
        fits_B.append(res)

    # Counts
    a_hits = sum(1 for r in fits_A if r and r.get('fit'))
    b_hits = sum(1 for r in fits_B if r and r.get('fit'))
    total_with_obs = sum(1 for o in inv if o.observed is not None)
    print(f"Template A hits: {a_hits}/{total_with_obs}")
    print(f"Template B additional hits: {b_hits}/{total_with_obs}")

    # Per-observable report
    print("\n── Per-observable template fit ─────────────────────────────")
    for i, o in enumerate(inv):
        flag_A = "—"
        flag_B = "—"
        if o.observed is None:
            tag = "[open]"
        else:
            tag = ""
            if fits_A[i] and fits_A[i].get('fit'):
                flag_A = f"A:{fits_A[i]['numerator']}/{fits_A[i]['denominator']}·γ^{fits_A[i]['gamma_exp']}·π^{fits_A[i]['pi_exp']}·φ^{fits_A[i]['phi_exp']} ({fits_A[i]['rel_err']*100:.2f}%)"
            if fits_B[i] and fits_B[i].get('fit'):
                flag_B = f"B+corr"
        print(f"  {o.name:<28} {tag:<7} {flag_A}")

    # DOF accounting
    dof_A = template_A_DOF_per_observable()
    dof_B = template_B_DOF_per_observable()
    print(f"\n── DOF accounting ──────────────────────────────────────────")
    print(f"Template A DOF per observable: {dof_A:.2f} bits")
    print(f"Template B DOF per observable: {dof_B:.2f} bits")

    # Information delivered
    total_info = 0.0
    for i, o in enumerate(inv):
        if o.observed is None: continue
        rerr = o.relerr()
        if rerr is None or rerr == 0: continue
        total_info += information_delivered(rerr)
    print(f"Total information delivered (sum log2(1/rel_err)): {total_info:.1f} bits")
    print(f"Total template-A budget: {dof_A * total_with_obs:.1f} bits ({total_with_obs} observables)")
    print(f"  Net info: {total_info - dof_A*total_with_obs:.1f} bits")

    return inv, fits_A, fits_B


if __name__ == "__main__":
    run_audit()
