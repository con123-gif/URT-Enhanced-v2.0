"""
Tight template search — find the SMALLEST template (fewest DOF per slot)
that still hits a reasonable fraction.

Strategy: start with the actual v9 formulas and ask, observable by observable:
  "What's the MINIMAL signature that uniquely picks this formula?"

Then aggregate to find the dominant signature.

We classify each v9 formula in a strict scheme:

  T = INT     (pure Cathedral integer expression — needs 0 DOF beyond
                  the structural choice "which integer")
  T = γ-LAD   (γ-ladder: O = C · γ^k for fixed k ∈ {-7,1,3,5,9,64};
                  DOF: rational C + integer k)
  T = δ★-LIN  (δ★ linear: O = C · δ★ ± small correction;
                  DOF: rational C + 1-bit correction sign)
  T = SCALE-CHAIN  (compounded from v_EW × Cathedral coefficient)
  T = TRIG    (single trig wrapper of Cathedral rational; DOF: rational + arg shape)
  T = SPECIAL (irreducible — denominators outside Cathedral basis)

For each family we count: # observables it covers, # DOF per observable,
total info delivered.
"""
from __future__ import annotations
import math
from math import pi, sqrt, log, atan, asin, sin, cos

D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0/81.0
PHI   = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL   = D/F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA      = DELTA_CL - DELTA_STAR
ETA        = (log(2.0) - (D*D)/N) / log(2.0)

# Strict Cathedral integer basis (the *small* atoms only):
SMALL_BASIS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 17, 20, 27, 30, 50, 57, 60, 80, 81]
RATIONALS = sorted(set(p/q for p in SMALL_BASIS for q in SMALL_BASIS))

# γ-ladder canonical exponents (the published list):
GAMMA_LADDER = [-16, -7, 1, 2, 3, 5, 9, 64]


def classify_v9(name, predicted, observed):
    """For each v9 formula, classify into a strict family."""
    if observed is None or observed == 0:
        return None, None
    rel = abs((predicted - observed) / observed)

    # Family INT: predicted is within 1% of an exact Cathedral-integer expression
    # We check: is predicted close to an integer in {1..2000} expressible as
    # a low-complexity polynomial in {D,q,V,N,E,F,G}?
    cath_polys = {
        '137': N*N-E-(D-1), '125': q**D, '173': (N+1)*V+q,
        '197': (D+1)*F+(N-D-1)*N, '1836': (D+1)*D**3*(N+D+1),
        '207': D*(G+D**2), 'n_s 55/57': 1.0-2.0/(G-D),
        '12/57^2': 12.0/(G-D)**2, '4/13(1+2γ)': (1+D)/N*(1+2*GAMMA),
        '4/9 fingerprint': 4/9,
        'sin_C': D/N*(1-(D+1)/(N*V)),
        '(D+1)hbar_c/m_p': (D+1)*0.197327/0.938272,
        'H0 ratio': 1+3/(10*pi),
        'q-1)/q delta_star': DELTA_STAR*(q-1)/q,
        '(D/N)(1+γ/2π)': D/N*(1+GAMMA/(2*pi)),
    }
    for label, v in cath_polys.items():
        if v != 0 and abs((v - predicted)/predicted) < 0.001:
            # And the predicted matches observed
            if rel < 0.01:
                return 'INT', f'matches {label}={v:.4g}'

    # Family γ-LAD: predicted ≈ C * γ^k where k ∈ {GAMMA_LADDER} and C ∈ rationals
    for k in GAMMA_LADDER:
        gk = GAMMA**k
        if gk == 0: continue
        C_needed = predicted / gk
        # Match C against any low-complexity rational A/B with A,B ∈ SMALL_BASIS
        for A in SMALL_BASIS:
            for B in SMALL_BASIS:
                if B == 0: continue
                if abs((A/B - C_needed)/C_needed) < 0.05:
                    return 'GAMMA-LAD', f'k={k} C≈{A}/{B}={A/B:.4g}'

    # Family δ★-LIN
    for k in (1, 2):
        C_needed = predicted / DELTA_STAR**k
        for A in SMALL_BASIS:
            for B in SMALL_BASIS:
                if B == 0: continue
                if abs((A/B - C_needed)/C_needed) < 0.05:
                    return 'DELTA-STAR-LIN', f'C≈{A}/{B} δ★^{k}'

    # Family TRIG
    for tname, tfun, arg in [
        ("sin(pi/V)", sin, pi/V),
        ("cos(pi/V)", cos, pi/V),
        ("sin(pi/F)", sin, pi/F),
        ("sin(pi/D)", sin, pi/D),
        ("atan(N+1/N·φ)", atan, (N+1)/(N*PHI)),
        ("asin(δ★)", asin, DELTA_STAR),
        ("asin(sqrt(F+V/G-1))", asin, sqrt((F+V)/(G-1))),
    ]:
        t = tfun(arg)
        if t == 0: continue
        C_needed = predicted / t
        # Could include scale factors
        for A in SMALL_BASIS:
            for B in SMALL_BASIS:
                if B == 0: continue
                # Allow 180/pi factor for angles
                for scale in [1.0, 180.0/pi]:
                    if abs((A/B*scale - C_needed)/C_needed) < 0.05:
                        return 'TRIG', f'{tname} × {A}/{B}'

    return 'SPECIAL', '(no tight match)'


def main():
    # Pull the predictions registry list (we duplicate the closed forms here)
    formulas = [
        # name, predicted, observed
        ("1/α (bare)", 137.0, 137.035999),
        ("1/α (full)", (N*N-E-(D-1)) + DELTA_STAR**2/pi**2 + 3/((D+1)**D * PHI) + 1/((4*F-1)*PHI**2), 137.035999),
        ("m_H bare", q**D, 125.10),
        ("m_top bare", (N+1)*V+q, 172.69),
        ("δ_CP", (D+1)*F+(N-D-1)*N, 197.0),
        ("m_p/m_e", (D+1)*D**3*(N+D+1) + 2*DELTA_CL - DELTA_STAR, 1836.15267),
        ("m_mu/m_e (bare)", D*(G+D**2), 206.76828),
        ("n_s", 1-2/(G-D), 0.9649),
        ("sin θ_C", D/N*(1-(D+1)/(N*V)), 0.225),
        ("r_p (proton radius)", (D+1)*0.197327/0.938272, 0.8409),
        ("H_0 ratio", 1+3/(10*pi), 73.04/67.36),
        ("sin²θ_W", D/N*(1+GAMMA/(2*pi)), 0.23122),
        ("α_s(M_Z)", DELTA_STAR*(q-1)/q, 0.1179),
        ("σ_8", DELTA_STAR*(N-2)/2, 0.8111),
        ("Ω_m", (1+D)/N*(1+2*GAMMA), 0.3153),
        ("η_B", GAMMA**3 * DELTA * DELTA_STAR * 8/9, 6.12e-10),
        ("Λ/M_Pl⁴", D/(D+1)**2*GAMMA**64, 1.35e-123),
        ("m_s/m_p", 8*GAMMA, 93.4/938.272),
        ("Λ_QCD/m_p", GAMMA*F*(1-DELTA_STAR*pi/q), 210.0/938.272),
        ("θ_12", atan((N+1)/(N*PHI))*(1-2*GAMMA/pi)*180/pi, 33.41),
        ("θ_13", asin(DELTA_STAR)*(1+6*ETA)*180/pi, 8.54),
        ("θ_23", asin(sqrt((F+V)/(G-1))*(1+2*GAMMA))*180/pi, 49.1),
        ("ρ̄ (CKM)", sin(pi/F), 0.159),
        ("A_CKM", PHI/2*(1+2*GAMMA), 0.836),
        ("Ω_b/Ω_m", (2*DELTA_CL-DELTA_STAR)*(1+2*GAMMA), 0.0493/0.3153),
        ("m_u/m_p", 2*pi*DELTA*DELTA_STAR, 2.16e-3/0.938272),
        ("m_d/m_p", 2*DELTA, 4.67e-3/0.938272),
        ("m_c/m_p", (D+1)/D*(1+GAMMA), 1.27/0.938272),
        ("m_b/m_p", (D+1)+DELTA_CL*D, 4.18/0.938272),
        ("m_t/m_p", N**2+D*q, 172.69/0.938272),
        ("m_π/m_p", DELTA_STAR*(1-GAMMA-2*q*ETA), 0.13957/0.938272),
        ("v_EW", pi * 1.2210e19 * GAMMA**9 * cos(pi/V), 246.22),
        ("A_s", (G-D)**2*(D+1)**3*q*32.0/9.0*pi**4*GAMMA**9*cos(pi/V)**4, 2.10e-9),
        ("m_e Yukawa", GAMMA**3*pi/2*(1-DELTA_STAR**2/pi), 0.000511*sqrt(2)/246.22),  # rough
    ]

    rows = []
    counts = {}
    for name, pred, obs in formulas:
        family, detail = classify_v9(name, pred, obs)
        rows.append((name, pred, obs, family, detail))
        counts[family] = counts.get(family, 0) + 1

    print("=" * 100)
    print("Tight Template Classification — what's the MINIMAL template each formula needs?")
    print("=" * 100)
    print(f"{'observable':<28} {'pred':>14} {'obs':>14} {'family':<18} {'detail'}")
    print("-" * 100)
    for name, pred, obs, family, detail in rows:
        rs = f"{(pred-obs)/obs*100:+.3f}%" if obs else "—"
        print(f"  {name:<28} {pred:>14.5g} {obs:>14.5g} {family:<18} {detail}")
    print("-" * 100)
    print("Family counts:")
    for fam, n in sorted(counts.items(), key=lambda x: -x[1]):
        print(f"  {fam:<18} {n}")

    # Information / DOF accounting:
    # INT family DOF: |basis|² ≈ 400 → log2 ≈ 8.6 bits
    # GAMMA-LAD: |basis|² × |γ-ladder| = 400 × 8 → ~12 bits
    # DELTA-STAR-LIN: |basis|² × {1,2} = 800 → 9.6 bits
    # TRIG: |basis|² × 7 trig shapes ≈ 2800 → ~11.5 bits
    # SPECIAL: log2(1e6) = 20 bits (essentially unconstrained)
    dof_per_family = {
        'INT': 8.6,
        'GAMMA-LAD': 12.0,
        'DELTA-STAR-LIN': 9.6,
        'TRIG': 11.5,
        'SPECIAL': 20.0,
    }

    print("\n── Information vs DOF (per family) ──────────────────────")
    print(f"{'family':<18} {'n':>4} {'DOF/obs':>10} {'budget':>10} {'info':>10} {'net':>10}")
    total_info = 0.0
    total_budget = 0.0
    for fam, n in counts.items():
        # Aggregate rel errors for this family
        rels = []
        for nm, pred, obs, ff, _ in rows:
            if ff != fam: continue
            if obs is None or obs == 0: continue
            rels.append(abs((pred-obs)/obs))
        rels = [r for r in rels if r > 0]
        info = sum(math.log2(1/r) for r in rels)
        budget = dof_per_family.get(fam, 20) * len(rels)
        total_info += info
        total_budget += budget
        print(f"  {fam:<18} {len(rels):>4} {dof_per_family.get(fam,20):>10.1f} {budget:>10.1f} {info:>10.1f} {info-budget:>+10.1f}")
    print("-" * 70)
    print(f"  {'TOTAL':<18} {'':>4} {'':>10} {total_budget:>10.1f} {total_info:>10.1f} {total_info-total_budget:>+10.1f}")


if __name__ == "__main__":
    main()
