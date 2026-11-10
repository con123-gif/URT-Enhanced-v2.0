#!/usr/bin/env python3
"""Coupled cycle 45: is archived G13 a sub-block, quotient or restriction?"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle45_g13_coupled_relation")
REPO = ROOT / "repo"
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops, graph_laplacian_h13  # noqa: E402

PRED_SHA = "b1325ab5cf30356321646bd54f854050a916c4b5751a7d15fd736c576f5111cf"
ATOL = 1e-8


def sanitize(o):
    if isinstance(o, dict):
        return {k: sanitize(v) for k, v in o.items()}
    if isinstance(o, (list, tuple)):
        return [sanitize(v) for v in o]
    if isinstance(o, (np.bool_,)):
        return bool(o)
    if isinstance(o, (np.floating, np.integer)):
        return o.item()
    if isinstance(o, float) and not np.isfinite(o):
        return None
    if isinstance(o, np.ndarray):
        return sanitize(o.tolist())
    return o


def spectrum_of(L):
    ev = eigvalsh(0.5 * (L + L.T))
    ev[np.abs(ev) < 1e-10] = 0.0
    return ev


def rounded_multiset(ev, nd=8):
    vals = np.round(ev, nd)
    # group
    uniq, counts = np.unique(vals, return_counts=True)
    return list(zip(uniq.tolist(), counts.tolist()))


def is_submultiset(small, big, atol=1e-6):
    """Each eigenvalue of small is found in big, respecting multiplicity."""
    b = np.sort(np.asarray(big, dtype=float).copy())
    used = np.zeros(b.size, dtype=bool)
    missing = []
    for x in np.sort(np.asarray(small, dtype=float)):
        diffs = np.abs(b - x)
        diffs[used] = np.inf
        j = int(np.argmin(diffs))
        if diffs[j] > atol:
            missing.append(float(x))
        else:
            used[j] = True
    return len(missing) == 0, missing


def rebuild_g13():
    N, V = 13, 12
    offsets = (1, 5, 7, 11)
    A = np.zeros((N, N))
    A[0, 1:] = 1.0
    A[1:, 0] = 1.0
    cayley_edges = set()
    for i in range(1, N):
        for k in offsets:
            j = (i - 1 + k) % V + 1
            A[i, j] = 1.0
            A[j, i] = 1.0
            if i != j:
                cayley_edges.add(tuple(sorted((i - 1, j - 1))))  # surface labels 0..11
    L = np.diag(A.sum(axis=1)) - A
    return L, A, sorted(cayley_edges)


def archive_g13():
    sys.path.insert(0, str(REPO))
    from newtons_cathedral.graph import laplacian, spectrum, adjacency

    return laplacian(), adjacency(), spectrum()


def platonic_spectra_and_maxdeg(ops):
    geom = ops["geom"]
    # five solids
    names = []
    blocks = []
    maxdeg = {}
    for key in geom:
        g = geom[key]
        if not isinstance(g, dict):
            continue
        if "points" not in g or "faces" not in g:
            continue
        pts = np.asarray(g["points"], dtype=float)
        faces = [tuple(int(x) for x in f) for f in g["faces"]]
        n = len(pts)
        edges = set()
        for f in faces:
            m = len(f)
            for a in range(m):
                edges.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
        L = np.zeros((n, n))
        for i, j in edges:
            L[i, i] += 1.0
            L[j, j] += 1.0
            L[i, j] -= 1.0
            L[j, i] -= 1.0
        deg = np.diag(L)
        names.append(key)
        blocks.append(L)
        maxdeg[key] = float(deg.max())
    return names, blocks, maxdeg


def hypercube_spectrum():
    # Q6 eigenvalues 2k with multiplicity C(6,k)
    from math import comb

    ev = []
    for k in range(7):
        ev.extend([2.0 * k] * comb(6, k))
    return np.array(ev, dtype=float)


def dodeca_laplacian(ops):
    g = ops["geom"]["dodecahedron"]
    pts = np.asarray(g["points"], dtype=float)
    faces = [tuple(int(x) for x in f) for f in g["faces"]]
    n = len(pts)
    edges = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            edges.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    L = np.zeros((n, n))
    for i, j in edges:
        L[i, i] += 1.0
        L[j, j] += 1.0
        L[i, j] -= 1.0
        L[j, i] -= 1.0
    return L, sorted(edges)


def ico_edges_and_L(ops):
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    edges = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            edges.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(edges)
    L = np.zeros((12, 12))
    adj = np.zeros((12, 12), dtype=int)
    for i, j in edges:
        L[i, i] += 1.0
        L[j, j] += 1.0
        L[i, j] -= 1.0
        L[j, i] -= 1.0
        adj[i, j] = adj[j, i] = 1
    return edges, L, adj


def perfect_matchings(adj):
    n = adj.shape[0]
    edges = [(i, j) for i in range(n) for j in range(i + 1, n) if adj[i, j]]
    found = []

    def rec(used, start, acc):
        if used == (1 << n) - 1:
            found.append(list(acc))
            return
        # first unused vertex
        v = 0
        while used & (1 << v):
            v += 1
        for u in range(v + 1, n):
            if (used & (1 << u)) == 0 and adj[v, u]:
                acc.append((v, u))
                rec(used | (1 << v) | (1 << u), v, acc)
                acc.pop()

    rec(0, 0, [])
    return found


def is_cayley_circulant(adj4):
    """Is this 4-regular 12-graph isomorphic to Cay(Z12,{1,5,7,11})?"""
    n = 12
    gens = {1, 5, 7, 11}
    # find a Hamiltonian cycle such that the chord steps of +5 are all present
    # Try every start and every Hamilton path via backtracking (12 is small)
    neigh = [[j for j in range(n) if adj4[i, j] and j != i] for i in range(n)]
    if any(len(nb) != 4 for nb in neigh):
        return False

    def ham_from(start):
        found = []

        def rec(path, used):
            if len(path) == n:
                if path[0] in neigh[path[-1]]:
                    found.append(list(path))
                return
            last = path[-1]
            for w in neigh[last]:
                if (used & (1 << w)) == 0:
                    rec(path + [w], used | (1 << w))
                    if found:
                        return

        rec([start], 1 << start)
        return found

    # We only need one cyclic labelling. Try starts 0..11 until one works.
    for s in range(n):
        cycles = ham_from(s)
        for cyc in cycles:
            # check steps +1 (the cycle itself) already edges; check +5
            pos = {v: i for i, v in enumerate(cyc)}
            ok = True
            for i, v in enumerate(cyc):
                w = cyc[(i + 5) % n]
                if not adj4[v, w]:
                    ok = False
                    break
            if ok:
                # also +7 and +11 are inverses of +5 and +1, automatic if undirected
                return True
    return False


def schur_hub(L):
    # L = [a, b^T; b, C] with a scalar, b length 12, C 12x12
    a = L[0, 0]
    b = L[1:, 0]
    C = L[1:, 1:]
    if abs(a) < 1e-14:
        return None
    return C - np.outer(b, b) / a


def main():
    L_g13, A_g13, cayley_edges = rebuild_g13()
    L_arch, A_arch, ev_arch = archive_g13()
    rebuild_agrees = bool(
        np.allclose(L_g13, L_arch, atol=1e-12) and np.allclose(A_g13, A_arch, atol=1e-12)
    )
    ev_g13 = spectrum_of(L_g13)
    ev_arch_s = np.sort(np.asarray(ev_arch, dtype=float))
    spectrum_agrees = bool(np.allclose(ev_g13, ev_arch_s, atol=1e-10))
    expected = np.array([0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13], dtype=float)
    spectrum_expected = bool(np.allclose(ev_g13, expected, atol=1e-8))

    ops = load_ops()
    ico_edges, K0, adj_ico = ico_edges_and_L(ops)
    L_h13 = graph_laplacian_h13(12, ico_edges)
    ev_h13 = spectrum_of(L_h13)
    ev_k0 = spectrum_of(K0)

    L_dod, _dod_edges = dodeca_laplacian(ops)
    L_joint = np.zeros((32, 32))
    L_joint[:12, :12] = K0
    L_joint[12:, 12:] = L_dod
    ev_joint = spectrum_of(L_joint)

    ev_bdg = np.concatenate([ev_k0, -ev_k0])
    ev_bdg_pos = ev_k0.copy()

    names, blocks, maxdeg = platonic_spectra_and_maxdeg(ops)
    # five-solid 0-form as direct sum
    if blocks:
        dims = [B.shape[0] for B in blocks]
        L_five = np.zeros((sum(dims), sum(dims)))
        o = 0
        for B in blocks:
            n = B.shape[0]
            L_five[o : o + n, o : o + n] = B
            o += n
        ev_five = spectrum_of(L_five)
        five_maxdeg = max(maxdeg.values()) if maxdeg else 0.0
        five_dim = int(sum(dims))
    else:
        ev_five = np.array([])
        five_maxdeg = 0.0
        five_dim = 0

    ev_h64 = hypercube_spectrum()

    operators = {
        "H13_geometric": ev_h13,
        "K0_ico": ev_k0,
        "joint_32": ev_joint,
        "BdG_subcritical_pm": ev_bdg,
        "BdG_subcritical_positive": ev_bdg_pos,
        "five_solid_0form": ev_five,
        "H64_hypercube": ev_h64,
    }

    # R1
    r1_similar = bool(np.allclose(np.sort(ev_g13), np.sort(ev_h13), atol=1e-8))
    # also try all hub-fixed surface perms? unnecessary if spectra differ
    r1_equal_raw = bool(np.allclose(L_g13, L_h13, atol=1e-10))

    # R2
    r2 = {}
    for name, ev in operators.items():
        ok, missing = is_submultiset(ev_g13, ev)
        r2[name] = {"spectrum_contained": ok, "missing": missing}

    # R3: Cayley as spanning subgraph of icosahedron
    matchings = perfect_matchings(adj_ico)
    r3_hits = 0
    for M in matchings:
        adj4 = adj_ico.copy()
        for i, j in M:
            adj4[i, j] = adj4[j, i] = 0
        if is_cayley_circulant(adj4):
            r3_hits += 1
    # also a direct edge-subset test after some labelling would be implied by a hit
    r3_holds = r3_hits > 0

    # degrees
    deg_g13 = A_g13.sum(axis=1)
    deg_h13 = np.diag(L_h13)  # degree = diagonal of Laplacian
    deg_k0 = np.diag(K0)
    deg_joint = np.diag(L_joint)

    # R4
    r4 = {
        "H13_has_deg12_hub": bool(np.max(deg_h13) + 1e-12 >= 12),
        "K0_max_degree": float(deg_k0.max()),
        "joint32_max_degree": float(deg_joint.max()),
        "five_solid_max_degree": float(five_maxdeg),
        "H64_degree": 6,
        "reduces_to_R1": True,
        "other_derived_deg12_vertex": False,
    }
    # confirm no degree-12 in joint or five-solid
    if deg_joint.max() >= 12 - 1e-12:
        r4["other_derived_deg12_vertex"] = True
        r4["reduces_to_R1"] = False
    if five_maxdeg >= 12 - 1e-12:
        r4["other_derived_deg12_vertex"] = True
        r4["reduces_to_R1"] = False

    # R5 Schur
    S_h13 = schur_hub(L_h13)
    S_g13 = schur_hub(L_g13)
    ev_Sh = spectrum_of(S_h13)
    ev_Sg = spectrum_of(S_g13)
    r5_equal = bool(np.allclose(np.sort(ev_Sh), np.sort(ev_Sg), atol=1e-8))

    # R6 divisibility
    dims = {
        "K0_ico": 12,
        "H13_geometric": 13,
        "joint_32": 32,
        "five_solid_0form": five_dim,
        "H64_hypercube": 64,
        "BdG_subcritical_pm": 24,
        "BdG_subcritical_positive": 12,
    }
    r6 = {}
    for name, d in dims.items():
        r6[name] = {
            "dim": d,
            "equal_cell_13_divides": (d % 13 == 0),
            "singletons_only_if_dim13": (d == 13),
        }

    any_r2 = any(v["spectrum_contained"] for v in r2.values())
    any_relation = bool(r1_similar or any_r2 or r3_holds or r5_equal or r4["other_derived_deg12_vertex"])

    out = {
        "pred_sha": PRED_SHA,
        "rebuild_agrees_with_graph_py": rebuild_agrees,
        "spectrum_agrees_with_graph_py": spectrum_agrees,
        "spectrum_expected": spectrum_expected,
        "ev_G13": ev_g13.tolist(),
        "ev_H13": ev_h13.tolist(),
        "ev_K0": ev_k0.tolist(),
        "n_cayley_edges": len(cayley_edges),
        "n_ico_edges": len(ico_edges),
        "deg_G13": deg_g13.tolist(),
        "R1_similar_or_equal": r1_similar,
        "R1_equal_raw_labelling": r1_equal_raw,
        "R2_reducing_subspace": r2,
        "R2_any": any_r2,
        "R3_n_perfect_matchings": len(matchings),
        "R3_cayley_is_ico_minus_1factor": r3_holds,
        "R3_n_hits": r3_hits,
        "R4": r4,
        "R5_schur_spectra_equal": r5_equal,
        "R5_ev_schur_H13": ev_Sh.tolist(),
        "R5_ev_schur_G13": ev_Sg.tolist(),
        "R6_equal_cell_quotients": r6,
        "any_named_relation": any_relation,
        "H1_R1_fails": (not r1_similar),
        "H2_R2_fails": (not any_r2),
        "H3_R3_computed": True,
        "H4_R4_R6_reduce_or_fail": bool(
            r4["reduces_to_R1"] and not any(v["equal_cell_13_divides"] and v["dim"] != 13 for v in r6.values())
        ),
        "classification_no_relation": (not any_relation),
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2, sort_keys=True))
    print(json.dumps(sanitize({
        "rebuild_ok": rebuild_agrees and spectrum_agrees and spectrum_expected,
        "R1": r1_similar,
        "R2_any": any_r2,
        "R2_missing_examples": {k: v["missing"][:6] for k, v in r2.items()},
        "R3_matchings": len(matchings),
        "R3": r3_holds,
        "R4_reduces": r4["reduces_to_R1"],
        "R5": r5_equal,
        "R5_ev_H13": ev_Sh.tolist(),
        "R5_ev_G13": ev_Sg.tolist(),
        "any_relation": any_relation,
        "maxdeg": {"k0": float(deg_k0.max()), "joint": float(deg_joint.max()), "five": five_maxdeg, "h13": float(deg_h13.max())},
        "solid_names": names,
        "five_dim": five_dim,
    }), indent=2))


if __name__ == "__main__":
    main()
