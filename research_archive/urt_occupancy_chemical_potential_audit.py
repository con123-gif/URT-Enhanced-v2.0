#!/usr/bin/env python3
"""Occupancy and chemical-potential selector audit for Cathedral/URT.

The four-mode exterior prior has a gauge-invariant A5-symmetric covariance
Q=p I4 with p=Delta/(1+Delta).  A5 symmetry alone permits every p in [0,1].
Particle-hole/Hodge invariance forces p=1/2 and is incompatible with the stored
Delta.  Conditioning on exterior degree two gives I6/6 (and I3/3 on either
Hodge chirality) for every positive fugacity, so the already used source prior
contains no information about the unconditioned chemical potential.

For a proposed full Fock lift of a history cost k, conditioning on particle
number one cancels every fugacity z.  A fixed mean-number constraint would
select a unique chemical potential for a supplied beta and k, but the mean is
an additional continuous ensemble datum; it is not implied by conditioning.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from math import comb
from pathlib import Path

import numpy as np
from scipy.linalg import expm


DELTA = 0.002489189840420375
ETA_DELTA = 5.995797986741314


def exterior_degree_probabilities(mode_count: int, fugacity: float) -> np.ndarray:
    return np.array(
        [
            comb(mode_count, degree)
            * fugacity**degree
            / (1.0 + fugacity) ** mode_count
            for degree in range(mode_count + 1)
        ]
    )


def conditioned_one_particle(beta_k: np.ndarray, fugacity: float) -> np.ndarray:
    weight = fugacity * expm(-beta_k)
    return weight / np.trace(weight)


def mean_number_scalar(mode_count: int, fugacity: float) -> float:
    return mode_count * fugacity / (1.0 + fugacity)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    n = 4
    p = DELTA / (1.0 + DELTA)
    probabilities = exterior_degree_probabilities(n, DELTA)
    hodge_reversed = probabilities[::-1]
    hodge_total_variation = float(0.5 * np.sum(np.abs(probabilities - hodge_reversed)))
    mean_n = float(sum(k * probabilities[k] for k in range(n + 1)))
    variance_n = float(
        sum((k - mean_n) ** 2 * probabilities[k] for k in range(n + 1))
    )

    # Conditioning on degree two erases the fugacity exactly.  Numerical rows
    # include both sides of the particle-hole symmetric value z=1.
    fugacity_samples = [1.0e-4, DELTA, 0.2, 1.0, 5.0]
    degree_two_rows = []
    for fugacity in fugacity_samples:
        weight_per_basis_state = fugacity**2 / (1.0 + fugacity) ** 4
        conditional_six = np.full(6, weight_per_basis_state)
        conditional_six /= np.sum(conditional_six)
        conditional_chiral_three = conditional_six[:3].copy()
        conditional_chiral_three /= np.sum(conditional_chiral_three)
        degree_two_rows.append(
            {
                "fugacity": fugacity,
                "Lambda2_uniform_residual": float(
                    np.max(np.abs(conditional_six - 1.0 / 6.0))
                ),
                "chiral_triplet_uniform_residual": float(
                    np.max(np.abs(conditional_chiral_three - 1.0 / 3.0))
                ),
            }
        )

    # One-particle conditioning erases fugacity for an arbitrary nondiagonal k.
    rng = np.random.default_rng(20260904)
    raw = rng.normal(size=(3, 3)) + 1j * rng.normal(size=(3, 3))
    unitary, _ = np.linalg.qr(raw)
    beta_k = unitary @ np.diag([0.3, 1.4, 2.8]) @ unitary.conj().T
    reference_conditioned = conditioned_one_particle(beta_k, 1.0)
    one_particle_rows = []
    for fugacity in (1.0e-8, DELTA, 0.1, 1.0, 17.0, 1.0e5):
        conditioned = conditioned_one_particle(beta_k, fugacity)
        one_particle_rows.append(
            {
                "fugacity": fugacity,
                "distance_from_z_1": float(
                    np.linalg.norm(conditioned - reference_conditioned, ord=2)
                ),
            }
        )

    # Compare possible scalar-energy occupancy conventions across actual spaces.
    history_dimensions = [4, 36, 144, 180, 720]
    occupancy_rows = []
    for dimension in history_dimensions:
        replicated_mean = mean_number_scalar(dimension, DELTA)
        mean_one_fugacity = 1.0 / (dimension - 1.0)
        mean_one_depth = math.log(dimension - 1.0)
        occupancy_rows.append(
            {
                "one_particle_mode_count": dimension,
                "mean_number_if_Delta_is_replicated": replicated_mean,
                "fugacity_for_mean_number_one_at_scalar_energy": mean_one_fugacity,
                "depth_for_mean_number_one": mean_one_depth,
                "depth_minus_eta_Delta": mean_one_depth - ETA_DELTA,
            }
        )

    out = {
        "certificate": "URT occupancy and chemical-potential selection audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "A5_invariant_quasifree_classification": {
            "carrier": "irreducible V4_C",
            "Schur_result": "every A5-invariant covariance is Q=p I4",
            "allowed_interval": "0<=p<=1; faithful states have 0<p<1",
            "corresponding_depth": "beta(epsilon-mu)=log((1-p)/p)",
            "consequence": (
                "A5 symmetry fixes equal occupations but leaves their common value "
                "and hence the fugacity continuous."
            ),
            "status": "E",
        },
        "stored_exterior_prior": {
            "Delta": DELTA,
            "eta_Delta": ETA_DELTA,
            "occupation_per_mode": p,
            "degree_probabilities_k_0_to_4": probabilities.tolist(),
            "mean_number": mean_n,
            "binomial_mean_formula": 4.0 * p,
            "variance_number": variance_n,
            "binomial_variance_formula": 4.0 * p * (1.0 - p),
        },
        "Hodge_particle_hole_test": {
            "action_on_degree": "k maps to 4-k",
            "invariance_condition": "Delta^k proportional Delta^(4-k) for all k",
            "unique_positive_solution": "Delta=1, equivalently p=1/2 and eta=0",
            "stored_p_minus_half": p - 0.5,
            "degree_distribution_total_variation_from_Hodge_reverse": (
                hodge_total_variation
            ),
            "verdict": "F: the stored Delta prior is not Hodge/particle-hole invariant",
            "status": "E",
        },
        "degree_two_conditioning": {
            "identity": (
                "P(N=2) conditioning makes every Lambda2 basis state weight 1/6 "
                "and every chosen Hodge triplet state weight 1/3 for all Delta>0"
            ),
            "samples": degree_two_rows,
            "consequence": (
                "The recovered source-chiral prior I3/3 cannot be inverted to select "
                "the unconditioned fugacity or chemical potential."
            ),
            "status": "E",
        },
        "history_one_particle_conditioning": {
            "identity": (
                "z exp(-beta k)/Tr[z exp(-beta k)] is independent of every z>0"
            ),
            "nondiagonal_samples": one_particle_rows,
            "consequence": (
                "All existing normalized N=1 history heat outputs are exactly blind "
                "to the fugacity of any proposed full-Fock extension."
            ),
            "status": "E",
        },
        "fixed_mean_number_rule": {
            "equation": (
                "Nbar(mu)=sum_j [1+exp(beta(epsilon_j-mu))]^-1=m"
            ),
            "derivative": (
                "dNbar/dmu=beta sum_j f_j(1-f_j)>0 for finite beta and 0<m<N"
            ),
            "uniqueness": "one mu exists for each supplied beta, spectrum and target m",
            "logical_boundary": (
                "conditioning on N=1 does not imply grand-canonical mean N=1; fixing "
                "m is a new ensemble constraint and beta normalization remains open"
            ),
            "scalar_energy_comparison": occupancy_rows,
            "status": "C as an additional premise, not selected by current axioms",
        },
        "half_filling_and_centered_neutrality": {
            "half_filling": "mean N=2 on four modes forces p=1/2 for Q=pI4",
            "centered_number_charge": "<N-2>=0 is the same condition",
            "compatibility_with_stored_prior": False,
            "note": (
                "Neutrality for a different physical gauge charge requires a declared "
                "charge operator and does not determine the particle-number chemical "
                "potential without an additional coupling premise."
            ),
            "status": "E for centered number; U for any new physical charge map",
        },
        "verdict": {
            "A5_symmetry_selects_fugacity": "F",
            "Hodge_symmetry_selects_stored_Delta": "F",
            "conditioned_chiral_prior_selects_fugacity": "F",
            "history_heat_outputs_select_full_Fock_chemical_potential": "F",
            "fixed_mean_number_can_select_mu_conditionally": "E conditional",
            "advance": (
                "Every surviving intrinsic candidate either leaves a continuous "
                "fugacity, erases it by conditioning, or selects half filling in "
                "direct conflict with the stored Delta.  A full history-Fock lift "
                "therefore requires an explicit occupancy/chemical-potential axiom."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()