#!/usr/bin/env python3
"""Test of the attached 13 -> 3 reduction claims (ATTACHMENT_PREREGISTRATION.md, sha256 e8569c85...).

Usage: python3 attachment_reduction_test.py <repo>/research_archive   (repo used only for the icosahedron)
"""
import sys
from pathlib import Path
import numpy as np

ARCH = Path(sys.argv[1] if len(sys.argv) > 1 else "research_archive")
sys.path.insert(0, str(ARCH / "2026-10-15_icosahedral_125_DEC_H64"))
import cathedral_strict_64_closure as c64  # noqa: E402

pi = np.pi
phi = (1 + 5 ** 0.5) / 2
ds, N = (80 / 81) * pi / (13 * phi), 13
rng = np.random.default_rng(20261018)
ph = np.array([1j ** k if k < 4 else np.exp(2j * pi * (k - 4) / 5) for k in range(N)])
nk = np.outer(np.arange(N), np.arange(N))
U0 = np.exp(2j * pi * ds * nk / N)                    # V[n,k] without phases (symmetric in n,k)
V = U0 * ph[None, :]                                  # V[n,k] = exp(2 pi i ds k n/13) phi_k


def Q_(lam):
    lam = np.asarray(lam, float)
    return (lam ** 2).sum() / lam.sum() ** 2


def lode(lam):
    t = np.asarray(lam, float) - np.mean(lam)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


me, rmu, mt, dmt = 0.51099895069, 206.7682827, 1776.93, 0.09
lep, lep2 = np.sqrt([me, rmu * me, mt]), np.sqrt([me, rmu * me, mt + dmt])
Qm, dQ, Dm, dD = Q_(lep), abs(Q_(lep2) - Q_(lep)), lode(lep), abs(lode(lep2) - lode(lep))
rows = []


def judge(name, lam):
    lam = np.sort(np.real_if_close(lam).astype(float))
    if lam[0] <= 0:
        print(f"   {name:50s} eig {np.round(lam, 6)}  FAIL (non-positive)")
        rows.append(False)
        return
    q, d = Q_(lam), lode(lam)
    ok = abs(q - Qm) < 3 * dQ and abs(d - Dm) < 3 * dD
    rows.append(ok)
    print(f"   {name:50s} Q = {q:.6f}  delta = {d:.6f}  m2/m1 = {(lam[1]/lam[0])**2:9.3f}  m3/m1 = {(lam[2]/lam[0])**2:10.3f}"
          f"  {'PASS' if ok else 'FAIL'}")


print("=" * 78)
print(f"targets: Q = {Qm:.8f} +- {dQ:.1e}, delta = {Dm:.8f} +- {dD:.1e}, m_mu/m_e = {rmu:.3f}, m_tau/m_e = {mt/me:.1f}")
# C1
Q1, R1 = np.linalg.qr(V)
Q0, R0 = np.linalg.qr(U0)
sgn = np.sign(np.real(np.diag(R0)))
Q0p, R0p = Q0 * sgn[None, :], R0 * sgn[:, None]       # positive-diagonal convention
kept = Q1 / (Q0p * ph[None, :])
stripped = Q1 / Q0p
col_kept = [np.max(np.abs(kept[:, k] / kept[0, k] - 1)) for k in range(10)]
print("C1 does numpy (Householder) QR strip phi_k from psi?")
print(f"   R diagonal returned real: max |Im R_kk| = {np.abs(np.imag(np.diag(R1))).max():.1e}")
print(f"   psi_k = (+-1) phi_k q_k for k = 0..9: max deviation {max(col_kept):.1e};"
      f"  |psi_k / q_k| phases = {np.round(np.angle(stripped[0, :4]) / (pi / 2), 6).tolist()} x pi/2")
print("   -> phases are kept in psi (R is made real), not stripped; claim C1 is false for LAPACK QR")
# C2
Rd = np.abs(np.diag(R0p))
print("C2 Cholesky / QR diagonal |R_kk| and successive ratios:")
print(f"   |R_kk| = {np.array2string(Rd, precision=3, max_line_width=150)}")
print(f"   ratios = {np.array2string(Rd[1:]/Rd[:-1], precision=4, max_line_width=150)}   (delta_star = {ds:.4f})")
print("=" * 78)
print("MASS TESTS")
judge("A1 sqrt-masses = R_11, R_22, R_33", Rd[1:4])
judge("A2 masses = R_11, R_22, R_33", np.sqrt(Rd[1:4]))
# B: centred icosahedron
v, _, edges, faces, _, _ = c64.icosahedron()
A = np.zeros((N, N))
for i, j in edges:
    A[i + 1, j + 1] = A[j + 1, i + 1] = 1
A[0, 1:] = A[1:, 0] = 1
L = np.diag(A.sum(1)) - A
Psi, Psi0 = Q1.T, (Q0p).T                              # rows psi_k, with and without phi_k
G, E, K = [1, 2, 3], [0] + list(range(4, 13)), [0, 1, 2, 3]


def schur(H, P, keep, elim):
    Ht = P @ H @ P.conj().T
    return Ht[np.ix_(keep, keep)] - Ht[np.ix_(keep, elim)] @ np.linalg.solve(Ht[np.ix_(elim, elim)], Ht[np.ix_(elim, keep)])


def b3(H, P):
    M4 = schur(H, P, K, list(range(4, 13)))
    return M4[1:4, 1:4]


gauge = 0.0
for lab, H in [("adjacency", A), ("Laplacian", L)]:
    for name, fn in [("B1" if lab == "adjacency" else "B2", lambda H, P: schur(H, P, G, E))] + \
                    ([("B3", b3)] if lab == "adjacency" else []):
        M = fn(H, Psi)
        M0 = fn(H, Psi0)
        lam = np.linalg.eigvalsh((M + M.conj().T) / 2)
        gauge = max(gauge, np.abs(np.sort(lam) - np.sort(np.linalg.eigvalsh((M0 + M0.conj().T) / 2))).max())
        judge(f"{name} {lab}, Schur onto k=1,2,3", lam)
print(f"C3 spectra with phi_k vs without phi_k: max difference {gauge:.1e}"
      "  -> the K4 x Z5 phases are a diagonal similarity; they cannot move Q or delta")
print("=" * 78)
print("CONTROLS")
for lab, H in [("adjacency", A), ("Laplacian", L)]:
    qs, dd, npos = [], [], 0
    for _ in range(2000):
        perm = np.r_[0, 1 + rng.permutation(12)]
        Hp = H[np.ix_(perm, perm)]
        lam = np.sort(np.linalg.eigvalsh((lambda M: (M + M.conj().T) / 2)(schur(Hp, Psi, G, E))))
        if lam[0] > 0:
            npos += 1
            qs.append(Q_(lam)); dd.append(lode(lam))
    print(f"   {lab}: over 2000 vertex numberings, positive spectra {npos}; Q range "
          f"{(min(qs) if qs else np.nan):.3f}..{(max(qs) if qs else np.nan):.3f}; delta range "
          f"{(min(dd) if dd else np.nan):.3f}..{(max(dd) if dd else np.nan):.3f}")
w, X = np.linalg.eigh(A)
print(f"   centred-icosahedron adjacency spectrum: {np.round(w, 4).tolist()}")
PK = Psi[K].conj().T @ Psi[K]
for lab, idx in [("top 4", np.argsort(w)[-4:]), ("bottom 4", np.argsort(w)[:4])]:
    PH = X[:, idx] @ X[:, idx].T
    print(f"   overlap of K4 span (k=0..3) with the adjacency's {lab} eigenspace: {np.real(np.trace(PK @ PH))/4:.4f} (1 = same)")
print("=" * 78)
print(f"RESULT: {sum(rows)} of {len(rows)} mass tests pass")
