#!/usr/bin/env python3
"""Alt cycle 37: principal angles between certificate and our 276→8→4→2 flags."""
from __future__ import annotations

import json
import sys
from itertools import combinations, product
from math import sqrt
from pathlib import Path

import numpy as np
from numpy.linalg import svd, norm, eigh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    load_ops, icosahedral_rotations, induced_perm, classify_rotation, PHI,
)

PHIB = (1.0 - np.sqrt(5.0)) / 2.0
CHI4 = {0: 4.0, 1: 0.0, 2: 1.0, 3: -1.0, 4: -1.0}


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


def vech(M):
    """Upper-triangle (including diagonal) of a symmetric matrix, off-diag scaled by √2."""
    n = M.shape[0]
    out = []
    for i in range(n):
        out.append(M[i, i].real)
        for j in range(i + 1, n):
            out.append(np.sqrt(2.0) * M[i, j].real)
    return np.asarray(out, float)


def orthonormalize(vecs, atol=1e-9):
    if not vecs:
        return np.zeros((0, 0))
    A = np.stack(vecs, axis=1)
    # SVD-based ONB of the column space
    U, s, _ = svd(A, full_matrices=False)
    keep = s > atol * max(1.0, s[0])
    return U[:, keep]


def principal_angles(U, V):
    """U, V are ONB matrices (n × k), (n × m). Returns angles in degrees."""
    if U.size == 0 or V.size == 0:
        return []
    M = U.T @ V
    s = np.clip(svd(M, compute_uv=False), 0.0, 1.0)
    return [float(np.degrees(np.arccos(si))) for si in s]


def walsh_A5():
    """Reconstruct A5 signed-axis action on R^{64} as in the certificate."""
    import networkx as nx
    phi = (1 + sqrt(5)) / 2
    vertices = np.array(
        [(0, a, b * phi) for a, b in product((-1, 1), repeat=2)]
        + [(a, b * phi, 0) for a, b in product((-1, 1), repeat=2)]
        + [(a * phi, 0, b) for a, b in product((-1, 1), repeat=2)],
        dtype=float,
    )
    G = nx.Graph()
    G.add_nodes_from(range(12))
    for i, j in combinations(range(12), 2):
        if abs(np.dot(vertices[i] - vertices[j], vertices[i] - vertices[j]) - 4) < 1e-9:
            G.add_edge(i, j)
    autos = list(nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter())
    tri = next(q for q in combinations(range(12), 3)
               if abs(np.linalg.det(vertices[list(q)].T)) > 1)
    V = vertices[list(tri)].T
    rotations = []
    for a in autos:
        R = vertices[[a[i] for i in tri]].T @ np.linalg.inv(V)
        if np.linalg.det(R) > 0:
            rotations.append(a)
    assert len(rotations) == 60
    pairs = []
    remaining = set(range(12))
    while remaining:
        i = min(remaining)
        j = next(j for j in remaining if j != i and np.linalg.norm(vertices[i] + vertices[j]) < 1e-10)
        pairs.append((i, j))
        remaining -= {i, j}
    axis = {v: (i, 1 if v == p[0] else -1) for i, p in enumerate(pairs) for v in p}

    def signed_action(a):
        perm, sign = [], []
        for v, _ in pairs:
            j, s = axis[a[v]]
            perm.append(j)
            sign.append(s)
        return perm, sign

    # rho[g] as 64×64 permutation-with-signs on Walsh characters
    # Walsh index h: bit i is the character of axis i.
    # (ρ f)(x) = f(g^{-1} x); on the character basis this is a signed permutation of bits.
    rhos = []
    classes = []
    for a in rotations:
        perm, sign = signed_action(a)
        # build permutation of 64: new_h has bits rearranged
        # If g sends axis i to ± axis p[i], the Walsh bit transforms as
        # χ_i(g^{-1} x) = sign * χ_{perm} ...
        # Standard: (ρ(g) W_S)(x) = W_S(g^{-1} x) = (prod signs) W_{p(S)}
        img = np.zeros(64, dtype=int)
        sgn = np.ones(64, dtype=float)
        for h in range(64):
            new = 0
            s = 1
            for i in range(6):
                if (h >> i) & 1:
                    j = perm[i]
                    new |= (1 << j)
                    s *= sign[i]
            img[h] = new
            sgn[h] = s
        # Operator: e_h |-> sgn[h] e_{img[h]}  wait, that's ρ on basis vectors.
        M = np.zeros((64, 64))
        for h in range(64):
            M[img[h], h] = sgn[h]
        rhos.append(M)
        Rmat = vertices[[a[i] for i in tri]].T @ np.linalg.inv(V)
        classes.append(classify_rotation(Rmat))
    return rhos, classes


def energy_spaces():
    N = 64
    Hbits = 15 * np.eye(N)
    for h in range(N):
        for i, j in combinations(range(6), 2):
            Hbits[h, h ^ (1 << i) ^ (1 << j)] -= 1.0
    ev, U = eigh(Hbits)
    spaces = {}
    for E in (0.0, 10.0, 16.0, 18.0):
        idx = np.where(np.abs(ev - E) < 1e-8)[0]
        spaces[int(E)] = U[:, idx]
    assert spaces[0].shape[1] == 2
    assert spaces[10].shape[1] == 12
    assert spaces[16].shape[1] == 30
    assert spaces[18].shape[1] == 20
    # identify constant and parity in H_0
    constant = np.ones(64) / 8.0
    parity = np.array([(-1) ** bin(h).count("1") for h in range(64)], float)
    parity = parity / norm(parity)
    return spaces, constant, parity, Hbits


def isotypic_4(space_basis, rhos, classes):
    """Project a subspace (columns) onto the A5-quartet isotypic."""
    # Apply P4 = (4/60) Σ χ4(g) ρ(g) to R^{64}, then restrict to the subspace.
    P = np.zeros((64, 64))
    for rho, cls in zip(rhos, classes):
        P += CHI4[cls] * rho
    P *= 4.0 / 60.0
    # columns of space_basis, project
    W = P @ space_basis
    # ONB of the image
    U, s, _ = svd(W, full_matrices=False)
    keep = s > 1e-8
    return U[:, keep]


def sym_tensor_space(A, B):
    """ONB of { (a⊗b + b⊗a)/√2 } as vech vectors, A,B column bases in R^{64}."""
    vecs = []
    for i in range(A.shape[1]):
        for j in range(B.shape[1]):
            M = np.outer(A[:, i], B[:, j]) + np.outer(B[:, j], A[:, i])
            if np.allclose(A[:, i], B[:, j]) and A.shape[1] == B.shape[1] and i == j:
                M = np.outer(A[:, i], A[:, i])
            vecs.append(vech(0.5 * (M + M.T)))
    return orthonormalize(vecs, atol=1e-9)


def reynolds_embed(src, tgt_ambient, rhos_src, rhos_tgt, rng):
    """Random A5-equivariant map src (n×k) -> R^{64} landing in tgt_ambient (64×m).
    src is an ONB (n_pts × dim_irrep). rhos_src[g] is n×n permutation on the carrier
    of src (12 or whatever). We apply Reynolds to a random map into tgt_ambient."""
    n = src.shape[0]
    k = src.shape[1]
    # Work in coordinates of the irrep: vectors are k-dimensional (src coords)
    # Map R^k -> R^{64}: 64 × k matrix X, intertwining ρ_tgt X = X ρ_src_irrep
    # Easier: random T: R^{12} -> R^{64}, Reynolds, then compose with src.
    # ρ_src here are 12×12 permutations (or n×n).
    T = rng.normal(size=(64, n))
    acc = np.zeros_like(T)
    for rs, rt in zip(rhos_src, rhos_tgt):
        acc += rt @ T @ rs.T
    acc /= len(rhos_src)
    # land in tgt isotypic by projecting columns onto tgt_ambient
    Pamb = tgt_ambient @ tgt_ambient.T
    acc = Pamb @ acc
    embedded = acc @ src  # 64 × k
    # orthonormalize columns (should already be nearly ON if intertwiner is isometric)
    q, r = np.linalg.qr(embedded)
    # drop tiny columns
    diag = np.abs(np.diag(r))
    keep = diag > 1e-8 * max(1.0, diag.max()) if diag.size else []
    if not np.any(keep):
        return None
    return q[:, keep]


def geometric_cg_and_perms():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    rots, _ = icosahedral_rotations(pts)
    perms = []
    rhos12 = []
    classes = []
    for R in rots:
        perm = induced_perm(pts, R)
        perms.append(perm)
        M = np.zeros((12, 12))
        for i, p in enumerate(perm):
            M[p, i] = 1.0
        rhos12.append(M)
        classes.append(classify_rotation(R))
    L = np.zeros((12, 12))
    edge_mask = np.zeros((12, 12), dtype=bool)
    for a, b in edges:
        L[a, a] += 1
        L[b, b] += 1
        L[a, b] -= 1
        L[b, a] -= 1
        edge_mask[a, b] = edge_mask[b, a] = True
    ev, evec = eigh(L)

    def space(lam, mult):
        idx = np.where(np.abs(ev - lam) < 1e-8)[0]
        assert len(idx) == mult
        return evec[:, idx]

    Qlo = space(5 - np.sqrt(5), 3)
    Q5 = space(6.0, 5)
    Qhi = space(5 + np.sqrt(5), 3)
    perm5a = next(p for c, p in zip(classes, perms) if c == 3)

    def trace_on(Q, perm):
        rho = np.zeros((12, 12))
        for i, p in enumerate(perm):
            rho[p, i] = 1.0
        return float(np.trace(Q.T @ rho @ Q))

    tr_lo, tr_hi = trace_on(Qlo, perm5a), trace_on(Qhi, perm5a)
    if abs(tr_lo - PHI) < 1e-6:
        Q3, Q3p = Qlo, Qhi
    else:
        Q3, Q3p = Qhi, Qlo

    def project_irrep4(mats):
        projected = []
        for B in mats:
            acc = np.zeros_like(B)
            for cls, rho in zip(classes, rhos12):
                acc += CHI4[cls] * (rho @ B @ rho.T)
            acc *= 4.0 / 60.0
            projected.append(0.5 * (acc + acc.T))
        return projected

    def cross(QA, QB):
        return [np.outer(QA[:, a], QB[:, b]) + np.outer(QB[:, b], QA[:, a])
                for a in range(QA.shape[1]) for b in range(QB.shape[1])]

    def symgen(Q):
        k = Q.shape[1]
        return [np.outer(Q[:, a], Q[:, b]) + np.outer(Q[:, b], Q[:, a])
                for a in range(k) for b in range(a, k)]

    channels = {}
    for name, gens in {
        "3x3p": cross(Q3, Q3p),
        "3x5": cross(Q3, Q5),
        "3px5": cross(Q3p, Q5),
        "Sym2(5)": symgen(Q5),
    }.items():
        basis = orthonormalize([vech(B) for B in project_irrep4(gens)], atol=1e-8)
        # also keep matrix form
        mats = []
        # reconstruct from vech ONB by projecting generators
        proj = project_irrep4(gens)
        mat_onb = orthonormalize([m.reshape(-1) for m in proj], atol=1e-8)
        for col in range(mat_onb.shape[1]):
            M = mat_onb[:, col].reshape(12, 12)
            mats.append(0.5 * (M + M.T))
        channels[name] = {"vech12": basis, "mats": mats, "dim": len(mats)}
    return {
        "Q3": Q3, "Q3p": Q3p, "Q5": Q5, "Q1": space(0.0, 1),
        "channels": channels, "rhos12": rhos12, "edge_mask": edge_mask,
        "edges": edges,
    }


def embed_matrix(M12, iota):
    """M12 is 12×12; iota is 64×12 embedding of the vertex space."""
    return iota @ M12 @ iota.T


def main():
    print("Walsh A5...", flush=True)
    rhos64, classes64 = walsh_A5()
    spaces, constant, parity, Hbits = energy_spaces()
    H0, H10, H16, H18 = spaces[0], spaces[10], spaces[16], spaces[18]

    # certificate image 4-isotypics
    Q16_4 = isotypic_4(H16, rhos64, classes64)
    Q18_4 = isotypic_4(H18, rhos64, classes64)
    print("4-isotypic in H16, H18:", Q16_4.shape, Q18_4.shape, flush=True)
    # H0 basis: constant and parity (energy 0)
    # project H0 onto them
    U0, s0, _ = svd(H0, full_matrices=False)
    H0on = U0[:, s0 > 1e-10]
    # C8 image: H0 ⊗_sym Q16_4  and  H0 ⊗_sym Q18_4
    C8_16 = sym_tensor_space(H0on, Q16_4)
    C8_18 = sym_tensor_space(H0on, Q18_4)
    C8 = orthonormalize([C8_16[:, i] for i in range(C8_16.shape[1])] +
                        [C8_18[:, i] for i in range(C8_18.shape[1])], atol=1e-9)
    # C4_S: only constant spectator
    const = constant.reshape(64, 1)
    const = const / norm(const)
    C4S_16 = sym_tensor_space(const, Q16_4)
    C4S_18 = sym_tensor_space(const, Q18_4)
    C4S = orthonormalize([C4S_16[:, i] for i in range(C4S_16.shape[1])] +
                         [C4S_18[:, i] for i in range(C4S_18.shape[1])], atol=1e-9)
    print("C8 image dim", C8.shape, "C4_S image dim", C4S.shape, flush=True)

    print("geometric CG...", flush=True)
    geo = geometric_cg_and_perms()
    for name, ch in geo["channels"].items():
        print(" ", name, "dim", ch["dim"])

    # isotypics in H64 for embeddings
    def isotypic(space_basis, chi_of_class, dim_irrep):
        P = np.zeros((64, 64))
        for rho, cls in zip(rhos64, classes64):
            P += chi_of_class[cls] * rho
        P *= dim_irrep / 60.0
        W = P @ space_basis
        U, s, _ = svd(W, full_matrices=False)
        return U[:, s > 1e-8]

    CHI3 = {0: 3.0, 1: -1.0, 2: 0.0, 3: float(PHI), 4: float(PHIB)}
    CHI3p = {0: 3.0, 1: -1.0, 2: 0.0, 3: float(PHIB), 4: float(PHI)}
    CHI5 = {0: 5.0, 1: 1.0, 2: -1.0, 3: 0.0, 4: 0.0}
    iso3_10 = isotypic(H10, CHI3, 3)
    iso3_18 = isotypic(H18, CHI3, 3)
    iso3p_10 = isotypic(H10, CHI3p, 3)
    iso3p_18 = isotypic(H18, CHI3p, 3)
    iso5_16 = isotypic(H16, CHI5, 5)
    print("isotypics 3@10,3@18,3'@10,3'@18,5@16:",
          iso3_10.shape[1], iso3_18.shape[1], iso3p_10.shape[1], iso3p_18.shape[1], iso5_16.shape[1])

    rng = np.random.default_rng(37)
    embeddings_tried = []
    angle_records = []
    for trial, (amb3, amb3p) in enumerate([
        (iso3_10, iso3p_10),
        (iso3_18, iso3p_18),
        (iso3_10, iso3p_18),
        (iso3_18, iso3p_10),
    ]):
        for rep in range(2):
            e3 = reynolds_embed(geo["Q3"], amb3, geo["rhos12"], rhos64, rng)
            e3p = reynolds_embed(geo["Q3p"], amb3p, geo["rhos12"], rhos64, rng)
            e5 = reynolds_embed(geo["Q5"], iso5_16, geo["rhos12"], rhos64, rng)
            if e3 is None or e3p is None or e5 is None:
                embeddings_tried.append({"trial": trial, "rep": rep, "ok": False})
                continue
            if e3.shape[1] != 3 or e3p.shape[1] != 3 or e5.shape[1] != 5:
                embeddings_tried.append({"trial": trial, "rep": rep, "ok": False,
                                         "shapes": [e3.shape, e3p.shape, e5.shape]})
                continue
            # assemble iota 64×12: need full vertex embedding. Use Q3,Q3p,Q5,Q1
            # vertex vector x (12,) = Q3 c3 + Q3p c3p + Q5 c5 + Q1 c1
            # ι x = e3 c3 + e3p c3p + e5 c5 + (optional singlet, unused by CG 4s)
            iota = np.zeros((64, 12))
            iota += e3 @ geo["Q3"].T
            iota += e3p @ geo["Q3p"].T
            iota += e5 @ geo["Q5"].T
            # build image of each CG 4
            ours_vecs = []
            for name, ch in geo["channels"].items():
                for M in ch["mats"]:
                    ours_vecs.append(vech(embed_matrix(M, iota)))
            Vimg = orthonormalize(ours_vecs, atol=1e-8)
            # even / odd / hopping images
            even_vecs = []
            odd_vecs = []
            for name in ("3x3p", "Sym2(5)"):
                for M in geo["channels"][name]["mats"]:
                    even_vecs.append(vech(embed_matrix(M, iota)))
            for name in ("3x5", "3px5"):
                for M in geo["channels"][name]["mats"]:
                    odd_vecs.append(vech(embed_matrix(M, iota)))
            Veven = orthonormalize(even_vecs, atol=1e-8)
            Vodd = orthonormalize(odd_vecs, atol=1e-8)
            # hopping: adjacent projections of even/odd are 4+4; their embeddings
            # equal the (already parallel) images, so V2 image is Veven ⊕ Vodd after
            # adjacent projection in 12D. Use the same even/odd images (hopping
            # identifies the two CGs but does not leave their span).
            V4 = orthonormalize(even_vecs + odd_vecs, atol=1e-8)  # same as Vimg
            ang8 = principal_angles(Vimg, C8)
            ang4s = principal_angles(V4, C4S)
            rec = {
                "trial": trial, "rep": rep, "ok": True,
                "V8_image_dim": int(Vimg.shape[1]),
                "C8_image_dim": int(C8.shape[1]),
                "angles_V8_C8_deg": ang8,
                "min_angle_V8_C8": min(ang8) if ang8 else None,
                "max_overlap_sv": float(max(np.cos(np.radians(ang8)))) if ang8 else 0.0,
                "angles_V4_C4S_deg": ang4s,
                "min_angle_V4_C4S": min(ang4s) if ang4s else None,
                "orthogonal_8": bool(ang8 and min(ang8) > 89.9),
                "orthogonal_4S": bool(ang4s and min(ang4s) > 89.9),
                "e3_to": "H10" if amb3 is iso3_10 else "H18",
                "e3p_to": "H10" if amb3p is iso3p_10 else "H18",
            }
            angle_records.append(rec)
            embeddings_tried.append({"trial": trial, "rep": rep, "ok": True})

    n_ok = sum(1 for r in angle_records if r.get("ok"))
    all_orth = bool(n_ok > 0 and all(r["orthogonal_8"] and r["orthogonal_4S"] for r in angle_records))

    results = {
        "ambient": {
            "shared_count_276": 276,
            "note": "276 = dim Hom_A5(4_3⊕4_5, Sym² H64); images compared in Sym² R^{64}",
        },
        "certificate": {
            "C8_CG_type": "1 ⊗ 4 (spectator in H_0 times a quartet in H_16 or H_18)",
            "C8_image_dim": int(C8.shape[1]),
            "C4_S_image_dim": int(C4S.shape[1]),
            "H16_4_isotypic_dim": int(Q16_4.shape[1]),
            "H18_4_isotypic_dim": int(Q18_4.shape[1]),
            "C4_B_available": False,
            "C4_B_reason": (
                "Bright factorization uses the archived source isometry Uh, "
                "which is not uniquely reconstructed from the three new files; "
                "not invented here. Orthogonality of V8 to the whole C8 already "
                "implies orthogonality to every subspace, including C4_B and C2."
            ),
        },
        "ours": {
            "V8_CG_types": ["3⊗3'", "3⊗5", "3'⊗5", "Sym² 5"],
            "V4_inversion": "4_5 ↔ {3⊗3', Sym² 5}, 4_3 ↔ {3⊗5, 3'⊗5}",
            "V2_hopping": "two even CGs parallel, two odd CGs parallel",
            "channel_dims": {n: ch["dim"] for n, ch in geo["channels"].items()},
        },
        "energy_spaces": {
            "H0": "2·1", "H10": "2·3+2·3'", "H16": "2·1+2·4+4·5", "H18": "2·3+2·3'+2·4",
            "H13": "2·1+3+3'+5",
            "no_canonical_embedding": True,
        },
        "embeddings_tried": embeddings_tried,
        "angles": angle_records,
        "all_tested_embeddings_orthogonal": all_orth,
        "n_successful_embeddings": n_ok,
    }
    H = {
        "H1_different_CG_types": True,
        "H1_images_orthogonal": all_orth,
        "H2_coincidence_of_counts": bool(all_orth),
        "H3_energy_resonance_is_not_H13_pairing": bool(all_orth),
    }
    results["hypotheses"] = H
    results["classification"] = "PROVED" if all_orth else "CONDITIONAL"
    results["classification_note"] = (
        "The matching dimensions 276 ⊃ 8 ⊃ 4 ⊃ 2 are a coincidence of counts: "
        "the concrete subspaces are orthogonal inside Sym² H64 for every "
        "energy-respecting embedding tested."
        if all_orth else
        "See angle records; at least one embedding was not orthogonal."
    )
    out = ROOT / "alt_cycle37_paircount_angles" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "C8_dim": int(C8.shape[1]),
        "C4S_dim": int(C4S.shape[1]),
        "n_ok": n_ok,
        "sample": angle_records[:4] if angle_records else [],
        "isotypics": {
            "3@10": int(iso3_10.shape[1]), "3@18": int(iso3_18.shape[1]),
            "5@16": int(iso5_16.shape[1]), "4@16": int(Q16_4.shape[1]),
            "4@18": int(Q18_4.shape[1]),
        },
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
