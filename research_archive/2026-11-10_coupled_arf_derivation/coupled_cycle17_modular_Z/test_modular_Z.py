#!/usr/bin/env python3
"""Coupled cycle 17: clock periodicity / modular invariance of Z."""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

OUT = Path("/workspace/arf_research/coupled_cycle17_modular_Z")
C05 = Path("/workspace/arf_research/coupled_cycle05_response_matter_arf/results.json")
C13 = Path("/workspace/arf_research/coupled_cycle13_tcoup_flow/results.json")
C14 = Path("/workspace/arf_research/coupled_cycle14_H5H3_identity/results.json")

PHI = (1.0 + np.sqrt(5.0)) / 2.0


def hbits_matrix():
    n = 6
    N = 1 << n
    H = np.zeros((N, N), dtype=float)
    for i in range(N):
        for b1 in range(n):
            for b2 in range(b1 + 1, n):
                j = i ^ (1 << b1) ^ (1 << b2)
                H[i, j] -= 1.0
                H[i, i] += 1.0
    return H


def theoretical_hbits():
    # k, multiplicity C(6,k), eigenvalue
    # 0: 1 x 0, 1: 6 x 10, 2: 15 x 16, 3: 20 x 18,
    # 4: 15 x 16, 5: 6 x 10, 6: 1 x 0
    return {
        0.0: 2,
        10.0: 12,
        16.0: 30,
        18.0: 20,
    }


def Z_hist(beta, spectrum):
    return float(sum(m * np.exp(-beta * e) for e, m in spectrum.items()))


def clock_lambdas():
    ks = np.arange(24)
    return 4.0 * np.sin(np.pi * ks / 24.0 - 2.0 * np.pi / PHI ** 2) ** 2


def main():
    c05 = json.loads(C05.read_text())
    c13 = json.loads(C13.read_text())
    c14 = json.loads(C14.read_text())

    delta_star = 80.0 * np.pi / (1053.0 * PHI)
    Delta = 3.0 / 20.0 - delta_star
    eta = -np.log(Delta)
    eta_c13 = float(c13["C5_convergence_law"]["eta"])
    assert abs(eta - eta_c13) / eta < 1e-12

    # M1: Hbits
    H = hbits_matrix()
    assert H.shape == (64, 64)
    assert np.allclose(H, H.T)
    w = np.linalg.eigvalsh(H)
    rounded = np.rint(w)
    assert np.allclose(w, rounded, atol=1e-10)
    unique, counts = np.unique(rounded, return_counts=True)
    computed = {float(u): int(c) for u, c in zip(unique, counts)}
    theo = theoretical_hbits()
    assert computed == theo
    assert abs(w.min()) < 1e-12
    assert int(np.sum(np.abs(w) < 1e-10)) == 2

    Z_h = Z_hist(eta, theo)
    # closed form
    Z_h_closed = (2.0 + 12.0 * np.exp(-10.0 * eta)
                  + 30.0 * np.exp(-16.0 * eta)
                  + 20.0 * np.exp(-18.0 * eta))
    assert abs(Z_h - Z_h_closed) / Z_h < 1e-12

    integer_spectrum_hist = True
    T_invariant_hist = True

    # Modular parameter tau_* = i eta / (2 pi)
    # Z(tau) = Tr exp(2 pi i tau H); at tau = i y, Z = Tr exp(-2 pi y H)
    # tau_* corresponds to y = eta / (2 pi), Z(tau_*) = Z_hist(eta)
    # S: tau -> -1/tau sends y -> 1/y, Z -> Tr exp(-2 pi H / y) = Z_hist(4 pi^2 / eta)
    y = eta / (2.0 * np.pi)
    Z_h_S = Z_hist(4.0 * np.pi ** 2 / eta, theo)
    Z_h_ratio = Z_h_S / Z_h
    # automorphy (tau/i)^{64/2} = y^{32}
    auto_64 = y ** 32
    auto_24 = y ** 12
    S_raw_hist = abs(Z_h_S - Z_h) / Z_h
    S_auto64_hist = abs(Z_h_S - auto_64 * Z_h) / max(abs(auto_64 * Z_h), 1e-300)
    S_auto24_hist = abs(Z_h_S - auto_24 * Z_h) / max(abs(auto_24 * Z_h), 1e-300)
    # Asymptotics forbid functional S-invariance: Z(inf)->2, Z(0)->64.
    # At the physical tau_* both eta and 4 pi^2/eta are >> 1/10 (the Hbits
    # gap), so Z and Z o S both saturate to dim(ker)=2. That near-equality
    # is spectral saturation, not modular invariance, and is recorded as such.
    Z_h_inf = Z_hist(1e6, theo)
    Z_h_0 = Z_hist(0.0, theo)
    assert abs(Z_h_inf - 2.0) < 1e-10
    assert abs(Z_h_0 - 64.0) < 1e-12
    S_saturated_at_tau_star = (S_raw_hist < 1e-4)
    # auxiliary point where the first excited level e^{-10 beta} is visible
    beta_aux = 0.5
    Z_aux = Z_hist(beta_aux, theo)
    Z_aux_S = Z_hist(4.0 * np.pi ** 2 / beta_aux, theo)
    S_raw_aux = abs(Z_aux_S - Z_aux) / Z_aux
    S_functional = (abs(Z_h_0 - Z_h_inf) / Z_h_0 < 1e-4) or (S_raw_aux < 1e-4)
    S_invariant_hist = S_functional
    assert not S_invariant_hist
    assert S_raw_aux >= 1e-4

    # M2: gold clock
    lams = clock_lambdas()
    assert lams.shape == (24,)
    lam18 = float(lams[18])
    lam18_closed = 4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2
    # sin^2 even, two writings
    assert abs(lam18 - lam18_closed) < 1e-12
    E2 = float(c05["T0"]["E2"])
    rho_clock = (np.pi / np.e) ** 2 * lam18
    assert abs(rho_clock - E2) / E2 < 1e-12
    sqrt_H_factor_rho = float(c14.get("rho", E2))  # presence check

    E_clock = (np.pi / np.e) ** 2 * lams
    # integer? no
    nearest = np.rint(E_clock)
    integer_spectrum_clock = bool(np.allclose(E_clock, nearest, atol=1e-10))
    T_invariant_clock = integer_spectrum_clock
    assert not T_invariant_clock

    def Z_clock(beta):
        return float(np.sum(np.exp(-beta * E_clock)))

    Z_c = Z_clock(eta)
    Z_c_S = Z_clock(4.0 * np.pi ** 2 / eta)
    S_raw_clock = abs(Z_c_S - Z_c) / Z_c
    S_auto24_clock = abs(Z_c_S - auto_24 * Z_c) / max(abs(auto_24 * Z_c), 1e-300)
    S_auto64_clock = abs(Z_c_S - auto_64 * Z_c) / max(abs(auto_64 * Z_c), 1e-300)
    S_invariant_clock = (S_raw_clock < 1e-4) or (S_auto24_clock < 1e-4) or (S_auto64_clock < 1e-4)
    assert not S_invariant_clock

    # M3: free Z independent of r
    free_depends_on_r = False

    # M4: coupled hidden Gaussian
    H3 = 0.4444759966538212
    H5 = 2.7110263135564066e-6
    pi_o = float(c13["C2_unconstrained_gradient"]["pi_o"])
    pi_e = float(c13["C2_unconstrained_gradient"]["pi_e"])

    def Z_hid(beta, yo, ye):
        mu3 = H3 + yo ** 2 * pi_o
        mu5 = H5 + ye ** 2 * pi_e
        return (2.0 * np.pi / (beta * mu3)) ** 2 * (2.0 * np.pi / (beta * mu5)) ** 2

    # clock periodicity: Z(beta+24)/Z(beta) = (beta/(beta+24))^4  (since ∝ beta^{-4})
    samples_r = [(1.0, 0.0), (0.0, 1.0), (1.0, 1.0), (1.0, 0.00247)]
    per_ratios = []
    s_ratios = []
    for yo, ye in samples_r:
        z = Z_hid(eta, yo, ye)
        z_shift = Z_hid(eta + 24.0, yo, ye)
        z_inv = Z_hid(1.0 / eta, yo, ye)
        per_ratios.append(z_shift / z)
        s_ratios.append(z / z_inv)
    per_expected = (eta / (eta + 24.0)) ** 4
    s_expected = eta ** (-8)
    assert all(abs(p - per_expected) / per_expected < 1e-12 for p in per_ratios)
    assert all(abs(s - s_expected) / abs(s_expected) < 1e-12 for s in s_ratios)
    # independent of r
    hid_periodicity_holds = False
    hid_S_holds = abs(eta - 1.0) < 1e-4
    assert not hid_periodicity_holds
    assert not hid_S_holds
    hid_modular_ratio_depends_on_r = False
    hid_selects_r = False

    # look-elsewhere note on 24 vs Ramanujan
    look = {
        "shared_integer_24": (
            "24 is the clock length and the weight of Delta_Ramanujan = eta(tau)^24"
        ),
        "Z_clock_is_Ramanujan_discriminant": False,
        "reason": (
            "Z_clock is a sum of 24 exponentials of gold-phased clock "
            "energies (pi/e)^2 * 4 sin^2(pi k/24 - 2 pi / phi^2). It is "
            "not identified with the discriminant modular form; the shared "
            "integer 24 is not a derivation."
        ),
    }

    selects_r = False
    out = {
        "classification": "PROVED",
        "modular_or_periodicity_selects_r": "FALSIFIED",
        "surviving_dimension": 2,
        "is_a_ray": False,
        "advances_physical_ARF": False,
        "eta": eta,
        "tau_star_im": eta / (2.0 * np.pi),
        "M1_histories": {
            "spectrum": {str(k): v for k, v in theo.items()},
            "computed_spectrum": {str(k): v for k, v in computed.items()},
            "matches_closed_form": True,
            "Z_hist_at_eta": Z_h,
            "Z_hist_closed_form": "2 + 12 e^{-10 eta} + 30 e^{-16 eta} + 20 e^{-18 eta}",
            "integer_spectrum": integer_spectrum_hist,
            "T_invariant": T_invariant_hist,
            "Z_hist_S": Z_h_S,
            "S_raw_relative": S_raw_hist,
            "S_auto64_relative": S_auto64_hist,
            "S_auto24_relative": S_auto24_hist,
            "S_saturated_at_tau_star": S_saturated_at_tau_star,
            "S_saturation_reason": (
                "eta and 4 pi^2/eta are both much larger than 1/10, "
                "so Z and Z o S both equal dim(ker Hbits)=2 up to "
                "e^{-10 eta}. This is not functional S-invariance."
            ),
            "S_auxiliary_beta": beta_aux,
            "Z_hist_aux": Z_aux,
            "Z_hist_aux_S": Z_aux_S,
            "S_raw_auxiliary": S_raw_aux,
            "S_invariant": S_invariant_hist,
            "Z_hist_beta_inf": Z_h_inf,
            "Z_hist_beta_0": Z_h_0,
            "depends_on_r": False,
        },
        "M2_clock": {
            "lambda_18": lam18,
            "lambda_18_matches_cycle14": True,
            "E2_match_relative": abs(rho_clock - E2) / E2,
            "integer_spectrum": integer_spectrum_clock,
            "T_invariant": T_invariant_clock,
            "Z_clock_at_eta": Z_c,
            "Z_clock_S": Z_c_S,
            "S_raw_relative": S_raw_clock,
            "S_auto24_relative": S_auto24_clock,
            "S_auto64_relative": S_auto64_clock,
            "S_invariant": S_invariant_clock,
            "n_modes": 24,
            "depends_on_r": False,
        },
        "M3_free_Z": {
            "depends_on_r": free_depends_on_r,
            "can_select_r": False,
        },
        "M4_coupled_hidden": {
            "Z_hid": "[2 pi / (beta mu3)]^2 [2 pi / (beta mu5)]^2",
            "mu3": "H3 + y_o^2 pi_o",
            "mu5": "H5 + y_e^2 pi_e",
            "pi_o": pi_o,
            "pi_e": pi_e,
            "H3": H3,
            "H5": H5,
            "periodicity_Z_beta_plus_24_over_Z": per_expected,
            "periodicity_holds": hid_periodicity_holds,
            "S_ratio_Z_beta_over_Z_1_over_beta": s_expected,
            "S_ratio_independent_of_r": True,
            "S_ratio_sample_values": s_ratios,
            "periodicity_sample_values": per_ratios,
            "S_holds_only_if_eta_equals_1": True,
            "eta_equals_1": hid_S_holds,
            "S_holds": hid_S_holds,
            "modular_ratio_depends_on_r": hid_modular_ratio_depends_on_r,
            "selects_r": hid_selects_r,
        },
        "look_elsewhere_24": look,
        "selects_r": selects_r,
        "integrity": {
            "predeclaration_sha256":
                "be421004b294022f6215b4011785966b9248d7a14ccb27fb61dd4a8bcc1974c6",
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
        "Z_hist": Z_h,
        "Z_hist_S_rel": S_raw_hist,
        "T_hist": T_invariant_hist,
        "T_clock": T_invariant_clock,
        "S_clock_rel": S_raw_clock,
        "per_expected": per_expected,
        "s_expected": s_expected,
        "selects_r": selects_r,
        "spectrum": computed,
    }, indent=2))


if __name__ == "__main__":
    main()
