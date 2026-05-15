"""
Vectorized brute-force search for a unified Cathedral recipe.

The master template (single uniform structure for every observable):

    O = T( R * gamma^k * pi^a * phi^b ) * C

where
    R  ∈ Cathedral-rational pool (numerator / denominator from VOCAB)
    k  ∈ gamma-ladder exponents
    a  ∈ pi exponents
    b  ∈ phi exponents
    T  ∈ {id, sin, cos, sqrt, asin_deg, atan_deg}
    C  ∈ small correction multipliers (1, 1±gamma, 1±2gamma/..., etc.)

For each observable, finds the template parameters minimising relative error.
Vectorized over the (R, k, a, b) grid with NumPy for speed.

Run locally:
    python recipe_search_fast.py
"""
from __future__ import annotations
import time
from math import pi, sqrt, log, atan, asin
import numpy as np

# ─── Cathedral primitives ──────────────────────────────────────────────
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0 / 81.0
PHI = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL = D / F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA = DELTA_CL - DELTA_STAR
ETA = (log(2.0) - 9.0 / N) / log(2.0)

# ─── Vocabulary ────────────────────────────────────────────────────────
VOCAB = {
    '1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,
    'D':D,'q':q,'V':V,'N':N,'E':E,'F':F,'G':G,
    'D+1':D+1,'D-1':D-1,'D!':6,'D^2':9,'D^3':27,
    'N-1':N-1,'N+1':N+1,'N-2':N-2,'N+D+1':N+D+1,
    'G-D':G-D,'G+D^2':G+D**2,'G-D^2':G-D**2,'G-1':G-1,'G+D':G+D,
    'F+V':F+V,'4N+1':4*N+1,'5N-6':5*N-6,'q-1':q-1,
    '4F':4*F,'4F-1':4*F-1,'E+q':E+q,'F*D':F*D,
    '2V':2*V,'2F':2*F,'2N':2*N,
    'N^2-E-2':N**2-E-2,
    '(D+1)F+(N-D-1)N':(D+1)*F+(N-D-1)*N,
    'D(G+D^2)':D*(G+D**2),
    '(D+1)D^3(N+D+1)':(D+1)*D**3*(N+D+1),
    'N^2+Dq':N**2+D*q,
    'd*':DELTA_STAR,'d*^2':DELTA_STAR**2,'d*^3':DELTA_STAR**3,
    'Delta':DELTA,'2Delta':2*DELTA,'d_cl':DELTA_CL,
}

# Build rationals R = a/b, deduplicating by value
def build_rationals():
    seen = {}
    for an, av in VOCAB.items():
        for bn, bv in VOCAB.items():
            if bv == 0:
                continue
            v = av / bv
            key = f"{an}/{bn}"
            # dedup near-identical values
            if any(abs(v - sv) / max(abs(v),1e-30) < 1e-12 for sv in seen.values() if sv != 0):
                # only keep the lexicographically simpler key for the same value
                continue
            seen[key] = v
    return seen

R_DICT = build_rationals()
R_KEYS = list(R_DICT.keys())
R_VALS = np.array([R_DICT[k] for k in R_KEYS], dtype=np.float64)

# ─── Axes ──────────────────────────────────────────────────────────────
GAMMA_EXP = np.array([-16, -7, -4, -1, 0, 1, 2, 3, 4, 5, 6, 9, 12, 16, 32, 64], dtype=np.float64)
PI_EXP    = np.array([-3, -2, -1, 0, 1, 2, 3, 4], dtype=np.float64)
PHI_EXP   = np.array([-2, -1, 0, 1, 2], dtype=np.float64)

# pre-compute γ^k, π^a, φ^b
G_POW = GAMMA ** GAMMA_EXP
P_POW = pi   ** PI_EXP
F_POW = PHI  ** PHI_EXP

# wrappers operate on a numpy array
def W_id(x): return x
def W_sin(x): return np.sin(x)
def W_cos(x): return np.cos(x)
def W_sqrt(x):
    out = np.where(x >= 0, np.sqrt(np.maximum(x, 0)), np.nan)
    return out
def W_asin_deg(x):
    mask = np.abs(x) <= 1
    out = np.where(mask, np.degrees(np.arcsin(np.clip(x, -1, 1))), np.nan)
    return out
def W_atan_deg(x): return np.degrees(np.arctan(x))

WRAPPERS = {
    'id': W_id, 'sin': W_sin, 'cos': W_cos, 'sqrt': W_sqrt,
    'asin_deg': W_asin_deg, 'atan_deg': W_atan_deg,
}

CORRECTIONS = {
    '1':         1.0,
    '1+g':       1 + GAMMA,
    '1+2g':      1 + 2*GAMMA,
    '1-g':       1 - GAMMA,
    '1+g/2pi':   1 + GAMMA/(2*pi),
    '1-2g/pi':   1 - 2*GAMMA/pi,
    '1+6eta':    1 + 6*ETA,
    '1-12eta/N': 1 - 12*ETA/N,
    '1+11eta/N': 1 + 11*ETA/N,
    '1-2q*eta':  1 - 2*q*ETA,
    '1-d*/pi':   1 - DELTA_STAR/pi,
    '1-d*^2/pi': 1 - DELTA_STAR**2/pi,
    '1-d**pi/q': 1 - DELTA_STAR*pi/q,
    '8/9':       8.0/9.0,
    '32/9':      32.0/9.0,
}

# ─── Targets ───────────────────────────────────────────────────────────
TARGETS = [
    ('1/alpha',         137.035999),
    ('alpha(MZ)^-1',    127.952),
    ('alpha_s(MZ)',     0.1179),
    ('sin2_thetaW',     0.23122),
    ('alpha_GUT^-1',    25.70),
    ('m_mu/m_e',        206.76828),
    ('m_tau/m_mu',      16.81700),
    ('m_p/m_e',         1836.15267),
    ('sin_thetaC',      0.22500),
    ('theta_12_deg',    33.41),
    ('theta_13_deg',    8.54),
    ('theta_23_deg',    49.1),
    ('delta_CP_deg',    197.0),
    ('Omega_m',         0.3153),
    ('Omega_b',         0.0493),
    ('sigma_8',         0.8111),
    ('n_s',             0.9649),
    ('H0_ratio',        1.0837),
    ('lambda_H',        0.129),
    ('m_u/m_p',         2.16e-3/0.93827),
    ('m_d/m_p',         4.67e-3/0.93827),
    ('m_s/m_p',         93.4e-3/0.93827),
    ('m_c/m_p',         1.27/0.93827),
    ('m_b/m_p',         4.18/0.93827),
    ('m_t/m_p',         172.69/0.93827),
    ('LQCD/m_p',        0.210/0.93827),
    ('fpi/m_p',         0.09228/0.93827),
    ('mpi/m_p',         0.135/0.93827),
    ('eta_B',           6.1e-10),
    ('A_s',             2.10e-9),
    ('Lambda/MPl^4',    1.35e-123),
    ('G_N_Planck',      DELTA_STAR**2),
]

# ─── Search ────────────────────────────────────────────────────────────

def precompute_args():
    """Build the (R, k, a, b) arg array of shape (|R|,|k|,|a|,|b|)."""
    # arg = R * γ^k * π^a * φ^b
    arg = (R_VALS[:, None, None, None]
           * G_POW[None, :, None, None]
           * P_POW[None, None, :, None]
           * F_POW[None, None, None, :])
    return arg  # shape (nR, nK, nA, nB)

ARG = precompute_args()
SHAPE = ARG.shape
print(f"Arg grid: {SHAPE}  ({np.prod(SHAPE):,} entries)")

# pre-apply all wrappers — gives a {wname: array} dict, each of shape SHAPE
WRAPPED = {wn: wf(ARG) for wn, wf in WRAPPERS.items()}

def search_one(target: float):
    best_rel = np.inf
    best = None
    for wn, warr in WRAPPED.items():
        for cn, cv in CORRECTIONS.items():
            val = warr * cv
            with np.errstate(invalid='ignore'):
                rel = np.abs(val - target) / max(abs(target), 1e-300)
            # mask NaN
            rel = np.where(np.isnan(rel), np.inf, rel)
            idx = np.unravel_index(np.argmin(rel), rel.shape)
            r = rel[idx]
            if r < best_rel:
                best_rel = r
                best = {
                    'rational': R_KEYS[idx[0]],
                    'k':  int(GAMMA_EXP[idx[1]]),
                    'a':  int(PI_EXP[idx[2]]),
                    'b':  int(PHI_EXP[idx[3]]),
                    'wrapper': wn, 'correction': cn,
                    'value': float(val[idx]),
                }
    return best_rel, best

def main():
    print("=" * 90)
    print(" CATHEDRAL UNIFIED-RECIPE BRUTE-FORCE SEARCH (vectorized)")
    print("=" * 90)
    print(f"\nRationals: {len(R_KEYS)}  γ-exp: {len(GAMMA_EXP)}  π-exp: {len(PI_EXP)}  φ-exp: {len(PHI_EXP)}")
    print(f"Wrappers: {len(WRAPPERS)}  Corrections: {len(CORRECTIONS)}")
    total = len(R_KEYS) * len(GAMMA_EXP) * len(PI_EXP) * len(PHI_EXP) * len(WRAPPERS) * len(CORRECTIONS)
    print(f"Total search per observable: {total:,} ≈ 2^{log(total)/log(2):.1f}")
    print(f"\n{'Observable':<22}{'Obs':>14}{'Fit':>14}{'Err%':>9}  Flag  Recipe")
    print("-" * 110)

    h01 = h1 = h10 = miss = 0
    bits_delivered = 0.0
    results = []
    t0 = time.time()
    for name, obs in TARGETS:
        rel, rec = search_one(obs)
        flag = '***' if rel<1e-3 else ('** ' if rel<1e-2 else (' * ' if rel<0.1 else 'MISS'))
        if rel<1e-3: h01 += 1
        elif rel<1e-2: h1  += 1
        elif rel<0.1:  h10 += 1
        else: miss += 1
        if rel>0 and rel<1:
            bits_delivered += min(30.0, log(1.0/rel)/log(2.0))
        recipe = f"{rec['wrapper']}({rec['rational']} g^{rec['k']} pi^{rec['a']} phi^{rec['b']}) * [{rec['correction']}]"
        print(f"{name:<22}{obs:>14.5g}{rec['value']:>14.5g}{rel*100:>+8.3f}%  {flag}  {recipe}")
        results.append((name, obs, rel, rec))
    elapsed = time.time() - t0

    nT = len(TARGETS)
    dof_per = log(total) / log(2.0)
    dof_total = dof_per * (h01 + h1)
    print("-" * 110)
    print(f"\nCoverage:  ***={h01}  ** ={h1}  * ={h10}  MISS={miss}  N={nT}")
    print(f"  @0.1%: {h01}/{nT} = {100*h01/nT:.1f}%")
    print(f"  @1%  : {h01+h1}/{nT} = {100*(h01+h1)/nT:.1f}%")
    print(f"  @10% : {h01+h1+h10}/{nT} = {100*(h01+h1+h10)/nT:.1f}%")
    print(f"\nDOF accounting:")
    print(f"  Bits per slot         : {dof_per:.2f}")
    print(f"  Slots filled (≤1%)    : {h01+h1}")
    print(f"  Total bits of freedom : {dof_total:.1f}")
    print(f"  Bits delivered by fits: {bits_delivered:.1f}")
    print(f"  Ratio info/freedom    : {bits_delivered/max(dof_total,1):.3f}")
    if bits_delivered / max(dof_total,1) > 2.0:
        v = "TIGHT — framework is doing real work"
    elif bits_delivered / max(dof_total,1) > 1.0:
        v = "MARGINAL — above curve-fitting threshold"
    else:
        v = "OVERFITTING — too many free choices vs. info delivered"
    print(f"  Verdict               : {v}")
    print(f"\nWall time: {elapsed:.1f}s")
    return results


if __name__ == '__main__':
    main()
