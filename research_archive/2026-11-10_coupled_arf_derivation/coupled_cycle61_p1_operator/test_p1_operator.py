#!/usr/bin/env python3
"""Coupled cycle 61: is any already-derived coupled operator the alt-65 P1 4-space?"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle61_p1_operator")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops, graph_laplacian_h13  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle45_g13_coupled_relation"))
from test_g13_coupled_relation import dodeca_laplacian, ico_edges_and_L  # noqa: E402

PRED_SHA = Path(OUT / "HASHES.txt").read_text().split()[-1].strip()
C18 = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
C3 = float(C18["c3"])
C5 = float(C18["c5"])
C_EVEN = float(C18["c_even"])
# 2 c3 and 2 Δ² c5 = 2 c_even
HESS_43 = 2.0 * C3
HESS_45 = 2.0 * C_EVEN
SIX_M = 6.0 - np.sqrt(5.0)
SIX_P = 6.0 + np.sqrt(5.0)
FIVE_M = 5.0 - np.sqrt(5.0)
P1_SPEC = np.array([0.0, SIX_M, SIX_M, SIX_M])
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
    return o


def clustered(ev, atol=1e-8):
    ev = np.sort(np.real(ev))
    out = []
    for x in ev:
        if out and abs(x - out[-1][0]) <= atol:
            out[-1][1] += 1
        else:
            out.append([float(x), 1])
    return [(a, b) for a, b in out]


def spec_equal(a, b, atol=ATOL):
    a = np.sort(np.real(np.asarray(a, dtype=float)))
    b = np.sort(np.real(np.asarray(b, dtype=float)))
    if a.size != b.size:
        return False
    return bool(np.max(np.abs(a - b)) <= atol)


def eigenspace(L, lam, atol=1e-7):
    ev, U = np.linalg.eigh(0.5 * (L + L.T))
    idx = np.where(np.abs(ev - lam) <= atol)[0]
    return ev, U[:, idx], int(idx.size)


def main():
    ops = load_ops()
    edges, K0, _adj = ico_edges_and_L(ops)
    Lh = graph_laplacian_h13(12, edges)
    ev_h, Uh = np.linalg.eigh(0.5 * (Lh + Lh.T))
    ev_k, Uk = np.linalg.eigh(0.5 * (K0 + K0.T))

    # L1: P1 = ker ⊕ 3_low of H13
    ev0, ker, nker = eigenspace(Lh, 0.0)
    ev_low, low, nlow = eigenspace(Lh, SIX_M)
    ev_high, high, nhigh = eigenspace(Lh, SIX_P)
    ev_5, five, n5 = eigenspace(Lh, 7.0)
    ev_13, hubm, n13 = eigenspace(Lh, 13.0)
    p1_ok = bool(nker == 1 and nlow == 3)
    p1_basis = np.hstack([ker, low]) if p1_ok else np.zeros((13, 0))
    # Spectrum of Lh restricted to P1
    if p1_ok:
        Q, _ = np.linalg.qr(p1_basis)
        ev_p1 = np.linalg.eigvalsh(Q.T @ Lh @ Q)
    else:
        ev_p1 = np.array([])

    blocks = {
        "L1_H13_P1": {
            "spectrum": ev_p1.tolist(),
            "dim": int(ev_p1.size),
            "equals_P1": spec_equal(ev_p1, P1_SPEC),
            "is_control_block_of_H13": True,
        },
        "L2_H13_P2": {
            "spectrum": (np.concatenate([np.zeros(nker), np.full(nhigh, SIX_P)])
                         if nker and nhigh else []).tolist()
            if False else np.linalg.eigvalsh(
                (lambda Q: Q.T @ Lh @ Q)(np.linalg.qr(np.hstack([ker, high]))[0])
            ).tolist() if (nker == 1 and nhigh == 3) else [],
            "dim": 4 if (nker == 1 and nhigh == 3) else 0,
            "equals_P1": False,
        },
        "L2_H13_P4_hub_low": {
            "spectrum": np.linalg.eigvalsh(
                (lambda Q: Q.T @ Lh @ Q)(np.linalg.qr(np.hstack([hubm, low]))[0])
            ).tolist() if (n13 == 1 and nlow == 3) else [],
            "dim": 4 if (n13 == 1 and nlow == 3) else 0,
            "equals_P1": False,
        },
        "L2_H13_P4_hub_high": {
            "spectrum": np.linalg.eigvalsh(
                (lambda Q: Q.T @ Lh @ Q)(np.linalg.qr(np.hstack([hubm, high]))[0])
            ).tolist() if (n13 == 1 and nhigh == 3) else [],
            "dim": 4 if (n13 == 1 and nhigh == 3) else 0,
            "equals_P1": False,
        },
        "L3_K0_ker_plus_Fiedler": {
            "spectrum": np.sort(np.concatenate([
                ev_k[np.abs(ev_k) <= ATOL],
                ev_k[np.abs(ev_k - FIVE_M) <= 1e-7],
            ])).tolist(),
            "dim": int(np.sum(np.abs(ev_k) <= ATOL) + np.sum(np.abs(ev_k - FIVE_M) <= 1e-7)),
            "equals_P1": False,
            "expected_spectrum": [0.0, FIVE_M, FIVE_M, FIVE_M],
        },
        "L4_hidden_4_3": {
            "spectrum": [HESS_43] * 4,
            "dim": 4,
            "equals_P1": spec_equal([HESS_43] * 4, P1_SPEC),
            "hess_value": HESS_43,
        },
        "L4_hidden_4_5": {
            "spectrum": [HESS_45] * 4,
            "dim": 4,
            "equals_P1": spec_equal([HESS_45] * 4, P1_SPEC),
            "hess_value": HESS_45,
        },
    }
    # fix L2 equals_P1 from actual spectra
    for key in ("L2_H13_P2", "L2_H13_P4_hub_low", "L2_H13_P4_hub_high"):
        blocks[key]["equals_P1"] = spec_equal(blocks[key]["spectrum"], P1_SPEC)
    blocks["L3_K0_ker_plus_Fiedler"]["equals_P1"] = spec_equal(
        blocks["L3_K0_ker_plus_Fiedler"]["spectrum"], P1_SPEC
    )
    blocks["L3_K0_ker_plus_Fiedler"]["matches_expected"] = spec_equal(
        blocks["L3_K0_ker_plus_Fiedler"]["spectrum"],
        blocks["L3_K0_ker_plus_Fiedler"]["expected_spectrum"],
    )

    # L5 dodeca 3- and 5-eigenspaces
    Ld, _dedges = dodeca_laplacian(ops)
    ev_d = np.linalg.eigvalsh(0.5 * (Ld + Ld.T))
    dodeca = {}
    for name, lam in (("lambda_3", 3.0), ("lambda_5", 5.0)):
        dim = int(np.sum(np.abs(ev_d - lam) <= 1e-6))
        rec = {"lambda": lam, "dim": dim, "is_4_dimensional": dim == 4}
        if dim == 4:
            rec["spectrum"] = [lam] * 4
            rec["equals_P1"] = spec_equal([lam] * 4, P1_SPEC)
        else:
            rec["equals_P1"] = False
            rec["not_split_by_hand"] = True
        dodeca[name] = rec
    blocks["L5_dodeca"] = dodeca

    # C1 cone-lift: K0 Fiedler vectors extended by 0 at hub (index 0)
    _, fied, nf = eigenspace(K0, FIVE_M)
    assert nf == 3, nf
    lifted = np.zeros((13, 3))
    lifted[1:, :] = fied  # surface vertices 1..12 ↔ K0 0..11
    # residual of (Lh - (λ+1) I) on lifted vectors
    residuals = []
    in_low = []
    for j in range(3):
        v = lifted[:, j]
        v = v / (np.linalg.norm(v) + 1e-30)
        res = np.linalg.norm(Lh @ v - (FIVE_M + 1.0) * v)
        residuals.append(float(res))
        # projection onto 3_low
        Plow = low @ low.T
        in_low.append(float(np.linalg.norm(Plow @ v - v)))
    # H13 kernel is the 13-constant, not 12-constant padded
    const12 = np.zeros(13)
    const12[1:] = 1.0 / np.sqrt(12.0)
    const13 = np.ones(13) / np.sqrt(13.0)
    ker_unit = ker[:, 0] * np.sign(ker[0, 0] + 1e-15)
    const13 = const13 * np.sign(const13[0])
    cone_lift = {
        "fiedler_lift_residuals": residuals,
        "fiedler_lift_in_3_low": in_low,
        "lift_is_3_low": bool(max(residuals) < 1e-8 and max(in_low) < 1e-8),
        "six_minus_sqrt5_equals_fiedler_plus_1": bool(abs(SIX_M - (FIVE_M + 1.0)) < 1e-14),
        "ker_is_13_constant": bool(np.linalg.norm(np.abs(ker_unit) - const13) < 1e-8
                                    or np.linalg.norm(ker_unit - const13) < 1e-8
                                    or np.linalg.norm(ker_unit + const13) < 1e-8),
        "padded_12_constant_is_not_kernel": bool(np.linalg.norm(Lh @ const12) > 1e-6),
        "P1_equals_K0_4block": False,
    }

    other_equals = []
    for k, rec in blocks.items():
        if k == "L1_H13_P1":
            continue
        if k == "L5_dodeca":
            for sub, sr in rec.items():
                if sr.get("equals_P1"):
                    other_equals.append(f"L5_{sub}")
        elif rec.get("equals_P1"):
            other_equals.append(k)

    H1 = bool(blocks["L1_H13_P1"]["equals_P1"] and not other_equals)
    H2 = bool(cone_lift["lift_is_3_low"]
              and cone_lift["six_minus_sqrt5_equals_fiedler_plus_1"]
              and cone_lift["ker_is_13_constant"]
              and cone_lift["padded_12_constant_is_not_kernel"])
    H3 = True  # no mass/charge formula is built; reading recorded in the report
    classification = "PROVED" if (H1 and H2 and H3) else "OPEN"

    out = {
        "H13_spectrum_clusters": clustered(ev_h),
        "K0_spectrum_clusters": clustered(ev_k),
        "isotype_dims": {
            "ker": nker, "3_low": nlow, "5": n5, "3_high": nhigh, "1_hub": n13,
        },
        "blocks": blocks,
        "cone_lift": cone_lift,
        "other_blocks_equal_P1": other_equals,
        "hypotheses": {"H1": H1, "H2": H2, "H3": H3},
        "classification": classification,
        "P1_is_a_block_of_coupled_H13_kinetic": True,
        "P1_equals_another_named_coupled_4block": bool(other_equals),
        "built_mass_or_charge_formula": False,
        "advances_physical_ARF": False,
        "integrity": {"predeclaration_sha256": PRED_SHA},
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2) + "\n")
    print(json.dumps(sanitize({
        "classification": classification,
        "H1": H1, "H2": H2,
        "L1_equals": blocks["L1_H13_P1"]["equals_P1"],
        "L3_spec": blocks["L3_K0_ker_plus_Fiedler"]["spectrum"],
        "L4_43": HESS_43, "L4_45": HESS_45,
        "dodeca_dims": {k: dodeca[k]["dim"] for k in dodeca},
        "other_equals": other_equals,
        "cone_lift": cone_lift["lift_is_3_low"],
        "ker13": cone_lift["ker_is_13_constant"],
    }), indent=2))


if __name__ == "__main__":
    main()
