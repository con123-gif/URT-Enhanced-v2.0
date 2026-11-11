#!/usr/bin/env python3
"""Is the induced photon at the registry vacuum Maxwell-like?

Uses the strict local minimum of Gamma_Q = 36G(t) + 36G(2t) + 12G(3t) stored by REGISTRY_INDUCED_VACUUM_2026_11_11.py
(theta_registry_best_2026_11_11.npy) and the same procedure as the single-charge test
(2026-11-10_induced_photon/INDUCED_PHOTON_COUPLING_TEST_2026_11_11.py): restrict the exact physical Hessian A of Gamma_Q to
the 481 non-gauge link directions, and compare it with the loop-flux (Maxwell) forms M = C^T C built from all elementary
triangles, all four-cycles, or both. Reported for each form: the generalized spectrum kappa of A relative to M on the
range of M, the Hilbert-Schmidt best single coupling kappa_HS = <A,M>/<M,M> and the relative residual |A - kappa_HS M|/|A|.
A Maxwell photon with one coupling would have kappa constant and residual near 0.
Normalisation: Gamma_Q sums over the 96 registry states; kappa per unit charge squared is kappa_HS/288 (sum c^2 = 288).
Premise: as in Q16 (declared tensor-product charge assignment).
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
IND = HERE.parent / "2026-11-10_induced_photon"
sys.path.insert(0, str(IND)); sys.path.insert(0, str(HERE))
import INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10 as K           # noqa: E402
import INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10 as V        # noqa: E402

WEIGHTS = {1: 36, 2: 36, 3: 12}


def hess(theta):
    return sum(n * c * c * K.kernels(K.H_of(c * theta), theta=c * theta)[0] for c, n in WEIGHTS.items())


def loopmat(cs):
    C = np.zeros((len(cs), K.nlink))
    for i, c in enumerate(cs):
        for l, sg in c:
            C[i, l] += sg
    return C


def compare(A, M):
    w, U = np.linalg.eigh(M)
    keep = w > 1e-9 * w.max()
    T = U[:, keep] / np.sqrt(w[keep])
    k = np.linalg.eigvalsh(T.T @ A @ T)
    hs = float(np.sum(A * M) / np.sum(M * M))
    return {"rank_M": int(keep.sum()), "kappa_min": float(k.min()), "kappa_median": float(np.median(k)),
            "kappa_max": float(k.max()), "kappa_HS": hs, "kappa_HS_per_unit_charge2": hs / 288,
            "relative_residual": float(np.linalg.norm(A - hs * M) / np.linalg.norm(A))}


def main() -> int:
    theta = np.load(HERE / "theta_registry_best_2026_11_11.npy")
    pb = V.physical_basis()
    A = pb.T @ hess(theta) @ pb
    assert np.linalg.eigvalsh(A).min() > 0, "stored point is not a strict local minimum"
    C3, C4 = loopmat(V.cycles(3)), loopmat(V.cycles(4))
    out = {}
    for name, C in (("triangles", C3), ("four_cycles", C4), ("triangles_and_four_cycles", np.vstack([C3, C4]))):
        out[name] = compare(A, pb.T @ (C.T @ C) @ pb)
    print(json.dumps(out, indent=2))
    (HERE / "REGISTRY_MAXWELL_TEST_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    best = min(out.values(), key=lambda d: d["relative_residual"])
    assert best["relative_residual"] > 0.2, "unexpectedly Maxwell-like: inspect before any physical reading"
    print(f"PASS (negative): no loop-flux form fits the registry-vacuum Hessian; best residual {100*best['relative_residual']:.1f}%, "
          f"kappa spread {best['kappa_min']:.4f}..{best['kappa_max']:.4f}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
