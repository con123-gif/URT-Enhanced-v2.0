#!/usr/bin/env python3
"""Q32: native meaning of Tr(S_D^2 S_D^T) on the 48 Q28/Q30 residual pairs.

Imports the original Q28 enumeration (itself importing the original Q3 geometric A5
on the 64 history codes and the primitive Q2). Rebuilds, in every signed dictionary D,
the archived conditional A5 chronology-Dirichlet operator of
2026-11-10_urt_arf_forward/new_gate/URT_A5_CHRONOLOGY_DIRICHLET_GAP_2026_11_10.py:
    240*Abar_D = sum_a P_a (2I-X_D)^T (2I-X_D) P_a^T,   240*Kbar_D = 240*H + 240*Abar_D,
with H = 15I - sum_{i<j} X_i X_j the archived pair-flip Hamiltonian. No fitted or
measured input, no synthetic matrix. All comparisons are exact integer arithmetic
(int64 with stated bounds, Python integers for characteristic polynomials).
Exits non-zero on any failed assertion.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from itertools import combinations
from pathlib import Path
import json, runpy, time
import numpy as np

t0 = time.time()
root = Path(__file__).resolve().parents[1]
q28 = root / '2026-11-11_q28_twirled_third_trace' / 'q28_twirled_third_trace.py'
assert q28.is_file(), q28
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(q28))
perms, Q, bits = (ns[x] for x in ('perms', 'Q', 'bits'))
reps, eight, alt, rev, inv = (ns[x] for x in ('reps', 'eight', 'alt', 'rev', 'inv'))
assert len(perms) == 60 and len(reps) == 96

n = 64
I = np.eye(n, dtype=np.int64)
H = 15 * I.copy()
for i, j in combinations(range(6), 2):
    for h in range(n):
        H[h, h ^ (1 << i) ^ (1 << j)] -= 1
Nflip = np.zeros((n, n), dtype=np.int64)          # N = sum_j X_j (single bit flips)
for h in range(n):
    for j in range(6):
        Nflip[h, h ^ (1 << j)] += 1
for p in perms:                                   # H and N are A5-invariant
    assert np.array_equal(H[np.ix_(p, p)], H) and np.array_equal(Nflip[np.ix_(p, p)], Nflip)
W = np.array([[(-1) ** bin(h & m).count('1') for m in range(n)] for h in range(n)], dtype=np.int64)
wt = [bin(m).count('1') for m in range(n)]
assert np.array_equal(W.T @ W, n * I)
assert np.array_equal(W.T @ H @ W, n * np.diag([2 * k * (6 - k) for k in wt]))
assert np.array_equal(W.T @ Nflip @ W, n * np.diag([6 - 2 * k for k in wt]))
blocks = {k: [m for m in range(n) if wt[m] == k] for k in range(7)}


def X_of(D):
    code = ((bits ^ np.array([x & 1 for x in D], dtype=np.int64)) <<
            np.array([x // 2 for x in D], dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist()) == list(range(n))
    iv = np.empty(n, dtype=np.int64)
    iv[code] = np.arange(n)
    return Q[np.ix_(iv, iv)]


def twirl(M):
    out = np.zeros((n, n), dtype=np.int64)
    for p in perms:
        out += M[np.ix_(p, p)]
    return out


def operators(D):
    X = X_of(D)
    S = twirl(X)                                   # original Q3 twirl, = 120 R(Q)
    assert np.all(S.sum(axis=0) == 120) and np.all(S.sum(axis=1) == 120)
    A240 = twirl((2 * I - X).T @ (2 * I - X))      # archived Dirichlet penalty, x240
    # Native identity (statement 2): X^T X = 2(I + flip of the digit-0 axis), and A5 is
    # transitive on the six axes with stabilisers of order 10, so its twirl is 120I + 20N.
    assert np.array_equal(twirl(X.T @ X), 120 * I + 20 * Nflip), D
    T = S + S.T
    assert np.array_equal(A240, 360 * I + 20 * Nflip - 2 * T), D
    K240 = 240 * H + A240
    assert np.array_equal(K240 @ H, H @ K240) and np.array_equal(S @ H, H @ S)
    return S, T, K240


def walsh_block(M, k):
    Mw = W.T @ M @ W
    assert np.all(Mw % n == 0)
    Mw //= n
    ids = blocks[k]
    off = [m for m in range(n) if wt[m] != k]
    assert not Mw[np.ix_(ids, off)].any()      # block diagonal in Walsh weight
    return [[int(Mw[a, b]) for b in ids] for a in ids]


def charpoly(A):
    """Faddeev-LeVerrier over Z (all divisions exact): coefficients of det(zI-A)."""
    m = len(A)
    M = [[int(i == j) for j in range(m)] for i in range(m)]
    c = [1]
    for k in range(1, m + 1):
        AM = [[sum(A[i][l] * M[l][j] for l in range(m)) for j in range(m)] for i in range(m)]
        tr = sum(AM[i][i] for i in range(m))
        assert tr % k == 0
        ck = -tr // k
        c.append(ck)
        M = [[AM[i][j] + (ck if i == j else 0) for j in range(m)] for i in range(m)]
    assert all(v == 0 for row in M for v in row)  # Cayley-Hamilton
    return tuple(c)


def mixed(S):
    S2 = S @ S                                     # entries <= 120^2, traces <= 64*120^3
    return int(np.trace(S2 @ S)), int(np.trace(S2 @ S.T)), S2


# ---- statement A (all signed dictionaries): S(D) = alternating flip acts as S_D -> S_D C ----
# C = complement h -> h^63 (central inversion of all six axes) = (-1)^(Walsh weight).
C = np.zeros((n, n), dtype=np.int64)
C[np.arange(n), np.arange(n) ^ 63] = 1
assert np.array_equal(W.T @ C @ W, n * np.diag([(-1) ** k for k in wt]))
for p in perms:
    assert np.array_equal(C[np.ix_(p, p)], C)        # signed axis permutations commute with C
from itertools import permutations as _perms
n_dict = 0
for pp in _perms(range(6)):                          # all 46,080 signed dictionaries
    for s in range(64):
        D = tuple(2 * pp[i] + ((s >> i) & 1) for i in range(6))
        XD, XE = X_of(D), X_of(alt(D))
        assert np.array_equal(XE, XD @ C) and np.array_equal(XD @ C, C @ XD), D
        n_dict += 1
assert n_dict == 46080
n_twirl = 0
for D in reps:
    for d in eight(D):                               # all 768 eight-orbit images
        SD, SE = operators(d)[0], operators(alt(d))[0]
        assert np.array_equal(SE, SD @ C) and np.array_equal(SD @ C, C @ SD), d
        assert np.array_equal(SE @ SE.T, SD @ SD.T)  # Q33 Gram matrices are identical
        n_twirl += 1
assert n_twirl == 768
POdd2 = I - C                                        # 2 x projector on odd Walsh weight


def neg(c):
    return tuple(v * (-1) ** i for i, v in enumerate(c))


def _order(p):
    q, k = np.arange(n), 0
    while True:
        q, k = p[q], k + 1
        if np.array_equal(q, np.arange(n)):
            return k


_ords = [_order(np.asarray(p)) for p in perms]
assert Counter(_ords) == Counter({1: 1, 2: 15, 3: 20, 5: 24})


def _proj60(chi):        # 60/d x central idempotent; for 3+3' the sum of both (x 20)
    P = np.zeros((n, n), dtype=np.int64)
    for p, o in zip(perms, _ords):
        P[np.asarray(p), np.arange(n)] += chi[o]
    return P


ISO = {'1': _proj60({1: 1, 2: 1, 3: 1, 5: 1}), '4': _proj60({1: 4, 2: 0, 3: 1, 5: -1}),
       '5': _proj60({1: 5, 2: 1, 3: -1, 5: 0}), '3+3p': _proj60({1: 6, 2: -2, 3: 0, 5: 1})}


def iso_split(TD, TE):
    """Isotypic parts whose exact Tr(T^j P), j = 1..3, differ between D and S(D)."""
    out = []
    for name, P in ISO.items():
        if any(int(np.trace(P @ np.linalg.matrix_power(TD, j))) != int(np.trace(P @ np.linalg.matrix_power(TE, j)))
               for j in (1, 2, 3)):
            out.append(name)
    return out


# ---- the 48 residual pairs (Tr S^3 constant on the eight-orbit; Q28) ----
residual = []
for D in reps:
    vals = {mixed(operators(d)[0])[0] for d in eight(D)}
    if len(vals) == 1:
        residual.append(D)
assert len(residual) == 48

# ---- statement 1: generic lemma evaluated on the native pairs ----
lemma_checked = 0
for D in residual:
    for d in (D, alt(D)):
        S, T, _ = operators(d)
        t3, m3, S2 = mixed(S)
        assert 6 * m3 == int(np.trace(T @ T @ T)) - 2 * t3
        B1, B2 = S - S.T, S2 - S2.T                  # 1-step and 2-step stationary currents
        assert 2 * m3 == 2 * t3 + int((B2 * B1).sum())
        lemma_checked += 1
    SD, SE = operators(D)[0], operators(alt(D))[0]
    dm = mixed(SD)[1] - mixed(SE)[1]
    assert dm == int(np.trace(SD @ SD @ SD.T @ POdd2))      # odd-Walsh (C = -1) part only
    assert int(np.trace(SD @ SD @ SD @ POdd2)) == 0         # cospectral: odd cubic part vanishes

# ---- statement 3: exact Kbar spectra, block by block, on all 48 pairs ----
summary = Counter()
split_pairs = []
tsplit = []
for D in residual:
    E = alt(D)
    SD, TD, KD = operators(D)
    SE, TE, KE = operators(E)
    dm = mixed(SD)[1] - mixed(SE)[1]
    pD = {k: charpoly(walsh_block(KD, k)) for k in range(7)}
    pE = {k: charpoly(walsh_block(KE, k)) for k in range(7)}
    tD = {k: charpoly(walsh_block(TD, k)) for k in range(7)}
    tE = {k: charpoly(walsh_block(TE, k)) for k in range(7)}
    for k in range(7):                                       # reflection law of statement A
        assert tE[k] == (tD[k] if k % 2 == 0 else neg(tD[k])), (D, k)
    sym3 = tD[3] == neg(tD[3])
    same = all(pD[k] == pE[k] for k in range(7))
    assert same == sym3 and all(pD[k] == pE[k] for k in (0, 1, 2, 4, 5, 6))
    dK3 = int(np.trace(KD @ KD @ KD)) - int(np.trace(KE @ KE @ KE))
    assert dK3 == -48 * dm, (dK3, dm)                        # Tr Kbar^3 sees exactly Tr(S^2 S^T)
    assert same == all(tD[k] == tE[k] for k in range(7))
    assert (dm == 0) == same, (D, dm, same)
    summary['cospectral_Kbar' if same else 'split_Kbar'] += 1
    if not same:
        kdiff = [k for k in range(7) if pD[k] != pE[k]]
        # exact pseudo-determinant of 240*Kbar (k = 0 block is the single zero mode)
        assert pD[0] == (1, 0) and pE[0] == (1, 0)
        detD = detE = 1
        for k in range(1, 7):
            detD *= (-1) ** len(blocks[k]) * pD[k][-1]
            detE *= (-1) ** len(blocks[k]) * pE[k][-1]
        assert detD > 0 and detE > 0
        hi, lo = (D, E) if dm > 0 else (E, D)
        det_hi, det_lo = (detD, detE) if dm > 0 else (detE, detD)
        # block traces of T^j, j = 2, 3 (exact) to locate the split
        loc = {}
        for k in kdiff:
            a = np.array(walsh_block(TD, k), dtype=np.int64)
            b = np.array(walsh_block(TE, k), dtype=np.int64)
            loc[k] = [int(np.trace(np.linalg.matrix_power(a, j)) - np.trace(np.linalg.matrix_power(b, j)))
                      for j in (1, 2, 3)]
        from fractions import Fraction
        ratio = Fraction(det_hi, det_lo)
        split_pairs.append({'pdet240_ratio_hi_over_lo': f'{ratio.numerator}/{ratio.denominator}',
                            'split_isotypic': iso_split(TD, TE),
'D': list(D), 'S_D': list(E), 'TrS2ST_D_minus_S_D': dm,
                            'walsh_weights_split': kdiff, 'block_dTr_T^1,2,3': {str(k): v for k, v in loc.items()},
                            'larger_TrS2ST_has_smaller_pdet_Kbar': det_hi < det_lo,
                            'pdet240_ratio_hi_over_lo_float': det_hi / det_lo})
assert summary == Counter({'cospectral_Kbar': 42, 'split_Kbar': 6}), summary

# ---- statement 4: declared scalar functionals ----
fun = Counter()
for D in residual:
    rows = []
    for d in (D, alt(D)):
        S, T, K = operators(d)
        A240 = K - 240 * H
        trV = 60 * int(np.trace(A240)) - int(np.trace((120 * I - S).T @ (120 * I - S)))
        rows.append((int(np.trace(K)), int((S * S).sum()), trV,
                     int(np.trace(K @ K)), int(np.trace(K @ K @ K))))
    fun['TrK_equal'] += rows[0][0] == rows[1][0]
    fun['Frobenius_cost_equal'] += rows[0][1] == rows[1][1]
    fun['TrK2_equal'] += rows[0][3] == rows[1][3]
    fun['frame_variance_TrV_equal'] += rows[0][2] == rows[1][2]
    fun['TrK3_equal'] += rows[0][4] == rows[1][4]
assert fun['TrK_equal'] == 48 and fun['Frobenius_cost_equal'] == 48 and fun['TrK2_equal'] == 48
assert fun['TrK3_equal'] == 42 and fun['frame_variance_TrV_equal'] == 48
# gap(Kbar_D) = 1 exactly in every residual dictionary: constant in kernel, full parity
# eigenvalue 240 (x240), and every other block >= 240*10 - ||2T|| ... checked exactly below.
for D in residual:
    for d in (D, alt(D)):
        S, T, K = operators(d)
        assert K[:, :].sum(axis=1).tolist() == [0] * n
        par = W[:, 63]
        assert np.array_equal(K @ par, 240 * par)
        # k = 1..5 blocks: K240 - 240 I positive definite <=> all its leading minors > 0
        for k in range(1, 6):
            blk = walsh_block(K, k)
            m = len(blk)
            Mx = [[blk[i][j] - (240 if i == j else 0) for j in range(m)] for i in range(m)]
            # Bareiss fraction-free elimination: leading principal minors
            A = [row[:] for row in Mx]
            prev = 1
            for i in range(m):
                assert A[i][i] > 0, ('gap', d, k)
                for r in range(i + 1, m):
                    for c in range(i + 1, m):
                        A[r][c] = (A[r][c] * A[i][i] - A[r][i] * A[i][c]) // prev
                prev = A[i][i]
fun['gap_one_exact'] = 96

result = {'task': 'Q32', 'residual_pairs': 48, 'lemma_checked_matrices': lemma_checked,
          'Kbar_spectrum': dict(summary), 'functionals': dict(fun), 'split_pairs': split_pairs,
          'integer_exact': True, 'physical_ARFs': 'not derived',
          'seconds': round(time.time() - t0, 1)}
print(json.dumps(result, indent=1, sort_keys=True))
