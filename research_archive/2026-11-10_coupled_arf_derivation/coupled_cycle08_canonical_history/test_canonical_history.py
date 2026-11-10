#!/usr/bin/env python3
"""Coupled cycle 08: distinguished history states and whether a response is forced."""
from __future__ import annotations
import json
from pathlib import Path
import numpy as np

SRC = Path("/workspace/arf_research/repo/research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py")
OUT = Path("/workspace/arf_research/coupled_cycle08_canonical_history")


def load_ops():
    g = {}
    exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), g)
    return g


def portal_hessian(C, P3, P5, Iico, alpha, c3, c5, d2):
    x = Iico @ alpha
    cx = C @ x
    h3 = P3 @ (cx * cx)
    h5 = P5 @ (cx * cx)
    CxI = C @ Iico
    dh3 = np.stack([2 * (P3 @ (cx * CxI[:, k])) for k in range(8)], axis=1)
    dh5 = np.stack([2 * (P5 @ (cx * CxI[:, k])) for k in range(8)], axis=1)
    H = np.zeros((8, 8))
    for k in range(8):
        for l in range(k, 8):
            d2h3 = 2 * (P3 @ (CxI[:, k] * CxI[:, l]))
            d2h5 = 2 * (P5 @ (CxI[:, k] * CxI[:, l]))
            val = 2 * c3 * (np.dot(dh3[:, k], dh3[:, l]) + np.dot(h3, d2h3))
            val += 2 * d2 * c5 * (np.dot(dh5[:, k], dh5[:, l]) + np.dot(h5, d2h5))
            H[k, l] = H[l, k] = val
    return 0.5 * (H + H.T)


def split_H(C, P3, P5, Iico, alpha):
    """Return the two pieces H3, H5 so V-weights can be swapped."""
    # rebuild with (c3,c5,d2) = (1,0,0) and (0,1,1)
    H3 = portal_hessian(C, P3, P5, Iico, alpha, 1.0, 0.0, 0.0)
    H5 = portal_hessian(C, P3, P5, Iico, alpha, 0.0, 1.0, 1.0)
    return H3, H5


def ratios(eigs, atol=1e-12):
    eigs = np.sort(np.real(eigs))
    amax = np.max(np.abs(eigs))
    if amax < atol:
        return eigs, np.zeros_like(eigs)
    return eigs, eigs / amax


def main():
    g = load_ops()
    C, P3, P5, Iico, Hbits = g["C"], g["P3"], g["P5"], g["Iico"], g["Hbits"]
    points = g["ico"]["points"]
    r = float(g["r"])
    theta = float(g["theta"])
    Delta = float(g["Delta"])
    d2 = Delta ** 2
    eta = -np.log(Delta)
    lam_g = 2 - 2 * np.cos(2 * theta - 2 * np.pi * 18 / 24)
    c3g = 0.25 - 0.5 / (18 + r * r * lam_g)
    c5g = 0.25 - 0.5 / (16 + r * r * lam_g)
    w3_rho = 1.0 / (4.0 * (1.0 + d2))
    w5_rho = d2 / (4.0 * (1.0 + d2))

    remaining = set(range(12))
    pairs = []
    while remaining:
        i = min(remaining)
        j = min(remaining - {i}, key=lambda k: np.linalg.norm(points[i] + points[k]))
        pairs.append((i, j))
        remaining.remove(i)
        remaining.remove(j)

    sigmas = np.zeros((64, 12))
    weights = np.zeros(64, dtype=int)
    for s in range(64):
        wt = 0
        for i in range(6):
            bit = (s >> i) & 1
            wt += bit
            v = pairs[i][bit]
            sigmas[s, v] = 1.0
            sigmas[s, pairs[i][1 - bit]] = -1.0
        weights[s] = wt
    alphas = sigmas @ Iico  # 64 x 8
    even = weights % 2 == 0
    odd = ~even
    assert even.sum() == 32 and odd.sum() == 32

    Hs = np.zeros((64, 8, 8))
    H3s = np.zeros((64, 8, 8))
    H5s = np.zeros((64, 8, 8))
    for s in range(64):
        H3s[s], H5s[s] = split_H(C, P3, P5, Iico, alphas[s])
        Hs[s] = c3g * H3s[s] + d2 * c5g * H5s[s]

    def pack(H, name):
        ev, rat = ratios(np.linalg.eigvalsh(H))
        return {"name": name, "eigs": ev.tolist(), "ratios": rat.tolist(),
                "trace": float(np.trace(H)), "frob": float(np.linalg.norm(H))}

    H_unif = Hs.mean(axis=0)
    H_even = Hs[even].mean(axis=0)
    H_odd = Hs[odd].mean(axis=0)
    mean_alpha = alphas.mean(axis=0)
    H_at_mean = portal_hessian(C, P3, P5, Iico, mean_alpha, c3g, c5g, d2)
    # average of ratio tuples
    rats = np.array([ratios(np.linalg.eigvalsh(Hs[s]))[1] for s in range(64)])
    mean_rat = rats.mean(axis=0)

    recs = [
        pack(H_unif, "uniform_average_of_Hessians"),
        pack(H_even, "even_weight_sector_average"),
        pack(H_odd, "odd_weight_sector_average"),
        pack(H_at_mean, "Hessian_at_mean_alpha"),
    ]

    # Hbits spectrum / kernel
    eh, Uh = np.linalg.eigh(Hbits)
    ker_idx = np.where(np.abs(eh) < 1e-8)[0]
    ker = Uh[:, ker_idx]  # 64 x 2
    # identify with even/odd indicators
    even_vec = even.astype(float)
    odd_vec = odd.astype(float)
    even_vec /= np.linalg.norm(even_vec)
    odd_vec /= np.linalg.norm(odd_vec)
    # project
    overlap = np.abs(ker.T @ np.column_stack([even_vec, odd_vec]))
    T_hist = np.exp(-eta * eh)
    # leading multiplicity
    lead = float(T_hist.max())
    lead_mult = int(np.sum(np.abs(T_hist - lead) < 1e-12))

    # rho* weighting on uniform / even / odd
    Hrho = lambda S: w3_rho * H3s[S].mean(0) + w5_rho * H5s[S].mean(0)
    recs.append(pack(Hrho(np.s_[:]), "rho_star_uniform"))
    recs.append(pack(Hrho(even), "rho_star_even"))
    recs.append(pack(Hrho(odd), "rho_star_odd"))

    # A5 action on 6 diameters = the 6 pairs, hence on 64
    # reuse rotations from a lightweight construction (same as cycle 06)
    pts = np.asarray(points, dtype=float)
    dmat = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    neigh = []
    for i in range(12):
        order = np.argsort(dmat[i])
        antip = int(np.argmax(dmat[i]))
        nn = [int(j) for j in order if j != i and j != antip][:5]
        neigh.append(nn)
    v0, n0 = pts[0], pts[neigh[0][0]]
    A0 = np.column_stack([v0, n0, np.cross(v0, n0)])
    pair_of = {}
    for k, (a, b) in enumerate(pairs):
        pair_of[a] = k
        pair_of[b] = k
    # which option of each pair: 0 if vertex == pairs[k][0]
    option = np.zeros(12, dtype=int)
    for k, (a, b) in enumerate(pairs):
        option[a] = 0
        option[b] = 1

    def perm_of(R):
        new = pts @ R.T
        perm = []
        for x in new:
            j = int(np.argmin(np.linalg.norm(pts - x, axis=1)))
            perm.append(j)
        return perm

    # map history s through vertex perm
    def act_on_history(perm, s):
        chosen = []
        for i in range(6):
            chosen.append(pairs[i][(s >> i) & 1])
        chosen = [perm[v] for v in chosen]
        s2 = 0
        for v in chosen:
            k = pair_of[v]
            bit = option[v]
            s2 |= (bit << k)
        return s2

    histories_images = []
    n_rots = 0
    for vt in range(12):
        for nj in neigh[vt]:
            v1, n1 = pts[vt], pts[nj]
            R = np.column_stack([v1, n1, np.cross(v1, n1)]) @ np.linalg.inv(A0)
            if abs(np.linalg.det(R) - 1) > 1e-6:
                continue
            perm = perm_of(R)
            if sorted(perm) != list(range(12)):
                continue
            n_rots += 1
            img = [act_on_history(perm, s) for s in range(64)]
            histories_images.append(img)
    # unique images? n_rots should be 60
    # orbits
    seen = [-1] * 64
    orbits = []
    for s in range(64):
        if seen[s] >= 0:
            continue
        stack = [s]
        orb = []
        seen[s] = len(orbits)
        while stack:
            u = stack.pop()
            orb.append(u)
            for img in histories_images:
                v = img[u]
                if seen[v] < 0:
                    seen[v] = len(orbits)
                    stack.append(v)
        orbits.append(sorted(orb))
    orbit_sizes = [len(o) for o in orbits]
    orbit_recs = []
    for i, orb in enumerate(orbits):
        Horb = Hs[orb].mean(axis=0)
        rec = pack(Horb, f"A5_orbit_{i}_size_{len(orb)}")
        rec["size"] = len(orb)
        rec["even_count"] = int(even[orb].sum())
        rec["odd_count"] = int(odd[orb].sum())
        orbit_recs.append(rec)

    # compare distinguished ratio tuples
    def rat_of(name):
        for r in recs:
            if r["name"] == name:
                return np.array(r["ratios"])
        return None

    comparisons = {
        "even_vs_odd_max_abs_ratio_diff": float(np.max(np.abs(
            rat_of("even_weight_sector_average") - rat_of("odd_weight_sector_average")))),
        "unif_vs_even": float(np.max(np.abs(
            rat_of("uniform_average_of_Hessians") - rat_of("even_weight_sector_average")))),
        "unif_vs_at_mean": float(np.max(np.abs(
            rat_of("uniform_average_of_Hessians") - recs[3]["ratios"]))),
        "gold_unif_vs_rhostar_unif": float(np.max(np.abs(
            rat_of("uniform_average_of_Hessians") - rat_of("rho_star_uniform")))),
        "mean_of_ratio_tuples": mean_rat.tolist(),
        "mean_of_ratio_tuples_vs_unif_H": float(np.max(np.abs(
            mean_rat - rat_of("uniform_average_of_Hessians")))),
    }
    forced = comparisons["even_vs_odd_max_abs_ratio_diff"] < 1e-10 \
        and comparisons["unif_vs_at_mean"] < 1e-10 \
        and comparisons["mean_of_ratio_tuples_vs_unif_H"] < 1e-10 \
        and lead_mult == 1
    results = {
        "Hbits_kernel_dim": int(ker_idx.size),
        "Hbits_kernel_overlaps_even_odd": overlap.tolist(),
        "T_hist_leading_eigenvalue": lead,
        "T_hist_leading_multiplicity": lead_mult,
        "n_even": int(even.sum()),
        "n_odd": int(odd.sum()),
        "n_rotations_used_for_orbits": n_rots,
        "n_A5_orbits": len(orbits),
        "orbit_sizes": orbit_sizes,
        "distinguished": recs,
        "A5_orbit_averages": orbit_recs,
        "comparisons": comparisons,
        "forced": bool(forced),
        "classification": "CONDITIONAL" if (not forced and lead_mult > 1) else ("PROVED" if forced else "FALSIFIED"),
        "note": (
            "Hbits ground space is 2-dimensional (even-weight and odd-weight "
            "indicators of the 6-cube). Those two KMS extremes, the uniform "
            "mixture, the Hessian-at-mean-alpha, and the mean of ratio tuples "
            "are compared above. A response is forced only if they all agree."
        ),
        "advances_ARF": False,
    }
    # refine classification: disagreeing distinguished states => FALSIFIED uniqueness
    if comparisons["even_vs_odd_max_abs_ratio_diff"] > 1e-10:
        results["classification"] = "FALSIFIED"
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    print("ker dim", ker_idx.size, "lead mult", lead_mult, "overlap", overlap)
    print("orbits", len(orbits), orbit_sizes)
    print("comparisons", comparisons)
    for r in recs:
        print(r["name"], [round(x, 6) for x in r["ratios"]])
    print("classification", results["classification"])
    print("PASS: cycle 08 canonical history")


if __name__ == "__main__":
    main()
