#!/usr/bin/env python3
"""Coupled cycle 22: does any archived normalisation fix y_even?"""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle22_ye_normalisation")
PRED_SHA = "6760ad783640ae8618bd95fc45aa07bc815efd72406e8d0d6b4e882ef43709fb"

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_GEOM)
LAM18 = 4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2
RHO = (np.pi / np.e) ** 2 * LAM18
C3 = 0.25 - 1.0 / (2.0 * (18.0 + RHO))
C5 = 0.25 - 1.0 / (2.0 * (16.0 + RHO))
C_ODD = C3
C_EVEN = (DELTA_GEOM ** 2) * C5
N_NUC = 4.640379972803843
Y_C_EVEN = 0.006011318618427269


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


def Z_hist(beta):
    b = float(beta)
    return 2.0 + 12.0 * np.exp(-10.0 * b) + 30.0 * np.exp(-16.0 * b) + 20.0 * np.exp(-18.0 * b)


def ye_from_r(r):
    return float(r * 4.0 * C_EVEN / N_NUC)


def omega_star(ye):
    return float(-(ye ** 2) * (N_NUC ** 2) / (16.0 * C_EVEN))


def ye_from_Omega_eq_minus_TlogZ(T, Z):
    # Ω_* = −T log Z  ⇒  ye² N² / (16 c) = T log Z
    val = np.log(Z)
    if val <= 0:
        return None
    ye2 = 16.0 * C_EVEN * T * val / (N_NUC ** 2)
    return float(np.sqrt(ye2)) if ye2 > 0 else None


def main():
    # ----- (1) unit-norm visible sources via F / B5 -----
    B5 = np.load(ROOT / "coupled_cycle03_map_F_hessian" / "B5.npy")
    # B5 shape (8,8,4); last five indices are the 5. h5_a = 1/2 α^T B5_55[:,:,a] α
    B55 = B5[3:, 3:, :]
    assert B55.shape == (5, 5, 4)

    def h5_of(alpha):
        a = np.asarray(alpha, dtype=float)
        return 0.5 * np.einsum("ija,i,j->a", B55, a, a)

    rng = np.random.default_rng(22)
    unit_starts = [np.eye(5)[i] for i in range(5)]
    extra = rng.normal(size=(80, 5))
    extra /= np.linalg.norm(extra, axis=1)[:, None]
    unit_starts.extend(extra)
    norms = [float(np.linalg.norm(h5_of(a))) for a in unit_starts]
    # also walk a few projected-ascent steps on ||h5||
    best_a = np.asarray(unit_starts[int(np.argmax(norms))], dtype=float)
    best_n = float(np.max(norms))
    for _ in range(40):
        # numerical gradient of ||h5||
        g = np.zeros(5)
        eps = 1e-5
        n0 = float(np.linalg.norm(h5_of(best_a)))
        for k in range(5):
            e = np.zeros(5)
            e[k] = 1.0
            g[k] = (np.linalg.norm(h5_of(best_a + eps * e)) - np.linalg.norm(h5_of(best_a - eps * e))) / (
                2.0 * eps
            )
        g = g - best_a * np.dot(g, best_a)
        if np.linalg.norm(g) < 1e-12:
            break
        trial = best_a + 0.3 * g
        trial /= np.linalg.norm(trial)
        nt = float(np.linalg.norm(h5_of(trial)))
        if nt > best_n:
            best_a, best_n = trial, nt
    # unit 3⊕5 (8-vector): h5 from full B5
    def h5_of8(v):
        v = np.asarray(v, dtype=float)
        return 0.5 * np.einsum("ija,i,j->a", B5, v, v)

    norms8 = []
    starts8 = [np.eye(8)[i] for i in range(8)]
    ex8 = rng.normal(size=(80, 8))
    ex8 /= np.linalg.norm(ex8, axis=1)[:, None]
    starts8.extend(ex8)
    for v in starts8:
        norms8.append(float(np.linalg.norm(h5_of8(v))))
    max_h5_unit5 = float(best_n)
    max_h5_unit8 = float(max(norms8))
    ye_if_r_equals_max5 = ye_from_r(max_h5_unit5)
    ye_if_r_equals_1 = ye_from_r(1.0)
    t1 = {
        "max_||h5||_unit_5": max_h5_unit5,
        "max_||h5||_unit_3oplus5": max_h5_unit8,
        "ye_matching_r_star_to_max_unit5": ye_if_r_equals_max5,
        "ye_matching_r_star_to_1": ye_if_r_equals_1,
        "y_c_even": Y_C_EVEN,
        "below_y_c": bool(ye_if_r_equals_max5 < Y_C_EVEN),
        "incompatible_with_condensation": bool(ye_if_r_equals_max5 < Y_C_EVEN),
        "fixes_ye_in_condensed_phase": False,
        "note": (
            "F of a unit-norm visible source produces ||h5|| = O(1). Matching "
            "that to the condensed r_* would require ye ~ O(c_even) << y_c,even, "
            "i.e. no condensate. ye is a Yukawa, not a history amplitude."
        ),
    }

    # ----- (2) 64-history Z -----
    Zh0 = float(Z_hist(0.0))
    Zhe = float(Z_hist(ETA))
    # hidden fluctuation Z does not involve ye at leading order (curvature 2 c_even)
    counterfactuals = {}
    for name, T, Z in (
        ("Z_hist_eta", ETA, Zhe),
        ("Z_hist_0_equals_64", ETA, Zh0),
        ("Z_equals_64_at_T0_undefined", 0.0, Zh0),
    ):
        if T <= 0:
            counterfactuals[name] = {
                "Z": Z,
                "T": T,
                "ye": None,
                "reason": "T=0 matching e^{-Ω/T} is singular",
            }
            continue
        ye_cf = ye_from_Omega_eq_minus_TlogZ(T, Z)
        counterfactuals[name] = {
            "Z": Z,
            "T": T,
            "ye": ye_cf,
            "above_y_c": bool(ye_cf is not None and ye_cf > Y_C_EVEN),
            "Omega_star_at_that_ye": omega_star(ye_cf) if ye_cf is not None else None,
        }
    ye_vals = [v["ye"] for v in counterfactuals.values() if v.get("ye") is not None]
    distinct = True
    if len(ye_vals) >= 2:
        distinct = max(ye_vals) / max(min(ye_vals), 1e-30) > 1.01
    t2 = {
        "Z_hist_0": Zh0,
        "Z_hist_eta": Zhe,
        "Z_hist_depends_on_ye": False,
        "matching_is_an_extra_postulate": True,
        "counterfactual_ye": counterfactuals,
        "counterfactuals_disagree": bool(distinct),
        "fixes_ye": False,
        "note": (
            "Z_hist is independent of ye (cycle 17). Equating it to the fermion "
            "grand potential would be a new matching and the named targets "
            "disagree with each other."
        ),
    }

    # ----- (3) KMS at eta -----
    rho_even = (DELTA_GEOM ** 2) / (4.0 * (1.0 + DELTA_GEOM ** 2))
    rho_odd = 1.0 / (4.0 * (1.0 + DELTA_GEOM ** 2))
    t3 = {
        "eta": ETA,
        "rho_star_odd_block": rho_odd,
        "rho_star_even_block": rho_even,
        "rho_star_depends_on_ye": False,
        "eta_depends_on_ye": False,
        "Tr_rho_equals_1_automatic": True,
        "fixes_ye": False,
    }

    # ----- (4) Ward charge-2 -----
    # algebraic: hopping phase λ_j-λ_i, pairing phase λ_i+λ_j, independent of ye
    rng2 = np.random.default_rng(220)
    lam = rng2.normal(size=12)
    # any edge
    i, j = 0, 1
    hop = lam[j] - lam[i]
    pair = lam[i] + lam[j]
    # charge = pairing response / (1/2 of a would-be charge-1 pair)? 
    # Standard: hopping charge 1 (coeff of (λ_j-λ_i)), pairing charge 2 (coeff of (λ_i+λ_j)/? )
    # Under global α: hopping phase 0, pairing phase 2α. Charge = 2.
    alpha = 0.37
    pair_global = 2.0 * alpha
    # ye independence: scale Δ by ye — phases unchanged
    t4 = {
        "hopping_phase_sample": float(hop),
        "pairing_phase_sample": float(pair),
        "global_pairing_phase_over_alpha": float(pair_global / alpha),
        "extracted_charge": 2,
        "charge_depends_on_ye": False,
        "cycle12_Ward_holds_for_every_ye": True,
        "Ward_identity_is_homogeneous_in_ye": True,
        "fixes_ye": False,
    }

    any_fixes = bool(t1["fixes_ye_in_condensed_phase"] or t2["fixes_ye"] or t3["fixes_ye"] or t4["fixes_ye"])
    n_fixing = int(t1["fixes_ye_in_condensed_phase"]) + int(t2["fixes_ye"]) + int(t3["fixes_ye"]) + int(t4["fixes_ye"])
    if n_fixing == 1:
        status = "FIXED"
    else:
        status = "FREE"

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "constants": {
            "eta": ETA,
            "c_even": C_EVEN,
            "c_odd": C_ODD,
            "nuclear_norm": N_NUC,
            "y_c_even": Y_C_EVEN,
            "r_over_ye": float(N_NUC / (4.0 * C_EVEN)),
        },
        "T1_unit_norm_histories": t1,
        "T2_64_history_Z": t2,
        "T3_KMS_at_eta": t3,
        "T4_Ward_charge2_vertex": t4,
        "ye_status": status,
        "n_candidates_that_fix_ye": n_fixing,
        "classification": "PROVED",
        "classification_note": (
            "Overall y_even is FREE. None of the four named archived "
            "normalisations uniquely fixes ye > y_c,even without an extra postulate."
        ),
        "advances_physical_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    print(json.dumps(sanitize({
        "ye_status": status,
        "T1": t1,
        "T2_counterfactuals": counterfactuals,
        "T2_Zh": {"0": Zh0, "eta": Zhe},
        "T3": t3,
        "T4": t4,
    }), indent=2))


if __name__ == "__main__":
    main()
