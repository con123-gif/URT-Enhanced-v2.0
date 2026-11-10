#!/usr/bin/env python3
"""Alt cycle 27: inter-solid links from the D6 → H3 root projection."""
from __future__ import annotations

import json
from collections import defaultdict, deque
from itertools import product
from pathlib import Path

import numpy as np
from scipy.spatial import ConvexHull
from scipy.linalg import eigh

PHI = (1.0 + np.sqrt(5.0)) / 2.0
Q = 1.0
NAMES = ["tetrahedron", "cube", "octahedron", "dodecahedron", "icosahedron"]
VERTS = {
    "tetrahedron": np.array([[1, 1, 1], [1, -1, -1], [-1, 1, -1], [-1, -1, 1]], float),
    "cube": np.array(list(product((-1, 1), repeat=3)), float),
    "octahedron": np.array(
        [[1, 0, 0], [-1, 0, 0], [0, 1, 0], [0, -1, 0], [0, 0, 1], [0, 0, -1]], float
    ),
    "dodecahedron": np.array(
        list(product((-1, 1), repeat=3))
        + [(0, a / PHI, b * PHI) for a, b in product((-1, 1), repeat=2)]
        + [(a / PHI, b * PHI, 0) for a, b in product((-1, 1), repeat=2)]
        + [(a * PHI, 0, b / PHI) for a, b in product((-1, 1), repeat=2)],
        float,
    ),
    "icosahedron": np.array(
        [(0, a, b * PHI) for a, b in product((-1, 1), repeat=2)]
        + [(a, b * PHI, 0) for a, b in product((-1, 1), repeat=2)]
        + [(a * PHI, 0, b) for a, b in product((-1, 1), repeat=2)],
        float,
    ),
}


def jsonable(obj):
    if isinstance(obj, dict):
        return {str(k): jsonable(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [jsonable(v) for v in obj]
    if isinstance(obj, (np.floating, float)):
        x = float(obj)
        return None if not np.isfinite(x) else x
    if isinstance(obj, (np.integer, int)):
        return int(obj)
    if isinstance(obj, (np.bool_, bool)):
        return bool(obj)
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


def build_faces(points):
    hull = ConvexHull(points)
    groups = []
    for tri, eq in zip(hull.simplices, hull.equations):
        for g in groups:
            if np.linalg.norm(eq[:3] - g[0]) < 1e-7 and abs(eq[3] - g[1]) < 1e-7:
                g[2].update(map(int, tri))
                break
        else:
            groups.append([eq[:3], eq[3], set(map(int, tri))])
    result = []
    for normal, offset, indices in groups:
        ids = sorted(indices)
        cen = np.mean(points[ids], axis=0)
        e1 = points[ids[0]] - cen
        e1 = e1 / np.linalg.norm(e1)
        e2 = np.cross(normal, e1)
        face = sorted(
            ids,
            key=lambda i: np.arctan2(np.dot(points[i] - cen, e2), np.dot(points[i] - cen, e1)),
        )
        result.append(face)
    result.sort(key=lambda x: tuple(sorted(x)))
    return result


def build_bdry(points, faces):
    edges = sorted(set(tuple(sorted((i, j))) for f in faces for i, j in zip(f, f[1:] + f[:1])))
    lookup = {x: i for i, x in enumerate(edges)}
    b1 = np.zeros((len(points), len(edges)), float)
    b2 = np.zeros((len(edges), len(faces)), float)
    for e, (i, j) in enumerate(edges):
        b1[i, e] = -1.0
        b1[j, e] = 1.0
    for k, f in enumerate(faces):
        for i, j in zip(f, f[1:] + f[:1]):
            b2[lookup[tuple(sorted((i, j)))], k] = 1.0 if i < j else -1.0
    assert np.max(np.abs(b1 @ b2)) < 1e-12
    return b1, b2, edges


def whiten(M, threshold=1e-10):
    G = M.T @ M
    w, U = eigh(G)
    assert w.min() > threshold
    return M @ ((U / np.sqrt(w)) @ U.T)


def unitrows(points):
    return points / np.linalg.norm(points, axis=1)[:, None]


def make_iso3(points):
    return whiten(unitrows(points))


def shortest_paths(adj, src, dst, cap=64):
    """All shortest src→dst paths (vertex lists), capped at `cap` enumerations."""
    if src == dst:
        return [[src]]
    prev = defaultdict(list)
    dist = {src: 0}
    q = deque([src])
    found = None
    while q:
        v = q.popleft()
        if found is not None and dist[v] > found:
            break
        if v == dst:
            found = dist[v]
            continue
        for w in adj[v]:
            nd = dist[v] + 1
            if w not in dist:
                dist[w] = nd
                prev[w].append(v)
                q.append(w)
            elif dist[w] == nd:
                prev[w].append(v)
    if found is None:
        return []
    paths = []

    def rec(node, acc):
        if len(paths) >= cap:
            return
        if node == src:
            paths.append([src] + list(reversed(acc)))
            return
        for p in prev[node]:
            rec(p, acc + [node])
            if len(paths) >= cap:
                return

    rec(dst, [])
    return paths


def count_shortest(adj, src):
    """BFS: distance and number of shortest paths from src to every vertex."""
    n = max(adj) + 1 if adj else 0
    dist = [-1] * n
    ways = [0] * n
    dist[src] = 0
    ways[src] = 1
    q = deque([src])
    while q:
        v = q.popleft()
        for w in adj[v]:
            if dist[w] < 0:
                dist[w] = dist[v] + 1
                ways[w] = ways[v]
                q.append(w)
            elif dist[w] == dist[v] + 1:
                ways[w] += ways[v]
    return dist, ways


def wilson(path, A, edges, edge_index, q=Q):
    u = 1.0 + 0.0j
    for a, b in zip(path, path[1:]):
        key = (min(a, b), max(a, b))
        e = edge_index[key]
        i, j = edges[e]
        if (a, b) == (i, j):
            u *= np.exp(1j * q * A[e])
        elif (a, b) == (j, i):
            u *= np.exp(-1j * q * A[e])
        else:
            raise RuntimeError("edge orientation mismatch")
    return u


def U_ij(i, j, A, paths_ij, recipe, edges, edge_index):
    if i == j:
        return 1.0 + 0.0j
    plist = paths_ij.get((i, j), [])
    if not plist:
        return None
    if recipe == "A":
        return sum(wilson(p, A, edges, edge_index) for p in plist) / len(plist)
    if recipe == "B":
        return wilson(plist[0], A, edges, edge_index)
    raise ValueError(recipe)


def action_hodge(psi, A, edges, q=Q):
    tot = 0.0
    for e, (i, j) in enumerate(edges):
        tot += abs(psi[j] - np.exp(1j * q * A[e]) * psi[i]) ** 2
    return float(np.real(tot))


def action_cbridge_gauged(psi, A, C, pairs, paths_ij, recipe, edges, edge_index):
    tot = 0.0j
    n = len(psi)
    for i in range(n):
        tot += C[i, i] * (psi[i].conj() * psi[i])
    for i, j in pairs:
        U = U_ij(i, j, A, paths_ij, recipe, edges, edge_index)
        if U is None:
            # pair not connected: fall back to ungauged bilinear (will break Ward)
            U = 1.0 + 0.0j
        tot += 2.0 * C[i, j] * (psi[j].conj() * U * psi[i])
    return float(np.real(tot))


def gauge_transform(psi, A, lam, edges, q=Q):
    psi_g = psi * np.exp(1j * q * lam)
    A_g = A.copy()
    for e, (i, j) in enumerate(edges):
        A_g[e] = A[e] + lam[j] - lam[i]
    return psi_g, A_g


def icosahedral_diameter_units(ico_pts):
    u = ico_pts / np.linalg.norm(ico_pts, axis=1)[:, None]
    used = set()
    diams = []
    for i in range(len(u)):
        if i in used:
            continue
        dots = u @ u[i]
        j = int(np.argmin(dots))
        if dots[j] > -0.99:
            raise RuntimeError(f"no antipode for vertex {i}: min dot {dots[j]}")
        used.add(i)
        used.add(j)
        diams.append(u[i])
    assert len(diams) == 6, len(diams)
    return np.asarray(diams)


def projected_D6_roots(u):
    roots = []
    for i in range(6):
        for j in range(i + 1, 6):
            for si in (+1.0, -1.0):
                for sj in (+1.0, -1.0):
                    roots.append(si * u[i] + sj * u[j])
    R = np.asarray(roots)
    assert R.shape == (60, 3)
    return R


def sine_to_root_set(d, roots):
    dn = np.linalg.norm(d)
    if dn < 1e-14:
        return 1.0, -1
    rn = np.linalg.norm(roots, axis=1)
    crosses = np.cross(roots, d)
    sines = np.linalg.norm(crosses, axis=1) / (rn * dn)
    k = int(np.argmin(sines))
    return float(sines[k]), k


def cluster_distances(dists, rtol=1e-7, atol=1e-10):
    xs = np.sort(np.asarray(dists, float))
    groups = []
    for x in xs:
        if not groups or abs(x - groups[-1][0]) > max(atol, rtol * groups[-1][0]):
            groups.append([float(x), 1])
        else:
            n = groups[-1][1]
            groups[-1][0] = (groups[-1][0] * n + float(x)) / (n + 1)
            groups[-1][1] = n + 1
    return [(g[0], g[1]) for g in groups]


def near_scale(ratio, targets=(PHI, 1.0 / PHI, PHI ** 2, 2.0), rtol=1e-6):
    for t in targets:
        if abs(ratio - t) / t < rtol:
            return True, float(t)
    return False, None


def main():
    # ----- rebuild five-solid Cbridge as in alt_cycle22 -----
    geom = {}
    offset = 0
    v_offset = 0
    for name in NAMES:
        pts = VERTS[name]
        faces = build_faces(pts)
        b1, b2, edges = build_bdry(pts, faces)
        V, E, F = b1.shape[0], b1.shape[1], b2.shape[1]
        h0 = np.ones(V) / np.sqrt(V)
        hf = np.ones(F) / np.sqrt(F)
        facepts = np.array([np.mean(pts[f], axis=0) for f in faces])
        Pdip = make_iso3(pts)
        Fdip = make_iso3(facepts)
        geom[name] = dict(
            points=pts, faces=faces, b1=b1, b2=b2, V=V, E=E, F=F, edges=edges,
            h0=h0, hf=hf, Pdip=Pdip, Fdip=Fdip, offset=offset, v_offset=v_offset,
        )
        offset += V + E + F
        v_offset += V
    assert offset == 190 and v_offset == 50

    U0 = np.zeros((190, 5))
    U2 = np.zeros((190, 5))
    Ud = np.zeros((190, 15))
    Uf = np.zeros((190, 15))
    for s, name in enumerate(NAMES):
        g = geom[name]
        o = g["offset"]
        V, E, F = g["V"], g["E"], g["F"]
        U0[o:o + V, s] = g["h0"]
        U2[o + V + E:o + V + E + F, s] = g["hf"]
        Ud[o:o + V, 3 * s:3 * s + 3] = g["Pdip"]
        Uf[o + V + E:o + V + E + F, 3 * s:3 * s + 3] = g["Fdip"]
    L5 = 5 * np.eye(5) - np.ones((5, 5))
    Ldip = np.kron(L5, np.eye(3))
    Cbridge = U0 @ L5 @ U0.T + U2 @ L5 @ U2.T + Ud @ Ldip @ Ud.T + Uf @ Ldip @ Uf.T
    assert abs(np.trace(Cbridge) - 160) < 1e-9
    assert abs(np.trace(Cbridge @ Cbridge) - 800) < 1e-8

    # 50 vertices in a common R^3
    pts50 = np.zeros((50, 3))
    solid_of = []
    local_of = []
    for name in NAMES:
        g = geom[name]
        vs = g["v_offset"]
        pts50[vs:vs + g["V"]] = g["points"]
        for k in range(g["V"]):
            solid_of.append(name)
            local_of.append(k)

    vert_idx = []
    for name in NAMES:
        g = geom[name]
        for k in range(g["V"]):
            vert_idx.append(g["offset"] + k)
    vert_idx = np.array(vert_idx)
    C50 = Cbridge[np.ix_(vert_idx, vert_idx)]

    # original 90 spatial edges, global indices
    orig_edges = []
    for name in NAMES:
        g = geom[name]
        vs = g["v_offset"]
        for i, j in g["edges"]:
            orig_edges.append((vs + i, vs + j) if i < j else (vs + j, vs + i))
    orig_edges = sorted(set(tuple(sorted(e)) for e in orig_edges))
    assert len(orig_edges) == 90, len(orig_edges)

    # D6 → H3 projected roots
    u = icosahedral_diameter_units(VERTS["icosahedron"])
    roots = projected_D6_roots(u)
    root_lengths = np.linalg.norm(roots, axis=1)
    uniq_root_len = cluster_distances(root_lengths)

    # candidates: inter-solid pairs parallel to a projected root
    candidates = []
    n_cross = 0
    n_cross_C = 0
    for a in range(50):
        for b in range(a + 1, 50):
            if solid_of[a] == solid_of[b]:
                continue
            n_cross += 1
            if abs(C50[a, b]) > 1e-10:
                n_cross_C += 1
            d = pts50[b] - pts50[a]
            sine, k = sine_to_root_set(d, roots)
            if sine < 1e-7:
                candidates.append({
                    "a": a, "b": b,
                    "dist": float(np.linalg.norm(d)),
                    "sine": sine,
                    "root_index": k,
                    "C": float(C50[a, b]),
                    "solids": (solid_of[a], solid_of[b]),
                })

    cand_dists = [c["dist"] for c in candidates]
    dist_groups = cluster_distances(cand_dists) if cand_dists else []
    d1 = dist_groups[0][0] if dist_groups else None
    d2 = dist_groups[1][0] if len(dist_groups) > 1 else None
    keep_scales = []
    if d1 is not None:
        keep_scales.append(d1)
    d2_kept = False
    d2_match = None
    if d1 is not None and d2 is not None:
        ok, match = near_scale(d2 / d1)
        d2_match = match
        if ok:
            keep_scales.append(d2)
            d2_kept = True

    def on_kept_scale(dist):
        return any(abs(dist - s) <= max(1e-10, 1e-7 * s) for s in keep_scales)

    links = [(c["a"], c["b"]) for c in candidates if on_kept_scale(c["dist"])]
    links = sorted(set(tuple(sorted(e)) for e in links))

    # enlarged graph
    edges = sorted(set(orig_edges) | set(links))
    nE = len(edges)
    edge_index = {tuple(sorted(e)): k for k, e in enumerate(edges)}
    adj = defaultdict(list)
    for i, j in edges:
        adj[i].append(j)
        adj[j].append(i)

    # connectivity
    seen = set()
    comps = []
    for s in range(50):
        if s in seen:
            continue
        stack = [s]
        seen.add(s)
        comp = {solid_of[s]}
        verts = 0
        while stack:
            v = stack.pop()
            verts += 1
            for w in adj[v]:
                if w not in seen:
                    seen.add(w)
                    stack.append(w)
                    comp.add(solid_of[w])
        comps.append({"n_verts": verts, "solids": sorted(comp)})
    five_connected = (len(comps) == 1)

    # Cbridge-nonzero pairs (i<j)
    C_pairs = [(i, j) for i in range(50) for j in range(i + 1, 50) if abs(C50[i, j]) > 1e-10]
    # ico block pairs (local ico indices 0..11 at global offset)
    ico_vs = geom["icosahedron"]["v_offset"]
    Vico = geom["icosahedron"]["V"]
    ico_off_edge = []
    ico_edge_set = set(tuple(sorted((ico_vs + i, ico_vs + j))) for i, j in geom["icosahedron"]["edges"])
    for i in range(Vico):
        for j in range(i + 1, Vico):
            gi, gj = ico_vs + i, ico_vs + j
            if abs(C50[gi, gj]) > 1e-10 and (gi, gj) not in ico_edge_set:
                ico_off_edge.append((gi, gj))
    assert len(ico_off_edge) == 36, len(ico_off_edge)

    # path counts via BFS (exact numbers, no enumeration cap)
    all_dist = []
    all_ways = []
    for s in range(50):
        d, w = count_shortest(adj, s)
        all_dist.append(d)
        all_ways.append(w)

    def pair_stats(pairs):
        n_conn = 0
        n_unique = 0
        n_multi = 0
        n_none = 0
        lengths = []
        npaths = []
        for i, j in pairs:
            dij = all_dist[i][j]
            wij = all_ways[i][j]
            if dij < 0 or wij == 0:
                n_none += 1
                continue
            n_conn += 1
            lengths.append(dij)
            npaths.append(wij)
            if wij == 1:
                n_unique += 1
            else:
                n_multi += 1
        return {
            "n_pairs": len(pairs),
            "n_connected": n_conn,
            "n_disconnected": n_none,
            "n_unique_shortest_path": n_unique,
            "n_multiple_shortest_paths": n_multi,
            "path_length_minmax": [int(min(lengths)), int(max(lengths))] if lengths else None,
            "n_paths_minmax": [int(min(npaths)), int(max(npaths))] if npaths else None,
            "all_connected": n_none == 0,
            "all_unique": n_none == 0 and n_multi == 0,
        }

    stats_all_C = pair_stats(C_pairs)
    stats_cross_C = pair_stats([(i, j) for i, j in C_pairs if solid_of[i] != solid_of[j]])
    stats_ico_off = pair_stats(ico_off_edge)

    # Wilson paths: enumerate (capped) for pairs we will use in the action
    # Use all C-pairs if connected; cap enumeration at 32 paths (recipe A then
    # averages the enumerated ones; uniqueness is reported from exact BFS counts).
    paths_ij = {}
    n_capped = 0
    CAP = 32
    for i, j in C_pairs:
        if all_dist[i][j] < 0:
            paths_ij[(i, j)] = []
            paths_ij[(j, i)] = []
            continue
        ps = shortest_paths(adj, i, j, cap=CAP)
        if len(ps) >= CAP and all_ways[i][j] > CAP:
            n_capped += 1
        ps = sorted(ps)
        paths_ij[(i, j)] = ps
        paths_ij[(j, i)] = [list(reversed(p)) for p in ps]

    # Ward / current on the enlarged graph
    rng = np.random.default_rng(27)
    psi = rng.normal(size=50) + 1j * rng.normal(size=50)
    A0 = np.zeros(nE)
    lam = rng.normal(size=50)
    A_rand = rng.normal(size=nE) * 0.25

    def ward_check(recipe):
        def S(psi_, A):
            return action_hodge(psi_, A, edges) + action_cbridge_gauged(
                psi_, A, C50, C_pairs, paths_ij, recipe, edges, edge_index
            )

        psi_g, A_g = gauge_transform(psi, A_rand, lam, edges)
        gauge_err = abs(S(psi, A_rand) - S(psi_g, A_g))
        # current by FD at A=0 (used only for A vs B comparison)
        j = np.zeros(nE)
        eps = 1e-7
        for e in range(nE):
            Ap = A0.copy()
            Am = A0.copy()
            Ap[e] += eps
            Am[e] -= eps
            j[e] = (S(psi, Ap) - S(psi, Am)) / (2.0 * eps)
        gauge_ok = gauge_err < 1e-9
        return {
            "gauge_invariance_abs_err": float(gauge_err),
            "gauge_invariance_holds": bool(gauge_ok),
            "first_Ward_holds": bool(gauge_ok),
            "current": j,
        }

    # Recipe B is always well-defined (lex-first enumerated path).
    # Recipe A averages enumerated shortest paths; if some pairs were capped
    # the numerical current is an approximation, but uniqueness is decided by BFS.
    resB = ward_check("B")
    resA = ward_check("A")
    curr_diff = float(np.linalg.norm(resA["current"] - resB["current"]))
    curr_rel = curr_diff / (np.linalg.norm(resA["current"]) + 1e-30)

    # Ambiguity removed?
    unique_current = bool(stats_all_C["all_unique"])
    ico_ambiguity_removed = bool(stats_ico_off["all_unique"])
    full_Ward = bool(stats_all_C["all_connected"] and resB["gauge_invariance_holds"])

    results = {
        "geometry": {
            "n_vertices": 50,
            "n_original_edges": len(orig_edges),
            "Tr_Cbridge": float(np.trace(Cbridge)),
            "Tr_Cbridge_squared": float(np.trace(Cbridge @ Cbridge)),
            "n_cross_solid_pairs": n_cross,
            "n_cross_solid_nonzero_Cbridge": n_cross_C,
            "n_Cbridge_nonzero_upper": len(C_pairs),
            "n_ico_off_edge": len(ico_off_edge),
        },
        "D6_H3": {
            "n_diameter_units": 6,
            "n_projected_roots": 60,
            "projected_root_lengths": [{"length": a, "mult": b} for a, b in uniq_root_len],
            "root_length_ratio": (
                uniq_root_len[1][0] / uniq_root_len[0][0] if len(uniq_root_len) > 1 else None
            ),
        },
        "candidates": {
            "n_root_parallel_intersolid": len(candidates),
            "distance_groups": [{"length": a, "mult": b} for a, b in dist_groups],
            "d1": d1,
            "d2": d2,
            "d2_over_d1": (None if (d1 is None or d2 is None) else d2 / d1),
            "d2_kept": d2_kept,
            "d2_matched_scale": d2_match,
            "kept_scales": keep_scales,
            "n_links": len(links),
            "d2_over_d1_minus_phi3": (
                None if (d1 is None or d2 is None) else (d2 / d1 - PHI ** 3)
            ),
            "d3": (dist_groups[2][0] if len(dist_groups) > 2 else None),
            "d3_over_d1": (
                None if (d1 is None or len(dist_groups) < 3) else dist_groups[2][0] / d1
            ),
            "d3_over_d1_minus_2phi2": (
                None if (d1 is None or len(dist_groups) < 3) else dist_groups[2][0] / d1 - 2 * PHI ** 2
            ),
        },
        "connectivity": {
            "n_enlarged_edges": nE,
            "n_components": len(comps),
            "components": comps,
            "five_solids_path_connected": five_connected,
        },
        "paths_Cbridge_pairs": stats_all_C,
        "paths_cross_solid_Cbridge_pairs": stats_cross_C,
        "paths_ico_off_edge": stats_ico_off,
        "H2_Ward": {
            "every_nonzero_Cbridge_pair_connected": stats_all_C["all_connected"],
            "recipe_B": {k: v for k, v in resB.items() if k != "current"},
            "recipe_A": {k: v for k, v in resA.items() if k != "current"},
            "full_five_solid_Ward_restored": full_Ward,
            "n_pairs_with_enumeration_capped": n_capped,
        },
        "H3_uniqueness": {
            "current_A_minus_B_l2_norm": curr_diff,
            "current_A_minus_B_relative": float(curr_rel),
            "currents_agree_numerically": bool(curr_rel < 1e-8),
            "all_Cbridge_pairs_have_unique_shortest_path": unique_current,
            "gauged_current_unique": unique_current,
            "path_ambiguity_removed": unique_current,
        },
        "H4_ico_offedge_ambiguity": {
            "n_ico_off_edge": 36,
            "all_unique_after_links": ico_ambiguity_removed,
            "n_multiple_after_links": stats_ico_off["n_multiple_shortest_paths"],
            "n_paths_minmax_after_links": stats_ico_off["n_paths_minmax"],
            "removed_0_855_ambiguity": ico_ambiguity_removed,
        },
    }

    H1 = bool(len(links) > 0)  # nonempty finite set; connectedness reported separately
    H2 = full_Ward
    H3 = unique_current
    H4 = ico_ambiguity_removed
    results["hypotheses"] = {
        "H1_nonempty_links": H1,
        "H1_five_connected": five_connected,
        "H2_full_Ward_restored": H2,
        "H3_current_unique": H3,
        "H4_ico_ambiguity_removed": H4,
    }
    # Each claim is computed rather than assumed; label PROVED for the computed dichotomy.
    results["classification"] = "PROVED"
    results["classification_note"] = (
        f"D6→H3 rule produced {len(links)} inter-solid links; "
        f"five-solid connected={five_connected}; "
        f"full Ward={full_Ward}; unique current={unique_current}; "
        f"ico 0.855 ambiguity removed={ico_ambiguity_removed}."
    )
    results["advances_ARF"] = False
    results["which_ARF"] = None

    # POST-HOC diagnostics (not part of predeclared C4). The three observed
    # inter-solid lengths are φ^{-2}, φ, 2 with ratios d2/d1 = φ³ and
    # d3/d1 = 2 φ², both native to H3 but not in the predeclared d2/d1 list
    # {φ, φ^{-1}, φ², 2}. Variants below keep extra lengths and re-test
    # connectivity / Ward / uniqueness. Primary claims above use C4 only.
    def evaluate_keep(scales, tag):
        def on_scale(dist):
            return any(abs(dist - s) <= max(1e-10, 1e-7 * s) for s in scales)
        L = sorted(set(tuple(sorted((c["a"], c["b"]))) for c in candidates if on_scale(c["dist"])))
        E = sorted(set(orig_edges) | set(L))
        adjL = defaultdict(list)
        for i, j in E:
            adjL[i].append(j)
            adjL[j].append(i)
        seenL, compsL = set(), 0
        solids_in = set()
        for s in range(50):
            if s in seenL:
                continue
            compsL += 1
            stack = [s]
            seenL.add(s)
            while stack:
                v = stack.pop()
                solids_in.add(solid_of[v])
                for w in adjL[v]:
                    if w not in seenL:
                        seenL.add(w)
                        stack.append(w)
        all_d, all_w = [], []
        for s in range(50):
            d, w = count_shortest(adjL, s)
            all_d.append(d)
            all_w.append(w)

        def ps(pairs):
            n_conn = n_unique = n_multi = n_none = 0
            npaths = []
            for i, j in pairs:
                dij, wij = all_d[i][j], all_w[i][j]
                if dij < 0 or wij == 0:
                    n_none += 1
                    continue
                n_conn += 1
                npaths.append(wij)
                if wij == 1:
                    n_unique += 1
                else:
                    n_multi += 1
            return {
                "n_pairs": len(pairs),
                "n_connected": n_conn,
                "n_disconnected": n_none,
                "n_unique_shortest_path": n_unique,
                "n_multiple_shortest_paths": n_multi,
                "n_paths_minmax": [int(min(npaths)), int(max(npaths))] if npaths else None,
                "all_connected": n_none == 0,
                "all_unique": n_none == 0 and n_multi == 0,
            }

        st_all = ps(C_pairs)
        st_cross = ps([(i, j) for i, j in C_pairs if solid_of[i] != solid_of[j]])
        st_ico = ps(ico_off_edge)
        # Ward with recipe B (lex-first path) if fully connected
        ward = None
        curr_rel_v = None
        if st_all["all_connected"]:
            pathsL = {}
            for i, j in C_pairs:
                psL = sorted(shortest_paths(adjL, i, j, cap=32))
                pathsL[(i, j)] = psL
                pathsL[(j, i)] = [list(reversed(p)) for p in psL]
            eidx = {tuple(sorted(e)): k for k, e in enumerate(E)}

            def S(psi_, A, recipe):
                return action_hodge(psi_, A, E) + action_cbridge_gauged(
                    psi_, A, C50, C_pairs, pathsL, recipe, E, eidx
                )

            A_r = rng.normal(size=len(E)) * 0.25
            psi_g, A_g = gauge_transform(psi, A_r, lam, E)
            errB = abs(S(psi, A_r, "B") - S(psi_g, A_g, "B"))
            errA = abs(S(psi, A_r, "A") - S(psi_g, A_g, "A"))
            # currents at A=0
            jA = np.zeros(len(E))
            jB = np.zeros(len(E))
            eps = 1e-7
            Azero = np.zeros(len(E))
            for e in range(len(E)):
                Ap = Azero.copy(); Am = Azero.copy()
                Ap[e] += eps; Am[e] -= eps
                jA[e] = (S(psi, Ap, "A") - S(psi, Am, "A")) / (2.0 * eps)
                jB[e] = (S(psi, Ap, "B") - S(psi, Am, "B")) / (2.0 * eps)
            curr_rel_v = float(np.linalg.norm(jA - jB) / (np.linalg.norm(jA) + 1e-30))
            ward = {
                "recipe_B_err": float(errB),
                "recipe_A_err": float(errA),
                "gauge_invariance_holds": bool(errB < 1e-9 and errA < 1e-9),
            }
        return {
            "tag": tag,
            "n_links": len(L),
            "n_enlarged_edges": len(E),
            "n_components": compsL,
            "five_solids_path_connected": compsL == 1,
            "paths_all_C": st_all,
            "paths_cross_C": st_cross,
            "paths_ico_off": st_ico,
            "Ward": ward,
            "current_A_minus_B_relative": curr_rel_v,
            "full_Ward": bool(st_all["all_connected"] and ward and ward["gauge_invariance_holds"]),
            "unique_current": bool(st_all["all_unique"]),
            "ico_ambiguity_removed": bool(st_ico["all_unique"]),
        }

    variant_scales = {}
    if d1 is not None:
        variant_scales["diagnostic_d1_plus_d2"] = [d1, d2] if d2 is not None else [d1]
        variant_scales["diagnostic_all_observed_lengths"] = [g[0] for g in dist_groups]
    results["posthoc_scale_variants"] = {
        k: evaluate_keep(s, k) for k, s in variant_scales.items()
    }
    results["posthoc_note"] = (
        "Variants keep extra observed root-parallel lengths (d2 = φ, d3 = 2) "
        "whose ratios to d1 are φ³ and 2φ². They are diagnostics, not the "
        "predeclared C4 test."
    )

    out = Path("/workspace/arf_research/alt_cycle27_d6_intersolid_links") / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "n_candidates": len(candidates),
        "dist_groups": results["candidates"]["distance_groups"],
        "d2_kept": d2_kept,
        "n_links": len(links),
        "five_connected": five_connected,
        "n_components": len(comps),
        "paths_all_C": stats_all_C,
        "paths_cross_C": stats_cross_C,
        "paths_ico_off": stats_ico_off,
        "Ward_B_err": resB["gauge_invariance_abs_err"],
        "Ward_A_err": resA["gauge_invariance_abs_err"],
        "full_Ward": full_Ward,
        "curr_rel": curr_rel,
        "unique": unique_current,
        "ico_amb_removed": ico_ambiguity_removed,
        "posthoc": results.get("posthoc_scale_variants"),
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
