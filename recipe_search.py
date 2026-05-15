"""
Brute-force search for a unified Cathedral recipe template.

Tries to fit every v9 observable to a SINGLE master template:

    O = C(Cathedral_rational) * gamma^k * pi^a * phi^b
        * T(arg) * (1 + eps)

where the parameter space is small and structural. Reports per-observable
the best-fitting parameters, the worst-case fit error, and what (if anything)
falls outside the template.
"""
from __future__ import annotations
from math import pi, sqrt, log, exp, atan, asin, sin, cos
from fractions import Fraction
import itertools

# ── Cathedral primitives ────────────────────────────────────────────────
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0 / 81.0
PHI = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL = D / F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA = DELTA_CL - DELTA_STAR
ETA = (log(2.0) - float(D * D) / N) / log(2.0)

INTS = {'D': D, 'q': q, 'V': V, 'N': N, 'E': E, 'F': F, 'G': G,
        '1': 1, '2': 2, '4': 4, '8': 8}
# add small Cathedral compounds
EXTRA = {
    'D+1': D+1, 'D-1': D-1, 'D!': 6, 'D^2': 9, 'D^D': 27,
    'N-1': N-1, 'N+1': N+1, 'N-2': N-2, 'N+D+1': N+D+1, 'G-D': G-D, 'G+D^2': G+D**2,
    '4N+1': 4*N+1, '5N-6': 5*N-6, 'F+V': F+V, 'G-1': G-1, 'q-1': q-1,
    'N^2-E-2': N**2-E-2, '(D+1)*F+(N-D-1)*N': (D+1)*F+(N-D-1)*N,
    'D*(G+D^2)': D*(G+D**2), '(D+1)*D^3*(N+D+1)': (D+1)*D**3*(N+D+1),
    'N^2+D*q': N**2+D*q,
}

# pre-build a pool of Cathedral RATIONALS (numerator/denominator pairs)
RATIONALS = {}
for name1, v1 in {**INTS, **EXTRA}.items():
    for name2, v2 in {**INTS, **EXTRA}.items():
        if v2 == 0:
            continue
        key = f"{name1}/{name2}"
        RATIONALS[key] = v1 / v2

# γ-exponent ladder
GAMMA_LADDER = [-16, -7, -4, 0, 1, 3, 5, 9, 64]
# π exponent
PI_EXP = [-2, -1, 0, 1, 2, 3, 4]
# φ exponent
PHI_EXP = [-2, -1, 0, 1, 2]
# trig wrappers
WRAPPERS = {
    'id': lambda x: x,
    'sin': sin, 'cos': cos,
    'asin_deg': lambda x: asin(x) * 180/pi if abs(x) <= 1 else float('nan'),
    'atan_deg': lambda x: atan(x) * 180/pi,
    'sqrt': lambda x: sqrt(x) if x >= 0 else float('nan'),
}
# tiny corrections (multiplicative)
CORRECTIONS = {
    '1':           1.0,
    '1+g':         1 + GAMMA,
    '1+2g':        1 + 2*GAMMA,
    '1+g/2pi':     1 + GAMMA/(2*pi),
    '1-g':         1 - GAMMA,
    '1+6eta':      1 + 6*ETA,
    '1+11eta/N':   1 + 11*ETA/N,
    '1-12eta/N':   1 - 12*ETA/N,
    '1-d*/pi':     1 - DELTA_STAR/pi,
    '1-d*^2/pi':   1 - DELTA_STAR**2/pi,
    '1-d**pi/q':   1 - DELTA_STAR*pi/q,
    '1-2g/pi':     1 - 2*GAMMA/pi,
}

# ── Targets (PDG / Planck) ─────────────────────────────────────────────
# (name, observed value, mass_dim_exponent in m_p — i.e. observable / m_p^d)
# For dimensionless or in-units-of-Cathedral-natural, mass_dim=0.
TARGETS = [
    # Dimensionless ratios / integers
    ('alpha_inv',       137.035999,    0),
    ('alpha_MZ_inv',    127.952,       0),
    ('alpha_s_MZ',      0.1179,        0),
    ('sin2_thetaW',     0.23122,       0),
    ('alpha_GUT_inv',   25.70,         0),
    ('m_mu/m_e',        206.76828,     0),
    ('m_tau/m_mu',      16.81700,      0),
    ('m_p/m_e',         1836.15267,    0),
    ('sin_thetaC',      0.22500,       0),
    ('theta_12_deg',    33.41,         0),
    ('theta_13_deg',    8.54,          0),
    ('theta_23_deg',    49.1,          0),
    ('delta_CP_deg',    197.0,         0),
    ('Omega_m',         0.3153,        0),
    ('sigma_8',         0.8111,        0),
    ('n_s',             0.9649,        0),
    ('A_s',             2.10e-9,       0),
    ('lambda_H',        0.129,         0),
    ('H0_ratio',        1.0837,        0),
    ('Lambda/MPl^4',    1.35e-123,     0),
    ('Omega_b',         0.0493,        0),
    ('G_N_Planck',      DELTA_STAR**2, 0),
    ('eta_B',           6.1e-10,       0),
    # Quark mass ratios m_q / m_p
    ('m_u/m_p',         2.16e-3/0.93827,    0),
    ('m_d/m_p',         4.67e-3/0.93827,    0),
    ('m_s/m_p',         93.4e-3/0.93827,    0),
    ('m_c/m_p',         1.27/0.93827,       0),
    ('m_b/m_p',         4.18/0.93827,       0),
    ('m_t/m_p',         172.69/0.93827,     0),
    # Λ_QCD / m_p
    ('LQCD/m_p',        0.210/0.93827,      0),
    # f_pi / m_p, m_pi / m_p
    ('fpi/m_p',         0.09228/0.93827,    0),
    ('mpi/m_p',         0.135/0.93827,      0),
    # PMNS m_2, m_3 in eV — we'll work in units of m_e
    ('m2/m_e',          (sqrt(7.53e-5))/0.000511, 0),  # ~17e-3 / 511e-3 (rough)
]

# Tolerance: a recipe "fits" if relative error < 1%
TOL = 1e-2

# ── Search loop ─────────────────────────────────────────────────────────

def search_observable(target_value: float, name: str = ''):
    """Brute-force search for the simplest recipe that hits target_value."""
    best = None
    for (rkey, rval), (ckey, cval), k, a, b, (wkey, wfn) in itertools.product(
        RATIONALS.items(), CORRECTIONS.items(),
        GAMMA_LADDER, PI_EXP, PHI_EXP, WRAPPERS.items(),
    ):
        try:
            arg = rval * GAMMA**k * pi**a * PHI**b
            val = wfn(arg) * cval
        except Exception:
            continue
        if val == 0 or not (val == val):  # NaN check
            continue
        rel = abs(val - target_value) / abs(target_value) if target_value else abs(val)
        if best is None or rel < best[0]:
            best = (rel, rkey, k, a, b, wkey, ckey, val)
            if rel < 1e-6:
                return best  # stop early on near-exact hit
    return best


def main():
    print("=" * 78)
    print(" UNIFIED RECIPE BRUTE-FORCE SEARCH ")
    print("=" * 78)
    print(f"\nRationals: {len(RATIONALS)}  γ exps: {len(GAMMA_LADDER)}  π exps: {len(PI_EXP)}")
    print(f"φ exps: {len(PHI_EXP)}  wrappers: {len(WRAPPERS)}  corrections: {len(CORRECTIONS)}")
    space = len(RATIONALS) * len(GAMMA_LADDER) * len(PI_EXP) * len(PHI_EXP) * len(WRAPPERS) * len(CORRECTIONS)
    print(f"Search space per observable: {space:,} ≈ 2^{log(space)/log(2):.1f}")
    print()

    hits01 = hits1 = miss = 0
    rows = []
    for name, obs, _md in TARGETS:
        b = search_observable(obs, name)
        if b is None:
            miss += 1
            rows.append((name, obs, None, None, None))
            continue
        rel, rkey, k, a, b_exp, wkey, ckey, val = b
        flag = '***' if rel < 1e-3 else ('** ' if rel < 1e-2 else ' * ')
        if rel < 1e-3: hits01 += 1
        elif rel < 1e-2: hits1 += 1
        else: miss += 1
        recipe = f"{wkey}({rkey} * g^{k} * pi^{a} * phi^{b_exp}) * [{ckey}]"
        rows.append((name, obs, val, rel, recipe))
        print(f"{flag} {name:<18} obs={obs:<14.5g} fit={val:<14.5g} err={rel*100:>+7.3f}%  {recipe}")

    print()
    print("=" * 78)
    print(f" SUMMARY: ***={hits01}  ** ={hits1}  miss={miss}  total={len(TARGETS)}")
    print(f" Coverage @ 1%: {hits01+hits1}/{len(TARGETS)} = {100*(hits01+hits1)/len(TARGETS):.1f}%")
    print("=" * 78)


if __name__ == '__main__':
    main()
