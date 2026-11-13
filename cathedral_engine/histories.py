"""The original 64-history operators, signed six-axis dictionaries, A5 x <I,R,S> orbits, twirled chronology.

Conventions are those of the archive (Q49/Q61/Q62/Q64/Q83), re-derived here and regression-tested:

* history/axis word s in 0..63: bit i chooses vertex ``pairs[i][(s >> i) & 1]`` (2026-11-07 ``M``);
* Q2[h, 2h mod 64] = Q2[h, 2h+1 mod 64] = 1 (URT two-successor rule), Q = Q2/2, Q^6 = J/64;
* lifts sigma_beta(h) = (2h mod 64) | (h5 xor beta(h mod 32)) (Q61); sigma_1 = sigma_beta for beta = 2^32 - 1;
* a signed dictionary D is a 6-tuple with D[j] = 2*axis + sign; ``index(h, D)`` sends URT-history bit j to
  axis D[j] // 2 xor sign (Q61/Q83);
* the A5 x <I,R,S> group: I = flip every sign, R = reverse D, S = flip the signs of odd positions (Q24);
* S_D = sum over the 60 code rotations of the code-frame image of Q2, pulled back to history coordinates
  (Q3/Q64).  Row sums are 120.
"""
from __future__ import annotations

from collections import Counter
from fractions import Fraction
from functools import lru_cache
from itertools import combinations, permutations

import numpy as np

from .fields import Q5
from .geometry import a5_rotations, antipodal_pairs, icosahedron, vertices

__all__ = [
    "N", "succ", "Q2", "chosen", "M_matrix", "carrier_projectors", "hbits", "hbits_spectrum", "walsh",
    "sigma_lift", "SIGMA0_BETA", "SIGMA1_BETA", "I_hist", "R_hist", "S_masks", "index", "dictionary_index",
    "all_dictionaries", "a5_axis_actions", "transport", "a5_classes", "class_of", "q24_ops", "q24_orbit_classes",
    "q24_orbits", "a5_on_codes", "twirled_chronology", "twirled_chronology_code", "twirled_chronologies", "conditioned_likelihood",
    "selected_orbit", "P13_projector", "uh_support",
]

N = 64
SIGMA0_BETA = 0
SIGMA1_BETA = (1 << 32) - 1


def succ(h: int) -> tuple:
    return ((2 * h) % 64, (2 * h) % 64 + 1)


@lru_cache(maxsize=None)
def Q2() -> np.ndarray:
    A = np.zeros((N, N), dtype=np.int64)
    for h in range(N):
        a, b = succ(h)
        A[h, a] = A[h, b] = 1
    return A


def chosen(s: int) -> frozenset:
    pairs = antipodal_pairs()
    return frozenset(pairs[i][(s >> i) & 1] for i in range(6))


@lru_cache(maxsize=None)
def M_matrix() -> tuple:
    """64 x 20 0/1 matrix: M[s, f] = 1 iff face f lies inside the chosen hemisphere word s (2026-11-07)."""
    Fs = icosahedron()["faces"]
    return tuple(tuple(int(set(f) <= chosen(s)) for f in Fs) for s in range(N))


def uh_support() -> frozenset:
    """Words carrying 1 or 4 faces: the 40-word support of im U_h (Q62/Q64)."""
    return frozenset(s for s, row in enumerate(M_matrix()) if sum(row) in (1, 4))


@lru_cache(maxsize=None)
def carrier_projectors() -> dict:
    """P8 = M Ph M^T/2 (im U_h), H3 = M P3 M^T/2, H5 = M P5 M^T/2: exact rational 64x64, ranks 8, 4, 4."""
    ico = icosahedron()
    Mm = M_matrix()
    rows = [[k for k, x in enumerate(r) if x] for r in Mm]

    def sandwich(P):
        out = [[Fraction(0)] * N for _ in range(N)]
        for a in range(N):
            for b in range(N):
                s = Fraction(0)
                for i in rows[a]:
                    Pi = P[i]
                    for j in rows[b]:
                        s += Pi[j]
                out[a][b] = s / 2
        return out
    return {"P8": sandwich(ico["Ph"]), "H3": sandwich(ico["P3"]), "H5": sandwich(ico["P5"])}


def walsh(m: int, y: int) -> int:
    return -1 if bin(m & y).count("1") % 2 else 1


@lru_cache(maxsize=None)
def hbits() -> np.ndarray:
    """H_bits = 15 I - sum_{i<j} X_i X_j (2026-11-07)."""
    H = 15 * np.eye(N, dtype=np.int64)
    for s in range(N):
        for i, j in combinations(range(6), 2):
            H[s, s ^ (1 << i) ^ (1 << j)] -= 1
    return H


def hbits_spectrum() -> dict:
    """Exact: Walsh character of weight w has eigenvalue 15 - ((6-2w)^2 - 6)/2; checked on all 64 characters."""
    H = hbits()
    spec = Counter()
    for m in range(N):
        v = np.array([walsh(m, y) for y in range(N)], dtype=np.int64)
        w = bin(m).count("1")
        lam = 15 - ((6 - 2 * w) ** 2 - 6) // 2
        assert np.array_equal(H @ v, lam * v)
        spec[lam] += 1
    return dict(sorted(spec.items()))


def sigma_lift(beta: int) -> tuple:
    return tuple(((2 * h) % 64) | (((h >> 5) & 1) ^ ((beta >> (h & 31)) & 1)) for h in range(N))


def I_hist() -> tuple:
    return tuple(h ^ 63 for h in range(N))


def R_hist() -> tuple:
    return tuple(int(format(h, "06b")[::-1], 2) for h in range(N))


S_masks = (0b101010, 0b010101)


# ----------------------------------------------------------------------------------------------- dictionaries
def index(h: int, D) -> int:
    o = 0
    for i, x in enumerate(D):
        o |= (((h >> i) & 1) ^ (x & 1)) << (x // 2)
    return o


def dictionary_index(D) -> tuple:
    """idx[h] = canonical axis word of URT history h under D (a bijection of 0..63)."""
    return tuple(index(h, D) for h in range(N))


@lru_cache(maxsize=None)
def all_dictionaries() -> tuple:
    return tuple(sorted({tuple(2 * p[i] + ((s >> i) & 1) for i in range(6)) for p in permutations(range(6))
                         for s in range(64)}))


@lru_cache(maxsize=None)
def a5_axis_actions() -> tuple:
    """The 60 signed six-axis actions (axis map, flip) of the proper rotations (Q61 S2)."""
    pairs = antipodal_pairs()
    pl = {v: i for i, p in enumerate(pairs) for v in p}
    acts = []
    for g, _ in a5_rotations():
        t, f = [], []
        for i, (a, b) in enumerate(pairs):
            j = pl[g[a]]; t.append(j); f.append(0 if g[a] == pairs[j][0] else 1)
        acts.append((tuple(t), tuple(f)))
    assert len(set(acts)) == 60
    return tuple(acts)


def transport(D, a) -> tuple:
    return tuple(2 * a[0][x // 2] + ((x & 1) ^ a[1][x // 2]) for x in D)


def class_of(D) -> tuple:
    return min(transport(D, a) for a in a5_axis_actions())


@lru_cache(maxsize=None)
def a5_classes() -> tuple:
    """The 768 proper-A5 classes of the 46,080 signed dictionaries, each represented by its minimum."""
    acts = a5_axis_actions()
    seen, reps = set(), []
    for D in all_dictionaries():
        if D in seen:
            continue
        orb = {transport(D, a) for a in acts}
        assert len(orb) == 60
        seen |= orb; reps.append(min(orb))
    assert len(reps) == 768
    return tuple(reps)


def _Id(D): return tuple(x ^ 1 for x in D)
def _Rd(D): return tuple(D[::-1])
def _Sd(D): return tuple(x ^ (i & 1) for i, x in enumerate(D))


def q24_ops() -> tuple:
    return (lambda d: d, _Id, _Rd, _Sd, lambda d: _Rd(_Sd(d)), lambda d: _Sd(_Rd(d)), lambda d: _Id(_Rd(d)),
            lambda d: _Id(_Sd(d)))


def q24_orbit_classes(D) -> frozenset:
    return frozenset(class_of(op(D)) for op in q24_ops())


@lru_cache(maxsize=None)
def q24_orbits() -> tuple:
    """The 96 A5 x <I,R,S> orbits, as sets of 8 class representatives, ordered by their minimum."""
    seen, orbs = set(), []
    for D in a5_classes():
        if D in seen:
            continue
        o = q24_orbit_classes(D)
        assert len(o) == 8
        seen |= o; orbs.append(o)
    orbs.sort(key=min)
    assert len(orbs) == 96
    return tuple(orbs)


@lru_cache(maxsize=None)
def a5_on_codes() -> tuple:
    """The 60 rotations acting on the 64 axis codes (Q3 ``geometric_a5_on_codes``), as index tuples."""
    code = {chosen(c): c for c in range(N)}
    return tuple(tuple(code[frozenset(g[v] for v in chosen(c))] for c in range(N)) for g, _ in a5_rotations())


def twirled_chronology_code(D) -> np.ndarray:
    """S_D in canonical code coordinates (Q28/Q40 frame): sum_g P_g X_D P_g^T, X_D = D Q2 D^-1."""
    idx = np.array(dictionary_index(D))
    inv = np.empty(N, dtype=np.int64); inv[idx] = np.arange(N)
    X = Q2()[np.ix_(inv, inv)]
    S = np.zeros((N, N), dtype=np.int64)
    for p in a5_on_codes():
        p = np.array(p)
        S += X[np.ix_(p, p)]
    return S


def twirled_chronology(D) -> np.ndarray:
    """S_D in history coordinates (Q64 ``S_hist``): integer 64x64, rows summing to 120."""
    idx = np.array(dictionary_index(D))
    inv = np.empty(N, dtype=np.int64); inv[idx] = np.arange(N)
    X = Q2()[np.ix_(inv, inv)]
    S = np.zeros((N, N), dtype=np.int64)
    for p in a5_on_codes():
        p = np.array(p)
        S += X[np.ix_(p, p)]
    assert np.all(S.sum(axis=1) == 120)
    return S[np.ix_(idx, idx)]


@lru_cache(maxsize=None)
def twirled_chronologies() -> dict:
    """S_D for all 768 class representatives (cached in-process; see cache.py for the disk cache)."""
    from .cache import cached_call
    return cached_call("histories.twirled_chronologies", _all_twirls, inputs=["q3_twirl", "q64_selection"])


def _all_twirls():
    return {D: twirled_chronology(D) for D in a5_classes()}


def conditioned_likelihood(S) -> tuple:
    """Q64 principle: max over lifts of prod_h S[h, sigma h] / (S[h,2h] + S[h,2h+1]); exact bitwise.
    Returns (L, beta, number of tied bits)."""
    tot, beta, ties = Fraction(1), 0, 0
    for x in range(32):
        base = (2 * x) % 64
        d1 = int(S[x, base] + S[x, base | 1]); d2 = int(S[x + 32, base] + S[x + 32, base | 1])
        v = [Fraction(int(S[x, base | b]), d1) * Fraction(int(S[x + 32, base | (1 ^ b)]), d2) for b in (0, 1)]
        tot *= max(v); ties += v[0] == v[1]; beta |= (v[1] > v[0]) << x
    return tot, beta, ties


@lru_cache(maxsize=None)
def selected_orbit() -> dict:
    """Recompute the Q64 maximiser over all 768 classes: the 8 classes, their lift, margin, runner-up value."""
    S = twirled_chronologies()
    res = {D: conditioned_likelihood(S[D]) for D in a5_classes()}
    vals = sorted({r[0] for r in res.values()}, reverse=True)
    win = sorted(D for D in res if res[D][0] == vals[0])
    return {"classes": tuple(win), "L": vals[0], "runner_up": vals[1], "beta": {res[D][1] for D in win},
            "ties": {res[D][2] for D in win}, "is_one_q24_orbit": q24_orbit_classes(win[0]) == frozenset(win)}


# ----------------------------------------------------------------------------------------------- H13 (Q62)
@lru_cache(maxsize=None)
def P13_projector() -> list:
    """H13 = Walsh degrees 0, 6, 1 plus V5 (Q62 C0 construction), exact over Q(sqrt5)."""
    from .linalg import inverse, matmul, transpose
    P = vertices("icosahedron")
    pairs = antipodal_pairs()
    v = [P[pairs[i][0]] for i in range(6)]
    PR = list(combinations(range(6), 2))

    def quad(z, a, b):
        return [2 * (a[0] * b[0] - a[1] * b[1]), 2 * (a[0] * b[0] + a[1] * b[1] - 2 * a[2] * b[2]),
                a[0] * b[1] + a[1] * b[0], a[0] * b[2] + a[2] * b[0], a[1] * b[2] + a[2] * b[1]][z]
    B = [[quad(z, v[i], v[j]) for z in range(5)] for (i, j) in PR]
    Bt = transpose(B)
    Pi5 = matmul(matmul(B, inverse(matmul(Bt, B))), Bt)
    low = [0, 63] + [1 << i for i in range(6)]
    out = []
    for a in range(N):
        row = []
        for b in range(N):
            x = Q5(sum(walsh(m, a) * walsh(m, b) for m in low))
            for k, (i, j) in enumerate(PR):
                ck = walsh((1 << i) | (1 << j), a)
                for l, (p, q) in enumerate(PR):
                    if Pi5[k][l]:
                        x = x + Pi5[k][l] * (ck * walsh((1 << p) | (1 << q), b))
            row.append(x * Fraction(1, 64))
        out.append(row)
    return out
