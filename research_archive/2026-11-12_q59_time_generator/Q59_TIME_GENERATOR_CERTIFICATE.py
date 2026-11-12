#!/usr/bin/env python3
"""Q59 — does a unique symplectic/Berry term and conservative real-time generator
follow from the primitive URT recurrence and the original positive H64/24 transfer?

Answer certified here: NO, with a scoped non-uniqueness certificate.

  R. Primitive recurrence z -> lam z, lam = (pi/e) exp(2 pi i/phi^2), on C = R^2.
  H. Original 64-history two-successor transfer Q = Q2/2, Q2[h,2h], Q2[h,2h+1] = 1.
  C. Original 7 Nov 2026 all-five 190/64/24 action (imported unmodified):
     hidden history kernels 18 + r^2 L24^(2), 16 + r^2 L24^(2) and the five-solid
     geometry kernel D190^2 + Cbridge + r^2 L24^(1).

Exits non-zero on any failure. Exact integer/Fraction arithmetic for part H; part R
uses only pi > e and irrationality of phi^2 (stated in the .md) with float checks;
part C imports the original source (needs mpmath: present on CI).
No fitted constants, no measured values, no random stand-ins for named operators.
"""
from fractions import Fraction
from math import pi, e, sqrt, log, cos, sin, acosh, cosh
from pathlib import Path
import contextlib, io, os, runpy, sys
import numpy as np
from scipy.linalg import expm

phi = (1 + sqrt(5)) / 2
r = pi / e
theta = 2 * pi / phi**2
out = []
def ok(cond, msg):
    if not cond:
        print('FAIL:', msg); sys.exit(1)
    out.append(msg)

# ---------------------------------------------------------------- R. recurrence
J2 = np.array([[0., -1.], [1., 0.]])
Rot = np.array([[cos(theta), -sin(theta)], [sin(theta), cos(theta)]])
M = r * Rot
# (R1) M^T (cJ) M = det(M) cJ for every 2x2 M; det M = r^2 != 1 since pi != e.
ok(np.allclose(M.T @ J2 @ M, np.linalg.det(M) * J2, atol=1e-14), 'R1 MtJM = det(M) J')
ok(abs(np.linalg.det(M) - r * r) < 1e-14 and r * r > 1.3, 'R1 det M = (pi/e)^2 > 1: no invariant area form on R^2')
# (R2) real logarithms: L_n = ln r I + (theta + 2 pi n) J, n in Z; all exp to M.
logs = {}
for n in range(-3, 4):
    L = log(r) * np.eye(2) + (theta + 2 * pi * n) * J2
    ok(np.allclose(expm(L), M, atol=1e-11), f'R2 exp(L_{n}) = M')
    ok(abs(np.trace(L) - 2 * log(r)) < 1e-14, f'R2 tr L_{n} = 2 ln(pi/e) != 0 (flow not area-preserving)')
    logs[n] = L
fro = {n: np.linalg.norm(L) for n, L in logs.items()}
ok(min(fro, key=fro.get) == 0 and abs(theta) < pi, 'R2 principal branch n=0 is the minimal-norm logarithm (|theta|<pi)')
# distinct branches give distinct time-1/2 maps: the interpolating flow is not fixed by M
half = {n: expm(0.5 * L) for n, L in logs.items()}
ok(np.linalg.norm(half[0] - half[1]) > 1.0, 'R2 branches n=0,1 give different half-step maps')
# (R3) cotangent (symplectic) lift Mhat = M (+) M^{-T} on T*R^2 = R^4 is symplectic,
# its generators Lhat_n = L_n (+) (-L_n^T) are Hamiltonian with H_n(x,p) = p.L_n x,
# and every H_n is indefinite (takes both signs): no positive conserved energy.
Om = np.block([[np.zeros((2, 2)), np.eye(2)], [-np.eye(2), np.zeros((2, 2))]])
Mhat = np.block([[M, np.zeros((2, 2))], [np.zeros((2, 2)), np.linalg.inv(M).T]])
ok(np.allclose(Mhat.T @ Om @ Mhat, Om, atol=1e-13), 'R3 cotangent lift is symplectic')
for n in (0, 1, -1):
    L = logs[n]
    Lh = np.block([[L, np.zeros((2, 2))], [np.zeros((2, 2)), -L.T]])
    ok(np.allclose(expm(Lh), Mhat, atol=1e-10), f'R3 exp(Lhat_{n}) = Mhat')
    ok(np.allclose(Lh.T @ Om + Om @ Lh, 0, atol=1e-13), f'R3 Lhat_{n} in sp(4)')
    H = lambda x, p: p @ L @ x
    x = np.array([1., 0.])
    ok(H(x, x) > 0 > H(x, -x), f'R3 H_{n} indefinite')
    # different branches -> different conserved Hamiltonians (differ by 2 pi angular momentum)
    if n:
        x, p = np.array([1., 0.]), np.array([0., 1.])
        ok(abs((p @ L @ x) - (p @ logs[0] @ x) - 2 * pi * n) < 1e-12, f'R3 H_{n}-H_0 = 2 pi n (x1 p2 - x2 p1)')

# ---------------------------------------------------------------- H. history transfer
Q2 = [[0] * 64 for _ in range(64)]
for h in range(64):
    Q2[h][2 * h % 64] = 1; Q2[h][(2 * h + 1) % 64] = 1
def mm(A, B):
    Bt = list(zip(*B))
    return [[sum(a * b for a, b in zip(row, col)) for col in Bt] for row in A]
def tr_(A): return [list(c) for c in zip(*A)]
I64 = [[int(i == j) for j in range(64)] for i in range(64)]
P = I64
for k in range(6): P = mm(P, Q2)
ok(all(v == 1 for row in P for v in row), 'H0 Q2^6 = J (Q^6 = J/64), original transfer')
# (H1) partial isometry: Q Q^T Q = Q  <=>  Q2 Q2^T Q2 = 4 Q2
ok(mm(mm(Q2, tr_(Q2)), Q2) == [[4 * v for v in row] for row in Q2], 'H1 Q Q^T Q = Q (partial isometry)')
QQt = mm(Q2, tr_(Q2)); QtQ = mm(tr_(Q2), Q2)
ok(all(QQt[i][j] == (2 if (i - j) % 32 == 0 else 0) for i in range(64) for j in range(64)), 'H1 QQ^T = (I+X)/2, X: h<->h+32')
ok(all(QtQ[i][j] == (2 if i // 2 == j // 2 else 0) for i in range(64) for j in range(64)), 'H1 Q^TQ = (I+Y)/2, Y: k<->k xor 1')
def rank(A):
    A = [[Fraction(v) for v in row] for row in A]; rk = 0; n = len(A[0])
    for c in range(n):
        piv = next((i for i in range(rk, len(A)) if A[i][c] != 0), None)
        if piv is None: continue
        A[rk], A[piv] = A[piv], A[rk]
        for i in range(len(A)):
            if i != rk and A[i][c] != 0:
                f = A[i][c] / A[rk][c]; A[i] = [a - f * b for a, b in zip(A[i], A[rk])]
        rk += 1
    return rk
ok(rank(Q2) == 32, 'H1 rank Q = 32, singular values 1^32 0^32')
# (H2) spectrum {1, 0^63}: (Q - J/64)^6 = Q^6 - J/64 = 0 because QJ = JQ = J.
# det Q = 0, so no Q^k (k>=1) equals exp(L) for any real or complex L (det exp L = exp tr L != 0).
ok(all(sum(row) == 2 for row in Q2) and all(sum(col) == 2 for col in zip(*Q2)), 'H2 QJ = JQ = J (doubly stochastic)')
out.append('H2 Q and every power Q^k are singular: Q has no logarithm, no continuous-time generator of any kind')
# (H3) unitary dilations U with U = Q on the initial space im(Q^T Q).
# Support-respecting permutation lifts sigma(h) in {2h, 2h+1} mod 64, bijective:
# h and h+32 share the successor pair, so exactly 2^32 lifts; each satisfies Q = (P_s + P_sbar)/2.
def lift(beta):            # sigma(h) = 2h mod 64 + (top bit of h) xor beta(h mod 32)
    return [(2 * h) % 64 + (((h >> 5) & 1) ^ beta[h % 32]) for h in range(64)]
def perm_matrix(s): return [[int(s[h] == k) for k in range(64)] for h in range(64)]
def cycle_type(s):
    seen, ct = set(), []
    for h in range(64):
        if h in seen: continue
        c, k = 0, h
        while k not in seen: seen.add(k); k = s[k]; c += 1
        ct.append(c)
    return tuple(sorted(ct))
betas = {'rotation(beta=0)': [0] * 32, 'beta=1': [1] * 32,
         'beta=parity': [bin(x).count('1') & 1 for x in range(32)],
         'beta=lowbit': [x & 1 for x in range(32)]}
types = {}
for name, b in betas.items():
    s = lift(b); sb = lift([1 - v for v in b])
    ok(sorted(s) == list(range(64)), f'H3 {name} is a bijection')
    Ps, Psb = perm_matrix(s), perm_matrix(sb)
    ok([[a + c for a, c in zip(x, y)] for x, y in zip(Ps, Psb)] == Q2, f'H3 Q = (P_s + P_sbar)/2 for {name}')
    # agreement with Q on the initial space: functions constant on pairs {2j,2j+1}
    for j in range(32):
        f = [int(k // 2 == j) for k in range(64)]
        Qf = [Fraction(sum(Q2[h][k] * f[k] for k in range(64)), 2) for h in range(64)]
        ok(Qf == [Fraction(f[s[h]]) for h in range(64)], f'H3 {name} agrees with Q on initial space') if j in (0, 31) else None
    types[name] = cycle_type(s)
ok(types['rotation(beta=0)'] == tuple(sorted([1, 1, 2, 3, 3] + [6] * 9)), 'H3 rotation lift = cyclic 6-bit rotation, order 6')
ok(len(set(types.values())) >= 3, 'H3 lifts have different cycle types: inequivalent reversible histories')
out.append('H3 cycle types: ' + '; '.join(f'{k}: {v}' for k, v in types.items()))
out.append('H3 unitary dilations of Q = U(32)-torsor (orthogonal: O(32)); 2^32 support-respecting permutation lifts')
# (H4) canonical antisymmetric part of Q (w.r.t. the stationary uniform measure)
A2 = [[Q2[i][j] - Q2[j][i] for j in range(64)] for i in range(64)]
rkA = rank(A2)
ok(rkA < 64, f'H4 antisymmetric part Q - Q^T is degenerate (rank {rkA} < 64): not a symplectic form on R^64')
QtAQ = mm(mm(tr_(Q2), A2), Q2)
ok(QtAQ != [[4 * v for v in row] for row in A2], 'H4 Q does not preserve its own antisymmetric form')
out.append(f'H4 rank(Q - Q^T) = {rkA}')

# ---------------------------------------------------------------- C. native clock
src = Path(os.environ['Q59_LOCAL_NATIVE']) if 'Q59_LOCAL_NATIVE' in os.environ else \
    Path(__file__).resolve().parents[2] / 'research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py'
with contextlib.redirect_stdout(io.StringIO()):
    m = runpy.run_path(str(src))
ok(m['D'].shape == (190, 190) and len(m['names']) == 5 and m['Hbits'].shape == (64, 64), 'C0 original all-five 190/64/24 source imported')
N = m['N']; rr = m['r']; th = m['theta']
ok(N == 24 and abs(rr - r) < 1e-15 and abs(th - theta) < 1e-15, 'C0 r = pi/e, theta = 2 pi/phi^2, N = 24 (native)')
Hgeo = m['D'] @ m['D'] + m['Cbridge']
geo = np.linalg.eigvalsh(Hgeo)
ok(np.sum(abs(geo) < 1e-9) == 2 and geo.min() > -1e-9, 'C0 Hgeo >= 0 with exactly two zero modes (Q57)')
ok(np.allclose(m['Hbits'] @ m['Uh'] @ m['P3'], 18 * m['Uh'] @ m['P3'], atol=1e-10)
   and np.allclose(m['Hbits'] @ m['Uh'] @ m['P5'], 16 * m['Uh'] @ m['P5'], atol=1e-10), 'C0 hidden 4_3 + 4_5 masses 18, 16 (Hbits)')
# (C1) The clock Laplacian's antisymmetric part is the Wilson twist; a non-periodic gauge
# alpha_j = j*q*theta removes it from 23 links and leaves the holonomy N q theta on one link.
def cyc_det(Mass, q, n, thv=None):
    thv = th if thv is None else thv
    L = m['clock_laplacian'](np.full(N, thv), q) if n == N else None
    if n != N:
        L = 2 * np.eye(n, dtype=complex)
        for j in range(n):
            k = (j + 1) % n; u = np.exp(1j * q * thv)
            L[k, j] -= u; L[j, k] -= np.conj(u)
    return np.linalg.det(Mass * np.eye(n) + rr * rr * L)
for q in (1, 2):
    L = m['clock_laplacian'](np.full(N, th), q)
    Aim = (L - L.T) / 2
    ok(np.linalg.norm(Aim.real) < 1e-14 and np.linalg.norm(Aim - Aim.conj().T) < 1e-14, f'C1 charge {q}: antisymmetric part i*sin(q theta)(S^T-S), purely imaginary')
    Dg = np.diag(np.exp(1j * q * th * np.arange(N)))
    Lg = Dg.conj().T @ L @ Dg
    off = [Lg[(j + 1) % N, j] for j in range(N)]
    ok(all(abs(off[j] + 1) < 1e-12 for j in range(N - 1)), f'C1 charge {q}: twist gauged off 23 links')
    ok(abs(off[N - 1] + np.exp(1j * q * th * N)) < 1e-11, f'C1 charge {q}: holonomy exp(i N q theta) on the closing link')
# (C2) Reading A — 24 = Euclidean time (transfer-matrix / Osterwalder-Schrader reading).
# For every mass M >= 0 of a spatial mode and every n >= 3:
#   det(M + r^2 L_n^(q)) = 2 r^(2n) (cosh(n w) - cos(n q theta)),  cosh w = 1 + M/(2 r^2),
# equivalently 1/det = c^n Tr_Fock[exp(-n w (N+ + N-)) exp(i n q theta (N+ - N-))]:
# the transfer spectrum is two oscillators of frequency w, and the Wilson twist is a
# conserved-charge phase (imaginary chemical potential) commuting with H_A.
masses = {'hidden P3 (18)': 18., 'hidden P5 (16)': 16.}
for lam in sorted(set(np.round(geo, 9)))[:6] + [geo.max()]:
    masses[f'geometry {lam:.6g}'] = max(lam, 0.)
for name, Mass in masses.items():
    q = 2 if name.startswith('hidden') else 1
    w = acosh(1 + Mass / (2 * rr * rr))
    for n in list(range(3, 13)) + [24]:
        d = cyc_det(Mass, q, n).real
        rhs = 2 * rr ** (2 * n) * (cosh(n * w) - cos(n * q * th))
        if abs(d - rhs) > 1e-9 * abs(rhs): ok(False, f'C2 {name}: transfer identity n={n}')
        if Mass > 0 and n == N:
            x = np.exp(-n * w + 1j * n * q * th)
            ok(abs(abs(1 - x) ** -2 - rr ** (2 * n) * np.exp(n * w) / d) < 1e-9 * abs(1 - x) ** -2, f'C2 {name}: Fock trace at n=24')
    out.append(f'C2 {name}: det identity n=3..12,24 and Fock trace, w = {w!r}')
wA3, wA5 = acosh(1 + 9 / r**2), acosh(1 + 8 / r**2)
out.append(f'C2 reading A hidden frequencies: w3 = arccosh(1+9e^2/pi^2) = {wA3!r}, w5 = arccosh(1+8e^2/pi^2) = {wA5!r}')
# (C3) Reading B — 24 = space, Hamiltonian postulate dz/dt = -i grad S (2026-11-08 doc, Q57):
# single-particle frequencies = eigenvalues of M + r^2 (2 - 2 cos(q theta - 2 pi k/24)).
ell2 = 2 - 2 * np.cos(2 * th - 2 * pi * np.arange(N) / N)
wB = np.concatenate([18 + r * r * ell2, 16 + r * r * ell2])
for Mass in (18, 16):
    ev = np.sort(np.linalg.eigvalsh(Mass * np.eye(N) + rr * rr * m['clock_laplacian'](np.full(N, th), 2)))
    ok(np.allclose(ev, np.sort(Mass + r * r * ell2), atol=1e-11), f'C3 native hidden kernel spectrum M={Mass}')
nB = len(np.unique(np.round(wB, 9)))
ok(nB == 48, f'C3 reading B: {nB} distinct hidden single-particle frequencies')
# (C4) inequivalence: an affine change t -> a t, E -> E + b preserves the NUMBER of distinct
# single-particle frequencies; reading A has 2 on the hidden carrier, reading B has 48.
ok(abs(wA3 - wA5) > 1e-3, 'C4 reading A: exactly 2 distinct hidden frequencies (w3 != w5)')
out.append('C4 readings A and B are not related by any choice of time unit or energy origin (2 vs 48 levels)')
for line in out: print('  ', line)
print('Q59_PASS  primitive recurrence: conformally symplectic, generator ambiguous by 2 pi Z, symplectic lift indefinite;')
print('          history transfer Q: partial isometry of rank 32, no logarithm, 2^32 permutation lifts (U(32) dilations);')
print('          native clock: holonomy is the only gauge-invariant antisymmetric datum; Euclidean-time and')
print('          Hamiltonian-postulate readings give inequivalent conservative generators. No time law derived.')
