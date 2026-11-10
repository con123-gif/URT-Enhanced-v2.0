#!/usr/bin/env python3
"""Coupled cycle 14: closed form of H5/H3 from V_hist, A3, A5."""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

OUT = Path("/workspace/arf_research/coupled_cycle14_H5H3_identity")
C03 = Path("/workspace/arf_research/coupled_cycle03_map_F_hessian/results.json")
C05 = Path("/workspace/arf_research/coupled_cycle05_response_matter_arf/results.json")
C12 = Path("/workspace/arf_research/coupled_cycle12_ratio_ward_rg/results.json")

PHI = (1.0 + np.sqrt(5.0)) / 2.0


def gold_lambda_mode18():
    # Charge-2 gold-angle eigenvalue of the 24-clock at Fourier mode 18:
    # 4 sin^2(pi*18/24 - 2pi/phi^2) = 4 sin^2(pi(9-4sqrt(5))/4).
    return float(4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2)


def main():
    c03 = json.loads(C03.read_text())
    c05 = json.loads(C05.read_text())
    c12 = json.loads(C12.read_text())

    delta_star = 80.0 * np.pi / (1053.0 * PHI)
    Delta = 3.0 / 20.0 - delta_star
    Delta2 = Delta**2

    lam_min = gold_lambda_mode18()
    rho = (np.pi / np.e) ** 2 * lam_min

    c3 = 0.25 - 1.0 / (2.0 * (18.0 + rho))
    c5 = 0.25 - 1.0 / (2.0 * (16.0 + rho))
    # closed algebraic forms
    c3_closed = (16.0 + rho) / (4.0 * (18.0 + rho))
    c5_closed = (14.0 + rho) / (4.0 * (16.0 + rho))
    assert abs(c3 - c3_closed) < 1e-15
    assert abs(c5 - c5_closed) < 1e-15

    H3 = 2.0 * c3
    H5 = 2.0 * Delta2 * c5
    ratio_H = H5 / H3
    sqrt_H = np.sqrt(ratio_H)
    factor = np.sqrt((14.0 + rho) * (18.0 + rho)) / (16.0 + rho)
    sqrt_H_formula = Delta * factor
    assert abs(sqrt_H - sqrt_H_formula) < 1e-15

    # limits
    factor_rho0 = np.sqrt(63.0 / 64.0)  # 3 sqrt(7) / 8
    factor_rho0_exact = 3.0 * np.sqrt(7.0) / 8.0
    assert abs(factor_rho0 - factor_rho0_exact) < 1e-15
    sqrt_H_rho0 = Delta * factor_rho0_exact
    sqrt_H_rho_inf = Delta  # c3 = c5 = 1/4

    rel_vs_Delta = (Delta - sqrt_H) / Delta
    rel_vs_rho0 = (sqrt_H_rho0 - sqrt_H) / sqrt_H_rho0
    one_minus_factor = 1.0 - factor
    one_minus_rho0 = 1.0 - factor_rho0_exact

    # match archived numbers
    c3_arch = float(c03["c3_gold"])
    c5_arch = float(c03["c5_gold"])
    H3_arch = float(c03["H_hid"]["degeneracies"]["hidden_4_3"]["eigenvalue"])
    H5_arch = float(c03["H_hid"]["degeneracies"]["hidden_4_5"]["eigenvalue"])
    E2 = float(c05["T0"]["E2"])
    sqrt_H_c12 = float(c12["M1_matching_recipes"]["values"]["canonical_hidden_sqrt_H5_over_H3"])
    Delta_c12 = float(c12["M1_matching_recipes"]["values"]["V_hist_Delta"])

    match_c3 = abs(c3 - c3_arch) / c3_arch
    match_c5 = abs(c5 - c5_arch) / c5_arch
    match_H3 = abs(H3 - H3_arch) / H3_arch
    match_H5 = abs(H5 - H5_arch) / H5_arch
    match_rho_E2 = abs(rho - E2) / E2
    match_c12 = abs(sqrt_H - sqrt_H_c12) / sqrt_H_c12

    # identity sqrt(H5/H3) == Delta ?
    identity_holds = abs(sqrt_H - Delta) < 1e-15
    # the 0.78% is the structural factor
    structural = abs(rel_vs_Delta - one_minus_factor) < 1e-14

    results = {
        "classification": "PROVED",
        "identity_sqrtH_equals_Delta": "FALSIFIED",
        "closed_form": {
            "formula": "sqrt(H5/H3) = Delta * sqrt((14+rho)(18+rho)) / (16+rho)",
            "H5_over_H3": "Delta^2 * (14+rho)(18+rho) / (16+rho)^2",
            "c3": "(16+rho)/(4(18+rho))",
            "c5": "(14+rho)/(4(16+rho))",
            "rho": "(pi/e)^2 * lambda_min(L2_charge2_gold)",
        },
        "numeric": {
            "phi": PHI,
            "Delta": Delta,
            "Delta2": Delta2,
            "lambda_min_L2": lam_min,
            "rho": rho,
            "c3": c3,
            "c5": c5,
            "H3": H3,
            "H5": H5,
            "H5_over_H3": ratio_H,
            "sqrt_H5_over_H3": sqrt_H,
            "structural_factor": factor,
            "relative_Delta_minus_sqrtH_over_Delta": rel_vs_Delta,
        },
        "limits": {
            "rho_to_0_factor": factor_rho0_exact,
            "rho_to_0_factor_formula": "3*sqrt(7)/8 = sqrt(63/64)",
            "rho_to_0_sqrtH": sqrt_H_rho0,
            "rho_to_inf_sqrtH": sqrt_H_rho_inf,
            "rho_to_inf_is_exactly_Delta": True,
            "physical_vs_rho0_relative": rel_vs_rho0,
            "one_minus_3sqrt7_over_8": one_minus_rho0,
        },
        "archive_match": {
            "c3_rel_err": match_c3,
            "c5_rel_err": match_c5,
            "H3_rel_err": match_H3,
            "H5_rel_err": match_H5,
            "rho_vs_E2_rel_err": match_rho_E2,
            "E2": E2,
            "cycle12_sqrtH_rel_err": match_c12,
            "cycle12_Delta": Delta_c12,
        },
        "identity_holds": identity_holds,
        "relative_difference_is_the_structural_factor": structural,
        "look_elsewhere": {
            "scanned_Cathedral_targets_to_match_the_0.78pct": False,
            "origin": (
                "The factor 1 - sqrt((14+rho)(18+rho))/(16+rho) is forced "
                "by Hbits eigenvalues 18 and 16 together with the archived "
                "gold-angle clock shift rho = E2. At rho = 0 it is "
                "1 - 3*sqrt(7)/8 = 1 - sqrt(63/64) ≈ 0.7843258%."
            ),
        },
        "statement": (
            "H5/H3 = Δ² (c5/c3) = Δ² (14+ρ)(18+ρ)/(16+ρ)² exactly, with "
            f"ρ = (π/e)² λ_min(L2) = E2 = {rho:.16e}. Therefore "
            f"√(H5/H3) = Δ × {factor:.16f}, not Δ. The relative difference "
            f"{rel_vs_Delta:.8%} equals 1 minus that structural factor "
            "(and equals 1 − 3√7/8 at ρ = 0, which is already within "
            f"{abs(rel_vs_rho0):.3%} of the physical value). The identity "
            "√(H5/H3) = Δ holds if and only if c3 = c5, i.e. in the limit "
            "ρ → ∞ (clock dominates 18 and 16). It is not an identity at "
            "the archived ρ, and the 0.78% is not an independent coincidence."
        ),
    }

    assert match_c3 < 1e-12 and match_c5 < 1e-12
    assert match_H3 < 1e-12 and match_H5 < 1e-12
    assert match_rho_E2 < 1e-12
    assert match_c12 < 1e-12
    assert not identity_holds
    assert structural

    def default(o):
        if isinstance(o, np.generic):
            return o.item()
        raise TypeError(type(o))

    (OUT / "results.json").write_text(json.dumps(results, indent=2, default=default) + "\n")
    print(json.dumps({
        "classification": results["classification"],
        "identity_sqrtH_equals_Delta": results["identity_sqrtH_equals_Delta"],
        "sqrt_H5_over_H3": sqrt_H,
        "Delta": Delta,
        "structural_factor": factor,
        "rel_diff": rel_vs_Delta,
        "rho": rho,
        "E2": E2,
        "rho0_factor": factor_rho0_exact,
        "statement": results["statement"],
    }, indent=2))


if __name__ == "__main__":
    main()
