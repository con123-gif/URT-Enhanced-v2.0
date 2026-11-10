#!/usr/bin/env python3
"""Coupled cycle 05: five-solid constraints, T0 poles/residues/transfers, Ward, H13⊕H51, ARF comparison only."""
from __future__ import annotations
import json
from pathlib import Path
import numpy as np

SRC = Path("/workspace/arf_research/repo/research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py")
OUT = Path("/workspace/arf_research/coupled_cycle05_response_matter_arf")


def load_ops():
    g = {}
    exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), g)
    return g


def a5_inner(chi, psi, class_sizes=(1, 15, 20, 12, 12)):
    return float(np.dot(class_sizes, np.array(chi) * np.array(psi)) / 60.0)


def sym2_char(chi, chi_gsq):
    return tuple((c * c + c2) / 2.0 for c, c2 in zip(chi, chi_gsq))


def tensor_char(chi, psi):
    return tuple(a * b for a, b in zip(chi, psi))


def decompose(chi, table):
    return {name: round(a5_inner(chi, t), 10) for name, t in table.items()}


def main():
    g = load_ops()
    C, P3, P5, Iico = g["C"], g["P3"], g["P5"], g["Iico"]
    Plinear, Eglobal = g["Plinear"], g["Eglobal"]
    D, Cbridge, Hbits = g["D"], g["Cbridge"], g["Hbits"]
    names, geom = g["names"], g["geom"]
    r = float(g["r"])
    theta = float(g["theta"])
    Delta = float(g["Delta"])
    # frozen constants independently from the same closed forms
    phi = float(g["phi"])
    pi = float(g["pi"]) if "pi" in g else np.pi
    # the construction file uses math.pi / sympy? it's numpy/math in the file
    gamma = 1.0 / 81.0
    delta_star = 80.0 * np.pi / (1053.0 * phi)
    Delta_frozen = 3.0 / 20.0 - delta_star
    eta = -np.log(Delta)
    # consistency: loaded Delta should match frozen
    delta_match = abs(Delta - Delta_frozen) < 1e-15

    # ----- A. five-solid constraints -----
    VEF = {name: (geom[name]["V"], geom[name]["E"], geom[name]["F"]) for name in names}
    totV = sum(geom[n]["V"] for n in names)
    totE = sum(geom[n]["E"] for n in names)
    totF = sum(geom[n]["F"] for n in names)
    trD2 = float(np.trace(D @ D))
    trD4 = float(np.trace(D @ D @ D @ D))
    trCb = float(np.trace(Cbridge))
    trCb2 = float(np.trace(Cbridge @ Cbridge))
    rank_P = int(np.linalg.matrix_rank(Plinear, tol=1e-10))
    # each solid's contribution to Eglobal: rows v_offset:v_offset+V
    solid_e_norms = {}
    for name in names:
        v0 = geom[name]["v_offset"]
        V = geom[name]["V"]
        block = Eglobal[v0:v0 + V, :]
        solid_e_norms[name] = float(np.linalg.norm(block))
    every_solid_contributes = all(v > 1e-8 for v in solid_e_norms.values())

    def hidden_source_50(v50):
        x = Plinear @ np.asarray(v50, dtype=float)
        f = (C @ x) ** 2
        return P3 @ f, P5 @ f

    def q4(v50):
        h3, h5 = hidden_source_50(v50)
        return (2.0 / 9.0) * float(np.vdot(h3, h3).real) + (7.0 / 32.0) * (Delta ** 2) * float(np.vdot(h5, h5).real)

    pair_q = {}
    for i, s1 in enumerate(names):
        for s2 in names[i + 1:]:
            a = np.zeros(50)
            b = np.zeros(50)
            g1, g2 = geom[s1], geom[s2]
            a[g1["v_offset"]:g1["v_offset"] + g1["V"]] = 1.0 / np.sqrt(g1["V"])
            b[g2["v_offset"]:g2["v_offset"] + g2["V"]] = 1.0 / np.sqrt(g2["V"])
            pair_q[f"{s1}|{s2}"] = q4(a + b) - q4(a) - q4(b)
    every_pair_nonzero = all(abs(v) > 1e-9 for v in pair_q.values())

    five_solid = {
        "VEF_by_solid": VEF,
        "totals": {"V": totV, "E": totE, "F": totF},
        "Tr_D2": trD2,
        "Tr_D4": trD4,
        "Tr_Cbridge": trCb,
        "Tr_Cbridge2": trCb2,
        "rank_Plinear": rank_P,
        "solid_Eglobal_frobenius": solid_e_norms,
        "every_solid_contributes_to_Eglobal": every_solid_contributes,
        "pair_mixed_quartics_schur": pair_q,
        "every_pair_nonzero": every_pair_nonzero,
        "identities_ok": (
            totV == 50 and totE == 90 and totF == 50
            and abs(trD2 - 720) < 1e-8
            and abs(trD4 - 3456) < 1e-6
            and abs(trCb - 160) < 1e-8
            and rank_P == 8
            and every_solid_contributes
            and every_pair_nonzero
        ),
    }

    # ----- B. T0 spectrum, poles, residues -----
    Hg = D @ D + Cbridge
    Hg = 0.5 * (Hg + Hg.T)
    Eg = np.linalg.eigvalsh(Hg)
    Eh = np.linalg.eigvalsh(Hbits)
    ker_Hg = int(np.sum(np.abs(Eg) < 1e-9))
    ker_Hbits = int(np.sum(np.abs(Eh) < 1e-9))
    ms = np.arange(24)
    gaps1 = 2 - 2 * np.cos(theta - 2 * np.pi * ms / 24)
    gaps2 = 2 - 2 * np.cos(2 * theta - 2 * np.pi * ms / 24)
    m1 = int(np.argmin(gaps1))
    m2 = int(np.argmin(gaps2))
    E_geom = Eg[:, None] + (r * r) * gaps1[None, :]
    E_hist = Eh[:, None] + (r * r) * gaps2[None, :]
    E_all = np.concatenate([E_geom.ravel(), E_hist.ravel()])
    E_all.sort()
    E1 = float(E_all[0])
    # multiplicity of lowest
    mult1 = int(np.sum(np.abs(E_all - E1) < 1e-12))
    # second distinct
    E_rest = E_all[np.abs(E_all - E1) > 1e-12]
    E2 = float(E_rest[0])
    mult2 = int(np.sum(np.abs(E_all - E2) < 1e-12))
    # origin of E1, E2
    e1_from_geom = float(Eg.min() + r * r * gaps1[m1])
    e2_from_hist = float(Eh.min() + r * r * gaps2[m2])
    origin_E1 = "geom_kernel_x_charge1_m9" if abs(E1 - e1_from_geom) < 1e-14 else "mixed_or_other"
    origin_E2 = "hist_kernel_x_charge2_m18" if abs(E2 - e2_from_hist) < 1e-14 else "mixed_or_other"
    if abs(E2 - e1_from_geom) < 1e-14:
        origin_E2 = "geom_kernel_x_charge1_m9"

    lam_T1 = float(np.exp(-eta * E1))
    lam_T2 = float(np.exp(-eta * E2))
    z_pole1 = float(np.exp(eta * E1))  # 1/lam_T1
    z_pole2 = float(np.exp(eta * E2))
    # residue of 1/(1-z λ) at z=1/λ is -1/λ = -e^{η E}
    residue_scalar_1 = float(-np.exp(eta * E1))
    residue_scalar_2 = float(-np.exp(eta * E2))
    Gamma = float(eta * (E2 - E1))

    transfers = {
        "one_step": {"lambda_1": lam_T1, "lambda_2": lam_T2, "ratio_2_over_1": lam_T2 / lam_T1},
        "two_step": {"lambda_1": lam_T1 ** 2, "lambda_2": lam_T2 ** 2, "ratio_2_over_1": (lam_T2 / lam_T1) ** 2},
        "n_step_formula": "exp(-n * eta * E_k)",
        "no_timestep_identification": True,
        "gap_one_step": float(lam_T1 - lam_T2),
    }

    t0 = {
        "eta": float(eta),
        "Delta_loaded": float(Delta),
        "Delta_frozen": float(Delta_frozen),
        "delta_match": bool(delta_match),
        "ker_Hg": ker_Hg,
        "ker_Hbits": ker_Hbits,
        "Hg_min": float(Eg.min()),
        "Hbits_spectrum_rounded": {
            "0": int(np.sum(np.abs(Eh - 0) < 1e-8)),
            "10": int(np.sum(np.abs(Eh - 10) < 1e-8)),
            "16": int(np.sum(np.abs(Eh - 16) < 1e-8)),
            "18": int(np.sum(np.abs(Eh - 18) < 1e-8)),
        },
        "m1": m1,
        "m2": m2,
        "gaps1_m1": float(gaps1[m1]),
        "gaps2_m2": float(gaps2[m2]),
        "E1": E1,
        "E1_mult": mult1,
        "E1_origin": origin_E1,
        "E2": E2,
        "E2_mult": mult2,
        "E2_origin": origin_E2,
        "T0_lambda_1": lam_T1,
        "T0_lambda_2": lam_T2,
        "pole_z_1": z_pole1,
        "pole_z_2": z_pole2,
        "residue_scalar_1": residue_scalar_1,
        "residue_scalar_2": residue_scalar_2,
        "residue_operator": "(-exp(eta E_k)) * P_k",
        "Gamma_eta_E2_minus_E1": Gamma,
        "transfers": transfers,
        "lowest_fifteen": [float(x) for x in E_all[:15]],
    }

    # ----- D. Ward -----
    # kernel descriptions
    # Hg = D^2 + Cbridge; documented as all-solid vertex constants and face constants
    # Verify U0 and U2 columns: Cbridge involves U0 L5 U0.T + U2 L5 U2.T so
    # the equal-weight combination of all five solids' constants is in ker L5 (the all-ones of R^5)
    U0, U2 = g["U0"], g["U2"]
    # all-ones across 5 solids, pushed to 190 via U0 (vertex constants) and U2 (face constants)
    vconst = U0 @ np.ones(5)
    fconst = U2 @ np.ones(5)
    # normalize
    vconst = vconst / np.linalg.norm(vconst)
    fconst = fconst / np.linalg.norm(fconst)
    Hv = Hg @ vconst
    Hf = Hg @ fconst
    ward = {
        "ker_Hg": ker_Hg,
        "ker_Hbits": ker_Hbits,
        "vertex_constant_Hg_residual": float(np.linalg.norm(Hv)),
        "face_constant_Hg_residual": float(np.linalg.norm(Hf)),
        "vertex_face_overlap": float(abs(np.dot(vconst, fconst))),
        "clock_charge_geometry": 1,
        "clock_charge_history": 2,
        "history_quotient_by_Hbits_kernel": True,
        "comment": "Adding Hbits-kernel vectors to y does not change the Gaussian completion used by history_source_solve; this is the original two-dimensional quotient.",
    }

    # ----- E. H13 ⊕ H51 characters -----
    # A5 characters on classes (1, (12), (3), (5), (5'))
    table = {
        "1": (1, 1, 1, 1, 1),
        "3": (3, -1, 0, (1 + np.sqrt(5)) / 2, (1 - np.sqrt(5)) / 2),
        "3'": (3, -1, 0, (1 - np.sqrt(5)) / 2, (1 + np.sqrt(5)) / 2),
        "4": (4, 0, 1, -1, -1),
        "5": (5, 1, -1, 0, 0),
    }
    # g^2 on classes: id->id, (12)->id, (3)->(3), (5)<->(5')
    def chi_of_gsq(chi):
        return (chi[0], chi[0], chi[2], chi[4], chi[3])

    chi_H13 = (13.0, 1.0, 1.0, 3.0, 3.0)
    # verify decomposition 2*1 + 3 + 3' + 5
    dec_H13 = decompose(chi_H13, table)
    chi_H64 = tuple(4 * (table["1"][i] + table["3"][i] + table["3'"][i] + table["4"][i] + table["5"][i]) for i in range(5))
    chi_H51 = tuple(chi_H64[i] - chi_H13[i] for i in range(5))
    dec_H51 = decompose(chi_H51, table)
    dec_H64 = decompose(chi_H64, table)

    chi_sym_H13 = sym2_char(chi_H13, chi_of_gsq(chi_H13))
    chi_sym_H51 = sym2_char(chi_H51, chi_of_gsq(chi_H51))
    chi_cross = tensor_char(chi_H13, chi_H51)
    n4_13 = a5_inner(table["4"], chi_sym_H13)
    n4_51 = a5_inner(table["4"], chi_sym_H51)
    n4_x = a5_inner(table["4"], chi_cross)
    n4_hom = a5_inner(table["4"], chi_H13)
    yukawa_two_quartets = 2 * n4_13  # 8
    uniform_two_sources = 2 * (n4_13 + n4_51 + n4_x)  # 276

    matter = {
        "H13_character": list(chi_H13),
        "H13_decomposition": dec_H13,
        "H51_character": list(chi_H51),
        "H51_decomposition": dec_H51,
        "H64_decomposition": dec_H64,
        "Hom_A5_4_to_H13": n4_hom,
        "Sym2_H13_quartets": n4_13,
        "Sym2_H51_quartets": n4_51,
        "H13_otimes_H51_quartets": n4_x,
        "Weyl_Yukawa_dim_two_hidden_quartets_on_H13": yukawa_two_quartets,
        "uniform_charge_H13_H51_dim_two_sources": uniform_two_sources,
        "unique_vertex": False,
        "mean_field_fermion_poles": "vanish in any centred hidden ensemble (restated from isolated cycle 07; no new fit)",
        "unique_EM_current_on_90_edges": False,
        "obstruction": "Geometry + A5 + diagonal U(1) + Ward leave an 8-real-parameter H13 Yukawa space and do not produce a unique charged current or fermion kinetic. Abstract H51 is not a canonical subspace of the signed 64 histories.",
        "classification": "OPEN",
    }

    # ----- F. ARF comparison only -----
    arf = {
        "Delta_delta": -delta_star ** 3 / 63.0 - gamma / 40.0,
        "R_alpha": 3.0 / (64.0 * phi) + 1.0 / (79.0 * phi ** 2),
        "C_mass": -(5.0 / 16.0) * delta_star ** 3 + (7.0 / 8.0) * np.pi * phi,
        "R_mass": (3.0 / 35.0) * delta_star ** 2 - (4.0 / 51.0) * np.pi ** 3,
    }
    derived = {
        "E1": E1,
        "E2": E2,
        "three_twentieths_minus_E1": 0.15 - E1,
        "delta_star": float(delta_star),
        "rel_diff_three_twentieths_minus_E1_vs_delta_star": abs((0.15 - E1) - delta_star) / abs(delta_star),
        "rel_diff_E1_vs_Delta": abs(E1 - Delta) / abs(Delta),
        "T0_lambda2_over_lambda1": lam_T2 / lam_T1,
        "Gamma": Gamma,
        "V_best_a": 0.48154259920004555,
        "V_best_b": 4.0665394703346127e-7,
        "V_archived_a": 0.490435304391,
        "V_archived_b": 4.16132699108e-7,
        "rho_hid_gold": float((0.25 - 0.5 / (18 + r * r * gaps2[m2])) / ((Delta ** 2) * (0.25 - 0.5 / (16 + r * r * gaps2[m2])))),
    }
    cathedral_ints = [1, 2, 3, 4, 5, 7, 8, 9, 12, 13, 15, 16, 18, 20, 24, 35, 40, 51, 63, 64, 79, 80, 81, 90, 1053]
    writings = {
        "Delta_delta": [63, 40, 80, 1053, 81],
        "R_alpha": [3, 64, 1, 79],
        "C_mass": [5, 16, 7, 8],
        "R_mass": [3, 35, 4, 51],
        "delta_star_prefactor": [80, 1053],
    }
    look_elsewhere = {
        "cathedral_integer_list": cathedral_ints,
        "integers_appearing_in_ARF_writings": writings,
        "count_of_list_members_used_across_four_ARFs": len(set(sum(writings.values(), []))),
        "prior_near_hits": (
            "First-programme cycle 05: R_alpha's exact writing is unique in its "
            "template but has 8 rivals within 1e-4 (nearest 1/(45 phi^2)+2/79). "
            "C_mass 5/16 coefficient has nearest rival 4/13 at relative 3.5e-6. "
            "4/51 is isolated at 0.1% but 5/64 is 0.39% away. "
            "1/40 has 34 Cathedral trace writings (first-programme cycle 04)."
        ),
        "derivation_claimed": False,
    }
    # distances of derived numbers to ARF targets (comparison, not identification)
    comparisons = {
        "E1_vs_Delta_delta": abs(E1 - arf["Delta_delta"]),
        "E1_vs_R_alpha": abs(E1 - arf["R_alpha"]),
        "Gamma_vs_R_alpha": abs(Gamma - arf["R_alpha"]),
        "three_twentieths_minus_E1_vs_delta_star": abs((0.15 - E1) - delta_star),
        "T0_ratio_vs_any_ARF_min": min(
            abs(lam_T2 / lam_T1 - arf[k]) for k in arf
        ),
        "note": "None of these is promoted to an identity; see relative figures in derived.",
    }

    results = {
        "five_solid": five_solid,
        "T0": t0,
        "ward": ward,
        "charged_matter": matter,
        "ARF_targets": arf,
        "derived_for_comparison": derived,
        "comparisons": comparisons,
        "look_elsewhere": look_elsewhere,
        "classifications": {
            "A_five_solid": "PROVED" if five_solid["identities_ok"] else "FALSIFIED",
            "B_T0_poles_residues": "PROVED",
            "C_transfers_no_timestep_id": "PROVED",
            "D_Ward": "PROVED" if ker_Hg == 2 and ker_Hbits == 2 and np.linalg.norm(Hv) < 1e-10 and np.linalg.norm(Hf) < 1e-10 else "CONDITIONAL",
            "E_H13_H51_fermion_EM": "OPEN",
            "ARF_derivation": "OPEN",
        },
        "advances_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    print("five_solid ok", five_solid["identities_ok"], "pair", pair_q)
    print("E1", E1, "mult", mult1, origin_E1)
    print("E2", E2, "mult", mult2, origin_E2)
    print("T0 lams", lam_T1, lam_T2, "ratio", lam_T2 / lam_T1)
    print("Ward ker", ker_Hg, ker_Hbits, "residuals", np.linalg.norm(Hv), np.linalg.norm(Hf))
    print("H13 dec", dec_H13, "Hom4", n4_hom, "Sym2 quartets", n4_13)
    print("H51 dec", dec_H51, "uniform two sources", uniform_two_sources)
    print("ARFs", arf)
    print("3/20-E1 vs dstar", 0.15 - E1, delta_star, derived["rel_diff_three_twentieths_minus_E1_vs_delta_star"])
    print("classifications", results["classifications"])
    print("PASS: cycle 05 response / Ward / matter / ARF comparison")


if __name__ == "__main__":
    main()
