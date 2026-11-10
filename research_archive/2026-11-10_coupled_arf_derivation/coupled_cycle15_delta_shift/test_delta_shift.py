#!/usr/bin/env python3
"""Coupled cycle 15: Hbits-induced shift of effective Delta / delta."""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

OUT = Path("/workspace/arf_research/coupled_cycle15_delta_shift")
C03 = Path("/workspace/arf_research/coupled_cycle03_map_F_hessian/results.json")
C05 = Path("/workspace/arf_research/coupled_cycle05_response_matter_arf/results.json")
C14 = Path("/workspace/arf_research/coupled_cycle14_H5H3_identity/results.json")

PHI = (1.0 + np.sqrt(5.0)) / 2.0


def gold_lambda_mode18():
    return float(4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2)


def writings_of(target, S):
    S = sorted(set(int(x) for x in S))
    writings = set()
    named = []
    for a in S:
        for b in S:
            if a * b == target:
                writings.add(f"{a}*{b}")
            if a + b == target:
                writings.add(f"{a}+{b}")
            if a - b == target:
                writings.add(f"{a}-{b}")
            for c in S:
                if c != 0 and a * b == target * c:
                    writings.add(f"{a}*{b}/{c}")
    return sorted(writings)


def main():
    c03 = json.loads(C03.read_text())
    c05 = json.loads(C05.read_text())
    c14 = json.loads(C14.read_text())

    delta_star = 80.0 * np.pi / (1053.0 * PHI)
    Delta = 3.0 / 20.0 - delta_star
    gamma = 1.0 / 81.0
    lam = gold_lambda_mode18()
    rho = (np.pi / np.e) ** 2 * lam

    c3 = (16.0 + rho) / (4.0 * (18.0 + rho))
    c5 = (14.0 + rho) / (4.0 * (16.0 + rho))
    H3 = 2.0 * c3
    H5 = 2.0 * (Delta ** 2) * c5
    f_rho = np.sqrt((14.0 + rho) * (18.0 + rho)) / (16.0 + rho)
    Delta_eff = np.sqrt(H5 / H3)
    assert abs(Delta_eff - Delta * f_rho) < 1e-15

    # Step 1: observable, no ARF yet.
    O_Delta = Delta_eff - Delta
    delta_eff = 3.0 / 20.0 - Delta_eff
    O_delta = delta_eff - delta_star
    assert abs(O_delta + O_Delta) < 1e-15
    assert abs(O_Delta - Delta * (f_rho - 1.0)) < 1e-15
    assert abs(O_delta - Delta * (1.0 - f_rho)) < 1e-15

    f0 = 3.0 * np.sqrt(7.0) / 8.0
    assert abs(f0 - np.sqrt(63.0 / 64.0)) < 1e-15
    assert abs(14.0 * 18.0 / 16.0 ** 2 - 63.0 / 64.0) < 1e-15
    assert abs((16.0 - 2.0) * (16.0 + 2.0) / 16.0 ** 2 - (1.0 - 1.0 / 64.0)) < 1e-15
    O_Delta_rho0 = Delta * (f0 - 1.0)
    O_delta_rho0 = Delta * (1.0 - f0)

    # Archive consistency with cycles 03 / 14 (not an ARF).
    H3_arch = float(c03["H_hid"]["degeneracies"]["hidden_4_3"]["eigenvalue"])
    H5_arch = float(c03["H_hid"]["degeneracies"]["hidden_4_5"]["eigenvalue"])
    E2 = float(c05["T0"]["E2"])
    sqrt_H_c14 = float(c14["numeric"]["sqrt_H5_over_H3"])
    assert abs(rho - E2) / E2 < 1e-12
    assert abs(H3 - H3_arch) / H3_arch < 1e-12
    assert abs(H5 - H5_arch) / H5_arch < 1e-12
    assert abs(Delta_eff - sqrt_H_c14) / sqrt_H_c14 < 1e-12

    observable = {
        "definition": {
            "Delta_eff": "sqrt(H5/H3)",
            "Delta_ref": "Delta (equal-Hbits / rho -> inf limit)",
            "O_Delta": "Delta_eff - Delta = Delta (f(rho) - 1)",
            "O_delta": "delta_eff - delta_star = -O_Delta = Delta (1 - f(rho))",
            "f_rho": "sqrt((14+rho)(18+rho))/(16+rho)",
        },
        "rho": rho,
        "f_rho": f_rho,
        "f_rho0": f0,
        "f_rho0_identity_sqrt_63_64": True,
        "identity_14_18_over_16sq_is_63_64": True,
        "identity_63_64_is_1_minus_1_64": True,
        "Delta": Delta,
        "delta_star": delta_star,
        "Delta_eff": Delta_eff,
        "delta_eff": delta_eff,
        "O_Delta": O_Delta,
        "O_delta": O_delta,
        "O_Delta_rho0": O_Delta_rho0,
        "O_delta_rho0": O_delta_rho0,
        "polynomial_type_of_O_delta": "linear in Delta, equivalently affine in delta_star",
        "match_cycle14_Delta_eff": abs(Delta_eff - sqrt_H_c14) / sqrt_H_c14,
    }

    # Step 2: only now form the historical comparison value.
    Dd = -(delta_star ** 3) / 63.0 - gamma / 40.0
    term_cube = -(delta_star ** 3) / 63.0
    term_gamma = -gamma / 40.0
    assert abs(gamma / 40.0 - 1.0 / 3240.0) < 1e-18

    def rel(a, b):
        return float(abs(a - b) / abs(b)) if b != 0 else float("inf")

    comparison = {
        "Delta_delta_ARF": Dd,
        "term_minus_delta_star_cubed_over_63": term_cube,
        "term_minus_gamma_over_40": term_gamma,
        "O_Delta_over_ARF": O_Delta / Dd,
        "O_delta_over_ARF": O_delta / Dd,
        "rel_O_delta_vs_ARF": rel(O_delta, Dd),
        "rel_O_Delta_vs_ARF": rel(O_Delta, Dd),
        "rel_O_delta_vs_cube_term": rel(O_delta, term_cube),
        "rel_O_delta_vs_gamma_term": rel(O_delta, term_gamma),
        "rel_O_Delta_vs_cube_term": rel(O_Delta, term_cube),
        "rel_O_Delta_vs_gamma_term": rel(O_Delta, term_gamma),
        "threshold": 1e-4,
        "O_delta_matches_ARF": rel(O_delta, Dd) < 1e-4,
        "O_Delta_matches_ARF": rel(O_Delta, Dd) < 1e-4,
        "O_delta_matches_cube_term": rel(O_delta, term_cube) < 1e-4,
        "O_delta_matches_gamma_term": rel(O_delta, term_gamma) < 1e-4,
        "polynomial_type_of_ARF": "cubic in delta_star plus constant gamma/40",
        "polynomial_types_agree": False,
    }
    assert comparison["polynomial_types_agree"] is False
    assert not comparison["O_delta_matches_ARF"]
    assert not comparison["O_Delta_matches_ARF"]
    assert not comparison["O_delta_matches_cube_term"]
    assert not comparison["O_delta_matches_gamma_term"]

    S = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 18, 20, 24,
         30, 32, 35, 40, 50, 51, 63, 64, 79, 80, 81, 90, 105, 190]
    w63 = writings_of(63, S)
    w64 = writings_of(64, S)
    named_63 = [
        "64-1 (complement of the constant history / traceless H64)",
        "7*9 (cycle 04; also 7 from Hodge 5-space and 9 from charge-1 mode)",
        "12+51 (cycle 04)",
        "13+50 (cycle 04)",
        "dim su(8) = 8^2-1 on the hidden 8 (cycle 04)",
        "14*18/4 from Hbits numerators (14=16-2, 18=16+2)",
        "14*18/16^2 = 63/64, so the numerator 63 after clearing 64",
        "(64/63)/Delta^2 Schur covariance ratio at rho=0 (cycle 07), same 63 as 14*18/16^2",
        "ARF denominator of delta_star^3/63 (historical, comparison only)",
    ]
    named_64 = [
        "2^6 = number of histories = dim H64",
        "4*16 (Hbits 16 times hidden-quartet dimension)",
        "16^2/4 = 64",
        "8^2",
        "80-16",
        "history filtration head (ranks start at 64)",
    ]
    look = {
        "structure_list_S": S,
        "n_writings_63_from_S": len(w63),
        "n_writings_64_from_S": len(w64),
        "sample_writings_63": w63[:40],
        "sample_writings_64": w64[:40],
        "named_writings_63": named_63,
        "named_writings_64": named_64,
        "two_63s_are_the_same_theorem": False,
        "comment": (
            "The Hbits 63 in 14*18/16^2 = 63/64 is the same integer that "
            "appears inverted in cycle 07's (64/63)/Delta^2. The ARF "
            "denominator 63 is a separately written historical factor "
            "(cycle 04 already listed several origins). Sharing an integer "
            "with many writings is not a derivation of the ARF from O."
        ),
    }

    classification = "PROVED"
    identification = "FALSIFIED"
    numerology = True

    out = {
        "classification": classification,
        "closed_form_of_O": "PROVED",
        "identification_O_equals_ARF": identification,
        "is_numerology": numerology,
        "advances_physical_ARF": False,
        "surviving_dimension": 2,
        "is_a_ray": False,
        "observable": observable,
        "comparison": comparison,
        "look_elsewhere": look,
        "integrity": {
            "predeclaration_sha256":
                "5b11084f474fadb0cac6e48f2edbaadbea3b0ec249b9b05f0ad975a81bc6703e",
        },
    }
    (OUT / "results.json").write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps({
        "O_delta": O_delta,
        "O_Delta": O_Delta,
        "ARF": Dd,
        "O_delta_over_ARF": O_delta / Dd,
        "rel_O_delta": comparison["rel_O_delta_vs_ARF"],
        "n63": len(w63),
        "n64": len(w64),
        "identification": identification,
        "numerology": numerology,
    }, indent=2))


if __name__ == "__main__":
    main()
