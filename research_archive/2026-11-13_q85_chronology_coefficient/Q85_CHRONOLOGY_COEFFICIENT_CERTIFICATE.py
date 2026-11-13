#!/usr/bin/env python3
"""Q85 certificate (ACTIVE PROBLEM A, attempt A3 coefficient).  Exits non-zero on failure.
Nothing fitted, nothing random.  Exact integers / Fractions except where a line says float64.

Question (Q85): find a native condition fixing c in K_c = H + c Abar on the selected dictionary D0, or prove the
tried conditions leave the one-parameter family.  Objects are those of Q82 (re-executed: Q82 -> Q73 -> Q64/Q61/Q3):
H = 15I - sum_{i<j} X_iX_j, A_X = (I - X)^T (I - X) for a history-coordinate chronology X, pulled to codes through
the dictionary, Abar_X its A5 Reynolds average; native sources G_s = U_h P_s U_h^T (s = 3, 5); C = central
inversion h -> h xor 63.

Part 1 (exact THEOREM, every A5 x <C>-invariant penalty is c-blind)
  1a C commutes with the 60 A5 code permutations, and every one of the 768 dictionary classes maps history
     complement to code complement, so code(C X C) = C code(X) C.
  1b The A5 quartet isotypic V = range P4 meets the C-eigenspaces in Walsh 2+4 (C-even, H = 16) and Walsh 3
     (C-odd, H = 18); both sources lie in V (G5 in Walsh 2, G3 in Walsh 3).
  1c Hence for ANY symmetric A' commuting with A5 and C, K_c = H + c A' restricted to V has c-independent
     eigenprojectors; eigenvalues are 16 + c alpha_i, 18 + c beta_j.  Source weights (and the residues of the
     source resolvent) cannot depend on c; only pole positions can.  (Proof in the .md; the checks are 1a, 1b.)
  1d Native chronologies commuting with C (exact): Q2; the reversible history P_sigma1; the Q72 uniform-marginal
     bridge of EVERY one of the 768 classes (rho_x = rho_{31-x} exactly, and C maps block x onto block 31-x with
     rows and columns swapped).  So none of them can fix c through weights or projectors.
Part 2 (float64, margin >> rounding): queued candidate (a) with the Q72 bridge B_D0 in place of Q:
     weights identical at c = 1/4, 1, 4, 16 (as 1c predicts) and NOT (4,2,2,0): P5 ~ (3.99994, 0.00006),
     P3 ~ (1.8535, 2.1465).
Part 3 (float64 scan, not a proof): the joint history x 24-clock bridge B^J (Q73/Q77) of D0 and of R D0 breaks C,
     so its weights do depend on c; but on the scan c = k/8, k = 1..512, the P5 source never sits on a single
     branch (leak >= 2e-4) and no two branches carry P3 weight (2,2): (4,2,2,0) is attained at no scanned c.
Part 4 (exact, orbit 1): Abar_Q restricted to Walsh blocks k = 1, 2, 3, 5 is > I, its minimum on Walsh 4 is
     exactly 2/3, and the six-bit parity history has Abar = 1, H = 0.  So gap(K_c) = c for 0 < c <= 48 (the
     parity history is the lightest mode and c is its mass in two-flip units), gap = 16 + 2c/3 for c >= 48.
     The source-visible quartet branches cross for c > 0 only at c = 40/3 (dark 16 + 3c/2 = P3 18 + 27c/20).
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import runpy, time, math
import numpy as np

t0 = time.time()
ARCH = Path(__file__).resolve().parent.parent
with redirect_stdout(StringIO()):
    Z = runpy.run_path(str(ARCH / '2026-11-13_q82_oriented_source_weights' / 'Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py'))
SH, classes, W64 = Z['SH'], Z['classes'], set(Z['W64'])
perms, index = Z['perms'], Z['index']
Hm, Pi, Ek, P4x15, wal = Z['Hm'], Z['Pi'], Z['Ek'], Z['P4x15'], Z['wal']
G3n, G5n, dG = Z['G3n'], Z['G5n'], Z['dG']
A240, code, Q2i, DR, sig1 = Z['A240'], Z['code'], Z['Q2i'], Z['DR'], Z['sig1']
Bf, Br = Z['Bf'], Z['Br']
N = 64
D0 = (0, 2, 4, 6, 10, 9)
def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)
report = {}

# ================================================================ Part 1: exact c-blindness
Cm = np.zeros((N, N), dtype=np.int64); Cm[np.arange(N), np.arange(N) ^ 63] = 1
check(all((Cm[np.ix_(p, p)] == Cm).all() for p in perms), 'C commutes with all 60 A5 code permutations')
check(all(index(h ^ 63, D) == index(h, D) ^ 63 for D in classes for h in range(N)),
      'every dictionary class maps history complement to code complement')
report['1a'] = 'C commutes with A5 (60 perms) and with every dictionary map (768 classes): code(CXC) = C code(X) C'
par = np.array([(-1) ** bin(m).count('1') for m in range(N)])
check(all((Pi[k] @ Cm == (-1) ** k * Pi[k]).all() for k in range(7)), 'C = (-1)^k on Walsh weight k')
ranks = [int(np.trace(Pi[k] @ P4x15)) // (64 * 15) for k in range(7)]
check(ranks == [0, 0, 4, 8, 4, 0, 0], 'quartet isotypic sits in Walsh 2, 3, 4 only (ranks 4, 8, 4)')
check(all((Pi[k] @ Hm == 2 * k * (6 - k) * Pi[k]).all() for k in (2, 3, 4)), 'H = 16, 18, 16 there')
E2G5 = np.array(Ek[2], dtype=object) @ G5n; E3G3 = np.array(Ek[3], dtype=object) @ G3n
check((E2G5 == 960 * G5n).all() and (E3G3 == 960 * G3n).all(), 'G5 inside quartet Walsh 2, G3 inside quartet Walsh 3')
report['1b'] = 'V = range P4 = (Walsh 2+4, C-even, H = 16) + (Walsh 3, C-odd, H = 18); G5 in Walsh 2, G3 in Walsh 3'
report['1c'] = ('for every symmetric A\' commuting with A5 and C, H + cA\' has c-independent eigenprojectors on V: '
                'source weights and residues are c-blind, only poles move')
I64 = np.eye(N, dtype=np.int64)
check((Cm @ Q2i @ Cm == Q2i).all(), 'C Q2 C = Q2')
Ps = np.zeros((N, N), dtype=np.int64)
for h in range(N): Ps[h, sig1(h)] = 1
check((Cm @ Ps @ Cm == Ps).all(), 'C P_sigma1 C = P_sigma1')
def rho(S, x):
    a, b, c, d = int(S[x, 2*x]), int(S[x, 2*x+1]), int(S[x+32, 2*x]), int(S[x+32, 2*x+1])
    return Fr(a * d, b * c)
for x in range(32):          # C maps block x (rows x, x+32; cols 2x, 2x+1) onto block 31-x, rows and columns swapped
    check({x ^ 63, (x + 32) ^ 63} == {31 - x, 63 - x} and (x ^ 63) == 63 - x and ((x + 32) ^ 63) == 31 - x, 'row map')
    check(((2*x) ^ 63) == 2*(31-x) + 1 and ((2*x+1) ^ 63) == 2*(31-x), 'column map')
check(all(rho(SH[D], x) == rho(SH[D], 31 - x) for D in classes for x in range(32)), 'rho_x = rho_{31-x} on all 768 classes')
report['1d'] = ('C-symmetric (hence c-blind): Q2, P_sigma1, and the Q72 uniform-marginal bridge of all 768 classes '
                '(rho_x = rho_{31-x} exactly; the bridge entry is sqrt(rho)/(1+sqrt(rho)) blockwise)')
check((A240(code(Q2i, D0)) @ Cm == Cm @ A240(code(Q2i, D0))).all(), 'Abar_Q(D0) commutes with C (integer)')

# ================================================================ Part 2: Q -> Q72 bridge of D0 (float64)
idx = np.array([index(h, D0) for h in range(N)])
def codef(X): Y = np.zeros((N, N)); Y[np.ix_(idx, idx)] = X; return Y
def twirl(A): return sum(A[np.ix_(p, p)] for p in perms) / 60.0
G3 = np.array(G3n, dtype=float) / dG; G5 = np.array(G5n, dtype=float) / dG; P4 = P4x15 / 15.0
def branch_weights(Ab, c, tol=1e-6):
    w, V = np.linalg.eigh(Hm + c * Ab)
    sel = [i for i in range(N) if V[:, i] @ P4 @ V[:, i] > 0.5]
    check(len(sel) == 16, 'sixteen quartet eigenvectors')
    groups = []
    for i in sel:
        if groups and abs(w[i] - groups[-1][0]) < tol: groups[-1][1].append(i)
        else: groups.append((w[i], [i]))
    out = []
    for lam, ii in groups:
        Vg = V[:, ii]; out.append((lam, len(ii), np.trace(Vg.T @ G3 @ Vg), np.trace(Vg.T @ G5 @ Vg)))
    return out
pb = np.zeros((N, N)); S0 = SH[D0]
for x in range(32):
    r = float(rho(S0, x)); p = math.sqrt(r) / (1 + math.sqrt(r))
    pb[x, 2*x] = pb[x+32, 2*x+1] = p; pb[x, 2*x+1] = pb[x+32, 2*x] = 1 - p
check(np.allclose(pb.sum(0), 1) and np.allclose(pb.sum(1), 1), 'Q72 bridge doubly stochastic')
check(np.abs(Cm @ pb @ Cm - pb).max() < 1e-15, 'Q72 bridge commutes with C (float check of 1d)')
AbB = twirl(codef((np.eye(N) - pb).T @ (np.eye(N) - pb)))
ref = None
for c in (0.25, 1.0, 4.0, 16.0):
    bw = branch_weights(AbB, c)
    check(len(bw) == 4 and all(m == 4 for _, m, _, _ in bw), 'four quartet branches of multiplicity 4')
    wts = sorted((round(a, 9), round(b, 9)) for _, _, a, b in bw)
    if ref is None: ref = wts
    check(wts == ref, f'bridge weights identical at c = {c} (1c)')
p5 = sorted(b for _, b in ref); p3 = sorted(a for a, _ in ref)
check(abs(p5[-1] - 3.99994) < 1e-5 and abs(p5[-2] - 5.7e-5) < 1e-5, 'bridge: P5 leaks ~5.7e-5 off its branch')
check(abs(p3[-1] - 2.14654) < 1e-4 and abs(p3[-2] - 1.85346) < 1e-4, 'bridge: P3 splits ~1.853 / 2.147')
report['2 Q -> Q72 bridge B_D0 (float64)'] = (f'weights c-independent (c = 1/4, 1, 4, 16); P5 ({p5[-1]:.6f}, {p5[-2]:.2e}), '
                                             f'P3 ({p3[-2]:.5f}, {p3[-1]:.5f}): (4,2,2,0) lost, c not fixed')

# ================================================================ Part 3: joint clock bridge B^J (float64 scan)
for name, Bx in (('B^J(D0)', Bf), ('B^J(R D0)', Br)):
    check(np.abs(Cm @ Bx @ Cm - Bx).max() > 0.1, f'{name} breaks C')
    AbJ = twirl(codef((np.eye(N) - Bx).T @ (np.eye(N) - Bx)))
    check(np.abs(AbJ @ Cm - Cm @ AbJ).max() > 1e-3, f'Abar of {name} breaks C')
    leak, split, var = [], [], []
    for k in range(1, 513):
        bw = branch_weights(AbJ, k / 8)
        b5 = sorted(b for *_, b in bw); b3 = sorted(a for _, _, a, _ in bw)
        leak.append(4 - b5[-1]); split.append(abs(b3[-1] - 2) + abs(b3[-2] - 2)); var.append(b3[-1])
    check(min(leak) > 2e-4, f'{name}: P5 never on a single branch on the scan')
    check(min(split) > 1e-2, f'{name}: P3 never split exactly (2,2) on the scan')
    check(max(var) - min(var) > 1e-3, f'{name}: weights depend on c')
    report[f'3 {name} scan c = k/8 <= 64 (float64)'] = (f'min P5 leak {min(leak):.2e}, min |w1-2|+|w2-2| over the two largest P3 branches {min(split):.3f}, '
                                                        f'P3 top weight varies over [{min(var):.4f}, {max(var):.4f}]')

# ================================================================ Part 4: exact gap and crossings, orbit 1
def psd_kernel(M):
    """exact symmetric elimination; returns (is PSD, nullity)"""
    M = [list(r) for r in M]; n = len(M); null = 0; done = [False] * n
    for _ in range(n):
        i = next((j for j in range(n) if not done[j] and M[j][j] != 0), None)
        if i is None:
            rest = [j for j in range(n) if not done[j]]
            if any(M[a][b] != 0 for a in rest for b in rest): return False, None
            return True, null + len(rest)
        if M[i][i] < 0: return False, None
        done[i] = True; piv = M[i][i]
        for a in range(n):
            if done[a] or M[a][i] == 0: continue
            f = M[a][i] / piv
            for b in range(n): M[a][b] -= f * M[i][b]
    return True, null
for D in sorted(W64):
    A = A240(code(Q2i, D))                                       # 240 Abar
    for k in range(7):
        cols = [m for m in range(N) if bin(m).count('1') == k]
        Wk = wal[:, cols]; Mk = Wk.T @ A @ Wk                    # = 64 * 240 * Abar on Walsh block k
        sc = 64 * 240
        if k in (1, 2, 3, 5):
            ok, nl = psd_kernel([[Fr(int(Mk[i, j])) - (sc if i == j else 0) for j in range(len(cols))] for i in range(len(cols))])
            check(ok and nl == 0, f'{D}: Abar > I on Walsh {k}')
        elif k == 4:
            ok, nl = psd_kernel([[Fr(int(Mk[i, j])) - (Fr(2, 3) * sc if i == j else 0) for j in range(len(cols))] for i in range(len(cols))])
            check(ok and nl > 0, f'{D}: min Abar on Walsh 4 is exactly 2/3')
        elif k == 6:
            check(int(Mk[0, 0]) == sc, f'{D}: parity history has Abar = 1')
        else:
            check(int(Mk[0, 0]) == 0, f'{D}: constant has Abar = 0')
check(16 + Fr(2, 3) * 48 == 48, 'Walsh-4 bottom meets parity at c = 48')
quart = {'P5': (16, Fr(4, 3)), 'P3-': (18, Fr(27, 20)), 'P3+': (18, Fr(33, 20)), 'dark': (16, Fr(3, 2))}
cross = sorted((Fr(e2 - e1, s1 - s2), a, b) for a, (e1, s1) in quart.items() for b, (e2, s2) in quart.items()
               if a < b and s1 != s2 and Fr(e2 - e1, s1 - s2) > 0)
check([c for c, _, _ in cross] == [Fr(40, 3)] and {cross[0][1], cross[0][2]} == {'dark', 'P3-'}, 'only positive quartet crossing: c = 40/3')
report['4 orbit 1 (exact)'] = ('Abar > I on Walsh 1,2,3,5; min 2/3 on Walsh 4; parity Abar = 1, H = 0 => gap(K_c) = c for '
                               '0 < c <= 48, 16 + 2c/3 beyond; quartet branches cross for c > 0 only at c = 40/3 (dark = lower P3)')
for k, v in report.items(): print(f'{k}: {v}')
print(f'Q85 certificate: all assertions passed in {time.time() - t0:.1f} s')
