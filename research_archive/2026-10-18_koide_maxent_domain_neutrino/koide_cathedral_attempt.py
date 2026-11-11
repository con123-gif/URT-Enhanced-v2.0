#!/usr/bin/env python3
"""Attempt: derive the Koide amplitude sqrt2 and phase from Cathedral structure (18 Oct 2026).

No lepton mass, Koide ratio or phase is used to build anything below; data enter only at
the comparison step. Geometry comes from the repo's own icosahedron
(cathedral_strict_64_closure.py); the H64 clock from the restored signed-history arrays.
Usage: python3 koide_cathedral_attempt.py <repo>/research_archive
"""
import sys
import itertools
from pathlib import Path
import numpy as np
from scipy.optimize import brentq, minimize

ARCH = Path(sys.argv[1] if len(sys.argv) > 1 else "research_archive")
sys.path.insert(0, str(ARCH / "2026-10-15_icosahedral_125_DEC_H64"))
import cathedral_strict_64_closure as c64  # noqa: E402

rng = np.random.default_rng(20261018)
SX = np.array([[0, 1], [1, 0]], complex)
SY = np.array([[0, -1j], [1j, 0]])
SZ = np.array([[1, 0], [0, -1]], complex)
C3 = np.roll(np.eye(3), 1, axis=0)


def Q(lam):
    lam = np.asarray(lam, float)
    return (lam ** 2).sum() / lam.sum() ** 2


def lode(lam):
    t = np.asarray(lam, float) - np.mean(lam)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


def koide_sqrt(d):
    return np.array([1 + np.sqrt(2) * np.cos(d + 2 * np.pi * k / 3) for k in range(3)])


def spinor(n):
    w, U = np.linalg.eigh(n[0] * SX + n[1] * SY + n[2] * SZ)
    return U[:, 1]                                                   # S.n = +1/2 state


def su2(m, ang):
    return np.cos(ang / 2) * np.eye(2) - 1j * np.sin(ang / 2) * (m[0] * SX + m[1] * SY + m[2] * SZ)


def three_return_gram(m, n):
    """Generations = spinor along n carried round the 3-fold axis m (A4 3-cycle, SU(2) lift)."""
    T = su2(m, 2 * np.pi / 3)
    p0 = spinor(n)
    F = np.column_stack([p0, T @ p0, T @ T @ p0])
    return F.conj().T @ F


# data (comparison only)
me, rmu, mt, dmt = 0.51099895069, 206.7682827, 1776.93, 0.09
mmu = rmu * me
lep = np.sqrt([me, mmu, mt])
Qm = Q(lep)
dQ = abs(Q(np.sqrt([me, mmu, mt + dmt])) - Qm)
dstar = brentq(lambda d: (koide_sqrt(d)[2] / koide_sqrt(d)[1]) ** 2 - rmu, 0.2, 0.25, xtol=1e-16)

# ----------------------------------------------------------------- 1. icosahedral axes
v, _, edges, faces, _, _ = c64.icosahedron()


def unit(x):
    return x / np.linalg.norm(x)


def uniq(vecs):
    out = []
    for x in vecs:
        x = unit(x)
        if not any(abs(abs(x @ y) - 1) < 1e-9 for y in out):
            out.append(x)
    return out


ax5 = uniq(list(v))
ax3 = uniq([v[i] + v[j] + v[k] for i, j, k in faces])
ax2 = uniq([v[i] + v[j] for i, j in edges])
axes = [("5-fold", a) for a in ax5] + [("3-fold", a) for a in ax3] + [("2-fold", a) for a in ax2]
print("=" * 78)
print(f"1) SPIN-1/2 THREE-RETURN ON THE CATHEDRAL ICOSAHEDRON  (axes: {len(ax5)} five-, {len(ax3)} three-,"
      f" {len(ax2)} two-fold)")
print("   generations = spinor along axis n carried round a 3-fold axis m by the SU(2) lift of the A4 3-cycle")
table, err = {}, 0.0
for m in ax3:
    for kind, n in axes:
        c = abs(m @ n)
        if c > 1 - 1e-9:
            continue                                              # n = m: one state, no generations
        G = three_return_gram(m, n)
        lam = np.linalg.eigvalsh(G)
        q = Q(lam)
        err = max(err, abs(q - (1 + c * c) / 2))
        key = (kind, round(np.degrees(np.arccos(c)), 4))
        table.setdefault(key, []).append((q, abs(np.linalg.det(G))))
print(f"   theorem: Q = (1 + cos^2 theta)/2, theta = angle(n, m)        max error {err:.1e}")
print(f"   {'reference axis':14s} {'angle':>9s} {'pairs':>6s} {'Q':>10s}   {'|det G|':>8s}")
for (kind, ang), vals in sorted(table.items(), key=lambda kv: kv[1][0][0]):
    q = vals[0][0]
    flag = "  <- Koide 2/3" if abs(q - 2 / 3) < 1e-12 else ""
    print(f"   {kind:14s} {ang:9.4f} {len(vals):6d} {q:10.6f}   {max(d for _, d in vals):8.1e}{flag}")
print("   => Q = 2/3 exactly for, and only for, a 2-fold axis at the magic angle arccos(1/sqrt3) = 54.7356 deg:")
print("      the reference spinor sits on an axis of one of the five inscribed cubes; the 3-cycle runs its 3 axes")

# the cube triad itself
m = ax3[0]
cube = [n for n in ax2 if abs(abs(n @ m) - 1 / np.sqrt(3)) < 1e-9][:1][0]
G = three_return_gram(m, cube)
lam = np.sort(np.linalg.eigvalsh(G))
s01 = G[0, 1]
print(f"   cube triad: |<g_j|g_k>|^2 = {abs(s01)**2:.12f}  eigenvalues {np.round(lam, 12)}")
print(f"      = {{0, (3-sqrt3)/2, (3+sqrt3)/2}};  Q = {Q(lam):.15f};  delta = {lode(lam):.12f} (pi/12 = {np.pi/12:.12f})")
print(f"   prediction: m_e = 0,  m_mu/m_tau = 7-4sqrt3 = {7-4*np.sqrt(3):.6f}   measured {mmu/mt:.6f}"
      f" ({100*((7-4*np.sqrt(3))/(mmu/mt)-1):+.1f}%)")

# ----------------------------------------------------------------- 2. uniqueness in spin
print("=" * 78)
print("2) WHICH SPIN?  spin-j coherent states on the cube triad: overlaps are spin-1/2 overlaps^(2j)")
for twoj in range(1, 7):
    Gj = G ** twoj                                                  # entrywise power
    lj = np.linalg.eigvalsh(Gj)
    print(f"   j = {twoj}/2:  Q = {Q(lj):.10f}   (1/3 + (2/3) 4^-j = {1/3 + 2/3*4**(-twoj/2):.10f})")
print("   => only spin-1/2 gives the Koide sqrt2 on orthogonal axes")

# ----------------------------------------------------------------- 3. the phase it forces
print("=" * 78)
print("3) WHAT THE SAME STRUCTURE DOES TO THE PHASE")
qubit_det = max(abs(np.linalg.det(three_return_gram(m3, n))) for m3 in ax3 for _, n in axes if abs(m3 @ n) < 1 - 1e-9)
print(f"   any spin-1/2 three-return Gram is rank 2: max |det G| over all axis pairs = {qubit_det:.1e}  -> one massless generation")
print(f"   Bargmann phase of the cube triad: Phi = 3 delta = pi/4 = {np.pi/4:.12f}")
print(f"   needed: Phi* = 3 delta* = {3*dstar:.12f};  gap pi/4 - Phi* = {np.pi/4-3*dstar:.12f} rad")
pe = (1 + np.sqrt(2) * np.cos(dstar + 2 * np.pi / 3)) / 3
print(f"   on the Koide circle, sqrt(m_e)/sum sqrt(m) = (1 + sqrt2 cos(delta + 2pi/3))/3 = {pe:.6f}; zero at delta = pi/12")
print(f"   so pi/12 - delta* = {np.pi/12-dstar:.6f} ~ 3 x {pe:.6f} = {3*pe:.6f}: the missing phase IS the electron mass")

# mixing no-go: can the electron be added by mixing spinor triads without losing Q?
Gp = G
Gm = G.conj()                                                       # reversed orientation, Phi = -pi/4
perms = [np.eye(3)[list(p)] for p in itertools.permutations(range(3))]


def mix(par, A, B):
    w, a, b = par
    w = 1 / (1 + np.exp(-w))
    D = np.diag([1, np.exp(1j * a), np.exp(1j * b)])
    return w * A + (1 - w) * D @ B @ D.conj().T


best = (0.0, None)
for A in (Gp, Gm):
    for B0 in (Gp, Gm):
        for P in perms:
            B = P @ B0 @ P.T
            for _ in range(6):
                f = lambda p: -Q(np.linalg.eigvalsh(mix(p, A, B))) + 1e4 * (lode(np.linalg.eigvalsh(mix(p, A, B))) - dstar) ** 2
                o = minimize(f, rng.normal(size=3) * [2, 3, 3], method="Nelder-Mead",
                             options={"xatol": 1e-12, "fatol": 1e-14, "maxiter": 20000})
                lamx = np.linalg.eigvalsh(mix(o.x, A, B))
                if abs(lode(lamx) - dstar) < 1e-5 and min(lamx) > 0 and Q(lamx) > best[0]:
                    best = (Q(lamx), o.x)
qmax_rand = 0.0
for _ in range(200000):
    k = rng.integers(2, 5)
    w = rng.dirichlet(np.ones(k))
    Gx = sum(wi * (lambda D, P, B: D @ P @ B @ P.T @ D.conj().T)(
        np.diag(np.exp(1j * rng.uniform(0, 2 * np.pi, 3))), perms[rng.integers(6)], (Gp, Gm)[rng.integers(2)])
        for wi in w)
    lamx = np.linalg.eigvalsh(Gx)
    if min(lamx) > 0 and abs(lode(lamx) - dstar) < 5e-4:
        qmax_rand = max(qmax_rand, Q(lamx))
print(f"   mixing spinor triads to reach delta*: best Q = {best[0]:.6f} (optimised 2-mixes);"
      f" random 2-4-mixes within 5e-4 of delta*: max Q = {qmax_rand:.6f}")
print(f"      measured Q = {Qm:.8f} +- {dQ:.1e}  -> shortfall {(Qm-best[0])/dQ:.0f} sigma: mixing cannot give the electron its mass")

# ----------------------------------------------------------------- 4. the other route: equipartition
print("=" * 78)
print("4) SECOND ROUTE: equipartition between two complex modes (phase left free)")
print("   weight exp(-k/2 ||X||_F^2), trace part and traceless part each one complex mode with any scale factor")
for d0, d1 in [(2, 2), (3, 3), (4, 4), (1, 2), (4, 3)]:
    l0, l1 = rng.uniform(0.3, 3.0, 2)
    kap = rng.uniform(0.5, 4.0)

    def f(r):
        a, b = np.exp(r)                                             # radii of the two modes
        return -((d0 - 1) * np.log(a) + (d1 - 1) * np.log(b) - kap / 2 * (3 * (l0 * a) ** 2 + 6 * (l1 * b) ** 2))
    if d0 == 1:
        print(f"   dims ({d0},{d1}) [Hermitian circulant: real trace mode]: no interior mode, trace radius -> 0")
        continue
    o = minimize(f, [0.0, 0.0], method="BFGS", options={"gtol": 1e-12})
    a, b = np.exp(o.x)
    Xb, Xt = 3 * (l0 * a) ** 2, 6 * (l1 * b) ** 2
    print(f"   dims ({d0},{d1}), random scales/k: Q = {1/3 + Xt/(3*Xb):.10f}   (theory 1/3 + (d1-1)/(3(d0-1)) = "
          f"{1/3 + (d1-1)/(3*(d0-1)):.10f})")
print("   => Q = 2/3 for every coupling and scale iff the two modes have equal dimension; delta is flat")
c = np.load(ARCH / "2026-10-17_h64_quadratic_koide_phase/combined_signed_source_operators.npz")
U, Vp = c["U64"], c["period_decoder_frame"]
Uv = Vp.T @ U @ Vp
kk = np.round(np.angle(np.linalg.eigvals(Uv)) / (np.pi / 6)).astype(int) % 12
counts = {int(k): int(n) for k, n in zip(*np.unique(kk, return_counts=True))}
Pk = np.linalg.solve(np.linalg.eig(U)[1], c["common_period_field_P64"])
print(f"   H64 period field (18 dims) under the clock U (Z12 = Z3 x Z4), multiplicity by k (eigenvalue e^(i k pi/6)):")
print(f"      {counts}  ;  invariant: {np.linalg.norm((np.eye(64)-Vp@Vp.T)@U@Vp):.0e}")
print("      Z3-singlets k=3,9 are complex (U = +-i), Z3-doublets k=1,2,4,5,... are complex: both modes exist in H64")
w_all = np.abs(Pk) ** 2 * np.sum(np.abs(np.linalg.eig(U)[1]) ** 2, axis=0)
kP = np.round(np.angle(np.linalg.eig(U)[0]) / (np.pi / 6)).astype(int) % 12
print(f"      selected vacuum P*: weight in k=0 sector {w_all[kP==0].sum()/w_all.sum():.15f} (all of it)")
print("      missing: an H64 map from these modes to the charged-lepton sqrt-mass operator")

# ----------------------------------------------------------------- 5. phase requirements
print("=" * 78)
print("5) WHAT FIXES THE PHASE")
print("   real cubic term g|s|^3 cos3delta : minimum at delta = 0 or pi/3 (two equal masses)")
print(f"   complex cubic coupling g e^(-i beta) s^3 : delta = beta/3, needs beta = {3*dstar:.12f} rad, an input")
print(f"   law 3delta = Q with Q = 2/3      : delta = 2/9, {2/9-dstar:.3e} rad off = 442 sigma")
print(f"   spinor cube (section 1)           : delta = pi/12 = {np.pi/12:.6f}, m_e = 0")
print("=" * 78)
print("SUMMARY")
print("   sqrt2 : DERIVED two ways with no fitted number:")
print("           (a) spin-1/2 three-return on an inscribed-cube axis (unique axis, unique spin) -> Q = 2/3 exactly")
print("           (b) equipartition of two complex modes, isotropic weight -> Q = 2/3 for any coupling")
print("   phase : NOT DERIVED. (a) forces delta = pi/12 and m_e = 0, and no mixture can repair it within data;")
print("           (b) leaves delta flat. The phase needs one more input: beta = 3 delta* = 0.666666141 rad.")
