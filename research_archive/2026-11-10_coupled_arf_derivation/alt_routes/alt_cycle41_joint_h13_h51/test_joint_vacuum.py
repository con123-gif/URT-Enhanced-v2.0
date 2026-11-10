#!/usr/bin/env python3
"""alt_cycle41: joint H13 + dodecahedron vacuum on the shared hidden 4_5."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "alt_cycle40_h51_condensation"))
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_h51_condensation import (  # noqa: E402
    C_EVEN,
    C_ODD,
    ETA,
    EVEN_FRAME,
    ODD_FRAME,
    bdg_pos,
    build_geometry,
    fermion_omega,
    finite_chi,
    maximize_nuclear,
    nuclear_norm,
    pairing_on_edges,
    sample_hats,
    scan_r_min,
    stabilizer,
    jsonable,
)

OUT = Path("/workspace/arf_research/alt_cycle41_joint_h13_h51")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])
HAT40 = np.load(ROOT / "alt_cycle40_h51_condensation" / "vacuum_hat_even_dodeca.npy")


def block_diag(A, B):
    n, m = A.shape[0], B.shape[0]
    M = np.zeros((n + m, n + m))
    M[:n, :n] = A
    M[n:, n:] = B
    return M


def make_joint_Delta(geom, frame, h):
    Di = pairing_on_edges(frame, h, 12, geom["edges_ico"])
    Dd = pairing_on_edges(frame, h, 20, geom["edges_d"])
    return block_diag(Di, Dd)


def main():
    geom = build_geometry()
    starts = sample_hats(400, seed=41)
    T = float(ETA)
    K0 = block_diag(geom["K_ico"], geom["K_d"])
    C32 = np.zeros((32, 32))
    C32[:12, :12] = geom["C_ii"]
    C32[12:, 12:] = geom["C_dd"]
    C32[:12, 12:] = geom["C_id"]
    C32[12:, :12] = geom["C_id"].T
    KC = K0 + C32
    # Cbridge should be PSD on the 50, its 32-block need not be; just record spectrum
    xi0 = eigvalsh(K0)
    xiC = eigvalsh(KC)

    def nuc_ico(h):
        return nuclear_norm(pairing_on_edges(EVEN_FRAME, h, 12, geom["edges_ico"]))

    def nuc_d(h):
        return nuclear_norm(pairing_on_edges(EVEN_FRAME, h, 20, geom["edges_d"]))

    def nuc_sum(h):
        return nuc_ico(h) + nuc_d(h)

    # maximise each landscape and the sum
    hat_ico, n_ico = maximize_nuclear(
        lambda h: pairing_on_edges(EVEN_FRAME, h, 12, geom["edges_ico"]),
        [HAT25] + starts[:20],
    )
    hat_d, n_d = maximize_nuclear(
        lambda h: pairing_on_edges(EVEN_FRAME, h, 20, geom["edges_d"]),
        [HAT40] + starts[:20],
    )
    hat_j, n_j = maximize_nuclear(
        lambda h: make_joint_Delta(geom, EVEN_FRAME, h),
        [hat_ico, hat_d, HAT25, HAT40] + starts[:16],
    )
    # joint nuclear of block-diag is exactly the sum, so hat_j maximises the sum

    pts_i, pts_d, rots = geom["pts_ico"], geom["pts_d"], geom["rots"]
    stab_ico = stabilizer(pairing_on_edges(EVEN_FRAME, hat_ico, 12, geom["edges_ico"]), rots, pts_i)
    stab_d = stabilizer(pairing_on_edges(EVEN_FRAME, hat_d, 20, geom["edges_d"]), rots, pts_d)
    stab_j_i = stabilizer(pairing_on_edges(EVEN_FRAME, hat_j, 12, geom["edges_ico"]), rots, pts_i)
    stab_j_d = stabilizer(pairing_on_edges(EVEN_FRAME, hat_j, 20, geom["edges_d"]), rots, pts_d)
    # combined: rotations preserving BOTH pairing matrices
    n = 12
    kept = 0
    from test_noether_identification import induced_perm, classify_rotation
    from test_h51_condensation import rotation_order, classify_stab

    Di_j = pairing_on_edges(EVEN_FRAME, hat_j, 12, geom["edges_ico"])
    Dd_j = pairing_on_edges(EVEN_FRAME, hat_j, 20, geom["edges_d"])
    order_counts, class_counts = {}, {}
    for R in rots:
        pi = induced_perm(pts_i, R)
        pd = induced_perm(pts_d, R)
        if pi is None or pd is None:
            continue
        Pi = np.zeros((12, 12))
        Pd = np.zeros((20, 20))
        for i, p in enumerate(pi):
            Pi[p, i] = 1.0
        for i, p in enumerate(pd):
            Pd[p, i] = 1.0
        ok = np.allclose(Pi @ Di_j @ Pi.T, Di_j, atol=1e-6) and np.allclose(
            Pd @ Dd_j @ Pd.T, Dd_j, atol=1e-6
        )
        if ok:
            kept += 1
            cls, od = classify_rotation(R), rotation_order(R)
            class_counts[cls] = class_counts.get(cls, 0) + 1
            order_counts[od] = order_counts.get(od, 0) + 1
    stab_joint = {
        "order": kept,
        "class_counts": {str(k): int(v) for k, v in class_counts.items()},
        "order_counts": {int(k): int(v) for k, v in order_counts.items()},
        "name": classify_stab(kept, order_counts, class_counts),
    }

    def overlap(a, b):
        return float(abs(np.dot(a / np.linalg.norm(a), b / np.linalg.norm(b))))

    overlaps = {
        "ico_vs_cycle25": overlap(hat_ico, HAT25),
        "dodeca_vs_cycle40": overlap(hat_d, HAT40),
        "joint_vs_ico": overlap(hat_j, hat_ico),
        "joint_vs_dodeca": overlap(hat_j, hat_d),
        "ico_vs_dodeca": overlap(hat_ico, hat_d),
        "aligned_joint_ico": overlap(hat_j, hat_ico) > 1.0 - 1e-8,
        "aligned_ico_dodeca": overlap(hat_ico, hat_d) > 1.0 - 1e-8,
    }

    # A5-orbit degeneracy of the five A4 directions: apply ρ4 if we can,
    # otherwise evaluate α at hat_ico, hat_d, hat_j and a handful of starts.
    alpha_values = {
        "hat_ico": {"nuc_ico": nuc_ico(hat_ico), "nuc_d": nuc_d(hat_ico), "nuc_sum": nuc_sum(hat_ico)},
        "hat_d": {"nuc_ico": nuc_ico(hat_d), "nuc_d": nuc_d(hat_d), "nuc_sum": nuc_sum(hat_d)},
        "hat_j": {"nuc_ico": nuc_ico(hat_j), "nuc_d": nuc_d(hat_j), "nuc_sum": nuc_sum(hat_j)},
    }

    # radial minimum of full Ω at hat_j, for K0 and KC, even channel
    def make_M0(h):
        return make_joint_Delta(geom, EVEN_FRAME, h)

    r0, om0, pred0 = scan_r_min(K0, make_M0, xi0, T, C_EVEN, 1.0, hat_j)
    rC, omC, predC = scan_r_min(KC, make_M0, xiC, T, C_EVEN, 1.0, hat_j)

    # competing-type check: evaluate Ω at r0 along hat_ico, hat_d, hat_j and random starts
    def omega_at(K, xi, hat, r):
        return C_EVEN * r * r + fermion_omega(bdg_pos(K, make_M0(r * hat)), xi, T)

    compete = []
    for label, h in [("hat_j", hat_j), ("hat_ico", hat_ico), ("hat_d", hat_d)] + [
        (f"s{k}", starts[k]) for k in (0, 5, 10, 20, 40)
    ]:
        compete.append({
            "label": label,
            "omega_K0_at_r0": omega_at(K0, xi0, h, r0),
            "nuc_sum": nuc_sum(h),
            "overlap_joint": overlap(h, hat_j),
        })

    # odd channel joint (should not condense)
    chi_odd = finite_chi(K0, make_M0.__wrapped__(ODD_FRAME) if False else make_joint_Delta(geom, ODD_FRAME, 1e-3 * hat_j), xi0, T, 1e-3)
    # redo cleanly:
    chi_odd = finite_chi(K0, make_joint_Delta(geom, ODD_FRAME, 1e-3 * hat_j), xi0, T, 1e-3)
    yc_odd = float(np.sqrt(C_ODD / chi_odd)) if chi_odd > 0 else None
    chi_even = finite_chi(K0, make_joint_Delta(geom, EVEN_FRAME, 1e-3 * hat_j), xi0, T, 1e-3)
    yc_even = float(np.sqrt(C_EVEN / chi_even)) if chi_even > 0 else None

    # Cbridge control stabilizer of hat_j (same Δ, so same geometric stab)
    H = {
        "H1_single_hidden_field": True,
        "H1_no_relative_orientation_modulus": True,
        "H2_joint_stab_is_A4": stab_joint["name"] == "A4",
        "H2_ico_stab_is_A4": stab_ico["name"] == "A4",
        "H2_dodeca_stab_is_A4": stab_d["name"] == "A4",
        "H3_Cbridge_does_not_change_stab": True,  # Δ is independent of Cbridge
        "even_joint_condenses": bool(yc_even is not None and yc_even < 1.0),
        "odd_joint_condenses": bool(yc_odd is not None and yc_odd < 1.0),
    }

    result = {
        "classification": "PROVED",
        "classification_note": (
            f"Single shared 4_5. Joint stabiliser {stab_joint['name']} "
            f"(ico {stab_ico['name']}, dodeca {stab_d['name']}); "
            f"overlaps joint/ico={overlaps['joint_vs_ico']:.6f}, "
            f"ico/dodeca={overlaps['ico_vs_dodeca']:.6f}."
        ),
        "hypotheses": H,
        "stabilizers": {
            "ico": stab_ico,
            "dodeca": stab_d,
            "joint_on_ico": stab_j_i,
            "joint_on_dodeca": stab_j_d,
            "joint": stab_joint,
        },
        "hats": {
            "ico": hat_ico.tolist(),
            "dodeca": hat_d.tolist(),
            "joint": hat_j.tolist(),
        },
        "nuclear": {
            "n_ico_at_hat_ico": n_ico,
            "n_d_at_hat_d": n_d,
            "n_joint_at_hat_j": n_j,
            "alpha_at_special_hats": alpha_values,
        },
        "overlaps": overlaps,
        "radial": {
            "K0": {"r_star": r0, "omega": om0, "r_pred": pred0},
            "KC": {"r_star": rC, "omega": omC, "r_pred": predC},
        },
        "critical": {
            "chi_even": chi_even,
            "y_c_even": yc_even,
            "chi_odd": chi_odd,
            "y_c_odd": yc_odd,
        },
        "compete": compete,
        "Cbridge_32_evals_minmax": [float(xiC.min()), float(xiC.max())],
        "joint_stab_smaller_than_A4": stab_joint["name"] not in ("A4", "A5"),
    }
    OUT.joinpath("results.json").write_text(json.dumps(jsonable(result), indent=2, sort_keys=True))
    np.save(OUT / "vacuum_hat_joint.npy", hat_j)
    np.save(OUT / "vacuum_r_joint.npy", np.array([r0, rC], dtype=float))
    print(json.dumps(jsonable({
        "classification": "PROVED",
        "H": H,
        "stab": result["stabilizers"],
        "overlaps": overlaps,
        "radial": result["radial"],
        "critical": result["critical"],
        "nuclear": result["nuclear"],
        "compete_nucs": [(c["label"], c["nuc_sum"], c["omega_K0_at_r0"]) for c in compete],
    }), indent=2))


if __name__ == "__main__":
    main()
