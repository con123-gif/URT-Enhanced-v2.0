#!/usr/bin/env python3
"""Cathedral Transform as the Koide phase source: pre-registered test (CT_KOIDE_PREREGISTRATION.md).

Usage: python3 ct_koide_test.py <repo>/research_archive
Data enter only at the comparison step. NumPy + SciPy only.
"""
import sys
import itertools
from pathlib import Path
import numpy as np
from scipy.linalg import qr, schur

ARCH = Path(sys.argv[1] if len(sys.argv) > 1 else "research_archive")
sys.path.insert(0, str(ARCH / "2026-10-15_icosahedral_125_DEC_H64"))
import cathedral_strict_64_closure as c64  # noqa: E402

pi = np.pi
phi = (1 + 5 ** 0.5) / 2
ds, dcl, N = (80 / 81) * pi / (13 * phi), 3 / 20, 13
rng = np.random.default_rng(20261018)


def k4_phase(k):
    """phi_k exactly as written: e^(i pi k/2) for k = 0..3, e^(i 2 pi (k-4)/5) for k = 4..12."""
    return np.exp(1j * pi * k / 2) if k < 4 else np.exp(2j * pi * (k - 4) / 5)


def build(phases=True):
    raw = np.array([[np.exp(2j * pi * ds * k * n / N) * (k4_phase(k) if phases else 1) for n in range(N)]
                    for k in range(N)])
    return raw, qr(raw.T)[0].T


raw, U = build()
raw0, W = build(phases=False)


def Q(lam):
    lam = np.asarray(lam, float)
    return (lam ** 2).sum() / lam.sum() ** 2


def lode(lam):
    t = np.asarray(lam, float) - np.mean(lam)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


# data (comparison only)
me, rmu, mt, dmt = 0.51099895069, 206.7682827, 1776.93, 0.09
lep = np.sqrt([me, rmu * me, mt])
lep2 = np.sqrt([me, rmu * me, mt + dmt])
Qm, dQ = Q(lep), abs(Q(lep2) - Q(lep))
Dm, dD = lode(lep), abs(lode(lep2) - lode(lep))


def score(lam):
    lam = np.sort(np.asarray(lam, float))
    if lam[0] <= 0:
        return None
    return Q(lam), lode(lam), np.hypot((Q(lam) - Qm) / dQ, (lode(lam) - Dm) / dD)


def three_return(V, x):
    x = x / np.linalg.norm(x)
    F = np.column_stack([x, V @ x, V @ V @ x])
    return np.linalg.eigvalsh(F.conj().T @ F)


def generator(V):
    T, Z = schur(V, output="complex")
    return Z @ np.diag(np.angle(np.diag(T))) @ Z.conj().T


line = print
line("=" * 78)
line("0) OPERATOR: Cathedral Transform as built 5 Apr 2026")
th = np.sort(np.angle(np.linalg.eigvals(U)))
arch = np.array([-2.854, -2.653, -2.266, -1.953, -1.435, -1.101, -0.673, 0.619, 0.825, 1.199, 1.762, 2.608, 2.716])
line(f"   delta_star = {ds:.12f};  unitarity {np.abs(U@U.conj().T-np.eye(N)).max():.1e}")
line(f"   eigenphases {np.round(th, 3)}")
line(f"   archived set matched up to overall sign: max diff {np.abs(np.sort(-th)-arch).max():.1e}")
alt = np.array([np.exp(2j * pi * ((k - 4) % 5) / 5) for k in range(4, 13)])
line(f"   phi_k as written vs archived (k-4) mod 5 form: max diff {np.abs(alt-np.array([k4_phase(k) for k in range(4,13)])).max():.0e}")
x = np.random.default_rng(1).normal(size=N)
line(f"   forward C_k = sum_n x_n psi_k(n), inverse x_n = sum_k C_k psi_k*(n): round trip {np.abs(U.conj().T@(U@x)-x).max():.1e}")

line("=" * 78)
line("1) STRUCTURE (what the transform can and cannot carry)")
D = np.diag(np.diag(U @ W.conj().T))
line(f"   a) K4/icosahedral phases are row phases: U = D W, D diagonal unitary, W = unphased QR;"
     f" max |U - D W| = {np.abs(U - D @ W).max():.1e}")
line(f"      |D_kk| = 1 to {np.abs(np.abs(np.diag(D))-1).max():.0e}: they cancel in every overlap modulus and Bargmann invariant")
rn = raw / np.linalg.norm(raw, axis=1, keepdims=True)
G_raw = rn.conj() @ rn.T
bim = max(abs(np.angle(G_raw[a, b] * G_raw[b, c] * G_raw[c, a]) % pi) if abs(np.angle(G_raw[a, b] * G_raw[b, c] * G_raw[c, a]) % pi) < pi / 2
          else pi - abs(np.angle(G_raw[a, b] * G_raw[b, c] * G_raw[c, a]) % pi)
          for a, b, c in itertools.combinations(range(N), 3))
line(f"   b) raw delta_star-Fourier rows: every Bargmann invariant is real; max distance of its phase from 0 or pi = {bim:.1e}")
line(f"   c) transform rows are orthonormal: Gram = I to {np.abs(U.conj()@U.T-np.eye(N)).max():.0e}  (any 3 of them: Q = 1/3)")
dist = [min(np.linalg.norm(np.linalg.matrix_power(U, n) - np.exp(1j * t) * np.eye(N)) for t in
            np.angle(np.diag(np.linalg.matrix_power(U, n)))) for n in range(1, 61)]
line(f"   d) no finite order: min over n<=60 of ||U^n - e^(it) I|| = {min(dist):.3f} (U^3: {dist[2]:.3f})")

line("=" * 78)
line("2) PRE-REGISTERED TESTS  (pass: all eigenvalues > 0, Q and delta both within 3 sigma)")
line(f"   targets: Q = {Qm:.8f} +- {dQ:.1e},  delta = {Dm:.8f} +- {dD:.1e}")
delta_sig = np.array([ds] + [dcl - i * (dcl - ds) / 12 for i in range(12)])
H = generator(U)
v, _, edges, faces, _, _ = c64.icosahedron()
SX = np.array([[0, 1], [1, 0]], complex); SY = np.array([[0, -1j], [1j, 0]]); SZ = np.diag([1, -1]).astype(complex)


def unit(x):
    return x / np.linalg.norm(x)


m3 = unit(v[faces[0][0]] + v[faces[0][1]] + v[faces[0][2]])
ax2 = [unit(v[i] + v[j]) for i, j in edges]
ncube = [a for a in ax2 if abs(abs(a @ m3) - 1 / np.sqrt(3)) < 1e-9][0]
w_, Uv = np.linalg.eigh(ncube[0] * SX + ncube[1] * SY + ncube[2] * SZ)
T3 = np.cos(pi / 3) * np.eye(2) - 1j * np.sin(pi / 3) * (m3[0] * SX + m3[1] * SY + m3[2] * SZ)
sp = np.column_stack([Uv[:, 1], T3 @ Uv[:, 1], T3 @ T3 @ Uv[:, 1]])
Gs = sp.conj().T @ sp
r3 = rn[1:4]
Gr = r3.conj() @ r3.T
tests = [
    ("T1 three-return, centre node e_0", three_return(U, np.eye(N)[0])),
    ("T2 three-return, canonical delta signal", three_return(U, delta_sig.astype(complex))),
    ("T3 three-return, K4-trivial mode function", three_return(U, U.conj().T @ np.eye(N)[0])),
    ("T4 -i log U on K4 modes 1,2,3", np.linalg.eigvalsh(H[1:4, 1:4])),
    ("T5 spinor cube (x) raw rows 1,2,3", np.linalg.eigvalsh(Gs * Gr)),
]
for lab, lam in tests:
    lam = np.sort(lam)
    sc = score(lam)
    if sc is None:
        line(f"   {lab:42s} eig {np.round(lam, 5)}  FAIL (non-positive eigenvalue)")
        continue
    q, d, z = sc
    ok = abs(q - Qm) < 3 * dQ and abs(d - Dm) < 3 * dD
    line(f"   {lab:42s} Q = {q:.6f} delta = {d:.6f}  ({(q-Qm)/dQ:+.0f}, {(d-Dm)/dD:+.0f} sigma)  {'PASS' if ok else 'FAIL'}")

line("=" * 78)
line("3) LOOK-ELSEWHERE: same constructions over every basis state and every mode triplet")


def family(V):
    best = np.inf
    Hv = generator(V)
    states = list(np.eye(N, dtype=complex)) + [V.conj().T @ e for e in np.eye(N)]
    for x in states:
        sc = score(three_return(V, x))
        if sc:
            best = min(best, sc[2])
    for tri in itertools.combinations(range(N), 3):
        sc = score(np.linalg.eigvalsh(Hv[np.ix_(tri, tri)]))
        if sc:
            best = min(best, sc[2])
    return best


bU = family(U)
null = []
for _ in range(2000):
    Z = rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N))
    Qr, Rr = np.linalg.qr(Z)
    null.append(family(Qr * (np.diag(Rr) / np.abs(np.diag(Rr)))))
null = np.array(null)
line(f"   Cathedral Transform: best joint distance over 26 states + 286 triplets = {bU:.3e} sigma")
line(f"   Haar-random unitaries, same family: median best = {np.median(null):.3e} sigma;"
     f" fraction at least as close = {np.mean(null <= bU):.3f}")
line("=" * 78)
tgt = 3 * 0.222222047073
near = th[np.argmin(np.abs(np.abs(th) - tgt))]
line(f"   post hoc (not pre-registered): eigenphase nearest 3 delta* = {tgt:.6f} is {near:+.6f} -> delta = {abs(near)/3:.6f},"
     f" off by {abs(near)/3-0.222222047073:+.2e} rad")
hits = np.mean([np.min(np.abs(np.abs(np.angle(np.linalg.eigvals(np.linalg.qr(rng.normal(size=(N,N))+1j*rng.normal(size=(N,N)))[0]))) - tgt)) <= abs(abs(near)-tgt) for _ in range(5000)])
line(f"      chance that a Haar-random 13x13 unitary has an eigenphase at least this close: {hits:.3f}")
line("VERDICT: " + ("PASS in at least one pre-registered construction" if bU < 3 else
     "FAIL in every pre-registered construction (best joint distance above 3 sigma)"))
