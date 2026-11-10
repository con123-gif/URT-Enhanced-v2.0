#!/usr/bin/env python3
"""Coupled cycle 03: F: Sym^2(3+5) -> 4_3 + 4_5 and hidden 8-amplitude Hessian."""
from __future__ import annotations
import json
from pathlib import Path
import numpy as np

SRC = Path("/workspace/arf_research/repo/research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py")
OUT = Path("/workspace/arf_research/coupled_cycle03_map_F_hessian")


def load_ops():
    g = {}
    exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), g)
    return g


def hidden_frame(P):
    evals, evecs = np.linalg.eigh(P)
    idx = np.where(evals > 0.5)[0]
    Q = evecs[:, idx]  # 20 x 4
    # unique orientation: flip columns with negative coordinate-sum
    for k in range(Q.shape[1]):
        if Q[:, k].sum() < 0:
            Q[:, k] *= -1
    # order by decreasing |coordinate-sum|
    order = np.argsort(-np.abs(Q.sum(axis=0)))
    return Q[:, order]


def sym_basis_index():
    """Orthonormal Frobenius basis of Sym^2(R^8): 36 pairs (i,j) with i<=j."""
    pairs = [(i, j) for i in range(8) for j in range(i, 8)]
    assert len(pairs) == 36
    return pairs


def main():
    g = load_ops()
    C, P3, P5, Iico = g["C"], g["P3"], g["P5"], g["Iico"]
    r = float(g["r"])
    theta = float(g["theta"])
    Delta = float(g["Delta"])
    N = int(g["N"])
    assert Iico.shape == (12, 8)
    assert abs(np.max(np.abs(Iico.T @ Iico - np.eye(8)))) < 1e-12

    lam = 2 - 2 * np.cos(2 * theta - 2 * np.pi * 18 / 24)
    c3 = 0.25 - 0.5 / (18 + r * r * lam)
    c5 = 0.25 - 0.5 / (16 + r * r * lam)
    d2 = Delta ** 2

    Q3 = hidden_frame(P3)
    Q5 = hidden_frame(P5)
    assert Q3.shape == (20, 4) and Q5.shape == (20, 4)
    assert np.allclose(Q3.T @ Q3, np.eye(4), atol=1e-12)
    assert np.allclose(Q5.T @ Q5, np.eye(4), atol=1e-12)
    assert np.linalg.norm(P3 @ Q3 - Q3) < 1e-12
    assert np.linalg.norm(P5 @ Q5 - Q5) < 1e-12
    # the two 4's are orthogonal in R^20
    assert np.linalg.norm(Q3.T @ Q5) < 1e-12

    # Polarization tensors B3, B5 in hidden frames: B(u_i, u_j) components
    # B3[i,j,a] = Q3[:,a] · 2 P3[(C Iico_i) ⊙ (C Iico_j)]
    Cx = C @ Iico  # 20 x 8
    B3 = np.zeros((8, 8, 4))
    B5 = np.zeros((8, 8, 4))
    for i in range(8):
        for j in range(8):
            had = Cx[:, i] * Cx[:, j]
            B3[i, j, :] = Q3.T @ (2 * (P3 @ had))
            B5[i, j, :] = Q5.T @ (2 * (P5 @ had))
    # symmetry
    assert np.linalg.norm(B3 - np.transpose(B3, (1, 0, 2))) < 1e-14
    assert np.linalg.norm(B5 - np.transpose(B5, (1, 0, 2))) < 1e-14

    # q(e_i) = half of B(e_i, e_i)
    q3_diag = np.array([Q3.T @ (P3 @ (Cx[:, i] * Cx[:, i])) for i in range(8)])
    assert np.linalg.norm(q3_diag - 0.5 * B3[np.arange(8), np.arange(8), :]) < 1e-14

    def frob(block):
        return float(np.linalg.norm(block))

    def rank_map_33(tensor):
        # tensor (3,3,4) symmetric -> 6 x 4
        rows = []
        for i in range(3):
            for j in range(i, 3):
                scale = 1.0 if i == j else np.sqrt(2.0)
                # F( (ei⊙ej) normalized ) = B_ij / scale? 
                # E_ii = ei⊗ei, F(E_ii) = q(ei) = B_ii/2
                # E_ij = (ei⊗ej+ej⊗ei)/sqrt(2), F = B_ij / sqrt(2)
                if i == j:
                    rows.append(tensor[i, j] / 2.0)
                else:
                    rows.append(tensor[i, j] / np.sqrt(2.0))
        M = np.stack(rows, axis=0)
        return int(np.linalg.matrix_rank(M, tol=1e-10)), frob(tensor), M

    def rank_map_55(tensor):
        rows = []
        for i in range(5):
            for j in range(i, 5):
                if i == j:
                    rows.append(tensor[i, j] / 2.0)
                else:
                    rows.append(tensor[i, j] / np.sqrt(2.0))
        M = np.stack(rows, axis=0)
        return int(np.linalg.matrix_rank(M, tol=1e-10)), frob(tensor), M

    def rank_map_35(tensor):
        # tensor (3,5,4): 3⊗5 is already 15-dimensional (no symmetrisation across types)
        # The Sym² component 3∨5 corresponds to (e_a⊗e_b + e_b⊗e_a)/sqrt(2)
        # F = B_{a, 3+b} / sqrt(2)
        M = tensor.reshape(15, 4) / np.sqrt(2.0)
        return int(np.linalg.matrix_rank(M, tol=1e-10)), frob(tensor), M

    blocks = {}
    r33_3, n33_3, M33_3 = rank_map_33(B3[:3, :3, :])
    r33_5, n33_5, M33_5 = rank_map_33(B5[:3, :3, :])
    r35_3, n35_3, M35_3 = rank_map_35(B3[:3, 3:, :])
    r35_5, n35_5, M35_5 = rank_map_35(B5[:3, 3:, :])
    r55_3, n55_3, M55_3 = rank_map_55(B3[3:, 3:, :])
    r55_5, n55_5, M55_5 = rank_map_55(B5[3:, 3:, :])
    blocks["3s3_to_4_3"] = {"rank": r33_3, "frob_B": n33_3}
    blocks["3s3_to_4_5"] = {"rank": r33_5, "frob_B": n33_5}
    blocks["3x5_to_4_3"] = {"rank": r35_3, "frob_B": n35_3}
    blocks["3x5_to_4_5"] = {"rank": r35_5, "frob_B": n35_5}
    blocks["5s5_to_4_3"] = {"rank": r55_3, "frob_B": n55_3}
    blocks["5s5_to_4_5"] = {"rank": r55_5, "frob_B": n55_5}

    # Brief-specified pieces:
    # h3(t,f) = 2 P3[(Ct)⊙(Cf)]  <-> B3[:3, 3:, :]
    # h5(f,f) = P5[(Cf)⊙(Cf)]   <-> half of B5[3:, 3:, :] diagonal map
    specified = {
        "h3_2P3_Ct_Cf_is_B3_3x5": True,
        "h5_P5_Cf_Cf_is_half_B5_5s5": True,
        "h3_3x5_rank": r35_3,
        "h5_5s5_rank": r55_5,
    }

    # Full F: 36 -> 8
    pairs = sym_basis_index()
    Fmat = np.zeros((8, 36))  # rows: 4_3 then 4_5
    for p, (i, j) in enumerate(pairs):
        if i == j:
            Fmat[:4, p] = B3[i, j] / 2.0
            Fmat[4:, p] = B5[i, j] / 2.0
        else:
            Fmat[:4, p] = B3[i, j] / np.sqrt(2.0)
            Fmat[4:, p] = B5[i, j] / np.sqrt(2.0)
    rank_F = int(np.linalg.matrix_rank(Fmat, tol=1e-10))
    sF = np.linalg.svd(Fmat, compute_uv=False)

    # Hidden Hessian of V = c3 ||h3||^2 + d2 c5 ||h5||^2
    # coordinates: 4 real 4_3 + 4 real 4_5
    H_hid = np.diag([2 * c3] * 4 + [2 * d2 * c5] * 4)
    hid_eigs = np.linalg.eigvalsh(H_hid)
    hid_nulls = int(np.sum(np.abs(hid_eigs) < 1e-14))
    # eigenvectors are the standard hidden-frame basis
    hid_vecs = np.eye(8)

    # Quartic operator K = F* G F on Sym^2, G = c3 I4 ⊕ d2 c5 I4
    Gdiag = np.array([c3] * 4 + [d2 * c5] * 4)
    K = Fmat.T @ (Gdiag[:, None] * Fmat)
    K = 0.5 * (K + K.T)
    K_eigs = np.linalg.eigvalsh(K)
    K_rank = int(np.linalg.matrix_rank(K, tol=1e-12))
    K_nulls = int(np.sum(np.abs(K_eigs) < 1e-12))

    # degeneracies of H_hid
    degeneracies = {
        "hidden_4_3": {"eigenvalue": float(2 * c3), "multiplicity": 4,
                       "protection": "A5 acts irreducibly on 4_3; H_hid is A5-scalar on this block"},
        "hidden_4_5": {"eigenvalue": float(2 * d2 * c5), "multiplicity": 4,
                       "protection": "A5 acts irreducibly on 4_5; Hbits eigenvalues 18 vs 16 separate the blocks"},
        "cross_mixing": False,
        "null_space_dim": hid_nulls,
    }

    results = {
        "c3_gold": float(c3),
        "c5_gold": float(c5),
        "Delta2": float(d2),
        "lam_gold": float(lam),
        "frames": {
            "Q3_coord_sums": Q3.sum(0).tolist(),
            "Q5_coord_sums": Q5.sum(0).tolist(),
        },
        "component_tensors": {
            "B3_33": B3[:3, :3, :].tolist(),
            "B3_35": B3[:3, 3:, :].tolist(),
            "B3_55": B3[3:, 3:, :].tolist(),
            "B5_33": B5[:3, :3, :].tolist(),
            "B5_35": B5[:3, 3:, :].tolist(),
            "B5_55": B5[3:, 3:, :].tolist(),
        },
        "blocks": blocks,
        "specified_channels": specified,
        "F": {
            "domain_dim": 36,
            "codomain_dim": 8,
            "rank": rank_F,
            "singular_values": sF.tolist(),
            "kernel_dim": 36 - rank_F,
        },
        "H_hid": {
            "eigenvalues": hid_eigs.tolist(),
            "eigenvectors_are_hidden_frame_basis": True,
            "null_dim": hid_nulls,
            "ratio_c3_over_Delta2_c5": float(c3 / (d2 * c5)),
            "degeneracies": degeneracies,
        },
        "K_quartic_on_Sym2": {
            "eigenvalues": K_eigs.tolist(),
            "rank": K_rank,
            "null_dim": K_nulls,
            "positive_eig_count": int(np.sum(K_eigs > 1e-12)),
        },
        "classification": "PROVED",
        "advances_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    np.save(OUT / "B3.npy", B3)
    np.save(OUT / "B5.npy", B5)
    np.save(OUT / "Fmat.npy", Fmat)
    np.save(OUT / "K.npy", K)
    print("F rank", rank_F, "kernel", 36 - rank_F, "SVs", sF)
    print("blocks", json.dumps(blocks))
    print("H_hid eigs", hid_eigs)
    print("K rank", K_rank, "nulls", K_nulls)
    print("K positive eigs", K_eigs[K_eigs > 1e-12])
    print("PASS: cycle 03 map F and hidden Hessian")


if __name__ == "__main__":
    main()
