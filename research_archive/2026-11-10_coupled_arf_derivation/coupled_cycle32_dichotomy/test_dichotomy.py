#!/usr/bin/env python3
"""Coupled cycle 32: dichotomy; full analysis of the subcritical branch."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.linalg import eigh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle32_dichotomy")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "68b447af0592a220013dd9029b1b0cb11a13f45a93f86e203d3c85cf016ffb8d"
PHI = c25.PHI
ETA = c25.ETA
R_ALPHA = c25.R_ALPHA
SQRT5 = np.sqrt(5.0)


def sanitize(o):
    return c25.sanitize(o)


def look_elsewhere(value):
    return c25.look_elsewhere(value)


def K_eigs_exact_A0():
    return np.array(
        [0.0]
        + [5.0 - SQRT5] * 3
        + [6.0] * 5
        + [5.0 + SQRT5] * 3,
        dtype=float,
    )


def K_eigs_exact_Api():
    return np.array(
        [10.0]
        + [5.0 + SQRT5] * 3
        + [4.0] * 5
        + [5.0 - SQRT5] * 3,
        dtype=float,
    )


def omega_from_eigs(ev, ev_ref, T):
    pos = np.maximum(np.asarray(ev, dtype=float).real, 0.0)
    pos0 = np.maximum(np.asarray(ev_ref, dtype=float).real, 0.0)
    return c25.fermion_omega(pos, pos0, T)


def project_describe(PiT, D1T):
    anal = c25.analyse_PiT(PiT, D1T)
    desc = c29.describe(PiT, D1T)
    return anal, desc


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    nE = len(edges)
    assert nE == 30

    # cycle space and Delta1, copied from cycle 25
    b1 = np.zeros((12, nE))
    for e, (i, j) in enumerate(edges):
        b1[i, e] = -1.0
        b1[j, e] = 1.0
    _, s, vh = svd(b1, full_matrices=True)
    rank = int(np.sum(s > 1e-10))
    trans = vh[rank:].T
    nT = trans.shape[1]
    assert nT == 19 and rank == 11
    lookup = {x: i for i, x in enumerate(edges)}
    b2 = np.zeros((nE, len(faces)))
    for k, f in enumerate(faces):
        ff = list(f)
        for a in range(len(ff)):
            i, j = int(ff[a]), int(ff[(a + 1) % len(ff)])
            key = (min(i, j), max(i, j))
            b2[lookup[key], k] = 1.0 if i < j else -1.0
    d0 = b1.T
    Delta1 = d0 @ d0.T + b2 @ b2.T
    D1T = trans.T @ Delta1 @ trans
    D1T = 0.5 * (D1T + D1T.T)

    A0 = np.zeros(nE)
    Api = np.full(nE, np.pi)
    ev0_num = eigvalsh(c25.magnetic_laplacian(edges, A0)).real
    evpi_num = eigvalsh(c25.magnetic_laplacian(edges, Api)).real
    ev0_ex = K_eigs_exact_A0()
    evpi_ex = K_eigs_exact_Api()
    ev0_num_s = np.sort(ev0_num)
    evpi_num_s = np.sort(evpi_num)
    spec_A0_ok = bool(np.allclose(ev0_num_s, np.sort(ev0_ex), atol=1e-10))
    spec_Api_ok = bool(np.allclose(evpi_num_s, np.sort(evpi_ex), atol=1e-10))

    # Item 1: K ⪰ 0 and Tr K = 60 for many connections; T=0 flatness
    rng = np.random.default_rng(32)
    traces = []
    lmins = []
    t0_omegas = []
    t0_ref_sum = float(np.sum(np.maximum(ev0_num, 0.0)))
    probe_As = [A0, Api]
    for _ in range(24):
        probe_As.append(rng.uniform(0.0, 2.0 * np.pi, size=nE))
    # a few gradients
    for _ in range(4):
        lam = rng.normal(size=12)
        lam = lam - lam.mean()
        probe_As.append(-(d0 @ lam))

    for A in probe_As:
        K = c25.magnetic_laplacian(edges, A)
        ev = eigvalsh(K).real
        traces.append(float(np.sum(ev)))
        lmins.append(float(ev.min()))
        t0_omegas.append(omega_from_eigs(ev, ev0_num, 0.0))

    tr_resid = float(max(abs(t - 60.0) for t in traces))
    lmin_min = float(min(lmins))
    t0_om_max = float(max(abs(x) for x in t0_omegas))
    psd_and_tr = bool(lmin_min > -1e-12 and tr_resid < 1e-10)
    t0_flat = bool(t0_om_max < 1e-12)

    # Item 3: T = η flux scan
    def omega_T(A, T):
        ev = eigvalsh(c25.magnetic_laplacian(edges, A)).real
        return omega_from_eigs(ev, ev0_num, T)

    om_eta_0 = float(omega_T(A0, ETA))
    om_eta_pi = float(omega_T(Api, ETA))
    dOmega_pi_minus_0 = float(om_eta_pi - om_eta_0)

    random_dO = []
    for _ in range(40):
        A = rng.uniform(0.0, 2.0 * np.pi, size=nE)
        random_dO.append(float(omega_T(A, ETA) - om_eta_0))
    random_dO = np.asarray(random_dO)

    grad_resid = []
    for _ in range(8):
        lam = rng.normal(size=12)
        lam = lam - lam.mean()
        A = -(d0 @ lam)
        grad_resid.append(abs(omega_T(A0 + A, ETA) - om_eta_0))
        A_rand = rng.uniform(0.0, 2.0 * np.pi, size=nE)
        grad_resid.append(abs(omega_T(A_rand + A, ETA) - omega_T(A_rand, ETA)))

    trK4_0 = float(np.sum(ev0_num ** 4))
    trK4_pi = float(np.sum(evpi_num ** 4))
    trK2_0 = float(np.sum(ev0_num ** 2))
    trK2_pi = float(np.sum(evpi_num ** 2))

    # vacuum at T=η: compare A=0, A=π, and the random sample
    # If all random dΩ ≥ -tol and dΩ(π) > 0, A=0 is the minimiser
    # among the tested points.
    min_random = float(random_dO.min())
    max_random = float(random_dO.max())
    mean_random = float(random_dO.mean())
    a0_is_min_among_tested = bool(
        dOmega_pi_minus_0 > 1e-14 and min_random > -1e-12
    )
    api_is_min_among_tested = bool(
        dOmega_pi_minus_0 < -1e-14 and (min_random + 1e-12) >= dOmega_pi_minus_0
    )
    if a0_is_min_among_tested:
        derived_vacuum = "A=0"
        A_vac = A0
        vac_tag = "A0"
    elif api_is_min_among_tested:
        derived_vacuum = "A=pi"
        A_vac = Api
        vac_tag = "Api"
    else:
        derived_vacuum = "undetermined"
        # fall back to the lower of {0, π} for kernel evaluation,
        # and record that the scan did not select uniquely
        if dOmega_pi_minus_0 < 0:
            A_vac = Api
            vac_tag = "Api"
        else:
            A_vac = A0
            vac_tag = "A0"

    # Item 5: transverse Hessians
    def make_omega_A(T, A_bg):
        ev_bg = eigvalsh(c25.magnetic_laplacian(edges, A_bg)).real

        def omega_A(A):
            ev = eigvalsh(c25.magnetic_laplacian(edges, A)).real
            return omega_from_eigs(ev, ev_bg, T)

        return omega_A

    points = {}
    configs = [
        ("A0_T0", A0, 0.0, 0.02),
        ("Api_T0", Api, 0.0, 0.02),
        ("A0_Teta", A0, ETA, 0.02),
        ("Api_Teta", Api, ETA, 0.02),
        ("A0_Teta_eps05", A0, ETA, 0.05),
        ("Api_Teta_eps05", Api, ETA, 0.05),
    ]
    print("cycle 32 Hessians...", flush=True)
    for tag, A_bg, T, eps in configs:
        print(f"  {tag} T={T:.6g} eps={eps}", flush=True)
        omega_A = make_omega_A(T, A_bg)
        HT, om0 = c25.hess_trans_bg(omega_A, trans, eps, A_bg)
        anal, desc = project_describe(HT, D1T)
        # GI / WI along gradients about this background
        wi_hess = []
        wi_val = []
        ev_bg = eigvalsh(c25.magnetic_laplacian(edges, A_bg)).real
        for _ in range(6):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()
            nrm = np.linalg.norm(lam)
            if nrm < 1e-12:
                continue
            lam = lam / nrm
            A = -(d0 @ lam)
            evp = eigvalsh(c25.magnetic_laplacian(edges, A_bg + A)).real
            wi_val.append(abs(omega_from_eigs(evp, ev_bg, T)))
            eps_g = 3e-3
            omp = omega_A(A_bg + eps_g * A)
            omm = omega_A(A_bg - eps_g * A)
            omc = omega_A(A_bg)
            wi_hess.append((omp + omm - 2.0 * omc) / (eps_g ** 2))
        points[tag] = {
            "T": T,
            "eps": eps,
            "omega_bg_rel_to_own_bg": float(om0),
            "Pi_norm": float(np.linalg.norm(HT, "fro")),
            "Pi_max_abs": float(np.max(np.abs(HT))),
            "gauge_invariance_max_residual": float(max(wi_val) if wi_val else 0.0),
            "WI_hessian_max_abs": float(max(np.abs(wi_hess)) if wi_hess else 0.0),
            "Pi": anal,
            "projection": desc,
        }

    # T=0 kernels should be ~0
    t0_ker_A0 = float(points["A0_T0"]["Pi_max_abs"])
    t0_ker_Api = float(points["Api_T0"]["Pi_max_abs"])
    t0_kernel_vanishes = bool(t0_ker_A0 < 1e-10 and t0_ker_Api < 1e-10)

    # eps control at A=0, T=η
    p02 = points["A0_Teta"]["Pi"]
    p05 = points["A0_Teta_eps05"]["Pi"]
    eps_rel_cI = abs(p02["c_identity"] - p05["c_identity"]) / max(
        abs(p02["c_identity"]), abs(p05["c_identity"]), 1e-30
    )
    eps_rel_kiso = abs((p02["kappa_iso"] or 0) - (p05["kappa_iso"] or 0)) / max(
        abs(p02["kappa_iso"] or 0), abs(p05["kappa_iso"] or 0), 1e-30
    )

    vac_point_key = "A0_Teta" if vac_tag == "A0" else "Api_Teta"
    vac_Pi = points[vac_point_key]["Pi"]
    vac_proj = points[vac_point_key]["projection"]
    usable = bool(vac_Pi["usable_derived_kappa"])

    alpha_eff = None
    alpha_REM = None
    comparison = {
        "performed": False,
        "reason": "item-6 tests did not all succeed at the derived T=η vacuum",
    }
    if usable and vac_Pi["kappa_iso"] not in (None, 0):
        alpha_eff = 1.0 / vac_Pi["kappa_iso"]
        alpha_REM = 1.0 / vac_Pi["kappa_REM"] if vac_Pi["kappa_REM"] not in (None, 0) else None
        comparison = {
            "performed": True,
            "alpha_eff": alpha_eff,
            "alpha_REM": alpha_REM,
            "R_alpha": R_ALPHA,
            "rel_err_eff": abs(alpha_eff - R_ALPHA) / R_ALPHA,
            "rel_err_REM": (
                abs(alpha_REM - R_ALPHA) / R_ALPHA if alpha_REM is not None else None
            ),
            "match_eff_1e-4": bool(abs(alpha_eff - R_ALPHA) / R_ALPHA < 1e-4),
            "look_elsewhere_eff": look_elsewhere(alpha_eff),
            "look_elsewhere_REM": look_elsewhere(alpha_REM) if alpha_REM is not None else None,
        }

    # supercritical side: citations only
    supercritical = {
        "cited_not_recomputed": True,
        "citations": [
            "coupled_cycle18_nambu_measure",
            "coupled_cycle23_gi_current",
            "coupled_cycle25_piflux_kernel",
            "coupled_cycle28_unbroken_photon",
            "coupled_cycle29_momentum_expansion",
            "alt_cycle25_dynamical_condensation",
            "alt_cycle29_charge2_higgs",
            "alt_cycle31_spontaneous_flux",
            "alt_cycle34_induced_kappa",
        ],
        "statement": (
            "For y_even > y_c(T) the origin is unstable, 4_5 condenses "
            "with Q_geo(Δ)=2, the geometric U(1) is Higgsed to Z2, the "
            "derived fermion-only vacuum is A_e≡π, and Π_T = (1/12) I "
            "at T=0 (tanh(10/(2η))/12 I at T=η), not Maxwell-like."
        ),
        "m2_T0": 1.0 / 12.0,
        "m2_Teta": float(np.tanh(10.0 / (2.0 * ETA)) / 12.0),
    }

    H1 = bool(psd_and_tr and t0_flat and t0_kernel_vanishes)
    H2 = bool(trK4_pi > trK4_0 and dOmega_pi_minus_0 > 0 and a0_is_min_among_tested)
    H3 = bool(
        derived_vacuum == "A=0"
        and abs(ev0_num_s[0]) < 1e-12
        and points["A0_Teta"]["gauge_invariance_max_residual"] < 1e-8
    )
    H4 = bool(not usable)
    H5 = bool(spec_A0_ok and spec_Api_ok and H1 and (not usable))

    gi_ok = all(
        points[k]["gauge_invariance_max_residual"] < 1e-8
        and points[k]["WI_hessian_max_abs"] < 1e-6
        for k in ("A0_T0", "Api_T0", "A0_Teta", "Api_Teta")
    )

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "R_alpha": R_ALPHA,
        "spectra": {
            "A0_exact": ev0_ex.tolist(),
            "A0_numerical": ev0_num_s.tolist(),
            "A0_match": spec_A0_ok,
            "Api_exact": evpi_ex.tolist(),
            "Api_numerical": evpi_num_s.tolist(),
            "Api_match": spec_Api_ok,
            "unpaired_A0": float(ev0_num_s[0]),
            "unpaired_Api": float(evpi_num_s[-1]) if abs(evpi_num_s[-1] - 10) < 1e-8 else float(np.max(evpi_num_s)),
        },
        "T0_flatness": {
            "n_probes": len(probe_As),
            "max_abs_TrK_minus_60": tr_resid,
            "min_eigenvalue": lmin_min,
            "psd_and_trace_identity": psd_and_tr,
            "max_abs_Omega_T0": t0_om_max,
            "Omega_T0_flat": t0_flat,
            "Pi_max_abs_A0": t0_ker_A0,
            "Pi_max_abs_Api": t0_ker_Api,
            "kernel_vanishes": t0_kernel_vanishes,
        },
        "invariants": {
            "TrK_A0": float(np.sum(ev0_num)),
            "TrK_Api": float(np.sum(evpi_num)),
            "TrK2_A0": trK2_0,
            "TrK2_Api": trK2_pi,
            "TrK2_equal": bool(abs(trK2_0 - trK2_pi) < 1e-10),
            "TrK4_A0": trK4_0,
            "TrK4_Api": trK4_pi,
            "TrK4_pi_gt_TrK4_0": bool(trK4_pi > trK4_0),
            "highT_deltaOmega_leading": float((trK4_pi - trK4_0) / (192.0 * ETA ** 3)),
        },
        "Teta_flux": {
            "Omega_A0": om_eta_0,
            "Omega_Api": om_eta_pi,
            "dOmega_pi_minus_0": dOmega_pi_minus_0,
            "random_n": 40,
            "random_dOmega_min": min_random,
            "random_dOmega_max": max_random,
            "random_dOmega_mean": mean_random,
            "gradient_max_residual": float(max(grad_resid)),
            "A0_is_min_among_tested": a0_is_min_among_tested,
            "Api_is_min_among_tested": api_is_min_among_tested,
            "derived_vacuum": derived_vacuum,
            "vacuum_used_for_kernel": vac_tag,
        },
        "points": points,
        "eps_control_A0_Teta": {
            "rel_c_identity": float(eps_rel_cI),
            "rel_kappa_iso": float(eps_rel_kiso),
        },
        "derived_vacuum_kernel": {
            "tag": vac_point_key,
            "usable_derived_kappa": usable,
            "Pi": vac_Pi,
            "projection": vac_proj,
        },
        "alpha_comparison": comparison,
        "supercritical": supercritical,
        "gauge_invariance_ok": gi_ok,
        "hypotheses": {
            "H1_T0_flat": H1,
            "H2_Teta_vacuum_A0": H2,
            "H3_unbroken_unpaired_at_A0": H3,
            "H4_no_unique_positive_Maxwell_kappa": H4,
            "H5_parameter_free_spectrum_no_alpha": H5,
        },
        "ye_independence": (
            "At r=0, Δ≡0, so Ω and Π_T are independent of y_even "
            "throughout the subcritical phase."
        ),
    }

    out = OUT / "results.json"
    out.write_text(json.dumps(sanitize(results), indent=2))
    print("wrote", out)
    print("H1", H1, "H2", H2, "H3", H3, "H4", H4, "H5", H5)
    print("derived vacuum", derived_vacuum, "dOmega(π-0)", dOmega_pi_minus_0)
    print("usable", usable, "alpha comparison", comparison["performed"])
    print("T0 flat max|Ω|", t0_om_max, "Pi max A0", t0_ker_A0)
    if vac_Pi:
        print(
            "vac Pi: posdef", vac_Pi["positive_definite"],
            "maxwell", vac_Pi["maxwell_like"],
            "ident", vac_Pi["identity_like"],
            "unique", vac_Pi["kappa_unique"],
            "cI", vac_Pi["c_identity"],
            "kiso", vac_Pi["kappa_iso"],
            "residM", vac_Pi["residual_maxwell"],
            "spread", vac_Pi["kappa_gen_spread"],
        )


if __name__ == "__main__":
    main()
