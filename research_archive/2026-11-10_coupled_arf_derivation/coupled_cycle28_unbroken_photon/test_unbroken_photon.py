#!/usr/bin/env python3
"""Coupled cycle 28: search for an unbroken Q_geo + c Q_other."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle28_unbroken_photon")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PRED_SHA = "8473707748d400bfe29e68fcf78b4a943f081f64abe36473c0cbea9499f9aede"


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


def frobenius_schur_4():
    # A5 characters of the 4: classes 1, (2,2), 3, 5, 5' with sizes 1,15,20,12,12
    # χ = (4, 0, 1, -1, -1). Squares: 1^2=1; double transp^2=1;
    # 3-cycle^2 is a 3-cycle; 5-cycle^2 is a 5-cycle in the *other* 5-class.
    # FS = (1/60) sum_g χ(g^2) = (1/60)[1*χ(1) + 15*χ(1) + 20*χ(3) + 12*χ(5') + 12*χ(5)]
    chi = {"1": 4.0, "22": 0.0, "3": 1.0, "5": -1.0, "5p": -1.0}
    fs = (1.0 / 60.0) * (
        1 * chi["1"]
        + 15 * chi["1"]
        + 20 * chi["3"]
        + 12 * chi["5p"]
        + 12 * chi["5"]
    )
    return float(fs)


def main():
    ops = load_ops()
    Hbits = np.asarray(ops["Hbits"], dtype=float)
    Uh = np.asarray(ops["Uh"], dtype=float)
    P5 = np.asarray(ops["P5"], dtype=float)
    P3 = np.asarray(ops["P3"], dtype=float)

    ev_h = eigvalsh(0.5 * (Hbits + Hbits.T))
    # kernel
    w, V = np.linalg.eigh(0.5 * (Hbits + Hbits.T))
    ker = V[:, np.abs(w) < 1e-10]
    n_ker = int(ker.shape[1])
    im5 = Uh @ P5  # 64 x 20, rank 4
    # column space of Uh P5
    u5, s5, _ = svd(im5, full_matrices=False)
    rank5 = int(np.sum(s5 > 1e-10))
    basis5 = u5[:, :rank5]
    # principal angles / overlap of 4_5 image with ker Hbits
    if n_ker == 0 or rank5 == 0:
        overlap = 0.0
        angles = []
    else:
        M = ker.T @ basis5
        ov = svd(M, compute_uv=False)
        overlap = float(ov.max()) if ov.size else 0.0
        # principal angles
        # clip for numerical safety
        angles = [float(np.degrees(np.arccos(np.clip(s, 0.0, 1.0)))) for s in ov]

    im3 = Uh @ P3
    u3, s3, _ = svd(im3, full_matrices=False)
    rank3 = int(np.sum(s3 > 1e-10))
    basis3 = u3[:, :rank3]
    M3 = ker.T @ basis3 if n_ker and rank3 else np.zeros((0, 0))
    ov3 = svd(M3, compute_uv=False) if M3.size else np.array([])
    overlap3 = float(ov3.max()) if ov3.size else 0.0

    fs4 = frobenius_schur_4()
    end_is_reals = bool(abs(fs4 - 1.0) < 1e-12)

    # clock data
    clock = {
        "n_sites": 24,
        "wilson_charge_geometry": 1,
        "wilson_charge_history": 2,
        "golden_mode_charge1": 9,
        "golden_mode_charge2": 18,
        "phase_under_one_tick_m18": {
            "re": float(np.cos(2 * np.pi * 18 / 24)),
            "im": float(np.sin(2 * np.pi * 18 / 24)),
            "closed_form": "exp(2*pi*i*18/24) = exp(3*pi*i/2) = -i",
        },
        "phase_under_one_tick_m9": {
            "re": float(np.cos(2 * np.pi * 9 / 24)),
            "im": float(np.sin(2 * np.pi * 9 / 24)),
            "closed_form": "exp(2*pi*i*9/24) = exp(3*pi*i/4)",
        },
        "has_derived_gauge_field_on_30_edges": False,
        "reason_not_gauged": (
            "alt_cycle34: H64 and the 24-clock have no derived charged current "
            "onto the 30 icosahedral edges; no clock gauge field is invented here."
        ),
    }

    # Q_geo of Delta
    Q_geo = 2
    # candidate charges of the condensate under Q_other
    candidates = []

    # Clock acting as Wilson charge 2 on history / pairing-as-ψψ (each ψ charge 1)
    candidates.append({
        "name": "clock_Wilson_on_pairing_as_psipsi",
        "Q_other_of_Delta": 2,
        "c_if_used": -1.0,
        "independent_of_Q_geo_on_geometry": False,
        "note": (
            "If the clock acts on geometric fermions with Wilson charge 1, "
            "that action coincides with global Q_geo on the 12 vertices, "
            "and ψψ then has clock charge 2, equal to Q_geo(Δ). The formal "
            "c = -1 makes Q_geo - Q_clock vanish on all geometric fields "
            "(ψ, Δ, A) and equal −2 on history. That is not a second gauge "
            "U(1) mixed with A; it is the statement that clock-on-geometry "
            "is global Q_geo."
        ),
        "independently_gauged": False,
        "produces_massless_gauge_photon": False,
    })
    candidates.append({
        "name": "clock_Fourier_m18_on_hidden_golden_mode",
        "Q_other_of_hidden": 18,
        "c_if_hidden_were_the_condensate": float(-2.0 / 18.0),
        "independent_of_Q_geo": True,
        "note": (
            "A clock tick multiplies the m=18 mode by −i (Z_24 charge 18). "
            "The condensed-phase Δ of cycles 18–26 carries no clock index, "
            "so this charge is not a charge of the spatial 4_5 pairing used "
            "to Higgs A. Even if it were, Z_24 is discrete and is not gauged "
            "on the 30 edges."
        ),
        "independently_gauged": False,
        "produces_massless_gauge_photon": False,
    })
    candidates.append({
        "name": "Hbits_kernel_SO2",
        "Q_other_of_4_5": 0,
        "overlap_with_ker": overlap,
        "principal_angles_deg": angles,
        "c_if_used": None,
        "independently_gauged": False,
        "produces_massless_gauge_photon": False,
        "note": "4_5 = Uh P5 lives at Hbits = 16 and is orthogonal to ker Hbits.",
    })
    candidates.append({
        "name": "A5_commutant_of_the_4",
        "Q_other_of_4_5": 0,
        "Frobenius_Schur_of_4": fs4,
        "End_A5_4_is_reals": end_is_reals,
        "c_if_used": None,
        "independently_gauged": False,
        "produces_massless_gauge_photon": False,
        "note": "Real irrep: no A5-invariant U(1) that can charge 4_5.",
    })

    # remnant Z2
    remnant = {
        "unbroken_Z2": True,
        "action_on_fermions": "psi -> -psi when alpha = pi",
        "action_on_Delta": "identity (exp(i*2*pi) = 1)",
        "is_a_U1": False,
        "has_gauge_field": False,
    }

    # cycle 25: no zero mode
    c25 = json.loads((ROOT / "coupled_cycle25_piflux_kernel" / "results.json").read_text())
    pi_rstar_T0 = c25["points"]["rstar_T0"]["Pi"]
    no_zero_mode = bool(
        pi_rstar_T0["positive_definite"]
        and pi_rstar_T0["n_zeroish"] == 0
        and pi_rstar_T0["lambda_min_PiT"] > 1e-10
    )

    any_gauged_other = any(c["independently_gauged"] for c in candidates)
    any_massless = any(c["produces_massless_gauge_photon"] for c in candidates)
    # c fixed as a gauge mixing angle?
    c_fixed = False
    c_value = None
    gi_response_computed = False

    H1 = bool(Q_geo == 2 and no_zero_mode)
    H2 = bool((not any_gauged_other) and (not any_massless))
    H3 = bool(overlap < 1e-10 and end_is_reals)

    if H1 and H2 and H3:
        classification = "PROVED"
        note = (
            "The geometric U(1) is Higgsed to Z2 (Q_geo(Δ)=2, Π_T has no "
            "zero mode). No second derived, independently gauged U(1) charges "
            "the 4_5 condensate, so there is no electroweak-like mixing angle "
            "and no massless Maxwell photon from a combination. The Hbits-kernel "
            "SO(2) does not act on 4_5; End_A5(4) ≅ ℝ."
        )
    else:
        classification = "CONDITIONAL"
        note = f"H1={H1} H2={H2} H3={H3}"

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "Q_geo_of_Delta": Q_geo,
        "geometric_photon_has_zero_mode": (not no_zero_mode),
        "pi_flux_lambda_min": pi_rstar_T0["lambda_min_PiT"],
        "pi_flux_identity_like": pi_rstar_T0.get("identity_like"),
        "Hbits": {
            "spectrum_rounded": [int(round(x)) for x in ev_h],
            "n_kernel": n_ker,
            "UhP5_rank": rank5,
            "UhP3_rank": rank3,
            "overlap_4_5_with_ker": overlap,
            "overlap_4_3_with_ker": overlap3,
            "principal_angles_4_5_ker_deg": angles,
        },
        "clock": clock,
        "Frobenius_Schur_4": fs4,
        "End_A5_4_is_reals": end_is_reals,
        "candidates": candidates,
        "discrete_remnant": remnant,
        "c_fixed_as_gauge_mixing_angle": c_fixed,
        "c_value": c_value,
        "unbroken_gauged_combination_exists": False,
        "GI_response_of_combination_computed": gi_response_computed,
        "reason_GI_not_computed": (
            "No independently gauged Q_other (criterion C2); a mixed kernel "
            "would invent a second gauge field."
        ),
        "hypotheses": {
            "H1_geo_Higgsed_to_Z2": H1,
            "H2_no_gauged_mixing": H2,
            "H3_no_history_or_A5_U1_on_4_5": H3,
        },
        "classification": classification,
        "classification_note": note,
        "advances_physical_ARF": False,
        "R_alpha_compared": False,
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    summary = {
        "classification": classification,
        "note": note,
        "H": results["hypotheses"],
        "Q_geo": Q_geo,
        "n_ker": n_ker,
        "overlap_45": overlap,
        "FS4": fs4,
        "c_fixed": c_fixed,
        "unbroken_gauged": False,
        "GI_computed": False,
        "pi_lmin": pi_rstar_T0["lambda_min_PiT"],
    }
    print(json.dumps(sanitize(summary), indent=2))


if __name__ == "__main__":
    main()
