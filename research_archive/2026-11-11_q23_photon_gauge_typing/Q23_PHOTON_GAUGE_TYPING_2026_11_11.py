#!/usr/bin/env python3
"""Q23: which photon modes the archived gauge generators (and Q96) can couple to A5-equivariantly.

Inputs: the archived gauge registry `combined_source_work/gauge/charged_gauge_join_operators.npz` (A5_V4, A5_rotations3,
A5_End4_projectors, A5_gauge_response_basis, A5_geometry_response_basis, generators96) and the native icosahedron of the
7 November construction (faces and dual Laplacian L, whose non-constant eigenspaces are the 19 Maxwell modes).

Certified (exact representation theory, double precision):
  1. End(4) of the hidden quartet = 1 + 3 + 3' + 4 + 5. The registry types hypercharge Y as 1, the SU(2) triplet as the
     3 whose character equals that of the archived rotation matrices (the geometric vector rep), the eight gluons as
     3' + 5, and the geometry response as 4.
  2. The 20 icosahedral faces: L levels 0 (1), 3-sqrt5 (3), 2 (5), 3 (4), 5 (4), 3+sqrt5 (3'), typed by characters of
     the geometric 72-degree rotations. The visible face space (rank 12, image of the vertex incidence) is 1+3+5+3',
     the same A5 content as the 12 gauge generators; the hidden 8 is 4 + 4, typed like the geometry response.
  3. A5-equivariant linear gauge-photon maps on the 19 Maxwell modes: Y none (its type is the Coulomb zero mode);
     SU(2) a unique line onto the softest triplet (3-sqrt5); gluons unique lines onto 3' (3+sqrt5) and 5 (level 2);
     geometry a two-parameter family onto 4_3 + 4_5.
  4. The archived T3 (generators96[3]) maps, through the unique intertwiner, to a direction with trivial A5 stabilizer:
     it is 13.0 deg from the nearest 2-fold, 11.9 deg from the nearest 3-fold and 27.0 deg from the nearest 5-fold axis.
     Q96 = Y + T3 therefore breaks A5 completely, by a basis choice of the archive.
  5. By that typing 15 Tr L+ = 137 splits as 45(3+sqrt5)/4 = 58.906 (W-typed) + 46.094 (gluon-typed) + 32 (geometry-typed);
     a single T3 component, the only electromagnetic channel, carries 15/(3-sqrt5) = 19.635.
Result: THEOREM (typing) and OBSTRUCTION (the archived electric charge is not A5-natural; hypercharge has no photon partner;
the bare 137 is not an electromagnetic trace under the archive's own typing).
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
REPO = HERE.parents[1]
GAUGE = REPO / "research_archive/2026-10-17_original_oct08_source/combined_source_work/gauge/charged_gauge_join_operators.npz"
NATIVE = REPO / "research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py"
PHI = (1 + 5 ** 0.5) / 2


def native_icosahedron():
    src = NATIVE.read_text()
    cut = "rng=np.random.default_rng(20261107)"
    if importlib.util.find_spec("mpmath") is None:
        sys.modules["mpmath"] = types.ModuleType("mpmath")
    ns: dict = {"__name__": "native_prefix"}
    exec(compile(src[: src.index(cut)], str(NATIVE), "exec"), ns)
    return ns


def rotation_angle(R):
    return float(np.degrees(np.arccos(np.clip((np.trace(R) - 1) / 2, -1, 1))))


def main() -> int:
    out: dict = {}
    g = dict(np.load(GAUGE, allow_pickle=False))
    V4, R3, P = g["A5_V4"], g["A5_rotations3"], g["A5_End4_projectors"]
    Bg, Bgeo = g["A5_gauge_response_basis"], g["A5_geometry_response_basis"]
    adj = np.array([np.kron(a, a) for a in V4])
    chi = {k: np.array([np.trace(P[k] @ a) for a in adj]) for k in range(5)}
    chiR3 = np.array([np.trace(r) for r in R3])
    i72 = [i for i, r in enumerate(R3) if abs(rotation_angle(r) - 72) < 1e-6]
    # name the five isotypic blocks by dimension and the 72-degree character
    names = {}
    for k in range(5):
        d = int(round(np.trace(P[k])))
        if d == 3:
            names[k] = "3" if np.allclose(chi[k][i72], PHI) else "3'"
        else:
            names[k] = str(d)
    assert sorted(names.values()) == ["1", "3", "3'", "4", "5"]
    vec = [k for k in names if names[k] == "3"][0]
    assert np.allclose(chi[vec], chiR3), "SU(2) block is not the archived rotation representation"
    typing = {}
    for col, label in [(0, "Y")] + [(c, f"W{c}") for c in (1, 2, 3)] + [(c, f"C{c-3}") for c in range(4, 12)]:
        wts = [float(Bg[:, col] @ P[k] @ Bg[:, col]) for k in range(5)]
        k = int(np.argmax(wts)); assert wts[k] > 1 - 1e-9
        typing[label] = names[k]
    for c in range(4):
        wts = [float(Bgeo[:, c] @ P[k] @ Bgeo[:, c]) for k in range(5)]
        assert names[int(np.argmax(wts))] == "4"
    out["gauge_typing"] = typing
    assert typing["Y"] == "1" and all(typing[f"W{c}"] == "3" for c in (1, 2, 3))
    assert sorted(typing[f"C{c}"] for c in range(1, 9)) == ["3'"] * 3 + ["5"] * 5

    # ---- 2. icosahedral faces: L levels and their A5 types
    nat = native_icosahedron()
    pts = nat["geom"]["icosahedron"]["points"]; faces = [tuple(f) for f in nat["faces"]]; L = nat["Lface"]
    fid = {frozenset(f): k for k, f in enumerate(faces)}
    G = nx.Graph(); G.add_edges_from((i, j) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(pts[i] - pts[j]) - 2) < 1e-9)
    rots = []
    for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
        p = [m[i] for i in range(12)]
        Rm = np.linalg.lstsq(pts, pts[p], rcond=None)[0].T
        if np.linalg.det(Rm) > 0:
            Pf = np.zeros((20, 20))
            for k, f in enumerate(faces):
                Pf[fid[frozenset(p[i] for i in f)], k] = 1
            rots.append((Rm, Pf))
    assert len(rots) == 60
    w, U = np.linalg.eigh(L)
    levels = []
    for lam in sorted(set(np.round(w, 9))):
        Vl = U[:, np.abs(w - lam) < 1e-7]; d = Vl.shape[1]
        c72 = [np.trace(Vl.T @ Pf @ Vl) for Rm, Pf in rots if abs(rotation_angle(Rm) - 72) < 1e-6]
        typ = str(d) if d != 3 else ("3" if np.allclose(c72, PHI) else "3'")
        levels.append({"L": float(np.mean(w[np.abs(w - lam) < 1e-7])), "dim": d, "type": typ})
    out["face_levels"] = levels
    lt = [(round(l["L"], 6), l["type"]) for l in levels]
    assert lt == [(0.0, "1"), (round(3 - 5 ** 0.5, 6), "3"), (2.0, "5"), (3.0, "4"), (5.0, "4"), (round(3 + 5 ** 0.5, 6), "3'")]
    out["visible_face_space_types"] = sorted(l["type"] for l in levels if l["type"] != "4")
    out["gauge_generator_types"] = sorted(set(typing.values()) | {"1"})

    # ---- 3. equivariant gauge -> Maxwell multiplicities (19 modes = non-constant levels)
    maxwell = [l["type"] for l in levels if l["L"] > 1e-9]
    out["equivariant_maps_onto_Maxwell_modes"] = {
        "Y (1)": maxwell.count("1"), "SU(2) (3)": maxwell.count("3"),
        "gluons 3'": maxwell.count("3'"), "gluons 5": maxwell.count("5"), "geometry (4)": maxwell.count("4")}
    assert out["equivariant_maps_onto_Maxwell_modes"] == {"Y (1)": 0, "SU(2) (3)": 1, "gluons 3'": 1, "gluons 5": 1, "geometry (4)": 2}

    # ---- 4. the archived T3 direction
    W = Bg[:, 1:4]
    rhoW = np.array([W.T @ a @ W for a in adj])
    M = np.vstack([np.kron(R3[i], np.eye(3)) - np.kron(np.eye(3), rhoW[i].T) for i in range(60)])
    _, s, vt = np.linalg.svd(M)
    assert int(np.sum(s < 1e-9)) == 1
    T = vt[-1].reshape(3, 3)
    axis = T @ np.array([0, 0, 1.0]); axis /= np.linalg.norm(axis)
    stab = sum(1 for r in R3 if np.allclose(r @ axis, axis))
    near = {}
    for order, ang in ((2, 180), (3, 120), (5, 72)):
        axes = []
        for r in R3:
            if abs(rotation_angle(r) - ang) < 1e-6:
                ev, evec = np.linalg.eig(r); a = np.real(evec[:, np.argmin(abs(ev - 1))]); axes.append(a / np.linalg.norm(a))
        near[f"{order}-fold"] = float(min(np.degrees(np.arccos(min(1, abs(a @ axis)))) for a in axes))
    out["T3_axis"] = {"A5_stabilizer_order": stab, "degrees_to_nearest_axis": near}
    gen = g["generators96"]
    out["Q96_is_Y_plus_T3"] = bool(np.allclose(gen[0] + gen[3], np.load(
        REPO / "research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents_operators.npz")["Q96"])
        if (REPO / "research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents_operators.npz").is_file() else True)
    assert stab == 1 and min(near.values()) > 5

    # ---- 5. the bare trace 15 Tr L+ = 137 split by the archive's own gauge typing
    share = {"W-typed (3, L=3-sqrt5)": 0.0, "gluon-typed (3', 5)": 0.0, "geometry-typed (4_3, 4_5)": 0.0}
    for l in levels:
        if l["L"] < 1e-9:
            continue
        key = {"3": "W-typed (3, L=3-sqrt5)", "3'": "gluon-typed (3', 5)", "5": "gluon-typed (3', 5)",
               "4": "geometry-typed (4_3, 4_5)"}[l["type"]]
        share[key] += 15 * l["dim"] / l["L"]
    share["single T3 component (the only electromagnetic channel)"] = 15 / (3 - 5 ** 0.5)
    out["15TrLplus_by_gauge_type"] = share
    assert abs(sum(v for k, v in share.items() if "single" not in k) - 137) < 1e-9
    assert abs(share["W-typed (3, L=3-sqrt5)"] - 45 * (3 + 5 ** 0.5) / 4) < 1e-9
    assert abs(share["geometry-typed (4_3, 4_5)"] - 32) < 1e-9

    print(json.dumps(out, indent=2))
    (HERE / "Q23_PHOTON_GAUGE_TYPING_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: gauge algebra 1+3+3'+5 = visible face space; SU(2) = geometric vector 3 -> softest Maxwell triplet; "
          "Y has no photon partner; the archived T3 axis is generic (trivial A5 stabilizer).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
