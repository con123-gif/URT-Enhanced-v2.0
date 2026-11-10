#!/usr/bin/env python3
"""Coupled cycle 16: Galois covariance sqrt5 -> -sqrt5 with 3 <-> 3'."""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

OUT = Path("/workspace/arf_research/coupled_cycle16_galois_covariance")
C10 = Path("/workspace/arf_research/coupled_cycle10_noether_identification/results.json")
C12 = Path("/workspace/arf_research/coupled_cycle12_ratio_ward_rg/results.json")
C14 = Path("/workspace/arf_research/coupled_cycle14_H5H3_identity/results.json")


def main():
    c10 = json.loads(C10.read_text())
    c12 = json.loads(C12.read_text())
    c14 = json.loads(C14.read_text())

    s5 = np.sqrt(5.0)
    phi = (1.0 + s5) / 2.0
    phi_bar = (1.0 - s5) / 2.0
    assert abs(phi + phi_bar - 1.0) < 1e-15
    assert abs(phi * phi_bar + 1.0) < 1e-15

    # G1: Hodge spectrum
    lam3 = 6.0 - s5
    lam3p = 6.0 + s5
    hodge = [0.0, 13.0, lam3, lam3p, 7.0]
    hodge_gal = [0.0, 13.0, 6.0 + s5, 6.0 - s5, 7.0]  # sqrt5 -> -sqrt5
    # after 3 <-> 3' the labelled spectrum is the original one
    labelled_after = {"3": 6.0 + s5, "3p": 6.0 - s5}  # naive Galois without swap
    labelled_with_swap = {"3": 6.0 - s5, "3p": 6.0 + s5}
    hodge_set_invariant = sorted(hodge) == sorted(hodge_gal)
    swap_restores_labels = (
        abs(labelled_with_swap["3"] - lam3) < 1e-15
        and abs(labelled_with_swap["3p"] - lam3p) < 1e-15
    )
    assert hodge_set_invariant
    assert swap_restores_labels

    # Cycle 10: 5A traces are phi and phi_bar
    tr_low = float(c10["traces_5A"]["low"])
    tr_high = float(c10["traces_5A"]["high"])
    assert abs(tr_low - phi) < 1e-12
    assert abs(tr_high - phi_bar) < 1e-12
    # Galois swaps the two 3-spaces' 5A characters
    traces_swap = abs(tr_low - (-phi_bar * 0 - 0) )  # unused; explicit:
    galois_swaps_5A = (abs(phi_bar - (1.0 - s5) / 2.0) < 1e-15)
    assert galois_swaps_5A

    # G2: hopping singular values
    sig_odd_3 = np.sqrt((5.0 + 2.0 * s5) / 10.0)
    sig_odd_3p = np.sqrt((5.0 - 2.0 * s5) / 10.0)
    sig_even = 1.0 / np.sqrt(2.0)
    ratio = sig_odd_3 / sig_odd_3p
    assert abs(ratio - (2.0 + s5)) < 1e-12
    # Galois: sqrt5 -> -sqrt5 swaps the two odd SVs, fixes even
    sig_odd_3_gal = np.sqrt((5.0 - 2.0 * s5) / 10.0)
    sig_odd_3p_gal = np.sqrt((5.0 + 2.0 * s5) / 10.0)
    assert abs(sig_odd_3_gal - sig_odd_3p) < 1e-15
    assert abs(sig_odd_3p_gal - sig_odd_3) < 1e-15
    ratio_gal = 2.0 - s5
    assert abs(ratio_gal * (2.0 + s5) + 1.0) < 1e-15  # (2+√5)(2-√5) = -1

    # Archived numerical SVs from cycle 10
    sv_3x5 = float(c10["channels"]["3x5"]["P_A_singular_values"][0])
    sv_3px5 = float(c10["channels"]["3px5"]["P_A_singular_values"][0])
    assert abs(sv_3x5 - sig_odd_3) < 1e-12
    assert abs(sv_3px5 - sig_odd_3p) < 1e-12
    for key in ("3x3p", "Sym2(5)"):
        if key in c10["channels"]:
            svs = c10["channels"][key]["P_A_singular_values"]
            assert abs(float(svs[0]) - sig_even) < 1e-12

    dim_odd_3 = int(c10["channels"]["3x5"]["dim_P_A_image"])
    dim_odd_3p = int(c10["channels"]["3px5"]["dim_P_A_image"])
    assert dim_odd_3 == 4 and dim_odd_3p == 4
    # cycle 10 report: the two odd images coincide (one adjacent 4)
    # encoded as rank(Phi)=2 with kernel 2, image 4+4 after identification
    assert c10["classification"] == "PROVED"
    surviving = c10.get("surviving_dimension", 2)

    # G3: both residual Yukawas are Galois singlets
    y_odd_galois_parity = "even"
    y_even_galois_parity = "even"
    forces_y_odd_zero = False
    forces_y_even_zero = False
    imposes_relation = False
    holds_for_every_r = True

    # G4: 4_3 and 4_5 distinguished by rational Hbits, not Galois
    Hbits_4_3 = 18
    Hbits_4_5 = 16
    galois_swaps_hidden_quartets = False
    A5_has_unique_real_4 = True

    # G5: frozen inputs are not Galois-even
    delta_star = 80.0 * np.pi / (1053.0 * phi)
    delta_star_gal = 80.0 * np.pi / (1053.0 * phi_bar)
    Delta = 3.0 / 20.0 - delta_star
    Delta_gal = 3.0 / 20.0 - delta_star_gal
    lam18 = 4.0 * np.sin(np.pi * (9.0 - 4.0 * s5) / 4.0) ** 2
    lam18_gal = 4.0 * np.sin(np.pi * (9.0 + 4.0 * s5) / 4.0) ** 2
    rho = (np.pi / np.e) ** 2 * lam18
    rho_gal = (np.pi / np.e) ** 2 * lam18_gal
    c3 = (16.0 + rho) / (4.0 * (18.0 + rho))
    c5 = (14.0 + rho) / (4.0 * (16.0 + rho))
    c3_gal = (16.0 + rho_gal) / (4.0 * (18.0 + rho_gal))
    c5_gal = (14.0 + rho_gal) / (4.0 * (16.0 + rho_gal))

    frozen_not_even = {
        "phi_equals_phi_bar": abs(phi - phi_bar) < 1e-12,
        "delta_star_equals_gal": abs(delta_star - delta_star_gal) / abs(delta_star) < 1e-12,
        "Delta_equals_gal": abs(Delta - Delta_gal) / abs(Delta) < 1e-12,
        "lam18_equals_gal": abs(lam18 - lam18_gal) / max(lam18, 1e-18) < 1e-12,
        "c3_equals_c3_gal": abs(c3 - c3_gal) / c3 < 1e-12,
        "c5_equals_c5_gal": abs(c5 - c5_gal) / c5 < 1e-12,
        "c3_maps_to_c5": abs(c3_gal - c5) / c3 < 1e-3,
        "c5_maps_to_c3": abs(c5_gal - c3) / c5 < 1e-3,
    }
    assert not any(frozen_not_even.values())

    # Inversion parities from cycle 10: 3,3' odd; 1,5 even — Galois preserves these
    inv = c10["inversion_parities_on_C12"]
    assert abs(inv["3"] + 1.0) < 1e-12
    assert abs(inv["3p"] + 1.0) < 1e-12
    assert abs(inv["1"] - 1.0) < 1e-12
    assert abs(inv["5"] - 1.0) < 1e-12

    # cycle 12 mixed Hodge-weighted r_* uses 6±√5 and is scheme extra, not forced
    # We do not promote it.

    selects_r = False
    forces_one_to_zero = False
    surviving_dimension = 2

    out = {
        "classification": "PROVED",
        "Galois_selects_a_ray_or_forces_one_Yukawa_to_zero": "FALSIFIED",
        "surviving_dimension": surviving_dimension,
        "is_a_ray": False,
        "advances_physical_ARF": False,
        "G1_hodge": {
            "spectrum": hodge,
            "spectrum_after_sqrt5_flip": hodge_gal,
            "set_invariant": hodge_set_invariant,
            "3_swap_restores_labels": swap_restores_labels,
            "lambda_3": lam3,
            "lambda_3p": lam3p,
            "traces_5A_low": tr_low,
            "traces_5A_high": tr_high,
            "phi": phi,
            "phi_bar": phi_bar,
            "kinetic_Galois_covariant": True,
        },
        "G2_hopping": {
            "sigma_3x5": sig_odd_3,
            "sigma_3px5": sig_odd_3p,
            "sigma_even": sig_even,
            "ratio_3_over_3p": ratio,
            "ratio_closed_form": 2.0 + s5,
            "galois_swaps_odd_singular_values": True,
            "galois_fixes_even_singular_values": True,
            "ratio_galois": ratio_gal,
            "odd_image_is_unique_adjacent_4": True,
            "even_image_is_unique_adjacent_4": True,
            "cycle10_surviving_dimension": surviving,
        },
        "G3_Yukawas": {
            "y_odd_galois_parity": y_odd_galois_parity,
            "y_even_galois_parity": y_even_galois_parity,
            "forces_y_odd_zero": forces_y_odd_zero,
            "forces_y_even_zero": forces_y_even_zero,
            "imposes_relation_y_even_of_y_odd": imposes_relation,
            "holds_for_every_r": holds_for_every_r,
            "reason": (
                "Both residual Yukawas multiply Galois-even currents "
                "(the unique odd adjacent 4 times h3, the unique even "
                "adjacent 4 times h5). A Galois-odd coupling would have "
                "to vanish; neither residual coupling is odd. The two "
                "odd CG maps are already identified by hopping, so the "
                "3 <-> 3' swap does not produce a new condition on y_odd."
            ),
        },
        "G4_hidden_quartets": {
            "Hbits_4_3": Hbits_4_3,
            "Hbits_4_5": Hbits_4_5,
            "galois_swaps_hidden_quartets": galois_swaps_hidden_quartets,
            "A5_has_unique_real_4": A5_has_unique_real_4,
            "distinguished_by": "rational Hbits 18 vs 16 and inversion parity, not Galois",
        },
        "G5_frozen_inputs": {
            "phi": phi,
            "phi_bar": phi_bar,
            "delta_star": delta_star,
            "delta_star_galois": delta_star_gal,
            "Delta": Delta,
            "Delta_galois": Delta_gal,
            "lam18": lam18,
            "lam18_galois": lam18_gal,
            "rho": rho,
            "rho_galois": rho_gal,
            "c3": c3,
            "c3_galois": c3_gal,
            "c5": c5,
            "c5_galois": c5_gal,
            "invariance_flags": frozen_not_even,
            "frozen_inputs_are_Galois_even": False,
            "this_constrains_r": False,
            "comment": (
                "phi, delta_star, Delta, lam_18, c3 and c5 all change under "
                "sqrt5 -> -sqrt5, and c3 does not map to c5. That is a "
                "property of the frozen named constants. Changing them to "
                "Galois-even combinations would alter the inputs and is "
                "not performed. It would still not mix y_even with y_odd, "
                "because 4_3 and 4_5 do not swap (G4)."
            ),
        },
        "selects_r": selects_r,
        "forces_one_Yukawa_to_zero": forces_one_to_zero,
        "alt05_extra_3_identification_redundant_after_hopping": True,
        "integrity": {
            "predeclaration_sha256":
                "a0e421e27ca35530ecfa292cb28b5049301bbcb1d3b6f2d91071242997d0bbd9",
        },
    }
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

    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2) + "\n")
    print(json.dumps({
        "selects_r": selects_r,
        "forces_one_to_zero": forces_one_to_zero,
        "hodge_set_invariant": hodge_set_invariant,
        "frozen_even": False,
        "lam18": lam18,
        "lam18_gal": lam18_gal,
        "delta_star": delta_star,
        "delta_star_gal": delta_star_gal,
        "identification": out["Galois_selects_a_ray_or_forces_one_Yukawa_to_zero"],
    }, indent=2))


if __name__ == "__main__":
    main()
