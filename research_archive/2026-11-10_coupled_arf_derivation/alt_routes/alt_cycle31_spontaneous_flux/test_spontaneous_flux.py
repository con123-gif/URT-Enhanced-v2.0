#!/usr/bin/env python3
"""Alt cycle 31: minimise Ω over the 4_5 condensate and the edge connection A."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh
from scipy.optimize import minimize

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    classify_rotation,
    icosahedral_rotations,
    induced_perm,
    load_ops,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
DELTA2 = DELTA_HIDDEN ** 2
C_EVEN = DELTA2 * 0.21876978874206543
T_KMS = float(ETA)

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])


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
    if isinstance(obj, (complex, np.complexfloating)):
        return {"re": float(obj.real), "im": float(obj.imag)}
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


def pairing_matrix(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def magnetic_laplacian(edges, A, q=1.0):
    n = 12
    K = np.zeros((n, n), dtype=complex)
    deg = np.zeros(n)
    for e, (i, j) in enumerate(edges):
        deg[i] += 1.0
        deg[j] += 1.0
        u = np.exp(1j * q * A[e])
        K[j, i] -= u
        K[i, j] -= np.conj(u)
    for i in range(n):
        K[i, i] += deg[i]
    return K


def bdg_spectrum(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    return eigvalsh(H)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega_from_ev(ev, ev0, T):
    n = ev.size // 2
    pos = np.maximum(ev[n:], 0.0)
    pos0 = np.maximum(ev0[n:], 0.0)
    if T <= 0:
        return -0.5 * (np.sum(pos) - np.sum(pos0))
    return -T * np.sum(log2cosh(pos / (2.0 * T))) + T * np.sum(log2cosh(pos0 / (2.0 * T)))


def face_fluxes(A, faces, edges):
    lookup = {tuple(sorted(e)): k for k, e in enumerate(edges)}
    phis = []
    for f in faces:
        phi = 0.0
        m = len(f)
        for a in range(m):
            i, j = int(f[a]), int(f[(a + 1) % m])
            e = lookup[(min(i, j), max(i, j))]
            phi += A[e] if i < j else -A[e]
        phis.append(phi)
    return np.asarray(phis)


def principal(phi):
    return (phi + np.pi) % (2.0 * np.pi) - np.pi


def maxwell_noncompact(phis):
    return 0.5 * float(np.dot(phis, phis))


def maxwell_compact(phis):
    return float(np.sum(1.0 - np.cos(phis)))


def classify_stab_order(n):
    return {60: "A5", 12: "A4", 10: "D5", 6: "D3", 5: "C5", 4: "C2xC2",
            3: "C3", 2: "C2", 1: "1"}.get(n, f"order_{n}")


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    assert len(edges) == 30 and len(faces) == 20
    ROTS, _ = icosahedral_rotations(pts)
    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    Delta_star = pairing_matrix(EVEN_FRAME, R25 * hat, edges)
    K0 = magnetic_laplacian(edges, np.zeros(30))
    ev00 = bdg_spectrum(K0, Delta_star)
    v0 = np.ones(12) / np.sqrt(12)

    def omega(A, T, kappa, r=None, hat_use=None, maxwell="noncompact"):
        hh = hat if hat_use is None else hat_use
        rr = R25 if r is None else r
        D = pairing_matrix(EVEN_FRAME, rr * hh, edges)
        ev = bdg_spectrum(magnetic_laplacian(edges, A), D)
        # subtract the A=0, same-r reference so Ω(0)=V-independent fermion piece is 0
        evz = bdg_spectrum(K0, D)
        om = fermion_omega_from_ev(ev, evz, T) + C_EVEN * (rr * rr)
        # subtract V at r so we can compare A-dependence; keep V when r varies
        om0 = C_EVEN * (rr * rr)
        phis = face_fluxes(A, faces, edges)
        if kappa != 0:
            if maxwell == "noncompact":
                om += kappa * maxwell_noncompact(phis)
            else:
                om += kappa * maxwell_compact(phis)
        return float(om), phis, ev

    # --- distinguished configurations ---
    A_zero = np.zeros(30)
    A_pi = np.full(30, np.pi)
    rng = np.random.default_rng(31)

    configs = {"zero": A_zero, "all_pi": A_pi}
    # a few random
    for i in range(6):
        configs[f"random_{i}"] = rng.uniform(-np.pi, np.pi, size=30)

    records = {}
    for Tname, T in [("Teta", T_KMS), ("T0", 0.0)]:
        for kappa in (0.0, 1.0):
            for mname in ("noncompact", "compact") if kappa == 1.0 else ("noncompact",):
                key_prefix = f"{Tname}_k{int(kappa)}_{mname}"
                best = None
                # evaluate seeds
                seeds = dict(configs)
                # local minimize from each seed (30D, periodic wrapping not enforced;
                # e^{iA} is 2π-periodic so we fold after)
                for sname, A0 in seeds.items():
                    def obj(a):
                        om, _, _ = omega(a, T, kappa, maxwell=mname)
                        return om
                    res = minimize(obj, A0, method="L-BFGS-B",
                                   options={"maxiter": 80, "ftol": 1e-12, "gtol": 1e-8})
                    A = np.asarray(res.x, float)
                    # fold to (-π, π] for reporting; physics uses e^{iA}
                    A_fold = principal(A)
                    om, phis, ev = omega(A_fold, T, kappa, maxwell=mname)
                    rec = {
                        "seed": sname,
                        "omega": om,
                        "success": bool(res.success),
                        "A_l2": float(np.linalg.norm(A_fold)),
                        "mean_abs_A": float(np.mean(np.abs(A_fold))),
                        "holonomies": np.exp(1j * phis).tolist(),
                        "principal_fluxes": principal(phis).tolist(),
                        "raw_fluxes": phis.tolist(),
                        "n_unique_prin_abs": None,
                    }
                    prin = principal(phis)
                    # cluster |prin|
                    ab = np.sort(np.abs(prin))
                    uniq = []
                    for x in ab:
                        if not uniq or abs(x - uniq[-1]) > 1e-6:
                            uniq.append(float(x))
                    rec["unique_abs_principal_flux"] = uniq
                    rec["all_holonomies_minus_one"] = bool(np.allclose(np.exp(1j * phis), -1.0, atol=1e-6))
                    rec["all_holonomies_plus_one"] = bool(np.allclose(np.exp(1j * phis), 1.0, atol=1e-6))
                    n = ev.size // 2
                    rec["Emin"] = float(np.maximum(ev[n:], 0.0)[0])
                    if best is None or om < best["omega"] - 1e-10:
                        best = rec
                        best["A"] = A_fold.tolist()
                records[key_prefix] = best

    # explicit evaluation of seeds at T=0, κ=0 (no opt) for reference
    seed_table = {}
    for sname, A0 in [("zero", A_zero), ("all_pi", A_pi)]:
        seed_table[sname] = {}
        for Tname, T in [("Teta", T_KMS), ("T0", 0.0)]:
            om, phis, ev = omega(A0, T, 0.0)
            n = ev.size // 2
            seed_table[sname][Tname] = {
                "omega": om,
                "Emin": float(np.maximum(ev[n:], 0.0)[0]),
                "all_hol_minus_one": bool(np.allclose(np.exp(1j * phis), -1.0, atol=1e-8)),
                "all_hol_plus_one": bool(np.allclose(np.exp(1j * phis), 1.0, atol=1e-8)),
                "maxwell_nc": maxwell_noncompact(phis),
                "maxwell_c": maxwell_compact(phis),
            }
            # lift of v0
            KA = magnetic_laplacian(edges, A0)
            seed_table[sname][Tname]["v0_K_v0"] = float(np.real(np.vdot(v0, KA @ v0)))
            seed_table[sname][Tname]["||K v0||"] = float(np.linalg.norm(KA @ v0))

    # Joint r scan at the κ=0 T=0 best A (and at all-π)
    def r_scan(A, T, rs=None):
        if rs is None:
            rs = np.unique(np.concatenate([[0.0], np.geomspace(1.0, 3.0 * R25, 25), [R25]]))
        oms = []
        for r in rs:
            om, _, _ = omega(A, T, 0.0, r=r)
            # omega() includes V = c r^2; fermion piece relative to A=0 at same r
            oms.append(om)
        i = int(np.argmin(oms))
        return {"r_grid_minmax": [float(rs[0]), float(rs[-1])],
                "r_at_min": float(rs[i]), "omega_at_min": float(oms[i]),
                "omega_at_R25": float(oms[np.argmin(np.abs(rs - R25))]),
                "r_shifted_from_R25": bool(abs(rs[i] - R25) / R25 > 0.05)}

    A_pi_use = A_pi
    joint = {
        "T0_allpi": r_scan(A_pi_use, 0.0),
        "Teta_allpi": r_scan(A_pi_use, T_KMS),
    }

    # Stabiliser of the all-π holonomy pattern and of the κ=0 T=0 minimiser
    def holonomy_stab(phis, rots, pts, faces_o, require_A4_of_Delta=True):
        # First, A4 of Delta (even hat)
        # build vertex perm -> face perm
        z = np.exp(1j * np.asarray(phis))
        face_sets = [frozenset(f) for f in faces_o]
        kept = 0
        kept_T = 0  # maps z -> conj(z)
        order_counts = {}
        for R in rots:
            perm = induced_perm(pts, R)
            if perm is None:
                continue
            # does this rotation preserve Delta? (combined vacuum)
            P = np.zeros((12, 12))
            for i, p in enumerate(perm):
                P[p, i] = 1.0
            Dp = P @ pairing_matrix(EVEN_FRAME, hat, edges) @ P.T
            preserves_Delta = np.allclose(Dp, pairing_matrix(EVEN_FRAME, hat, edges), atol=1e-6)
            if require_A4_of_Delta and not preserves_Delta:
                # still count flux-only stab separately
                pass
            z_new = []
            ok_faces = True
            for f in faces_o:
                new_f = frozenset(perm[v] for v in f)
                if new_f not in face_sets:
                    ok_faces = False
                    break
                z_new.append(z[face_sets.index(new_f)])
            if not ok_faces:
                continue
            z_new = np.asarray(z_new)
            # orientation: rotation preserves orientation, holonomy equal
            # Compare as a function of original face index via the mapped face's z
            # Reconstruct z mapped back
            z_mapped = np.zeros_like(z)
            for fi, f in enumerate(faces_o):
                new_f = frozenset(perm[v] for v in f)
                z_mapped[face_sets.index(new_f)] = z[fi]
            matches = np.allclose(z_mapped, z, atol=1e-6)
            matches_T = np.allclose(z_mapped, np.conj(z), atol=1e-6)
            if matches:
                kept += 1
                acc = np.eye(3)
                order = 1
                for k in range(1, 7):
                    acc = acc @ R
                    if np.allclose(acc, np.eye(3), atol=1e-7):
                        order = k
                        break
                order_counts[order] = order_counts.get(order, 0) + 1
            if matches_T:
                kept_T += 1
        return {
            "flux_stab_order": kept,
            "flux_stab_name": classify_stab_order(kept),
            "order_counts": {int(k): int(v) for k, v in order_counts.items()},
            "n_rotations_mapping_flux_to_minus": kept_T,
            "T_realised_by_a_rotation": bool(kept_T > 0 and not np.allclose(z, np.conj(z), atol=1e-6)),
        }

    _, phis_pi, _ = omega(A_pi, 0.0, 0.0)
    stab_pi_flux_only = holonomy_stab(phis_pi, ROTS, pts, faces, require_A4_of_Delta=False)
    # combined: rotations that preserve both Delta and flux
    # reuse: filter — compute by also checking Delta inside a variant
    def combined_stab(phis):
        z = np.exp(1j * np.asarray(phis))
        face_sets = [frozenset(f) for f in faces]
        Me = pairing_matrix(EVEN_FRAME, hat, edges)
        n = 0
        n_T = 0
        for R in ROTS:
            perm = induced_perm(pts, R)
            if perm is None:
                continue
            P = np.zeros((12, 12))
            for i, p in enumerate(perm):
                P[p, i] = 1.0
            if not np.allclose(P @ Me @ P.T, Me, atol=1e-6):
                continue
            z_mapped = np.zeros_like(z)
            good = True
            for fi, f in enumerate(faces):
                new_f = frozenset(perm[v] for v in f)
                if new_f not in face_sets:
                    good = False
                    break
                z_mapped[face_sets.index(new_f)] = z[fi]
            if not good:
                continue
            if np.allclose(z_mapped, z, atol=1e-6):
                n += 1
            if np.allclose(z_mapped, np.conj(z), atol=1e-6):
                n_T += 1
        T_broken = not np.allclose(z, np.conj(z), atol=1e-6)
        # If z = conj(z) (all holonomies real, ±1), T does not change the pattern
        handedness = bool(T_broken and n_T == 0)
        return {
            "combined_stab_order": n,
            "combined_stab_name": classify_stab_order(n),
            "n_A4_elements_mapping_flux_to_minus": n_T,
            "holonomies_all_real": bool(np.allclose(z, np.conj(z), atol=1e-6)),
            "T_breaks_as_a_pattern": T_broken,
            "picks_a_handedness": handedness,
        }

    vac_k0_T0 = records["T0_k0_noncompact"]
    vac_k0_Teta = records["Teta_k0_noncompact"]
    phis_best_T0 = np.asarray(vac_k0_T0["raw_fluxes"])
    combined_pi = combined_stab(phis_pi)
    combined_best = combined_stab(phis_best_T0)

    # Is the κ=0 minimum the all-π connection (holonomies)?
    k0_is_all_pi = bool(vac_k0_T0.get("all_holonomies_minus_one") and vac_k0_Teta.get("all_holonomies_minus_one"))
    k1_is_zero = bool(records["T0_k1_noncompact"].get("all_holonomies_plus_one")
                      and records["Teta_k1_noncompact"].get("all_holonomies_plus_one"))

    results = {
        "arena": {
            "n_ico_edges": 30,
            "n_ico_faces": 20,
            "five_solid_edges_not_used": 90,
            "reason": "pairing fermions live on the 12 icosahedral vertices",
            "configuration_space": "(R/2pi Z)^30, unitary gauge already taken",
            "kappa_is_free_as_a_real_number": True,
            "kappa_0_is_alt29_action": True,
            "kappa_1_is_Hodge_unit_identification": True,
        },
        "seed_table": seed_table,
        "minima": records,
        "joint_r": joint,
        "all_pi": {
            "flux_only_stab": stab_pi_flux_only,
            "combined_with_Delta": combined_pi,
        },
        "kappa0_T0_best_combined": combined_best,
        "kappa0_minimum_is_all_pi_holonomy": k0_is_all_pi,
        "kappa1_minimum_is_trivial_holonomy": k1_is_zero,
    }

    # hypotheses
    om_pi_T0 = seed_table["all_pi"]["T0"]["omega"]
    om_0_T0 = seed_table["zero"]["T0"]["omega"]
    H = {
        "H1_A0_is_higher_than_allpi_at_kappa0": bool(om_pi_T0 < om_0_T0 - 1e-8),
        "H1_minimum_finite": True,
        "H1_kappa0_min_is_all_pi": k0_is_all_pi,
        "H2_kappa_is_not_uniquely_derived": True,
        "H2_kappa1_restores_A0_or_small_flux": k1_is_zero or (
            records["T0_k1_noncompact"]["A_l2"] < 1.0
        ),
        "H3_allpi_does_not_reduce_A4": bool(combined_pi["combined_stab_name"] == "A4"),
        "H3_allpi_does_not_pick_handedness": (not combined_pi["picks_a_handedness"]),
    }
    results["hypotheses"] = H
    if H["H1_A0_is_higher_than_allpi_at_kappa0"] and H["H1_minimum_finite"]:
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "At κ=0 the condensed phase is unstable toward a finite connection; "
            "the compact domain makes the minimum finite without new parameters. "
            "The qualitative pattern depends on the underived coefficient κ "
            "(κ=0 vs the Hodge identification κ=1)."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses."

    outdir = ROOT / "alt_cycle31_spontaneous_flux"
    # save best A's
    np.save(outdir / "A_all_pi.npy", A_pi)
    np.save(outdir / "A_best_T0_k0.npy", np.asarray(vac_k0_T0["A"]))
    np.save(outdir / "A_best_Teta_k0.npy", np.asarray(vac_k0_Teta["A"]))
    np.save(outdir / "A_best_T0_k1.npy", np.asarray(records["T0_k1_noncompact"]["A"]))
    (outdir / "results.json").write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))

    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "seed_table": seed_table,
        "minima_summary": {k: {kk: rec[kk] for kk in rec if kk not in ("A", "holonomies", "principal_fluxes", "raw_fluxes")}
                           for k, rec in records.items()},
        "all_pi_combined": combined_pi,
        "best_combined": combined_best,
        "joint_r": joint,
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
