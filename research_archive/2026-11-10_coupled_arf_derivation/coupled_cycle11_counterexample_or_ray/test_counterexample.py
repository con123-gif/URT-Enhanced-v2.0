#!/usr/bin/env python3
"""Coupled cycle 11: explicit odd/even hopping-current pair and the
minimal extra principle (dimension did not drop to a ray in cycle 10)."""
from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path

import numpy as np

C10 = Path("/workspace/arf_research/coupled_cycle10_noether_identification")
OUT = Path("/workspace/arf_research/coupled_cycle11_counterexample_or_ray")


def load_c10():
    spec = importlib.util.spec_from_file_location(
        "c10", C10 / "test_noether_identification.py"
    )
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def main():
    c10_res = json.loads((C10 / "results.json").read_text())
    assert c10_res["surviving_dimension"] == 2
    assert c10_res["is_a_ray"] is False
    # Branch: not a ray, so construct the pair; do not run one-loop/EM/ARF.

    m = load_c10()
    g = m.load_ops()
    ico = g["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    edges = set()
    for f in faces:
        n = len(f)
        for i in range(n):
            edges.add(tuple(sorted((f[i], f[(i + 1) % n]))))
    edges = sorted(edges)
    assert len(edges) == 30

    rots, _ = m.icosahedral_rotations(pts)
    perms = []
    for R in rots:
        perms.append((m.classify_rotation(R), m.induced_perm(pts, R)))

    Lico = np.zeros((12, 12))
    edge_mask = np.zeros((12, 12), dtype=bool)
    for a, b in edges:
        Lico[a, a] += 1
        Lico[b, b] += 1
        Lico[a, b] -= 1
        Lico[b, a] -= 1
        edge_mask[a, b] = edge_mask[b, a] = True
    np.fill_diagonal(edge_mask, False)

    ev, evec = np.linalg.eigh(Lico)

    def space(lam, mult):
        idx = np.where(np.abs(ev - lam) < 1e-8)[0]
        assert len(idx) == mult
        return evec[:, idx]

    Qlo = space(5 - np.sqrt(5), 3)
    Q5 = space(6.0, 5)
    Qhi = space(5 + np.sqrt(5), 3)
    perm5a = next(p for c, p in perms if c == 3)

    def trace_on(Q, perm):
        rho = np.zeros((12, 12))
        for i, p in enumerate(perm):
            rho[p, i] = 1.0
        return float(np.trace(Q.T @ rho @ Q))

    tr_lo = trace_on(Qlo, perm5a)
    Q3, Q3p = (Qlo, Qhi) if abs(tr_lo - m.PHI) < 1e-6 else (Qhi, Qlo)

    d2 = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    antip = [int(np.argmax(d2[i])) for i in range(12)]

    def cross(QA, QB):
        mats = []
        for a in range(QA.shape[1]):
            for b in range(QB.shape[1]):
                u, w = QA[:, a], QB[:, b]
                mats.append(np.outer(u, w) + np.outer(w, u))
        return mats

    def sym(Q):
        mats = []
        k = Q.shape[1]
        for a in range(k):
            for b in range(a, k):
                u, w = Q[:, a], Q[:, b]
                mats.append(np.outer(u, w) + np.outer(w, u))
        return mats

    def PA(B):
        out = np.zeros_like(B)
        out[edge_mask] = B[edge_mask]
        return 0.5 * (out + out.T)

    def image_of(gens):
        projected = m.project_irrep4(gens, perms)
        basis = m.orthonormalize(projected, atol=1e-9)
        return m.orthonormalize([PA(B) for B in basis], atol=1e-10)

    W_odd_a = image_of(cross(Q3, Q5))
    W_odd_b = image_of(cross(Q3p, Q5))
    W_even_a = image_of(cross(Q3, Q3p))
    W_even_b = image_of(sym(Q5))

    def span_dim(*lists):
        mats = []
        for L in lists:
            mats.extend(L)
        return len(m.orthonormalize(mats, atol=1e-10))

    # The two constructions of each parity coincide.
    assert span_dim(W_odd_a) == 4 and span_dim(W_even_a) == 4
    assert span_dim(W_odd_a, W_odd_b) == 4
    assert span_dim(W_even_a, W_even_b) == 4
    assert span_dim(W_odd_a, W_even_a) == 8

    def mean_parity(Ws):
        ps = []
        for B in Ws:
            IB = B[np.ix_(antip, antip)]
            ps.append(float(np.sum(B * IB)))
        return float(np.mean(ps)), ps

    p_odd, p_odd_list = mean_parity(W_odd_a)
    p_even, p_even_list = mean_parity(W_even_a)
    assert abs(p_odd + 1) < 1e-8, p_odd
    assert abs(p_even - 1) < 1e-8, p_even

    # Frobenius orthogonality of opposite-parity spaces.
    crosses = [abs(float(np.sum(A * B))) for A in W_odd_a for B in W_even_a]
    max_cross = max(crosses)
    assert max_cross < 1e-12, max_cross

    # Edge-vector fingerprints (4 x 30) for each current space.
    def to_edge_frame(Ws):
        M = np.stack([[B[a, b] for a, b in edges] for B in Ws], axis=0)
        # M is (4, 30). Orthonormal frame of the row space is Vt.
        _U, s, Vt = np.linalg.svd(M, full_matrices=False)
        keep = s > 1e-12
        F = Vt[keep].copy()
        for i in range(F.shape[0]):
            j = int(np.argmax(np.abs(F[i])))
            if F[i, j] < 0:
                F[i] *= -1
        return F, s[keep]

    F_odd, s_odd = to_edge_frame(W_odd_a)
    F_even, s_even = to_edge_frame(W_even_a)
    assert F_odd.shape == (4, 30)
    assert F_even.shape == (4, 30)
    # opposite parity frames are orthogonal in R^30 as well
    gram = F_odd @ F_even.T
    assert np.max(np.abs(gram)) < 1e-12

    def fingerprint(F):
        raw = F.astype(np.float64).tobytes()
        return {
            "sha256": hashlib.sha256(raw).hexdigest(),
            "shape": list(F.shape),
            "frobenius_norm": float(np.linalg.norm(F)),
            "max_abs": float(np.max(np.abs(F))),
            "row_l2": [float(np.linalg.norm(r)) for r in F],
        }

    fp_odd = fingerprint(F_odd)
    fp_even = fingerprint(F_even)
    np.save(OUT / "odd_adjacent_current_frame.npy", F_odd)
    np.save(OUT / "even_adjacent_current_frame.npy", F_even)

    # Two explicit theories (rays in the residual 2-plane).
    theory_A = {
        "name": "pure_odd_hopping",
        "y_odd": 1.0,
        "y_even": 0.0,
        "couples_to": "4_3",
        "inversion_parity": -1,
        "CG_parents": ["3x5", "3px5"],
        "frame_sha256": fp_odd["sha256"],
    }
    theory_B = {
        "name": "pure_even_hopping",
        "y_odd": 0.0,
        "y_even": 1.0,
        "couples_to": "4_5",
        "inversion_parity": +1,
        "CG_parents": ["3x3p", "Sym2(5)"],
        "frame_sha256": fp_even["sha256"],
    }

    # Invariants of a general (y_odd, y_even): only the two scales (or their
    # ratio). No A5/inversion/Ward/Hodge singlet picks a preferred direction
    # in this plane, because both axes are already singlets of those
    # symmetries (they are the two inversion eigenspaces of the unique
    # adjacent 2·4). Any derived principle built from those symmetries is
    # constant on each axis and cannot relate them.
    derived_principles_fail_to_pick_ratio = {
        "A5_equivariance": "both axes are already A5 4-isotypes",
        "inversion": "each axis is an inversion eigenspace; inversion distinguishes them but does not discard either",
        "Ward_conservation": "both 4's sit in ker(div) of signed C^1 (cycle 06 / cycle 10)",
        "Hodge_kinetic": "j_K is charge 0 and does not mix with charge-+2 pairings",
        "hopping_support": "already imposed; this is the residual after P_A",
        "history_clock_handedness": (
            "alt_cycle10: native all-flip / Hamming parity / clock reversal "
            "do not pick 3 vs 3', and after hopping that pair is already "
            "identified. None of those operations mixes or kills one of "
            "{4_3, 4_5}."
        ),
        "source_content_of_F": (
            "archived F produces both hidden quartets (3⊗5 → 4_3 and "
            "Sym²5 → 4_5), so matching the source keeps both axes"
        ),
        "stacked_cuts_alt09": "leave 4 Yukawas (before hopping); hopping cuts that to 2, not 1",
        "Cbridge_alt12": "splits kinetic eigenvalues of 3 vs 3', not the 4_3/4_5 pairing ratio",
        "maxent_KMS_alt14": "Haar measure on the residual sphere is not a point",
    }

    minimal_additional_principle = {
        "statement": (
            "A rule that either discards one inversion parity of the "
            "H13 pairing (only 4_3 or only 4_5 couples to charged matter) "
            "or else fixes the relative coupling y_even : y_odd."
        ),
        "named_candidates_not_derived": [
            {
                "name": "portal_quartet_only",
                "effect": "keep only the odd current (to 4_3); kill 4_5",
                "status": "extra assumption",
            },
            {
                "name": "hidden_action_weighting",
                "effect": (
                    "set y_even / y_odd equal to the V_hist weight Δ² "
                    "(or Δ) that already multiplies the 4_5 term relative "
                    "to the 4_3 term"
                ),
                "status": "extra assumption; would produce a ray",
            },
            {
                "name": "log_det_on_Yukawa_sphere",
                "effect": (
                    "alt_cycle14: maximising log det of the Hodge kinetic "
                    "against the four abstract Yukawas picks the pure "
                    "3⊗5 → 4_3 ray because λ_3 = 5−√5 is lighter. After "
                    "hopping that ray is the pure odd current. The principle "
                    "itself is not KMS and is not derived."
                ),
                "status": "CONDITIONAL extra principle (alt_cycle14 H3)",
            },
        ],
        "what_does_not_suffice": list(derived_principles_fail_to_pick_ratio.keys()),
    }

    results = {
        "classification": "PROVED",
        "branch": "not_a_ray",
        "cycle10_surviving_dimension": 2,
        "one_loop_EM_ARF_ran": False,
        "reason_one_loop_skipped": (
            "surviving dimension is 2, not 1; the brief asks for the "
            "one-loop / EM / ARF pipeline only on a ray"
        ),
        "theory_A": theory_A,
        "theory_B": theory_B,
        "odd_frame": {**fp_odd, "svd_of_projection": s_odd.tolist()},
        "even_frame": {**fp_even, "svd_of_projection": s_even.tolist()},
        "odd_inversion_parity": p_odd,
        "even_inversion_parity": p_even,
        "odd_inversion_list": p_odd_list,
        "even_inversion_list": p_even_list,
        "max_Frobenius_cross": max_cross,
        "odd_constructions_coincide": True,
        "even_constructions_coincide": True,
        "derived_principles_fail_to_pick_ratio": derived_principles_fail_to_pick_ratio,
        "minimal_additional_principle": minimal_additional_principle,
        "statement": (
            "Explicit counterexample pair: theory A is the pure odd "
            f"adjacent pairing-current (frame sha256 {fp_odd['sha256'][:16]}…, "
            "parity −1, couples to hidden 4_3, jointly the image of 3⊗5 and "
            "3'⊗5); theory B is the pure even adjacent pairing-current "
            f"(frame sha256 {fp_even['sha256'][:16]}…, parity +1, couples to "
            "hidden 4_5, jointly the image of 3⊗3' and Sym²5). The two "
            "4-spaces are Frobenius-orthogonal. No principle already derived "
            "in this programme (A5, inversion, Ward, Hodge, hopping, "
            "history/clock handedness, source content of F) selects a ratio "
            "y_even : y_odd. The minimal additional principle is a rule that "
            "discards one inversion parity of the H13 pairing or fixes that "
            "ratio. One-loop fermion self-energy, EM vertex and ARF "
            "comparison were not computed."
        ),
    }

    def default(o):
        if isinstance(o, np.generic):
            return o.item()
        if isinstance(o, np.ndarray):
            return o.tolist()
        raise TypeError(type(o))

    (OUT / "results.json").write_text(
        json.dumps(results, indent=2, default=default) + "\n"
    )
    print(json.dumps({
        "classification": results["classification"],
        "branch": results["branch"],
        "one_loop_EM_ARF_ran": results["one_loop_EM_ARF_ran"],
        "odd_sha256": fp_odd["sha256"],
        "even_sha256": fp_even["sha256"],
        "max_Frobenius_cross": max_cross,
        "minimal_principle": minimal_additional_principle["statement"],
        "statement": results["statement"],
    }, indent=2))


if __name__ == "__main__":
    main()
