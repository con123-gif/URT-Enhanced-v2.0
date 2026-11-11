#!/usr/bin/env python3
"""Parity of the hidden sector and the Delta-selection rule of the native URT action.

Native objects only: the archived 7 November all-five construction
(`2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py`) is executed
verbatim up to its first test block (geometry, Hodge-Dirac, Cbridge, Plinear, P3, P5, Uh, Hbits and the
action functions geom_energy, hidden_source, history_source_solve, direct_history_energy, entropy_total,
reduced_action, full_action). Its mpmath import is only used after that point.

Certified (exact representation theory, checked in double precision):
  1. Central inversion acts on the 20 icosahedral faces (= dodecahedral vertices) and commutes with the
     dual Laplacian L. The hidden sector splits by parity: 4_3 (L = 3) is ODD, 4_5 (L = 5) is EVEN.
     Even = 1 + 5 + 4_5, odd = 3 + 4_3 + 3'. The bare trace splits 15 Tr L+ = 99/2 (even) + 175/2 (odd).
  2. In each of the five A4 vacua the A4-invariant face functions are 3-dimensional; the 4_3 singlet is
     the tetrahedral parity vector 1_T - 1_T' of the two 4-face orbits, the 4_5 singlet is the contrast
     2*1_rest - 3*1_(T+T') between the 12-face orbit and the 8 faces of the inscribed cube.
  3. Edge (photon) cochains never enter the history or KMS terms: the native photon is a free field.
  4. R = I - 2 Uh P5 Uh^T is an orthogonal involution commuting with Hbits; the full action satisfies
     S(z, y; Delta) = S(z, R y; -Delta) once the KMS weights are written through Delta^2.
     Hence every observable of z alone (geometry, photon, vacuum, Hessians) is EVEN in Delta.
Consequence: within the native action no geometric or photon observable has a term linear in Delta,
and the photon trace 15 Tr M+ = 137 receives no correction at all. A Delta-linear alpha correction
(the Delta polynomial's 17572/1215) needs a coupling that is absent from the native action and odd
under R. Scope: the 7 November action as archived; no physical identification of alpha is made.
"""
from __future__ import annotations

import importlib.util
import json
import sys
import types
from itertools import combinations
from pathlib import Path

import networkx as nx
import numpy as np

HERE = Path(__file__).resolve().parent
NATIVE = HERE.parent / "2026-11-07_joint_interacting_native" / "cathedral_constructed_joint_dynamics_2026_11_07.py"
CUT = "rng=np.random.default_rng(20261107)"


def load_native() -> dict:
    src = NATIVE.read_text()
    assert src.count(CUT) == 1
    prefix = src[: src.index(CUT)]
    if importlib.util.find_spec("mpmath") is None:      # only the unexecuted tail uses mpmath
        sys.modules["mpmath"] = types.ModuleType("mpmath")
    ns: dict = {"__name__": "native_prefix", "__file__": str(NATIVE)}
    exec(compile(prefix, str(NATIVE), "exec"), ns)
    return ns


def main() -> int:
    nat = load_native()
    out: dict = {}
    ico = nat["geom"]["icosahedron"]
    pts, faces = ico["points"], [tuple(f) for f in nat["faces"]]
    L, P3, P5, C, Uh, Hbits = (nat[k] for k in ("Lface", "P3", "P5", "C", "Uh", "Hbits"))
    nf = len(faces)
    fid = {frozenset(f): k for k, f in enumerate(faces)}

    # ---- 1. inversion parity on faces
    anti = [int(np.argmin(np.linalg.norm(pts + pts[i], axis=1))) for i in range(12)]
    Pinv = np.zeros((nf, nf))
    for k, f in enumerate(faces):
        Pinv[fid[frozenset(anti[i] for i in f)], k] = 1
    assert np.allclose(Pinv @ L, L @ Pinv)
    par3 = np.trace(Pinv @ P3) / 4; par5 = np.trace(Pinv @ P5) / 4
    out["hidden_parity"] = {"4_3": float(par3), "4_5": float(par5)}
    assert np.allclose(Pinv @ P3, -P3) and np.allclose(Pinv @ P5, P5)
    w, U = np.linalg.eigh(L)
    levels = {}
    for lam in sorted(set(np.round(w, 9))):
        V = U[:, np.abs(w - lam) < 1e-7]
        levels[f"{lam:.6f}"] = {"dim": V.shape[1], "parity": float(np.trace(V.T @ Pinv @ V) / V.shape[1])}
    out["levels"] = levels
    Lp = np.linalg.pinv(L)
    even = (np.eye(nf) + Pinv) / 2
    tr_even, tr_odd = 15 * np.trace(even @ Lp), 15 * np.trace((np.eye(nf) - even) @ Lp)
    out["15TrLplus"] = {"even": float(tr_even), "odd": float(tr_odd), "total": float(tr_even + tr_odd)}
    assert abs(tr_even - 99 / 2) < 1e-10 and abs(tr_odd - 175 / 2) < 1e-10

    # ---- 2. the five A4 vacua and their hidden singlets
    G = nx.Graph()
    G.add_edges_from((i, j) for i, j in combinations(range(12), 2)
                     if abs(np.linalg.norm(pts[i] - pts[j]) - 2) < 1e-9)
    rots = []
    for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
        p = tuple(m[i] for i in range(12))
        R = np.linalg.lstsq(pts, pts[list(p)], rcond=None)[0]
        if np.linalg.det(R) > 0:
            rots.append(p)
    assert len(rots) == 60
    comp = lambda a, b: tuple(a[b[i]] for i in range(12))
    e = tuple(range(12))
    inv = [a for a in rots if a != e and comp(a, a) == e]
    klein = {frozenset((e, a, b, comp(a, b))) for a in inv for b in inv if a != b and comp(a, b) == comp(b, a)}
    assert len(klein) == 5
    inverse = lambda g: tuple(g.index(i) for i in range(12))
    vac = []
    for V4 in klein:
        A4 = [g for g in rots if frozenset(comp(comp(g, x), inverse(g)) for x in V4) == V4]
        assert len(A4) == 12
        av = np.zeros((nf, nf))
        for g in A4:
            for k, f in enumerate(faces):
                av[fid[frozenset(g[i] for i in f)], k] += 1 / 12
        assert abs(np.trace(av) - 3) < 1e-9                       # 3 A4-invariant face functions
        orbits = sorted({frozenset(np.nonzero(av[:, k] > 1e-9)[0]) for k in range(nf)}, key=len)
        assert [len(o) for o in orbits] == [4, 4, 12]
        ind = [np.isin(np.arange(nf), list(o)).astype(float) for o in orbits]
        s3 = ind[0] - ind[1]; s5 = 2 * ind[2] - 3 * (ind[0] + ind[1])
        ok3 = np.allclose(P3 @ s3, s3) and np.allclose(L @ s3, 3 * s3) and np.allclose(Pinv @ s3, -s3)
        ok5 = np.allclose(P5 @ s5, s5) and np.allclose(L @ s5, 5 * s5) and np.allclose(Pinv @ s5, s5)
        rank3 = np.linalg.matrix_rank(P3 @ av @ P3, tol=1e-9); rank5 = np.linalg.matrix_rank(P5 @ av @ P5, tol=1e-9)
        vac.append({"singlet_3_is_tetrahedral_parity": bool(ok3), "singlet_5_is_cube_contrast": bool(ok5),
                    "rank_P3_avA4_P3": int(rank3), "rank_P5_avA4_P5": int(rank5)})
        assert ok3 and ok5 and rank3 == 1 and rank5 == 1
    out["a4_vacua"] = vac

    # ---- 3. edge cochains are free: history and KMS see vertex cochains only
    geom, names, N = nat["geom"], nat["names"], nat["N"]
    thetas = np.full(N, nat["theta"])
    rng = np.random.default_rng(1111)
    z = (rng.normal(size=(N, 190)) + 1j * rng.normal(size=(N, 190))) * 0.05
    S0, _, V0, h30, h50 = nat["reduced_action"](z, thetas)
    zE = z.copy()
    for nm in names:
        g = geom[nm]; o = g["offset"]
        zE[:, o + g["V"]: o + g["V"] + g["E"]] += 0.3 * (rng.normal(size=(N, g["E"])) + 1j * rng.normal(size=(N, g["E"])))
    S1, _, V1, h31, h51 = nat["reduced_action"](zE, thetas)
    hist_kms0 = V0 + nat["entropy_total"](h30, h50)
    hist_kms1 = V1 + nat["entropy_total"](h31, h51)
    out["edge_shift_changes_history_plus_KMS_by"] = float(abs(hist_kms1 - hist_kms0))
    out["edge_shift_changes_geometric_energy_by"] = float(abs((S1 - hist_kms1) - (S0 - hist_kms0)))
    assert abs(hist_kms1 - hist_kms0) < 1e-12 and np.allclose(h31, h30) and np.allclose(h51, h50)

    # ---- 4. R-symmetry: S(z, y; Delta) = S(z, R y; -Delta)
    Pi5 = Uh @ P5 @ Uh.T
    Rm = np.eye(64) - 2 * Pi5
    assert np.allclose(Rm @ Rm, np.eye(64)) and np.allclose(Rm @ Hbits, Hbits @ Rm)
    assert np.allclose(Rm @ Uh @ P3, Uh @ P3) and np.allclose(Rm @ Uh @ P5, -Uh @ P5)
    y = (rng.normal(size=(N, 64)) + 1j * rng.normal(size=(N, 64))) * 0.1
    D0 = nat["Delta"]
    Hp = nat["direct_history_energy"](y, h30, h50, thetas)
    nat["Delta"] = -D0
    Hm = nat["direct_history_energy"](y @ Rm.T, h30, h50, thetas)
    Vm, ym = nat["history_source_solve"](h30, h50, thetas)
    nat["Delta"] = D0
    Vp, yp = nat["history_source_solve"](h30, h50, thetas)
    out["R_symmetry_history_energy_difference"] = float(abs(Hp - Hm))
    out["reduced_history_energy_even_in_Delta"] = float(abs(Vp - Vm))
    out["optimal_history_maps_by_R"] = float(np.max(np.abs(ym - yp @ Rm.T)))
    assert abs(Hp - Hm) < 1e-10 * max(1, abs(Hp)) and abs(Vp - Vm) < 1e-12
    assert np.max(np.abs(ym - yp @ Rm.T)) < 1e-12

    print(json.dumps(out, indent=2))
    (HERE / "HIDDEN_PARITY_DELTA_SELECTION_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: 4_3 odd, 4_5 even; 15 Tr L+ = 99/2 + 175/2; A4 singlets = tetrahedral parity and cube contrast; "
          "native photon free; S(z,y;D) = S(z,Ry;-D), so z-observables are even in Delta.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
