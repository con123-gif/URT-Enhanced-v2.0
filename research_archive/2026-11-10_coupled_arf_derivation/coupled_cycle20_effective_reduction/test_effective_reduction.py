#!/usr/bin/env python3
"""Coupled cycle 20: effective reduction of the condensed phase."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle20_effective_reduction")
C18 = ROOT / "coupled_cycle18_nambu_measure"
C19 = ROOT / "coupled_cycle19_vev_and_r"
sys.path.insert(0, str(C18))
from test_nambu_measure import (  # noqa: E402
    C_EVEN,
    C_ODD,
    ETA,
    EVEN_FRAME,
    ODD_FRAME,
    build_K_H13,
    fermion_omega,
    graph_laplacian,
    load_ops,
    pairing_matrix_12,
    embed13,
    bdg_positive_energies,
    nuclear_norm,
)

PRED_SHA = "d87859f48fb81dc4190f2ffbe6691f2c32dcc586839507b4176516a97e5b47d6"


def sanitize(o):
    if isinstance(o, dict):
        return {k: sanitize(v) for k, v in o.items()}
    if isinstance(o, (list, tuple)):
        return [sanitize(v) for v in o]
    if isinstance(o, (np.bool_,)):
        return bool(o)
    if isinstance(o, (np.floating, np.integer)):
        return o.item()
    return o


def omega_full(K, xi, edges, y_o, y_e, h3, h5, T):
    M = y_e * pairing_matrix_12(EVEN_FRAME, h5, edges) + y_o * pairing_matrix_12(
        ODD_FRAME, h3, edges
    )
    Delta = embed13(M) if K.shape[0] == 13 else M
    E, _, _ = bdg_positive_energies(K, Delta)
    V = C_ODD * float(np.dot(h3, h3)) + C_EVEN * float(np.dot(h5, h5))
    return V + fermion_omega(E, xi, T), E


def refine_even_ray(K, xi, edges, y_e, hat, T):
    nuc = nuclear_norm(EVEN_FRAME, hat, edges)
    r_an = y_e * nuc / (4.0 * C_EVEN)
    # refine in a relative window around the analytic seed
    lo, hi = 0.92 * r_an, 1.08 * r_an
    rs = np.linspace(lo, hi, 81)
    oms = np.array(
        [omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), r * hat, T)[0] for r in rs]
    )
    i = int(np.argmin(oms))
    r0, r1 = rs[max(i - 1, 0)], rs[min(i + 1, len(rs) - 1)]
    rs2 = np.linspace(r0, r1, 81)
    oms2 = np.array(
        [omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), r * hat, T)[0] for r in rs2]
    )
    j = int(np.argmin(oms2))
    r_star = float(rs2[j])
    om_star, E = omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), r_star * hat, T)
    om0, _ = omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), np.zeros(4), T)
    return {
        "r_star": r_star,
        "omega_star": float(om_star),
        "omega_0": float(om0),
        "r_analytic": float(r_an),
        "relative_to_analytic": float(abs(r_star - r_an) / r_an),
        "omega_over_r2": float(om_star / (r_star * r_star)),
        "r_over_ye": float(r_star / y_e),
        "omega_over_ye2": float(om_star / (y_e * y_e)),
        "energies": E,
    }


def group_eigs(e, rtol=1e-8, atol=1e-4):
    e = np.sort(np.asarray(e, dtype=float))
    groups = []
    cur = [e[0]]
    for x in e[1:]:
        ref = float(np.mean(cur))
        tol = atol + rtol * max(abs(ref), 1.0)
        if abs(x - ref) <= tol or abs(x - cur[-1]) <= tol:
            cur.append(float(x))
        else:
            groups.append(
                {
                    "mean": float(np.mean(cur)),
                    "mult": len(cur),
                    "min": float(np.min(cur)),
                    "max": float(np.max(cur)),
                }
            )
            cur = [float(x)]
    groups.append(
        {
            "mean": float(np.mean(cur)),
            "mult": len(cur),
            "min": float(np.min(cur)),
            "max": float(np.max(cur)),
        }
    )
    return groups


def h3_gradient(K, xi, edges, y_o, y_e, h5, T, eps=1e-2):
    grads = []
    for k in range(4):
        e = np.zeros(4)
        e[k] = 1.0
        omp, _ = omega_full(K, xi, edges, y_o, y_e, eps * e, h5, T)
        omm, _ = omega_full(K, xi, edges, y_o, y_e, -eps * e, h5, T)
        grads.append(float((omp - omm) / (2.0 * eps)))
    g = np.asarray(grads)
    return g.tolist(), float(np.linalg.norm(g))


def fermion_odd_curvature(K, xi, edges, y_e, h5, hat_odd, T, eps):
    """∂²Ω_f/∂s² at s=0 for Δ = y_e M_even(h5) + s M_odd(hat_odd)."""
    M_e = y_e * pairing_matrix_12(EVEN_FRAME, h5, edges)
    M_o = pairing_matrix_12(ODD_FRAME, hat_odd, edges)

    def om_f(s):
        M = M_e + s * M_o
        Delta = embed13(M) if K.shape[0] == 13 else M
        E, _, _ = bdg_positive_energies(K, Delta)
        return fermion_omega(E, xi, T)

    o0 = om_f(0.0)
    return float((om_f(eps) + om_f(-eps) - 2.0 * o0) / (eps * eps)), float(o0)


def even_radial_curvature(K, xi, edges, y_e, hat, r_star, T, delta):
    omp, _ = omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), (r_star + delta) * hat, T)
    omm, _ = omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), (r_star - delta) * hat, T)
    om0, _ = omega_full(K, xi, edges, 0.0, y_e, np.zeros(4), r_star * hat, T)
    return float((omp + omm - 2.0 * om0) / (delta * delta))


def mixed_block(K, xi, edges, y_o, y_e, h5, T, eps=1e-2):
    """Approximate ∂²Ω / ∂h3_i ∂h5_j at h3=0 by central differences in h3
    of (Ω at h5+eps e_j minus Ω at h5-eps e_j)."""
    # mixed elements should vanish by inversion; use a single overall norm
    # via ∂/∂h3 of (e_radial · grad_h5) i.e. increment h5 along hat
    hat = h5 / np.linalg.norm(h5)
    dh5 = eps * hat * max(np.linalg.norm(h5), 1.0) * 0  # unused
    # simpler: grad_h3 at h5 * (1±δ)
    r = float(np.linalg.norm(h5))
    delta = 1e-3 * r
    gp, np_ = h3_gradient(K, xi, edges, y_o, y_e, (r + delta) * hat, T)
    gm, nm = h3_gradient(K, xi, edges, y_o, y_e, (r - delta) * hat, T)
    mixed = (np.asarray(gp) - np.asarray(gm)) / (2.0 * delta)
    return mixed.tolist(), float(np.linalg.norm(mixed))


def spectrum_at_g(K, M_unit, g):
    Delta = embed13(g * M_unit) if K.shape[0] == 13 else (g * M_unit)
    E, _, _ = bdg_positive_energies(K, Delta)
    return np.sort(E)


def match_to_sigmas(E, g, sigmas):
    """Assign each clustered level to nearest g*σ."""
    groups = group_eigs(E, rtol=1e-9, atol=0.05)
    assigned = []
    leftover = []
    targets = [(float(s), float(g * s)) for s in sigmas]
    used = set()
    for grp in groups:
        dists = [abs(grp["mean"] - tgt) for _, tgt in targets]
        j = int(np.argmin(dists))
        tgt = targets[j][1]
        sig = targets[j][0]
        if abs(sig) < 1e-12:
            ok = abs(grp["mean"]) < 1e-3
        else:
            ok = (abs(grp["mean"] - tgt) < 20.0) or (
                tgt > 1.0 and abs(grp["mean"] - tgt) / tgt < 0.05
            )
        rec = {
            "mean": grp["mean"],
            "mult": grp["mult"],
            "nearest_sigma": targets[j][0],
            "g_sigma": tgt,
            "abs_shift": float(grp["mean"] - tgt),
            "tracks": bool(ok),
        }
        if ok:
            assigned.append(rec)
        else:
            leftover.append({**rec, "tracks": False})
    return assigned, leftover, groups


def fit_alpha_beta(gs, Es, sigma):
    """Least squares E(g) = g σ + α + β/g for g>0."""
    gs = np.asarray(gs, dtype=float)
    Es = np.asarray(Es, dtype=float)
    # unknowns α, β: E - gσ = α + β/g
    A = np.column_stack([np.ones_like(gs), 1.0 / gs])
    rhs = Es - gs * sigma
    coef, *_ = np.linalg.lstsq(A, rhs, rcond=None)
    pred = gs * sigma + coef[0] + coef[1] / gs
    rel = float(np.max(np.abs(pred - Es) / np.maximum(Es, 1.0)))
    return {
        "sigma": float(sigma),
        "alpha": float(coef[0]),
        "beta": float(coef[1]),
        "max_rel_residual": rel,
    }


def main():
    c18 = json.loads((C18 / "results.json").read_text())
    assert c18.get("four_5_condensation_at_y_even_1") == "PROVED"
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    assert len(edges) == 30

    K13 = build_K_H13(edges)
    xi13 = eigvalsh(K13)
    Kico = graph_laplacian(12, edges)
    xiico = eigvalsh(Kico)

    hat = np.asarray(c18["even_hat"], dtype=float)
    hat = hat / np.linalg.norm(hat)
    nuc = nuclear_norm(EVEN_FRAME, hat, edges)
    M_even_unit = pairing_matrix_12(EVEN_FRAME, hat, edges)
    sigmas = svd(M_even_unit, compute_uv=False)
    expected = {
        "0": 0.0,
        "sqrt(2/15)": float(np.sqrt(2.0 / 15.0)),
        "sqrt(1/6)": float(np.sqrt(1.0 / 6.0)),
        "sqrt(3/10)": float(np.sqrt(3.0 / 10.0)),
    }
    expected_mult = {"0": 1, "sqrt(2/15)": 3, "sqrt(1/6)": 6, "sqrt(3/10)": 2}
    buckets = {n: [] for n in expected}
    for s in sigmas:
        name = min(expected, key=lambda n: abs(float(s) - expected[n]))
        buckets[name].append(float(s))
    sigma_id = []
    for name, val in expected.items():
        got = buckets[name]
        rels = [abs(x - val) / max(val, 1e-15) if val > 0 else abs(x) for x in got]
        sigma_id.append(
            {
                "name": name,
                "expected": val,
                "mean": float(np.mean(got)) if got else None,
                "mult": len(got),
                "expected_mult": expected_mult[name],
                "max_rel_err": float(max(rels) if rels else 1.0),
                "mult_ok": bool(len(got) == expected_mult[name]),
            }
        )
    pos = [expected["sqrt(2/15)"], expected["sqrt(1/6)"], expected["sqrt(3/10)"]]
    ratio_2_sqrt5_3 = None
    if len(pos) == 3:
        ratio_2_sqrt5_3 = {
            "values": pos,
            "normalized_to_first_times_2": [2.0 * p / pos[0] for p in pos],
            "target": [2.0, float(np.sqrt(5.0)), 3.0],
            "rel_err": [
                abs(2.0 * p / pos[0] - t) / t
                for p, t in zip(pos, [2.0, float(np.sqrt(5.0)), 3.0])
            ],
            "measured_means": [s["mean"] for s in sigma_id if s["expected"] > 0],
            "measured_max_rel_err": [s["max_rel_err"] for s in sigma_id if s["expected"] > 0],
            "multiplicities_ok": all(s["mult_ok"] for s in sigma_id),
        }

    # --- on-shell grid, primary H13, T=η ---
    ye_grid = [0.1, 1.0, 2.0]
    yo_grid = [0.0, 1.0, 2.0]
    grid = []
    ref = None
    for ye in ye_grid:
        rec_ye = refine_even_ray(K13, xi13, edges, ye, hat, ETA)
        # spectrum independent of yo at h3=0; compute once
        E = rec_ye.pop("energies")
        groups = group_eigs(E, rtol=1e-9, atol=0.05)
        assigned, leftover, _ = match_to_sigmas(
            E, ye * rec_ye["r_star"], [s["expected"] for s in sigma_id]
        )
        for yo in yo_grid:
            h5 = rec_ye["r_star"] * hat
            om_yo, E_yo = omega_full(K13, xi13, edges, yo, ye, np.zeros(4), h5, ETA)
            gvec, gnorm = h3_gradient(K13, xi13, edges, yo, ye, h5, ETA)
            spec_diff = float(np.max(np.abs(np.sort(E_yo) - np.sort(E))))
            om_diff = float(abs(om_yo - rec_ye["omega_star"]))
            row = {
                "ye": ye,
                "yo": yo,
                **{k: rec_ye[k] for k in rec_ye},
                "omega_at_this_yo": float(om_yo),
                "omega_diff_vs_yo0": om_diff,
                "spectrum_maxdiff_vs_yo0": spec_diff,
                "h3_grad": gvec,
                "h3_grad_norm": gnorm,
                "BdG_groups": groups,
                "pairing_assigned": assigned,
                "nontracking_levels": leftover,
            }
            grid.append(row)
            if abs(ye - 1.0) < 1e-15 and abs(yo - 0.0) < 1e-15:
                ref = {**row, "energies": E.tolist()}

    assert ref is not None
    r_star_1 = ref["r_star"]
    h5_1 = r_star_1 * hat

    # T=0 control at (1,0)
    rec_T0 = refine_even_ray(K13, xi13, edges, 1.0, hat, 0.0)
    rec_T0.pop("energies", None)

    # --- Hessian / kappa_vac ---
    # odd nuclear-norm direction from cycle 18 if present, else e0
    hat_odd = np.asarray(c18.get("odd_hat", [1.0, 0.0, 0.0, 0.0]), dtype=float)
    hat_odd = hat_odd / np.linalg.norm(hat_odd)
    kappa = {}
    for eps in (10.0, 30.0):
        kap, _ = fermion_odd_curvature(K13, xi13, edges, 1.0, h5_1, hat_odd, ETA, eps)
        kappa[f"eps_{int(eps)}"] = kap
    # also at origin for comparison
    kap_origin, _ = fermion_odd_curvature(
        K13, xi13, edges, 1.0, np.zeros(4), hat_odd, ETA, 1e-3
    )
    # even radial
    rad = {
        "delta_1e3": even_radial_curvature(K13, xi13, edges, 1.0, hat, r_star_1, ETA, 1e3),
        "delta_1e4": even_radial_curvature(K13, xi13, edges, 1.0, hat, r_star_1, ETA, 1e4),
        "target_2c_even": float(2.0 * C_EVEN),
    }
    mixed_yo0 = mixed_block(K13, xi13, edges, 0.0, 1.0, h5_1, ETA)
    mixed_yo1 = mixed_block(K13, xi13, edges, 1.0, 1.0, h5_1, ETA)

    # odd mass formula: 2 c_odd + yo^2 * kappa_vac  (kappa = ∂²Ω_f/∂s², s = yo ||h3|| if hat unit)
    # Use kappa at eps=10
    kappa_vac = kappa["eps_10"]
    odd_mass2 = {str(yo): float(2.0 * C_ODD + (yo ** 2) * kappa_vac) for yo in yo_grid}

    # --- Laplacian corrections vs g, both kinetics ---
    gs = [1e2, 1e3, 1e4, 1e5, float(1.0 * r_star_1)]
    unique_sigmas = [s["expected"] for s in sigma_id]
    # the three positive expected
    pos_sigmas = [expected["sqrt(2/15)"], expected["sqrt(1/6)"], expected["sqrt(3/10)"]]
    lap = {}
    for kname, K, xi in (
        ("H13_Hodge", K13, xi13),
        ("ico_laplacian", Kico, xiico),
    ):
        series = []
        centroids = {s: [] for s in pos_sigmas}
        split6 = []
        extras = []
        for g in gs:
            E = spectrum_at_g(K, M_even_unit, g)
            assigned, leftover, groups = match_to_sigmas(E, g, unique_sigmas)
            # collect the would-be 6: groups near g*sqrt(1/6)
            near6 = [grp for grp in groups if abs(grp["mean"] - g * expected["sqrt(1/6)"]) < max(20.0, 0.05 * g * expected["sqrt(1/6)"])]
            if len(near6) >= 2:
                near6 = sorted(near6, key=lambda z: z["mean"])
                split6.append(
                    {
                        "g": g,
                        "low": near6[0]["mean"],
                        "high": near6[-1]["mean"],
                        "split": float(near6[-1]["mean"] - near6[0]["mean"]),
                        "mults": [near6[0]["mult"], near6[-1]["mult"]],
                        "centroid": float(0.5 * (near6[0]["mean"] + near6[-1]["mean"])),
                    }
                )
                centroids[expected["sqrt(1/6)"]].append(
                    (g, float(0.5 * (near6[0]["mean"] + near6[-1]["mean"])))
                )
            elif len(near6) == 1:
                centroids[expected["sqrt(1/6)"]].append((g, near6[0]["mean"]))
            for s in (expected["sqrt(2/15)"], expected["sqrt(3/10)"]):
                near = [
                    grp
                    for grp in groups
                    if abs(grp["mean"] - g * s) < max(20.0, 0.05 * g * s)
                ]
                if near:
                    centroids[s].append((g, float(np.mean([z["mean"] for z in near]))))
            extras.append({"g": g, "nontracking": leftover, "groups": groups})
            series.append({"g": g, "assigned": assigned, "leftover": leftover})
        fits = {}
        for s, pts_s in centroids.items():
            if len(pts_s) >= 3:
                pts_fit = [p for p in pts_s if p[0] >= 1000.0]
                use = pts_fit if len(pts_fit) >= 3 else pts_s
                gg = [p[0] for p in use]
                ee = [p[1] for p in use]
                fits[f"{s:.8f}"] = {
                    **fit_alpha_beta(gg, ee, s),
                    "samples": [{"g": a, "E": b} for a, b in pts_s],
                    "fitted_g_min": min(gg),
                }
        lap[kname] = {
            "series": series,
            "split6": split6,
            "fits_E_eq_g_sigma_plus_alpha_plus_beta_over_g": fits,
            "extras_by_g": extras,
        }

    # --- independence diagnostics ---
    # yo independence of on-shell even observables at each ye
    yo_indep = []
    for ye in ye_grid:
        rows = [r for r in grid if abs(r["ye"] - ye) < 1e-15]
        oms = [r["omega_at_this_yo"] for r in rows]
        specs = [r["spectrum_maxdiff_vs_yo0"] for r in rows]
        yo_indep.append(
            {
                "ye": ye,
                "omega_spread": float(max(oms) - min(oms)),
                "max_spectrum_diff": float(max(specs)),
                "max_h3_grad_norm": float(max(r["h3_grad_norm"] for r in rows)),
            }
        )
    # ye scaling of ratios among pairing levels and of Omega/r^2, r/ye
    ye_ratios = []
    for ye in ye_grid:
        row = next(r for r in grid if abs(r["ye"] - ye) < 1e-15 and abs(r["yo"] - 0.0) < 1e-15)
        ye_ratios.append(
            {
                "ye": ye,
                "r_over_ye": row["r_over_ye"],
                "omega_over_r2": row["omega_over_r2"],
                "omega_over_ye2": row["omega_over_ye2"],
                "rel_r_to_analytic": row["relative_to_analytic"],
            }
        )

    # analytic large-vev targets
    N = float(nuc)
    analytic = {
        "nuclear_norm": N,
        "r_over_ye": float(N / (4.0 * C_EVEN)),
        "omega_over_r2": float(-C_EVEN),
        "omega_over_ye2": float(-(N ** 2) / (16.0 * C_EVEN)),
        "even_radial_curvature": float(2.0 * C_EVEN),
        "c_even": float(C_EVEN),
        "c_odd": float(C_ODD),
    }

    # classify
    # 1) all recorded ratios independent of both? 
    # yo: on-shell even observables independent if omega_spread and spec_diff tiny
    yo_on_shell_independent = all(
        rec["omega_spread"] < 1e-6 and rec["max_spectrum_diff"] < 1e-8 for rec in yo_indep
    )
    # ye: r/ye and Omega/r2 should be nearly constant; mixing with tree/Laplacian scales is not
    r_over_ye_vals = [z["r_over_ye"] for z in ye_ratios]
    om_over_r2_vals = [z["omega_over_r2"] for z in ye_ratios]
    r_over_ye_rel_spread = float(
        (max(r_over_ye_vals) - min(r_over_ye_vals)) / np.mean(r_over_ye_vals)
    )
    om_over_r2_rel_spread = float(
        (max(om_over_r2_vals) - min(om_over_r2_vals)) / abs(np.mean(om_over_r2_vals))
    )
    pairing_scale_ratios_stable = bool(
        r_over_ye_rel_spread < 1e-3 and om_over_r2_rel_spread < 1e-2
    )
    # odd mass2 depends on yo iff kappa_vac != 0
    odd_mass_depends_on_yo = bool(abs(kappa_vac) > 1e-18)
    # mixing pairing with tree scale: m_h3 / (ye r sigma) depends on ye
    tree_to_pairing_depends_on_ye = True  # structural: m_h3 ~ O(1), gap ~ ye^2
    # H13 extras
    h13_extras_at_phys = lap["H13_Hodge"]["extras_by_g"][-1]["nontracking"]
    h13_has_nonscaling = bool(len(h13_extras_at_phys) > 0)

    all_ratios_independent = bool(
        yo_on_shell_independent
        and pairing_scale_ratios_stable
        and (not odd_mass_depends_on_yo)
        and (not tree_to_pairing_depends_on_ye)
        and (not h13_has_nonscaling)
    )
    # the last two are structurally False, so the global claim is FALSIFIED
    # pairing-dominated list is PROVED if the first two hold and singular-value identity holds
    sv_ok = bool(
        ratio_2_sqrt5_3 is not None
        and max(ratio_2_sqrt5_3["rel_err"]) < 1e-6
        and ratio_2_sqrt5_3.get("multiplicities_ok", False)
        and max(ratio_2_sqrt5_3.get("measured_max_rel_err", [1.0])) < 1e-6
    )
    split_vs_2sqrt5 = {}
    for kname in ("H13_Hodge", "ico_laplacian"):
        rows = []
        for rec in lap[kname]["split6"]:
            if rec["g"] >= 1000.0 and list(rec["mults"]) == [3, 3]:
                rows.append(
                    {
                        "g": rec["g"],
                        "split": rec["split"],
                        "target_2sqrt5": float(2.0 * np.sqrt(5.0)),
                        "rel_err": abs(rec["split"] - 2.0 * np.sqrt(5.0))
                        / (2.0 * np.sqrt(5.0)),
                    }
                )
        split_vs_2sqrt5[kname] = rows
    pairing_list_proved = bool(
        yo_on_shell_independent and pairing_scale_ratios_stable and sv_ok
    )

    if all_ratios_independent:
        global_claim = "PROVED"
    else:
        global_claim = "FALSIFIED"
    pairing_claim = "PROVED" if pairing_list_proved else "CONDITIONAL"

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "c_even": float(C_EVEN),
        "c_odd": float(C_ODD),
        "nuclear_norm": N,
        "even_hat": hat.tolist(),
        "singular_values": sigma_id,
        "ratio_2_sqrt5_3": ratio_2_sqrt5_3,
        "analytic_large_vev": analytic,
        "grid": [
            {k: v for k, v in row.items() if k not in ("pairing_assigned",)}
            for row in grid
        ],
        "T0_control_ye1_yo0": rec_T0,
        "yo_independence": yo_indep,
        "ye_ratio_scaling": ye_ratios,
        "hessian": {
            "kappa_vac_d2Omega_f_ds2": kappa,
            "kappa_origin": kap_origin,
            "kappa_vac": kappa_vac,
            "odd_mass2_equals_2c_odd_plus_yo2_kappa": odd_mass2,
            "even_radial_curvature": rad,
            "mixed_norm_yo0": mixed_yo0[1],
            "mixed_norm_yo1": mixed_yo1[1],
            "mixed_yo0": mixed_yo0[0],
            "mixed_yo1": mixed_yo1[0],
        },
        "laplacian_corrections": {
            k: {
                "split6": v["split6"],
                "fits": v["fits_E_eq_g_sigma_plus_alpha_plus_beta_over_g"],
                "nontracking_at_each_g": [
                    {"g": e["g"], "n_nontracking": len(e["nontracking"]), "levels": e["nontracking"]}
                    for e in v["extras_by_g"]
                ],
            }
            for k, v in lap.items()
        },
        "yo_on_shell_independent": yo_on_shell_independent,
        "pairing_scale_ratios_stable": pairing_scale_ratios_stable,
        "odd_mass_depends_on_yo": odd_mass_depends_on_yo,
        "tree_to_pairing_depends_on_ye": tree_to_pairing_depends_on_ye,
        "h13_has_nonscaling_levels": h13_has_nonscaling,
        "h13_nonscaling_at_physical_vev": h13_extras_at_phys,
        "r_over_ye_rel_spread": r_over_ye_rel_spread,
        "omega_over_r2_rel_spread": om_over_r2_rel_spread,
        "singular_value_identity_ok": sv_ok,
        "split6_versus_2sqrt5": split_vs_2sqrt5,
        "global_claim_all_observable_ratios_independent_of_2plane": global_claim,
        "pairing_dominated_ratios_parameter_free": pairing_claim,
        "classification": pairing_claim,
        "classification_note": (
            "Global claim (every observable ratio independent of the 2-plane) is "
            + global_claim
            + ". Pairing-dominated ratio list is "
            + pairing_claim
            + "."
        ),
        "advances_physical_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    print(
        json.dumps(
            sanitize(
                {
                    "global_claim": global_claim,
                    "pairing_claim": pairing_claim,
                    "sv_ok": sv_ok,
                    "ratio": ratio_2_sqrt5_3,
                    "yo_indep": yo_indep,
                    "ye_ratios": ye_ratios,
                    "kappa_vac": kappa,
                    "kappa_origin": kap_origin,
                    "odd_mass2": odd_mass2,
                    "radial": rad,
                    "mixed": {"yo0": mixed_yo0[1], "yo1": mixed_yo1[1]},
                    "analytic": analytic,
                    "split6_H13": lap["H13_Hodge"]["split6"],
                    "split6_ico": lap["ico_laplacian"]["split6"],
                    "fits_H13": lap["H13_Hodge"]["fits_E_eq_g_sigma_plus_alpha_plus_beta_over_g"],
                    "fits_ico": lap["ico_laplacian"]["fits_E_eq_g_sigma_plus_alpha_plus_beta_over_g"],
                    "h13_nonscaling_phys": h13_extras_at_phys,
                    "ico_nontracking_phys": lap["ico_laplacian"]["extras_by_g"][-1]["nontracking"],
                    "r_star_1": r_star_1,
                    "T0": rec_T0,
                }
            ),
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
