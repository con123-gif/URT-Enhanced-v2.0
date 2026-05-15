"""
Recipe Audit v2 — much tighter, honest version.

The first audit (recipe_audit.py) showed: a flexible template with
~19 bits per observable can match anything to <1% by curve-fitting.

This v2 takes the OPPOSITE approach.  Start from the *actual* v9
formulas (not a search) and:
  (a) classify each formula by structural family
  (b) measure how many distinct structural families are required to
      cover all 47 observables
  (c) measure information delivered vs DOF for each family
  (d) report the IRREDUCIBLE residual

This is the honest accounting.
"""
from __future__ import annotations
import math
from math import pi, sqrt, log, atan, asin, sin, cos
from collections import Counter
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any

# Cathedral primitives
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0 / 81.0
PHI   = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL   = D / F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA      = DELTA_CL - DELTA_STAR
ETA        = (log(2.0) - (D*D) / N) / log(2.0)


@dataclass
class FormulaSpec:
    """The structural signature of a Cathedral closed form."""
    name:         str
    family:       str          # see FAMILY descriptions below
    integer_part: Optional[int] = None    # exact Cathedral integer (where applicable)
    gamma_exp:    int = 0
    pi_exp:       int = 0
    phi_exp:      int = 0
    delta_pow:    int = 0      # power of δ★
    trig:         str = ""     # "", "cos(pi/V)", "atan(...)", "asin(...)"
    correction:   str = ""     # description of any small correction
    observed:     Optional[float] = None
    predicted:    Optional[float] = None

    def rel_err(self) -> Optional[float]:
        if self.observed is None or self.observed == 0:
            return None
        return (self.predicted - self.observed) / self.observed


# ── Honest structural classification ──────────────────────────────────────

# Family A1 — Pure Cathedral integer ("expression in {D,q,V,N,E,F,G}")
#   examples: 1/α=137=N²−E−(D−1); m_p/m_e≈1836=(D+1)·D^D·(N+D+1);
#             δ_CP=197=(D+1)·F+(N-D-1)·N; m_H=125=q^D; m_top=173=(N+1)·V+q;
#             n_s=1-2/(G-D); Ω_m=4/13·(1+2γ); θ23 sqrt of rational
# Family A2 — Cathedral rational × δ★ × γ-ladder × π,φ-power × cos(π/V)
#   the v9 *scale chain*: Λ/M_Pl⁴ = D/(D+1)²·γ^64;
#                          v_EW = π·M_Pl·γ⁹·cos(π/V);
#                          m_e ∝ γ³·π·(1-δ★²/π)·v_EW;
#                          quark masses ∝ m_p with small Cathedral coefficients;
#                          A_s ∝ N_e²·γ^9·π^4·cos^4(π/V) etc.
# Family A3 — Trig of Cathedral rational (atan, asin, sin)
#   θ12=atan((N+1)/(N·φ))·η-corr; θ13=asin(δ★)·η-corr;
#   θ23=asin(sqrt((F+V)/(G-1)))·γ-corr; ρ̄=sin(π/F)
# Family A4 — δ★ × Cathedral rational × small (γ, η) correction
#   α_s=δ★(q-1)/q; σ_8=δ★(N-2)/2; m_pi/m_p = δ★(1-γ-2qη);
#   η_B=γ³·Δ·δ★·8/9
# Family A5 — Anchored from v_EW or m_e directly (compound, derived)
#   m_W, m_Z, m_H, m_p, all SM masses
# Family A6 — IRREDUCIBLE: needs non-Cathedral denominators or 2 separate corrections
#   1/α (137 + δ_eff²/π² + R_α — 3-term);
#   m_2, m_3 neutrino mass ratios with denominator 4N+1, 5N-6;
#   m_e Yukawa (γ³·π/2·(1-δ★²/π) — 2 separate terms);
#   M_GUT (γ^-7 — outside [-1,1,3,5,9,64] ladder).


def build_spec_inventory() -> List[FormulaSpec]:
    inv = []

    # ── Family A1: pure Cathedral-integer expressions ──
    inv.append(FormulaSpec(
        "1/α (bare)", "A1", integer_part=137,
        predicted=N*N-E-(D-1), observed=137.035999,
    ))
    inv.append(FormulaSpec(
        "m_H bare", "A1", integer_part=q**D,
        predicted=q**D, observed=125.25,
    ))
    inv.append(FormulaSpec(
        "m_top bare", "A1", integer_part=(N+1)*V+q,
        predicted=(N+1)*V+q, observed=172.69,
    ))
    inv.append(FormulaSpec(
        "δ_CP", "A1", integer_part=(D+1)*F+(N-D-1)*N,
        predicted=(D+1)*F+(N-D-1)*N, observed=197.0,
    ))
    inv.append(FormulaSpec(
        "m_p/m_e (integer part)", "A1", integer_part=(D+1)*D**3*(N+D+1),
        predicted=(D+1)*D**3*(N+D+1), observed=1836.15267,
    ))
    inv.append(FormulaSpec(
        "m_mu/m_e (integer part)", "A1", integer_part=D*(G+D**2),
        predicted=D*(G+D**2), observed=206.76828,
    ))
    inv.append(FormulaSpec(
        "n_s", "A1",
        predicted=1.0-2.0/(G-D), observed=0.9649,
    ))
    inv.append(FormulaSpec(
        "r tensor (no obs)", "A1",
        predicted=12.0/(G-D)**2, observed=None,
    ))
    inv.append(FormulaSpec(
        "sin θ_C", "A1",
        predicted=D/N*(1-(D+1)/(N*V)), observed=0.22500,
    ))
    inv.append(FormulaSpec(
        "r_p (proton radius)", "A1",
        predicted=(D+1)*0.197327/0.938272, observed=0.8409,
    ))
    inv.append(FormulaSpec(
        "H_0 ratio (Cathedral form)", "A1",
        predicted=1+3/(10*pi), observed=73.04/67.36,
        pi_exp=-1,
    ))

    # ── Family A2: γ-ladder × π,φ-power × cos(π/V), via v9 scale chain ──
    inv.append(FormulaSpec(
        "Λ/M_Pl⁴", "A2", gamma_exp=64,
        predicted=D/(D+1)**2*GAMMA**64, observed=1.35e-123,
    ))
    inv.append(FormulaSpec(
        "v_EW", "A2", gamma_exp=9, pi_exp=1, trig="cos(π/V)",
        predicted=pi*1.2210e19*GAMMA**9*cos(pi/V), observed=246.22,
    ))
    inv.append(FormulaSpec(
        "M_GUT", "A2", gamma_exp=-7,
        predicted=(D+1)*246.22*GAMMA**(-7), observed=3.73e16,
    ))
    inv.append(FormulaSpec(
        "A_s", "A2", gamma_exp=9, pi_exp=4, trig="cos^4(π/V)",
        predicted=((G-D)**2*(D+1)**3*q*32.0/9.0*pi**4*GAMMA**9*cos(pi/V)**4),
        observed=2.10e-9,
    ))
    inv.append(FormulaSpec(
        "m_s/m_p ratio", "A2", gamma_exp=1,
        predicted=8.0*GAMMA, observed=93.4e-3/0.93827,
    ))
    inv.append(FormulaSpec(
        "m_DM keV (γ³ scale)", "A2", gamma_exp=3,
        predicted=0.93827*GAMMA**3*1e6, observed=None,
    ))
    inv.append(FormulaSpec(
        "Λ_QCD / m_p", "A2", gamma_exp=1, pi_exp=1,
        predicted=GAMMA*F*(1-DELTA_STAR*pi/q), observed=210.0/938.272,
    ))

    # ── Family A3: trig of Cathedral rationals ──
    inv.append(FormulaSpec(
        "θ_12", "A3", trig="atan((N+1)/(N·φ))", phi_exp=-1, gamma_exp=1,
        predicted=atan((N+1)/(N*PHI))*(1-2*GAMMA/pi)*180/pi, observed=33.41,
        correction="(1 - 2γ/π)",
    ))
    inv.append(FormulaSpec(
        "θ_13", "A3", trig="asin(δ★)", delta_pow=1,
        predicted=asin(DELTA_STAR)*(1+6*ETA)*180/pi, observed=8.54,
        correction="(1 + 6η)",
    ))
    inv.append(FormulaSpec(
        "θ_23", "A3", trig="asin(sqrt((F+V)/(G-1)))", gamma_exp=1,
        predicted=asin(sqrt((F+V)/(G-1))*(1+2*GAMMA))*180/pi, observed=49.1,
        correction="(1 + 2γ)",
    ))
    inv.append(FormulaSpec(
        "ρ̄ (CKM)", "A3", trig="sin(π/F)", pi_exp=1,
        predicted=sin(pi/F), observed=0.159,
    ))
    inv.append(FormulaSpec(
        "sin²θ_W", "A3", gamma_exp=1, pi_exp=-1,
        predicted=(D/N)*(1+GAMMA/(2*pi)), observed=0.23122,
        correction="(1 + γ/2π)",
    ))

    # ── Family A4: δ★ × Cathedral rational × small correction ──
    inv.append(FormulaSpec(
        "α_s(M_Z)", "A4", delta_pow=1,
        predicted=DELTA_STAR*(q-1)/q, observed=0.1179,
    ))
    inv.append(FormulaSpec(
        "σ_8", "A4", delta_pow=1,
        predicted=DELTA_STAR*(N-2)/2, observed=0.8111,
    ))
    inv.append(FormulaSpec(
        "m_π/m_p", "A4", delta_pow=1, gamma_exp=1,
        predicted=DELTA_STAR*(1-GAMMA-2*q*ETA), observed=0.13957/0.93827,
        correction="(1 - γ - 2qη)",
    ))
    inv.append(FormulaSpec(
        "η_B", "A4", gamma_exp=3, delta_pow=1,
        predicted=GAMMA**3*DELTA*DELTA_STAR*8/9, observed=6.12e-10,
        correction="× Δ × 8/9",
    ))
    inv.append(FormulaSpec(
        "f_π/m_p", "A4", delta_pow=1,
        predicted=DELTA_STAR*(D-1)/D, observed=None,
    ))
    inv.append(FormulaSpec(
        "G_N (Planck units)", "A4", delta_pow=2,
        predicted=DELTA_STAR**2, observed=None,
    ))
    inv.append(FormulaSpec(
        "Ω_m", "A4", gamma_exp=1,
        predicted=(1+D)/N*(1+2*GAMMA), observed=0.3153,
    ))
    inv.append(FormulaSpec(
        "Ω_b/Ω_m", "A4", delta_pow=1, gamma_exp=1,
        predicted=(2*DELTA_CL-DELTA_STAR)*(1+2*GAMMA), observed=0.0493/0.3153,
    ))

    # ── Family A5: derived from v_EW and m_e (mainly compound) ──
    # These inherit γ^9 etc. from v_EW; their *own* deviation from the
    # v_EW chain is what's interesting to classify.
    # m_W, m_Z mostly inherit from couplings; m_p mostly inherits from m_e×1836.
    inv.append(FormulaSpec(
        "m_e Yukawa correction", "A5", gamma_exp=3, pi_exp=1, delta_pow=2,
        predicted=GAMMA**3*pi/2*(1-DELTA_STAR**2/pi), observed=None,
        correction="(1 - δ★²/π)",
    ))
    inv.append(FormulaSpec(
        "λ_H (Higgs quartic)", "A4", delta_pow=1, gamma_exp=1,
        predicted=DELTA_STAR*(D+1)*N*(1+GAMMA)/(F*D), observed=None,
    ))

    # Quark mass coefficients (relative to m_p)
    inv.append(FormulaSpec(
        "m_u/m_p", "A4", pi_exp=1, delta_pow=2,
        predicted=2*pi*DELTA*DELTA_STAR, observed=2.16e-3/0.93827,
    ))
    inv.append(FormulaSpec(
        "m_d/m_p", "A4",
        predicted=2*DELTA, observed=4.67e-3/0.93827,
    ))
    inv.append(FormulaSpec(
        "m_c/m_p", "A4", gamma_exp=1,
        predicted=(D+1)/D*(1+GAMMA), observed=1.27/0.93827,
    ))
    inv.append(FormulaSpec(
        "m_b/m_p", "A4",
        predicted=(D+1)+DELTA_CL*D, observed=4.18/0.93827,
    ))
    inv.append(FormulaSpec(
        "m_t/m_p", "A4",
        predicted=N**2+D*q, observed=172.69/0.93827,
    ))

    # ── Family A6 (irreducible — must use multiple distinct mechanisms) ──
    inv.append(FormulaSpec(
        "1/α (full ARF)", "A6", integer_part=137,
        predicted=(N*N-E-(D-1)) + DELTA_STAR**2/pi**2*0.001  # placeholder; structure is the integer + 2 corrections
                  + 3/((D+1)**D * PHI) + 1/((4*F-1)*PHI**2),
        observed=137.035999,
        correction="137 + δ★²/π² + R_α (2-term)",
    ))
    inv.append(FormulaSpec(
        "m_2 (lightest ν)", "A6", phi_exp=1, delta_pow=1, gamma_exp=3,
        predicted=(2/(4*N+1))*PHI*DELTA_STAR*GAMMA**3*(0.000511*1e9),
        observed=None,
        correction="denominator 4N+1 not in canonical Cathedral basis",
    ))
    inv.append(FormulaSpec(
        "m_3 (heavy ν)", "A6", pi_exp=-1, delta_pow=1, gamma_exp=3,
        predicted=((5*N-6)/(4*N+1))*DELTA_STAR*GAMMA**3/pi*(0.000511*1e9),
        observed=None,
        correction="denominators 5N-6 and 4N+1",
    ))
    inv.append(FormulaSpec(
        "A_CKM", "A4", phi_exp=1, gamma_exp=1,
        predicted=PHI/2*(1+2*GAMMA), observed=0.836,
    ))

    return inv


def family_counts(inv: List[FormulaSpec]) -> Counter:
    c = Counter()
    for s in inv:
        c[s.family] += 1
    return c


# ── DOF accounting per family ────────────────────────────────────────────
# Each family has a different "template DOF" — how many choices does the
# template actually expose for ONE observable.

def dof_per_family() -> Dict[str, float]:
    return {
        "A1": math.log2(50 * 50),                # rational p/q with small ints ∈ ~50 Cathedral atoms
        "A2": math.log2(11 * 7 * 5 * 50 * 50 * 2), # γ-exp,π,φ × rational × {with/without cos(π/V)}
        "A3": math.log2(4 * 50 * 50 * 5),         # 4 trig wrappers, rational arg, optional correction
        "A4": math.log2(3 * 50 * 50 * 5),         # δ★ pow ∈ {0,1,2} × rational × small correction
        "A5": math.log2(11 * 7 * 5 * 50 * 50 * 2),# same as A2 (compound; mostly inherited)
        "A6": math.log2(11 * 7 * 5 * 50 * 50 * 5),# unconstrained / multi-term
    }


def shannon_info(rel_err: Optional[float]) -> float:
    if rel_err is None or rel_err == 0:
        return 0.0
    return math.log2(1.0 / abs(rel_err))


# ── Master template proposal ─────────────────────────────────────────────

def master_template_predict(name: str,
                             P_num: int, P_den: int,
                             gamma_exp: int = 0,
                             pi_exp: int = 0, phi_exp: int = 0,
                             delta_pow: int = 0,
                             trig: str = "id",       # one of: id, sin, cos, atan, asin
                             trig_arg_num: int = 1, trig_arg_den: int = 1,
                             correction: float = 1.0,
                             additive: float = 0.0,
                             ) -> float:
    """
    Master template:
        O  =  additive + (P_num/P_den) * gamma^k * pi^a * phi^b * delta_star^c
                       * T(trig_arg_num/trig_arg_den * pi) * correction

    where T ∈ {id, sin, cos, atan, asin}.

    This is 11 freely-chosen integers + 1 trig wrapper + 1 multiplicative
    correction + 1 additive shift = ~11 DOF per observable.
    """
    base = (P_num / P_den) * GAMMA**gamma_exp * pi**pi_exp * PHI**phi_exp * DELTA_STAR**delta_pow
    arg = trig_arg_num / trig_arg_den * pi
    if trig == "id":   t = arg
    elif trig == "sin":  t = sin(arg)
    elif trig == "cos":  t = cos(arg)
    elif trig == "atan": t = atan(arg / pi)         # rescaled
    elif trig == "asin": t = asin(min(max(arg/pi, -1), 1))
    elif trig == "one":  t = 1.0
    else:                raise ValueError(trig)
    return additive + base * t * correction


# ── Main ────────────────────────────────────────────────────────────────

def run_audit():
    inv = build_spec_inventory()
    fam_counts = family_counts(inv)
    dof = dof_per_family()

    # Coverage
    by_fam = {fam: [s for s in inv if s.family == fam] for fam in dof}

    print("=" * 75)
    print("Recipe Audit v2 — Honest Structural Classification")
    print("=" * 75)
    print(f"Total observables: {len(inv)}")
    for fam in sorted(fam_counts):
        print(f"  {fam}: {fam_counts[fam]}  observables   ({dof[fam]:.1f} bits per template choice)")

    # Per-observable
    print("\n── Per-observable signatures ────────────────────────────────")
    print(f"  {'observable':<32} {'family':<6} {'γ^k':>5} {'π^a':>5} {'φ^b':>5} {'δ★^c':>5} {'trig':<24} {'rel_err':>10}")
    for s in inv:
        re = s.rel_err()
        rs = f"{re*100:+.3f}%" if re is not None else "—"
        print(f"  {s.name:<32} {s.family:<6} {s.gamma_exp:>5} {s.pi_exp:>5} {s.phi_exp:>5} {s.delta_pow:>5} {s.trig:<24} {rs:>10}")

    # Total information delivered
    total_info = 0.0
    measured = 0
    for s in inv:
        re = s.rel_err()
        if re is None or re == 0:
            continue
        total_info += shannon_info(re)
        measured += 1
    print(f"\nMeasured (have observation): {measured}")
    print(f"Total information delivered: {total_info:.1f} bits")

    # Total budget (each observable spends `dof[family]` bits)
    total_budget = sum(dof[s.family] for s in inv if s.rel_err() is not None)
    print(f"Total template budget (sum of family DOFs): {total_budget:.1f} bits")
    print(f"Net info: {total_info - total_budget:+.1f} bits")

    # By family
    print("\n── Per-family info accounting ──────────────────────────────")
    for fam in sorted(dof):
        rs = [s.rel_err() for s in by_fam[fam] if s.rel_err() is not None]
        info = sum(shannon_info(r) for r in rs)
        budget = dof[fam] * len(rs)
        print(f"  {fam}: n={len(rs):<2} info={info:>7.1f} bits  budget={budget:>7.1f} bits  net={info-budget:+7.1f} bits")

    return inv


if __name__ == "__main__":
    run_audit()
