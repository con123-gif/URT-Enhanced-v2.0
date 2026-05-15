"""
======================================================================
 CATHEDRAL RECIPE BRUTE-FORCE SEARCH — Colab-ready single file
======================================================================

Paste this entire file into a Colab cell and run. No external deps
beyond numpy. Searches for a SINGLE master recipe template that fits
every Cathedral v9 observable, and reports per-observable parameters
plus total DOF accounting.

The master template is:

    O = T( R(integers) * gamma^k * pi^a * phi^b ) * C(corrections)

where R is a Cathedral rational, T is one of {id, sin, cos, asin_deg,
atan_deg, sqrt}, and C is a multiplicative correction.

Output:
  - per-observable best-fit parameters and relative error
  - coverage @ 0.1%, 1%, 10%
  - effective DOF (bits) given the search space
  - bits of information delivered by the fits
  - verdict: tight, marginal, or curve-fitting
======================================================================
"""
import itertools
from math import pi, sqrt, log, exp, atan, asin, sin, cos
import time

# ── CATHEDRAL PRIMITIVES (all from D=3) ──────────────────────────────
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0 / 81.0
PHI = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL = D / F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA = DELTA_CL - DELTA_STAR
ETA = (log(2.0) - 9.0 / N) / log(2.0)

# ── Cathedral "vocabulary" — integers and small compounds ────────────
PRIMES = {'1':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9}
INTS   = {'D':D, 'q':q, 'V':V, 'N':N, 'E':E, 'F':F, 'G':G}
COMPS  = {
    'D+1':D+1, 'D-1':D-1, 'D!':6, 'D^2':9, 'D^3':27, 'D^D':27,
    'N-1':N-1, 'N+1':N+1, 'N-2':N-2, 'N+2':N+2, 'N+D+1':N+D+1,
    'G-D':G-D, 'G+D^2':G+D**2, 'G-D^2':G-D**2, 'G-1':G-1, 'G+D':G+D,
    'F+V':F+V, 'F-V':F-V, '4N+1':4*N+1, '5N-6':5*N-6, 'q-1':q-1,
    '4F':4*F, '4F-1':4*F-1, 'E+q':E+q, 'F*D':F*D, 'F*V':F*V,
    '2V':2*V, '2F':2*F, '2N':2*N,
    # spectral-residue style targets (fixed values from ARF)
    'N^2-E-2':N**2-E-2,                             # 137
    '(D+1)F+(N-D-1)N':(D+1)*F+(N-D-1)*N,            # 197
    'D(G+D^2)':D*(G+D**2),                           # 207
    '(D+1)D^3(N+D+1)':(D+1)*D**3*(N+D+1),           # 1836
    'N^2+Dq':N**2+D*q,                               # 184
    # δ★ and Δ as "vocabulary" elements
    'd*':DELTA_STAR, 'd*^2':DELTA_STAR**2, 'd*^3':DELTA_STAR**3,
    'D':DELTA, '2D':2*DELTA, 'd_cl':DELTA_CL,
}

VOCAB = {**INTS, **COMPS, **PRIMES}

# Build a pool of Cathedral rationals a/b with no duplicates
def build_rationals():
    pairs = {}
    for n_name, n_val in VOCAB.items():
        for d_name, d_val in VOCAB.items():
            if d_val == 0:
                continue
            v = n_val / d_val
            key = f"{n_name}/{d_name}"
            # also include n*v (products) of common pairs
            pairs[key] = v
    # add canonical pure values
    pairs['gamma'] = GAMMA
    return pairs

RATIONALS = build_rationals()

# ── Search axes ──────────────────────────────────────────────────────
GAMMA_EXP = [-16, -7, -4, -1, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 32, 64]
PI_EXP    = [-3, -2, -1, 0, 1, 2, 3, 4]
PHI_EXP   = [-2, -1, 0, 1, 2]

# wrappers
WRAPPERS = {
    'id':       lambda x: x,
    'sin':      lambda x: sin(x),
    'cos':      lambda x: cos(x),
    'sqrt':     lambda x: sqrt(x) if x >= 0 else float('nan'),
    'asin_deg': lambda x: asin(x)*180/pi if abs(x) <= 1 else float('nan'),
    'atan_deg': lambda x: atan(x)*180/pi,
    'asin':     lambda x: asin(x) if abs(x) <= 1 else float('nan'),
    'atan':     lambda x: atan(x),
}

# multiplicative corrections
CORRECTIONS = {
    '1':           1.0,
    '1+g':         1 + GAMMA,
    '1+2g':        1 + 2*GAMMA,
    '1-g':         1 - GAMMA,
    '1+g/2pi':     1 + GAMMA/(2*pi),
    '1-2g/pi':     1 - 2*GAMMA/pi,
    '1+6eta':      1 + 6*ETA,
    '1+11eta/N':   1 + 11*ETA/N,
    '1-12eta/N':   1 - 12*ETA/N,
    '1-2q*eta':    1 - 2*q*ETA,
    '1-d*/pi':     1 - DELTA_STAR/pi,
    '1-d*^2/pi':   1 - DELTA_STAR**2/pi,
    '1-d**pi/q':   1 - DELTA_STAR*pi/q,
    '8/9':         8.0/9.0,
    '32/9':        32.0/9.0,
}

# ── Targets ──────────────────────────────────────────────────────────
TARGETS = [
    # Pure integers / ratios
    ('1/alpha',           137.035999),
    ('alpha(MZ)^-1',      127.952),
    ('alpha_s(MZ)',       0.1179),
    ('sin2_thetaW',       0.23122),
    ('alpha_GUT^-1',      25.70),
    ('m_mu/m_e',          206.76828),
    ('m_tau/m_mu',        16.81700),
    ('m_p/m_e',           1836.15267),
    ('sin_thetaC',        0.22500),
    ('theta_12_deg',      33.41),
    ('theta_13_deg',      8.54),
    ('theta_23_deg',      49.1),
    ('delta_CP_deg',      197.0),
    ('Omega_m',           0.3153),
    ('Omega_b',           0.0493),
    ('sigma_8',           0.8111),
    ('n_s',               0.9649),
    ('H0_ratio',          1.0837),
    ('lambda_H',          0.129),
    # quark ratios m_q / m_p
    ('m_u/m_p',           2.16e-3/0.93827),
    ('m_d/m_p',           4.67e-3/0.93827),
    ('m_s/m_p',           93.4e-3/0.93827),
    ('m_c/m_p',           1.27/0.93827),
    ('m_b/m_p',           4.18/0.93827),
    ('m_t/m_p',           172.69/0.93827),
    ('LQCD/m_p',          0.210/0.93827),
    ('fpi/m_p',           0.09228/0.93827),
    ('mpi/m_p',           0.135/0.93827),
    # γ-ladder anchored
    ('Lambda/MPl^4',      1.35e-123),
    # dynamical-engine derived
    ('eta_B',             6.1e-10),
    ('A_s',               2.10e-9),
    # dimensionless gravity coupling
    ('G_N_Planck',        DELTA_STAR**2),
]

# ── Search ───────────────────────────────────────────────────────────

def search_one(target: float, max_rel: float = 1e-3, verbose: bool = False):
    """Return the best (relative_error, recipe_dict) within the template."""
    best = (float('inf'), None)
    n_tried = 0
    for r_key, r_val in RATIONALS.items():
        for k in GAMMA_EXP:
            gk = GAMMA**k
            for a in PI_EXP:
                pa = pi**a
                for b in PHI_EXP:
                    pb = PHI**b
                    arg_base = r_val * gk * pa * pb
                    for w_key, w_fn in WRAPPERS.items():
                        try:
                            wv = w_fn(arg_base)
                        except Exception:
                            continue
                        if wv != wv:  # NaN
                            continue
                        for c_key, c_val in CORRECTIONS.items():
                            val = wv * c_val
                            n_tried += 1
                            if val == 0:
                                continue
                            rel = abs(val - target) / abs(target) if target else abs(val)
                            if rel < best[0]:
                                best = (rel, {
                                    'rational': r_key, 'k': k, 'a': a, 'b': b,
                                    'wrapper': w_key, 'correction': c_key,
                                    'value': val,
                                })
                                if rel < 1e-9:
                                    return best, n_tried
    return best, n_tried

# ── DOF accounting ───────────────────────────────────────────────────

def dof_per_slot():
    n = len(RATIONALS) * len(GAMMA_EXP) * len(PI_EXP) * len(PHI_EXP) * len(WRAPPERS) * len(CORRECTIONS)
    return log(n) / log(2.0)

# ── Run ──────────────────────────────────────────────────────────────

def main():
    print("=" * 80)
    print(" CATHEDRAL UNIFIED RECIPE — BRUTE-FORCE SEARCH ")
    print("=" * 80)
    print(f"\nSearch space per observable: {len(RATIONALS) * len(GAMMA_EXP) * len(PI_EXP) * len(PHI_EXP) * len(WRAPPERS) * len(CORRECTIONS):,}")
    print(f"DOF per slot: {dof_per_slot():.2f} bits\n")
    print(f"{'Observable':<22}{'Obs':>14}{'Fit':>14}{'Err%':>9}  Recipe")
    print("-" * 100)

    h01 = h1 = h10 = miss = 0
    bits_delivered = 0.0
    t0 = time.time()
    results = []
    for name, obs in TARGETS:
        (rel, rec), _ntried = search_one(obs)
        if rec is None:
            print(f"{name:<22}{obs:>14.5g}{'-':>14}{'-':>9}  MISS")
            miss += 1
            continue
        flag = '***' if rel<1e-3 else ('** ' if rel<1e-2 else (' * ' if rel<0.1 else 'MISS'))
        if rel < 1e-3: h01 += 1
        elif rel < 1e-2: h1 += 1
        elif rel < 0.1:  h10 += 1
        else: miss += 1
        if rel > 0:
            bits_delivered += min(20.0, log(1.0/rel) / log(2.0))
        recipe_str = f"{rec['wrapper']}({rec['rational']} g^{rec['k']} pi^{rec['a']} phi^{rec['b']}) * [{rec['correction']}]"
        print(f"{name:<22}{obs:>14.5g}{rec['value']:>14.5g}{rel*100:>+8.3f}%  {flag}  {recipe_str}")
        results.append((name, obs, rel, rec))

    elapsed = time.time() - t0
    n_targets = len(TARGETS)
    dof_total = dof_per_slot() * (h01 + h1)  # only count slots we filled
    print("-" * 100)
    print(f"\nCoverage:  ***={h01}  ** ={h1}  * ={h10}  MISS={miss}  N={n_targets}")
    print(f"           @0.1% : {h01}/{n_targets} = {100*h01/n_targets:.1f}%")
    print(f"           @1%   : {h01+h1}/{n_targets} = {100*(h01+h1)/n_targets:.1f}%")
    print(f"           @10%  : {h01+h1+h10}/{n_targets} = {100*(h01+h1+h10)/n_targets:.1f}%")
    print(f"\nDOF accounting (information-theoretic):")
    print(f"  Bits per template slot:     {dof_per_slot():.2f}")
    print(f"  Slots filled @ <=1%:        {h01+h1}")
    print(f"  Total bits of freedom:      {dof_total:.1f}")
    print(f"  Bits delivered by fits:     {bits_delivered:.1f}")
    print(f"  Ratio info/freedom:         {bits_delivered/max(dof_total,1):.2f}")
    if bits_delivered / max(dof_total,1) > 2.0:
        verdict = "TIGHT — framework is doing real work"
    elif bits_delivered / max(dof_total,1) > 1.0:
        verdict = "MARGINAL — framework above curve-fitting threshold"
    else:
        verdict = "OVERFITTING — too many free choices vs. info delivered"
    print(f"  Verdict:                    {verdict}")
    print(f"\nSearch wall time: {elapsed:.1f}s")
    print("=" * 80)
    return results


if __name__ == '__main__':
    main()
