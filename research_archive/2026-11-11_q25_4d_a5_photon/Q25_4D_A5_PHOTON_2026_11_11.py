#!/usr/bin/env python3
"""Q25: the photon on the A5-symmetric 4D complex 13-cell x 24-clock (geometry only; no matter coupling chosen).

13-cell: centre + the 12 native icosahedron vertices; 42 edges (30 shell + 12 spokes), 50 triangles (20 shell + 30 spoke),
20 tetrahedra. It is a 3-ball, so H^1 = 0. The 24-clock is a 24-cycle; for the neutral photon its golden background twist
is irrelevant (a flat background acts only on charged fields). The product CW complex has 13*24 = 312 vertices,
55*24 = 1320 links and 92*24 = 2208 plaquettes; its lattice Maxwell operator is d1^T d1.

Certified:
  1. d1 d0 = 0 and d2 d1 = 0 on the 13-cell; Euler characteristic 1.
  2. A5 acts on edges by signed permutations (orientation signs kept; equivariant with d0). The 30 physical spatial link
     modes carry 2(3 + 3' + 4 + 5): NO trivial representation. The only A5-invariant 1-form is the outward spoke field,
     which is d0 of the radial function, i.e. pure gauge. The spatial curl-curl is positive on all 30 (levels listed).
  3. So the 2D result of Q23 survives in 3D: hypercharge (typed 1) has no A5-equivariant MAGNETIC photon channel.
     The longitudinal (electric) sector is the nonzero graph-Laplacian part of the 13 vertex functions,
     3 (6-sqrt5) + 5 (7) + 3' (6+sqrt5) + 1 (13); its singlet is the centre-shell radial mode at lambda_L = 13.
  4. The 4D product: in clock Fourier mode n the Maxwell operator splits into 30 transverse modes mu + 4 sin^2(pi n/24),
     12 longitudinal modes lambda_L + 4 sin^2(pi n/24) (lambda_L the nonzero 13-cell graph Laplacian levels) and, at n = 0
     only, one harmonic mode (the clock holonomy). The full 1320 x 1320 operator is built and its spectrum checked against
     this decomposition; physical count 1320 - 311 = 1009.
No number is identified with alpha.
"""
from __future__ import annotations

import collections
import itertools
import json
import sys
from itertools import combinations
from pathlib import Path

import networkx as nx
import numpy as np

HERE = Path(__file__).resolve().parent
PHI = (1 + 5 ** 0.5) / 2
NCLOCK = 24


def thirteen_cell():
    shell = np.array([(0, a, b * PHI) for a, b in itertools.product((-1, 1), repeat=2)]
                     + [(a, b * PHI, 0) for a, b in itertools.product((-1, 1), repeat=2)]
                     + [(a * PHI, 0, b) for a, b in itertools.product((-1, 1), repeat=2)], float)
    pts = np.vstack([np.zeros(3), shell])                      # vertex 0 = centre
    sh = [(i + 1, j + 1) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(shell[i] - shell[j]) - 2) < 1e-9]
    edges = [(0, i) for i in range(1, 13)] + sh
    tri_sh = [f for f in combinations(range(1, 13), 3) if all(tuple(sorted(p)) in sh for p in combinations(f, 2))]
    faces = [(0, i, j) for i, j in sh] + tri_sh
    tets = [(0,) + f for f in tri_sh]
    return pts, edges, faces, tets


def boundary(cells, faces_of):
    """Simplicial boundary with vertex-ordered orientation: rows = faces_of index, cols = cells."""
    idx = {c: k for k, c in enumerate(faces_of)}
    B = np.zeros((len(cells), len(faces_of)))
    for r, c in enumerate(cells):
        for k in range(len(c)):
            f = c[:k] + c[k + 1:]
            B[r, idx[f]] += (-1) ** k
    return B


def a5_rotations(pts):
    shell = pts[1:]
    G = nx.Graph(); G.add_edges_from((i, j) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(shell[i] - shell[j]) - 2) < 1e-9)
    rots = []
    for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
        p = [m[i] for i in range(12)]
        if np.linalg.det(np.linalg.lstsq(shell, shell[p], rcond=None)[0]) > 0:
            rots.append([0] + [x + 1 for x in p])               # centre fixed
    assert len(rots) == 60
    return rots


def signed_perm(cells, perm):
    idx = {c: k for k, c in enumerate(cells)}
    P = np.zeros((len(cells), len(cells)))
    for k, c in enumerate(cells):
        img = [perm[v] for v in c]
        srt = tuple(sorted(img))
        # sign of the permutation sorting img
        sign = 1
        arr = list(img)
        for a in range(len(arr)):
            for b in range(a + 1, len(arr)):
                if arr[a] > arr[b]:
                    sign = -sign
        P[idx[srt], k] = sign
    return P


CHARS = {"1": [1, 1, 1, 1, 1], "3": [3, -1, 0, PHI, 1 - PHI], "3'": [3, -1, 0, 1 - PHI, PHI],
         "4": [4, 0, 1, -1, -1], "5": [5, 1, -1, 0, 0]}


def rot_class(R):
    tr = np.trace(R)
    for k, t in enumerate([3, -1, 0, PHI, 1 - PHI]):
        if abs(tr - t) < 1e-9:
            return k
    raise ValueError(tr)


def decompose(Vb, reps, classes):
    """Multiplicities of A5 irreps on the span of columns Vb, from characters of the restricted signed permutations."""
    sizes = [1, 15, 20, 12, 12]
    chi = np.zeros(5); cnt = np.zeros(5)
    for P, c in zip(reps, classes):
        chi[c] += np.trace(Vb.T @ P @ Vb); cnt[c] += 1
    chi /= cnt
    out = {}
    for name, ch in CHARS.items():
        m = sum(sizes[k] * chi[k] * ch[k] for k in range(5)) / 60
        assert abs(m - round(m)) < 1e-8, (name, m)
        if round(m):
            out[name] = int(round(m))
    return out


def main() -> int:
    pts, edges, faces, tets = thirteen_cell()
    V, E, F, T = 13, len(edges), len(faces), len(tets)
    d0 = np.zeros((E, V))
    for k, (i, j) in enumerate(edges):
        d0[k, i], d0[k, j] = -1, 1
    d1 = boundary(faces, edges)
    d2 = boundary(tets, faces)
    out = {"V_E_F_T": [V, E, F, T], "euler": V - E + F - T}
    assert (E, F, T) == (42, 50, 20) and out["euler"] == 1
    assert np.allclose(d1 @ d0, 0) and np.allclose(d2 @ d1, 0)

    rots = a5_rotations(pts)
    shell = pts[1:]
    rot_mats = [np.linalg.lstsq(shell, shell[[x - 1 for x in p[1:]]], rcond=None)[0].T for p in rots]
    classes = [rot_class(R) for R in rot_mats]
    Pe = [signed_perm(edges, p) for p in rots]
    for P, perm in zip(Pe, rots):
        Pv = np.zeros((V, V))
        for v in range(V):
            Pv[perm[v], v] = 1
        assert np.allclose(P @ d0, d0 @ Pv), "signed edge action not equivariant with d0"
    Ms = d1.T @ d1
    U, s, _ = np.linalg.svd(d0, full_matrices=False)
    gauge = U[:, :int(np.sum(s > 1e-9))]
    assert gauge.shape[1] == 12
    phys = np.linalg.svd(np.eye(E) - gauge @ gauge.T)[0][:, :E - 12]
    out["physical_spatial_modes"] = phys.shape[1]
    out["physical_A5_content"] = decompose(phys, Pe, classes)
    w, Vv = np.linalg.eigh(phys.T @ Ms @ phys)
    assert w.min() > 1e-9, "13-cell has a harmonic spatial link mode"
    levels = []
    for lv in sorted(set(np.round(w, 9))):
        B = phys @ Vv[:, np.abs(w - lv) < 1e-7]
        levels.append({"mu": float(np.mean(w[np.abs(w - lv) < 1e-7])), "dim": int(B.shape[1]), "A5": decompose(B, Pe, classes)})
    out["transverse_levels"] = levels
    singlets = [l for l in levels if "1" in l["A5"]]
    out["A5_singlet_transverse_modes"] = [l["mu"] for l in singlets]
    assert out["physical_A5_content"] == {"3": 2, "3'": 2, "4": 2, "5": 2}, out["physical_A5_content"]
    assert not singlets
    # the only A5-invariant 1-form is the outward spoke field, which is pure gauge (d0 of the radial function)
    inv = np.mean(Pe, axis=0)
    wi, Vi = np.linalg.eigh(0.5 * (inv + inv.T))
    invariant = Vi[:, wi > 0.5]
    radial = np.zeros(V); radial[1:] = 1.0
    out["invariant_one_forms"] = int(invariant.shape[1])
    assert invariant.shape[1] == 1 and np.allclose(abs(invariant[:, 0] @ (d0 @ radial)) / np.linalg.norm(d0 @ radial), 1)

    # graph Laplacian of the 13-cell (longitudinal sector) and its A5 types
    lamL, VL = np.linalg.eigh(d0.T @ d0)
    Pv = []
    for perm in rots:
        M_ = np.zeros((V, V))
        for v in range(V):
            M_[perm[v], v] = 1
        Pv.append(M_)
    long_levels = []
    for lv in sorted(set(np.round(lamL, 9))):
        if lv < 1e-9:
            continue
        B = VL[:, np.abs(lamL - lv) < 1e-7]
        long_levels.append({"lambda_L": float(np.mean(lamL[np.abs(lamL - lv) < 1e-7])), "dim": int(B.shape[1]), "A5": decompose(B, Pv, classes)})
    out["longitudinal_levels"] = long_levels
    sing_L = [l for l in long_levels if "1" in l["A5"]]
    assert len(sing_L) == 1 and abs(sing_L[0]["lambda_L"] - 13) < 1e-9

    # ---- 4D product: build the full operator and compare spectra
    nV, nE = V * NCLOCK, (E + V) * NCLOCK
    D0 = np.zeros((nE, nV))
    def vid(v, t): return v * NCLOCK + t
    links = []
    for t in range(NCLOCK):
        for k, (i, j) in enumerate(edges):
            links.append(("s", k, t)); r = len(links) - 1
            D0[r, vid(i, t)], D0[r, vid(j, t)] = -1, 1
        for v in range(V):
            links.append(("t", v, t)); r = len(links) - 1
            D0[r, vid(v, t)], D0[r, vid(v, (t + 1) % NCLOCK)] = -1, 1
    lid = {L: k for k, L in enumerate(links)}
    plaq = []
    for t in range(NCLOCK):
        for f in range(F):
            row = np.zeros(nE)
            for k in range(E):
                if d1[f, k]:
                    row[lid[("s", k, t)]] += d1[f, k]
            plaq.append(row)
        for k, (i, j) in enumerate(edges):        # spatial edge x clock edge
            row = np.zeros(nE)
            row[lid[("s", k, t)]] += 1; row[lid[("t", j, t)]] += 1
            row[lid[("s", k, (t + 1) % NCLOCK)]] -= 1; row[lid[("t", i, t)]] -= 1
            plaq.append(row)
    D1 = np.array(plaq)
    assert D1.shape == (92 * NCLOCK, nE) and np.allclose(D1 @ D0, 0)
    M4 = D1.T @ D1
    ev4 = np.sort(np.linalg.eigvalsh(M4))
    rank_d0 = np.linalg.matrix_rank(D0)
    n_zero = int(np.sum(ev4 < 1e-8))
    out["4D"] = {"links": nE, "rank_d0": int(rank_d0), "zero_modes": n_zero, "physical": nE - int(rank_d0)}
    assert rank_d0 == nV - 1 and n_zero == rank_d0 + 1          # gauge directions + the clock holonomy
    pred = []
    for n in range(NCLOCK):
        om = 4 * np.sin(np.pi * n / NCLOCK) ** 2
        pred += [l["mu"] + om for l in levels for _ in range(l["dim"])]
        pred += [x + om for x in lamL if x > 1e-9]
    pred = np.sort(np.array(pred))
    nonzero = ev4[n_zero:]
    out["4D"]["spectrum_matches_decomposition"] = bool(len(pred) == len(nonzero) and np.allclose(pred, nonzero, atol=1e-8))
    assert out["4D"]["spectrum_matches_decomposition"]
    out["4D"]["softest_nonzero"] = float(nonzero[0])
    out["4D"]["softest_is"] = ("transverse static" if abs(nonzero[0] - levels[0]["mu"]) < 1e-8 else "other")

    print(json.dumps(out, indent=2))
    (HERE / "Q25_4D_A5_PHOTON_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: 13-cell transverse links carry 2(3+3'+4+5), no A5 singlet (the invariant spoke field is pure gauge); "
          "in 4D the only A5-singlet photon modes are electric: the centre-shell radial mode (lambda_L = 13, every n != 0) "
          f"and the clock holonomy (n = 0); physical modes {out['4D']['physical']}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
