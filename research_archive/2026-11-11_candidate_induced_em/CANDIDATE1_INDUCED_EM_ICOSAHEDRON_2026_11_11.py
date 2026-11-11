#!/usr/bin/env python3
"""Candidate 1 (conditional, minimal form): electromagnetism induced on the icosahedral edges by the native vertex field.

Choice declared (not derived): the native icosahedral vertex cochain v (complex, kinetic term the graph Laplacian
b1 b1^T of the 7 November action) carries unit charge under compact phases A_e on the 30 icosahedral edges, by Peierls
substitution; it lives on the native 24-clock with the native stiffness r = pi/e and golden twist theta = 2 pi/phi^2,
so clock mode m adds the mass r^2 (2 - 2 cos(2 pi m/24 + theta)). Cbridge is dropped (it is not gauge covariant under
vertex phases). There is no bare photon term: the photon action is entirely induced,
    Gamma(A) = sum_m log det( L(A) + r^2 lambda_m )        (bosonic, so +log det).
By the diamagnetic inequality A = 0 is its minimum. The Hessian Pi at A = 0 is computed analytically.

Pre-registered observable (fixed before computing): the induced stiffness on the softest Maxwell triplet
(M = d1^T d1 eigenvalue 3 - sqrt5, the A5 vector, the only SU(2)-typed channel, Q23), kappa_3 = Pi_3 / M_3, reported with
4 pi kappa_3. Caveat: the icosahedral photon is 2-dimensional, so e^2 is a lattice number here, not a 4D alpha.
Certified: the Ward identity Pi d0 = 0; Pi is diagonal on the five Maxwell levels (parity and A5); its eigenvalues;
kappa on each level; the Hilbert-Schmidt best single coupling and its residual.
"""
from __future__ import annotations

import itertools
import json
import sys
from itertools import combinations
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
PHI = (1 + 5 ** 0.5) / 2
R = np.pi / np.e
THETA = 2 * np.pi / PHI ** 2


def complex_icosahedron():
    pts = np.array([(0, a, b * PHI) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a, b * PHI, 0) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a * PHI, 0, b) for a, b in itertools.product((-1, 1), repeat=2)], float)
    E = [(i, j) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(pts[i] - pts[j]) - 2) < 1e-9]
    Fc = [f for f in combinations(range(12), 3) if all(tuple(sorted(p)) in E for p in combinations(f, 2))]
    eid = {e: k for k, e in enumerate(E)}
    d0 = np.zeros((30, 12))
    for k, (i, j) in enumerate(E):
        d0[k, i], d0[k, j] = -1, 1
    d1 = np.zeros((20, 30))
    for fi, (a, b, c) in enumerate(Fc):
        d1[fi, eid[(a, b)]] += 1; d1[fi, eid[(b, c)]] += 1; d1[fi, eid[(a, c)]] -= 1
    assert len(E) == 30 and len(Fc) == 20 and np.allclose(d1 @ d0, 0)
    return E, d0, d1


def induced_hessian(E):
    """Analytic Hessian at A = 0 of sum_m log det(L(A) + r^2 lambda_m), L(A)_{ji} = -e^{i A_e} for edge e = (i, j)."""
    L0 = np.zeros((12, 12))
    for i, j in E:
        L0[i, i] += 1; L0[j, j] += 1; L0[i, j] -= 1; L0[j, i] -= 1
    n = len(E)
    Pi = np.zeros((n, n))
    for m in range(24):
        lam = 2 - 2 * np.cos(2 * np.pi * m / 24 + THETA)
        G = np.linalg.inv(L0 + R * R * lam * np.eye(12))
        J = []
        for i, j in E:
            dL = np.zeros((12, 12), complex); dL[j, i] = -1j; dL[i, j] = 1j       # d/dA of -e^{iA} and -e^{-iA}
            J.append(dL)
        for a, (i, j) in enumerate(E):
            W = np.zeros((12, 12)); W[j, i] = 1; W[i, j] = 1                       # second derivative at A = 0
            Pi[a, a] += np.trace(G @ W).real
        GJ = [G @ Jl for Jl in J]
        for a in range(n):
            for b in range(n):
                Pi[a, b] -= np.trace(GJ[a] @ GJ[b]).real
    return 0.5 * (Pi + Pi.T)


def main() -> int:
    E, d0, d1 = complex_icosahedron()
    Pi = induced_hessian(E)
    out = {"choice": "Peierls unit charge on icosahedral vertex cochains; native 24-clock (r = pi/e, golden twist); Cbridge dropped",
           "ward_max": float(np.abs(Pi @ d0).max())}
    assert out["ward_max"] < 1e-10
    M = d1.T @ d1
    U, s, _ = np.linalg.svd(d0, full_matrices=False)
    gauge = U[:, :int(np.sum(s > 1e-9))]
    pb = np.linalg.svd(np.eye(30) - gauge @ gauge.T)[0][:, :30 - gauge.shape[1]]
    A, Mp = pb.T @ Pi @ pb, pb.T @ M @ pb
    assert np.linalg.eigvalsh(A).min() > 0, "flat links not stable for the bosonic induced action"
    w, V = np.linalg.eigh(Mp)
    levels = []
    offdiag = 0.0
    for lv in sorted(set(np.round(w, 9))):
        Vl = V[:, np.abs(w - lv) < 1e-7]
        Vo = V[:, np.abs(w - lv) >= 1e-7]
        offdiag = max(offdiag, float(np.abs(Vo.T @ A @ Vl).max()))
        ev = np.linalg.eigvalsh(Vl.T @ A @ Vl)
        levels.append({"M": float(lv), "dim": int(Vl.shape[1]), "Pi": float(ev.mean()), "Pi_spread": float(ev.max() - ev.min()),
                       "kappa": float(ev.mean() / lv)})
    out["levels"] = levels
    out["max_Pi_mixing_between_levels"] = offdiag
    assert offdiag < 1e-9 and all(l["Pi_spread"] < 1e-9 for l in levels)
    k3 = levels[0]["kappa"]
    hs = float(np.sum(A * Mp) / np.sum(Mp * Mp))
    out["softest_triplet"] = {"kappa_3": k3, "4pi_kappa_3": 4 * np.pi * k3}
    out["best_single_kappa"] = {"kappa_HS": hs, "relative_residual": float(np.linalg.norm(A - hs * Mp) / np.linalg.norm(A))}
    print(json.dumps(out, indent=2))
    (HERE / "CANDIDATE1_INDUCED_EM_ICOSAHEDRON_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print(f"PASS (negative for alpha): induced kernel nearly constant on the 19 transverse modes (Pi {levels[0]['Pi']:.4f}..{levels[-1]['Pi']:.4f}); "
          f"kappa_3 = {k3:.6f}, 4 pi kappa_3 = {4*np.pi*k3:.4f}; best single coupling residual {100*out['best_single_kappa']['relative_residual']:.1f}%.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
