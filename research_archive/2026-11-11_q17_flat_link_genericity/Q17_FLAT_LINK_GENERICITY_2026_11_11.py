#!/usr/bin/env python3
"""Q17 [verify]: is the flat-link instability of the v61 induced action generic in (r, M, c_t), or tuned?

Gamma(theta) = -log|det H(theta)|, H = gamma5 (D_W(e^{i theta}) - M) on the archived 6x2x2x2 lattice (48 sites, 11 link
directions, 528 links), antiperiodic in time. D_W is rebuilt here with free parameters: spatial hops (+-gamma_d - r)/2,
temporal-diagonal hops c_t (+-gamma_0 - 1), onsite 3r + 16 c_t (the Wilson structure; at c_t = 1/16 this is the archived
3r + 1). The rebuild is required to equal the archived v61 operator at the archived (R_EXACT, M_EXACT, 1/16).
Independent of the archived kernel code: the Hessian at theta = 0 is obtained from central differences of the analytic
gradient dGamma/dtheta_l = -Re Tr(G dH/dtheta_l), projected off the 47 gauge directions (site-link incidence).
Certified: the archived count (72 negative, 409 positive physical modes) is reproduced; on a grid around the archived
point the number of unstable physical modes is reported (points where H is singular are flagged, not used).
"""
from __future__ import annotations

import importlib.util
import itertools
import json
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
SOURCE = HERE.parents[1] / "research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py"
spec = importlib.util.spec_from_file_location("v61_q17", SOURCE)
v61 = importlib.util.module_from_spec(spec); sys.modules[spec.name] = v61; spec.loader.exec_module(v61)

NT, NS = 6, 2
SITES = list(itertools.product(range(NT), range(NS), range(NS), range(NS)))
IDX = {s: i for i, s in enumerate(SITES)}
DIRS = [(0, 1, 0, 0), (0, 0, 1, 0), (0, 0, 0, 1)] + [(1, *b) for b in itertools.product((0, -1), repeat=3)]
NSITE, NDIR = len(SITES), len(DIRS)
NLINK = NSITE * NDIR
s1 = np.array([[0, 1], [1, 0]], complex); s2 = np.array([[0, -1j], [1j, 0]]); s3 = np.diag([1., -1.]).astype(complex)
I2, I4 = np.eye(2), np.eye(4)
GAM = [np.kron(s1, I2), np.kron(s2, s1), np.kron(s2, s2), np.kron(s2, s3)]
G5 = np.kron(s3, I2)


def shift(site, d):
    return tuple((site[k] + d[k]) % (NT, NS, NS, NS)[k] for k in range(4))


def asign(site, d):
    t = site[0] + d[0]
    return -1 if t < 0 or t >= NT else 1


def hops(r, ct):
    out = []
    for k, d in enumerate(DIRS):
        if k < 3:
            out.append((0.5 * (GAM[k + 1] - r * I4), 0.5 * (-GAM[k + 1] - r * I4)))
        else:
            out.append((ct * (GAM[0] - I4), ct * (-GAM[0] - I4)))
    return out


# link l = (x, k): forward block (x, x+d) carries U_l; backward block (x+d, x) carries conj(U_l)
LINKS = []
for x, site in enumerate(SITES):
    for k, d in enumerate(DIRS):
        y = IDX[shift(site, d)]
        LINKS.append((x, y, k, asign(site, d), asign(SITES[y], tuple(-v for v in d))))
INC = np.zeros((NLINK, NSITE))
for l, (x, y, *_ ) in enumerate(LINKS):
    INC[l, x] += 1; INC[l, y] -= 1


LX = np.array([L[0] for L in LINKS]); LY = np.array([L[1] for L in LINKS]); LK = np.array([L[2] for L in LINKS])
SF = np.array([L[3] for L in LINKS], float); SB = np.array([L[4] for L in LINKS], float)
G5BIG = np.kron(np.eye(NSITE), G5)


def hop_arrays(r, ct):
    hp = hops(r, ct)
    F = np.array([hp[k][0] for k in LK]) * SF[:, None, None]
    B = np.array([hp[k][1] for k in LK]) * SB[:, None, None]
    return F, B


def H_of(theta, r, M, ct):
    F, B = hop_arrays(r, ct)
    U = np.exp(1j * theta)[:, None, None]
    D4 = np.zeros((NSITE, NSITE, 4, 4), complex)
    D4[np.arange(NSITE), np.arange(NSITE)] = (3 * r + 16 * ct) * I4
    np.add.at(D4, (LX, LY), F * U)
    np.add.at(D4, (LY, LX), B * np.conj(U))
    D = D4.transpose(0, 2, 1, 3).reshape(4 * NSITE, 4 * NSITE)
    return G5BIG @ (D - M * np.eye(4 * NSITE))


def gradient(theta, r, M, ct):
    G = np.linalg.inv(H_of(theta, r, M, ct)).reshape(NSITE, 4, NSITE, 4).transpose(0, 2, 1, 3)
    F, B = hop_arrays(r, ct)
    U = np.exp(1j * theta)[:, None, None]
    a = np.einsum("ij,ljk->lik", G5, 1j * F * U)
    b = np.einsum("ij,ljk->lik", G5, -1j * B * np.conj(U))
    return -np.real(np.einsum("lij,lji->l", G[LY, LX], a) + np.einsum("lij,lji->l", G[LX, LY], b))


def physical_basis():
    U_, s, _ = np.linalg.svd(INC, full_matrices=False)
    gauge = U_[:, :int(np.sum(s > 1e-9))]
    assert gauge.shape[1] == 47
    return np.linalg.svd(np.eye(NLINK) - gauge @ gauge.T)[0][:, :NLINK - 47]


def unstable_count(r, M, ct, pb, eps=1e-4):
    H0 = H_of(np.zeros(NLINK), r, M, ct)
    gap = float(np.min(np.abs(np.linalg.eigvalsh(H0))))
    if gap < 1e-6:
        return None, gap
    Hs = np.empty((NLINK, NLINK))
    for m in range(NLINK):
        e = np.zeros(NLINK); e[m] = eps
        Hs[:, m] = (gradient(e, r, M, ct) - gradient(-e, r, M, ct)) / (2 * eps)
    Hs = 0.5 * (Hs + Hs.T)
    w = np.linalg.eigvalsh(pb.T @ Hs @ pb)
    return (int(np.sum(w < -1e-6)), int(np.sum(w > 1e-6)), float(w.min()), float(w.max())), gap


def main() -> int:
    R0, M0 = float(v61.R_EXACT), float(v61.M_EXACT)
    out: dict = {}
    th = np.random.default_rng(17).uniform(-np.pi, np.pi, NLINK)
    arch = np.kron(np.eye(NSITE), G5) @ (v61.wilson_operator_from_links(np.exp(1j * th).reshape(NSITE, NDIR)) - M0 * np.eye(4 * NSITE))
    out["rebuild_matches_v61_max_abs"] = float(np.max(np.abs(H_of(th, R0, M0, 1 / 16) - arch)))
    assert out["rebuild_matches_v61_max_abs"] < 1e-12
    pb = physical_basis()
    base, gap0 = unstable_count(R0, M0, 1 / 16, pb)
    out["archived_point"] = {"r": R0, "M": M0, "c_t": 1 / 16, "negative": base[0], "positive": base[1], "gap": gap0}
    assert base[:2] == (72, 409), base
    grid = []
    rs = [0.2, 0.3, R0, 0.45, 0.6, 1.0]
    Ms = [0.3, 0.6, M0, 1.0, 1.4]
    cts = [1 / 32, 1 / 16, 1 / 8, 1 / 4]
    for r, M, ct in itertools.product(rs, Ms, cts):
        res, gap = unstable_count(r, M, ct, pb)
        grid.append({"r": r, "M": M, "c_t": ct, "gap": gap,
                     "negative": None if res is None else res[0], "positive": None if res is None else res[1]})
    out["grid"] = grid
    ok = [g for g in grid if g["negative"] is not None]
    out["grid_points"] = len(grid); out["nonsingular_points"] = len(ok)
    out["points_with_unstable_modes"] = sum(1 for g in ok if g["negative"] > 0)
    out["negative_mode_counts"] = sorted({g["negative"] for g in ok})
    print(json.dumps({k: v for k, v in out.items() if k != "grid"}, indent=2))
    (HERE / "Q17_FLAT_LINK_GENERICITY_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print(f"PASS: rebuild equals v61; archived 72/409 reproduced; {out['points_with_unstable_modes']} of "
          f"{out['nonsingular_points']} nonsingular grid points have unstable flat links.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
