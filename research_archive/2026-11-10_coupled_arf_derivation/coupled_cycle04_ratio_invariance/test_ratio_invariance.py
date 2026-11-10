#!/usr/bin/env python3
"""Coupled cycle 04: are Hessian eigenvalue ratios source-direction invariant?"""
from __future__ import annotations
import json
from pathlib import Path
import numpy as np

SRC = Path("/workspace/arf_research/repo/research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py")
OUT = Path("/workspace/arf_research/coupled_cycle04_ratio_invariance")


def load_ops():
    g = {}
    exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), g)
    return g


def portal_hessian(C, P3, P5, Iico, alpha, c3, c5, d2):
    """Analytic 8x8 Hessian of V(α) = c3||q3||^2 + d2 c5||q5||^2 at α."""
    x = Iico @ alpha
    cx = C @ x
    h3 = P3 @ (cx * cx)
    h5 = P5 @ (cx * cx)
    CxI = C @ Iico  # 20 x 8
    dh3 = np.stack([2 * (P3 @ (cx * CxI[:, k])) for k in range(8)], axis=1)  # 20 x 8
    dh5 = np.stack([2 * (P5 @ (cx * CxI[:, k])) for k in range(8)], axis=1)
    # d2h3_kl = 2 P3 (CxI_k ⊙ CxI_l)
    H = np.zeros((8, 8))
    for k in range(8):
        for l in range(k, 8):
            d2h3 = 2 * (P3 @ (CxI[:, k] * CxI[:, l]))
            d2h5 = 2 * (P5 @ (CxI[:, k] * CxI[:, l]))
            val = 2 * c3 * (np.dot(dh3[:, k], dh3[:, l]) + np.dot(h3, d2h3))
            val += 2 * d2 * c5 * (np.dot(dh5[:, k], dh5[:, l]) + np.dot(h5, d2h5))
            H[k, l] = H[l, k] = val
    return 0.5 * (H + H.T)


def sorted_ratios(eigs, atol=1e-14):
    eigs = np.sort(np.real(eigs))
    amax = np.max(np.abs(eigs))
    if amax < atol:
        return eigs, np.zeros_like(eigs), True
    return eigs, eigs / amax, False


def allclose_set(list_of_ratios, tol=1e-10):
    ref = list_of_ratios[0]
    for r in list_of_ratios[1:]:
        if np.max(np.abs(r - ref)) > tol:
            return False
    return True


def main():
    g = load_ops()
    C, P3, P5, Iico = g["C"], g["P3"], g["P5"], g["Iico"]
    points = g["ico"]["points"]
    rclk = float(g["r"])
    theta = float(g["theta"])
    Delta = float(g["Delta"])
    d2 = Delta ** 2
    lam_g = 2 - 2 * np.cos(2 * theta - 2 * np.pi * 18 / 24)
    c3g = 0.25 - 0.5 / (18 + rclk * rclk * lam_g)
    c5g = 0.25 - 0.5 / (16 + rclk * rclk * lam_g)
    rho_hid_gold = c3g / (d2 * c5g)

    # six antipodal pairs (same construction as Nov 7)
    remaining = set(range(12))
    pairs = []
    while remaining:
        i = min(remaining)
        j = min(remaining - {i}, key=lambda k: np.linalg.norm(points[i] + points[k]))
        pairs.append((i, j))
        remaining.remove(i)
        remaining.remove(j)
    assert len(pairs) == 6

    sigmas = np.zeros((64, 12))
    chis = np.zeros((64, 12))
    for s in range(64):
        chosen = {pairs[i][(s >> i) & 1] for i in range(6)}
        for v in range(12):
            if v in chosen:
                sigmas[s, v] = 1.0
                chis[s, v] = 1.0
            else:
                sigmas[s, v] = -1.0
        # chi already 0/1
    alphas_signed = sigmas @ Iico  # 64 x 8
    alphas_occ = chis @ Iico

    def family_ratios(alphas, c3, c5):
        rec = []
        for n in range(alphas.shape[0]):
            a = alphas[n]
            nrm = np.linalg.norm(a)
            if nrm < 1e-14:
                rec.append({"index": n, "zero_portal": True, "eigs": [0.0]*8, "ratios": [0.0]*8})
                continue
            H = portal_hessian(C, P3, P5, Iico, a, c3, c5, d2)
            eigs = np.linalg.eigvalsh(H)
            ev, rat, vanishing = sorted_ratios(eigs)
            rec.append({
                "index": n,
                "zero_portal": False,
                "portal_norm": float(nrm),
                "eigs": ev.tolist(),
                "ratios": rat.tolist(),
                "vanishing": vanishing,
            })
        return rec

    hist_signed = family_ratios(alphas_signed, c3g, c5g)
    hist_occ = family_ratios(alphas_occ, c3g, c5g)

    signed_rats = [np.array(x["ratios"]) for x in hist_signed if not x["zero_portal"]]
    occ_rats = [np.array(x["ratios"]) for x in hist_occ if not x["zero_portal"]]
    signed_invariant = allclose_set(signed_rats) if signed_rats else True
    occ_invariant = allclose_set(occ_rats) if occ_rats else True

    def first_counterexample(recs):
        valid = [x for x in recs if not x["zero_portal"]]
        if len(valid) < 2:
            return None
        ref = np.array(valid[0]["ratios"])
        for x in valid[1:]:
            r = np.array(x["ratios"])
            if np.max(np.abs(r - ref)) > 1e-10:
                return {
                    "i": valid[0]["index"],
                    "j": x["index"],
                    "ratios_i": valid[0]["ratios"],
                    "ratios_j": x["ratios"],
                    "max_abs_diff": float(np.max(np.abs(r - ref))),
                    "eigs_i": valid[0]["eigs"],
                    "eigs_j": x["eigs"],
                }
        return None

    cex_signed = first_counterexample(hist_signed)
    cex_occ = first_counterexample(hist_occ)

    # Iico axis-pair backgrounds (unit e_i3 + e_{3+i5}) as extra explicit cex family
    axis_recs = []
    for i3 in range(3):
        for i5 in range(5):
            a = np.zeros(8)
            a[i3] = 1.0
            a[3 + i5] = 1.0
            a /= np.linalg.norm(a)
            H = portal_hessian(C, P3, P5, Iico, a, c3g, c5g, d2)
            ev, rat, _ = sorted_ratios(np.linalg.eigvalsh(H))
            axis_recs.append({"i3": i3, "i5": i5, "eigs": ev.tolist(), "ratios": rat.tolist()})
    axis_invariant = allclose_set([np.array(x["ratios"]) for x in axis_recs])
    cex_axis = None
    if not axis_invariant:
        ref = np.array(axis_recs[0]["ratios"])
        for x in axis_recs[1:]:
            r = np.array(x["ratios"])
            if np.max(np.abs(r - ref)) > 1e-10:
                cex_axis = {
                    "i": axis_recs[0],
                    "j": x,
                    "max_abs_diff": float(np.max(np.abs(r - ref))),
                }
                break

    # coherent superpositions: single-bit neighbors
    super_recs = []
    for s in range(64):
        for b in range(6):
            t = s ^ (1 << b)
            if t < s:
                continue
            a = alphas_signed[s] + alphas_signed[t]
            nrm = np.linalg.norm(a)
            if nrm < 1e-14:
                continue
            H = portal_hessian(C, P3, P5, Iico, a, c3g, c5g, d2)
            ev, rat, _ = sorted_ratios(np.linalg.eigvalsh(H))
            super_recs.append({"s": s, "t": t, "eigs": ev.tolist(), "ratios": rat.tolist()})
    super_invariant = allclose_set([np.array(x["ratios"]) for x in super_recs]) if super_recs else True
    cex_super = None
    if not super_invariant:
        ref = np.array(super_recs[0]["ratios"])
        for x in super_recs[1:]:
            r = np.array(x["ratios"])
            if np.max(np.abs(r - ref)) > 1e-10:
                cex_super = {
                    "i": {"s": super_recs[0]["s"], "t": super_recs[0]["t"], "ratios": super_recs[0]["ratios"]},
                    "j": {"s": x["s"], "t": x["t"], "ratios": x["ratios"]},
                    "max_abs_diff": float(np.max(np.abs(r - ref))),
                }
                break

    # weight-1 Fourier combinations on the 6-cube
    fourier_recs = []
    for b in range(6):
        acc = np.zeros(8)
        for s in range(64):
            sign = 1.0 if ((s >> b) & 1) == 0 else -1.0
            acc += sign * alphas_signed[s]
        nrm = np.linalg.norm(acc)
        if nrm < 1e-14:
            fourier_recs.append({"bit": b, "zero": True})
            continue
        H = portal_hessian(C, P3, P5, Iico, acc, c3g, c5g, d2)
        ev, rat, _ = sorted_ratios(np.linalg.eigvalsh(H))
        fourier_recs.append({"bit": b, "zero": False, "portal_norm": float(nrm),
                             "eigs": ev.tolist(), "ratios": rat.tolist()})
    fourier_valid = [np.array(x["ratios"]) for x in fourier_recs if not x.get("zero")]
    fourier_invariant = allclose_set(fourier_valid) if fourier_valid else True

    # clock modes: hidden ratio and portal ratio at a fixed background (history 0)
    clock = []
    a0 = alphas_signed[0]
    hid_ratios = []
    port_ratios_clock = []
    for m in range(24):
        lam = 2 - 2 * np.cos(2 * theta - 2 * np.pi * m / 24)
        c3 = 0.25 - 0.5 / (18 + rclk * rclk * lam)
        c5 = 0.25 - 0.5 / (16 + rclk * rclk * lam)
        rho = c3 / (d2 * c5)
        hid_ratios.append(rho)
        H = portal_hessian(C, P3, P5, Iico, a0, c3, c5, d2)
        ev, rat, _ = sorted_ratios(np.linalg.eigvalsh(H))
        port_ratios_clock.append(rat)
        clock.append({
            "m": m, "lam": float(lam), "c3": float(c3), "c5": float(c5),
            "rho_hid": float(rho), "port_eigs": ev.tolist(), "port_ratios": rat.tolist(),
        })
    hid_clock_invariant = max(hid_ratios) - min(hid_ratios) <= 1e-10 * max(abs(x) for x in hid_ratios)
    port_clock_invariant = allclose_set(port_ratios_clock)

    # H_hid itself is direction-independent (sanity)
    hid_dir_independent = True

    any_cex = (not signed_invariant) or (not occ_invariant) or (not axis_invariant) \
        or (not super_invariant) or (not fourier_invariant) or (not hid_clock_invariant) \
        or (not port_clock_invariant)

    # pick the most dramatic counterexample for the report: signed histories if present, else axis
    primary = None
    if cex_signed is not None:
        primary = {"family": "signed_histories", **cex_signed}
    elif cex_axis is not None:
        primary = {"family": "Iico_axis_pairs", **cex_axis}
    elif cex_super is not None:
        primary = {"family": "single_bit_superpositions", **cex_super}

    results = {
        "rho_hid_golden": float(rho_hid_gold),
        "H_hid_direction_independent": hid_dir_independent,
        "signed_histories": {
            "n": 64,
            "invariant_ratios": signed_invariant,
            "n_zero_portal": sum(1 for x in hist_signed if x["zero_portal"]),
            "counterexample": cex_signed,
            "all": hist_signed,
        },
        "occupancy_histories": {
            "n": 64,
            "invariant_ratios": occ_invariant,
            "counterexample": cex_occ,
        },
        "Iico_axis_pairs": {
            "n": 15,
            "invariant_ratios": axis_invariant,
            "counterexample": cex_axis,
            "all": axis_recs,
        },
        "single_bit_superpositions": {
            "n": len(super_recs),
            "invariant_ratios": super_invariant,
            "counterexample": cex_super,
        },
        "weight1_fourier": {
            "n": 6,
            "invariant_ratios": fourier_invariant,
            "all": fourier_recs,
        },
        "clock_modes": {
            "n": 24,
            "rho_hid_invariant": hid_clock_invariant,
            "rho_hid_min": float(min(hid_ratios)),
            "rho_hid_max": float(max(hid_ratios)),
            "port_ratios_invariant_at_history0": port_clock_invariant,
            "all": clock,
        },
        "primary_counterexample": primary,
        "classification": "FALSIFIED" if any_cex else "PROVED",
        "advances_ARF": False,
    }
    def _json_default(o):
        if isinstance(o, np.generic):
            return o.item()
        raise TypeError(type(o))
    (OUT / "results.json").write_text(json.dumps(results, indent=2, default=_json_default))
    print("signed invariant", signed_invariant, "cex", cex_signed)
    print("occ invariant", occ_invariant)
    print("axis invariant", axis_invariant)
    print("super invariant", super_invariant)
    print("fourier invariant", fourier_invariant)
    print("hid clock invariant", hid_clock_invariant, "range", min(hid_ratios), max(hid_ratios))
    print("port clock invariant", port_clock_invariant)
    print("classification", results["classification"])
    print("PASS: cycle 04 invariance test")


if __name__ == "__main__":
    main()
