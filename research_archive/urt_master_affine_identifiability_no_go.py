#!/usr/bin/env python3
"""Master affine-identifiability and completion-moduli theorem for URT.

For the declared relative-information functional, the pair (eta,K) enters the
normalized Gibbs state only through eta K modulo a scalar identity.  The exact
affine transformation K->aK+bI, eta->eta/a changes the functional by a
rho-independent constant and leaves every state-only output invariant.

This unifies the cost-scale and vacuum-zero obstructions but does not pretend
that all remaining physical parameters literally occur in one K.  A separate
sector audit identifies ten continuous choices still unconstrained by the
currently proved kinematics.  Because a coupled continuum completion has not
been constructed, this is a count of independent open directions in the
present axioms, not a claimed manifold dimension of completed theories.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


def hermitian_function(matrix: np.ndarray, function: Any) -> np.ndarray:
    values, vectors = np.linalg.eigh(matrix)
    return (vectors * function(values)) @ vectors.conj().T


def gibbs(prior: np.ndarray, cost: np.ndarray, eta: float) -> tuple[np.ndarray, float]:
    exponent = hermitian_function(prior, np.log) - eta * cost
    unnormalized = hermitian_function(exponent, np.exp)
    partition = float(np.trace(unnormalized).real)
    return unnormalized / partition, partition


def affine_witnesses() -> tuple[list[dict[str, float]], float]:
    prior = np.diag([0.37, 0.29, 0.21, 0.13]).astype(complex)
    raw = np.asarray(
        [
            [0.4 + 0.1j, -0.2, 0.1j, 0.05],
            [0.1, 0.3 - 0.2j, 0.07, -0.08j],
            [-0.12j, 0.05, 0.27 + 0.03j, 0.11],
            [0.02, 0.09j, -0.04, 0.31 - 0.06j],
        ],
        dtype=complex,
    )
    cost = raw.conj().T @ raw
    eta = 5.995797986741314
    state, partition = gibbs(prior, cost, eta)
    identity = np.eye(4)
    records = []
    maximum_residual = 0.0
    for scale, shift in ((0.4, -0.3), (1.0, 0.0), (2.7, 0.19), (9.0, 1.1)):
        transformed_eta = eta / scale
        transformed_cost = scale * cost + shift * identity
        transformed_state, transformed_partition = gibbs(
            prior, transformed_cost, transformed_eta
        )
        predicted_partition = math.exp(-eta * shift / scale) * partition
        state_residual = float(
            np.linalg.norm(transformed_state - state, ord="fro")
        )
        partition_residual = abs(transformed_partition - predicted_partition)
        free_energy_shift_residual = abs(
            (-math.log(transformed_partition) + math.log(partition))
            - eta * shift / scale
        )
        maximum_residual = max(
            maximum_residual,
            state_residual,
            partition_residual,
            free_energy_shift_residual,
        )
        records.append(
            {
                "a": scale,
                "b": shift,
                "eta_prime": transformed_eta,
                "state_frobenius_residual": state_residual,
                "partition_law_residual": partition_residual,
                "free_energy_shift_residual": free_energy_shift_residual,
            }
        )
    return records, maximum_residual


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    witnesses, maximum_residual = affine_witnesses()

    moduli = [
        {
            "name": "determinant_line_phase",
            "parameter": "lambda",
            "domain": "one real phase direction",
            "preserved_data": "gauge/A5/reversal/KO-6 identities and positive spectrum",
            "certificate": "urt_joint_action_invariant_no_go_results.json",
        },
        {
            "name": "absolute_parent_gauge_coupling",
            "parameter": "beta or common g",
            "domain": "R_{>0}",
            "preserved_data": "shortest-loop form and g1:g2:g3 parent ratios",
            "certificate": "urt_gauge_coupling_scale_no_go_results.json",
        },
        {
            "name": "Newton_source_normalization",
            "parameter": "G/a_*^2 relative to source conversion C",
            "domain": "R_{>0}",
            "preserved_data": "trace-free Ricci representation channel",
            "certificate": "urt_gravity_normalization_no_go_results.json",
        },
        {
            "name": "cosmological_vacuum_coefficient",
            "parameter": "Lambda a_*^2",
            "domain": "R",
            "preserved_data": "all normalized Gibbs and trace-free source observables",
            "certificate": "urt_gravity_normalization_no_go_results.json",
        },
        {
            "name": "adjoint_Higgs_orbit_shape",
            "parameter": "d/c in an open bounded-potential 3+2 region",
            "domain": "open interval in R_{>0}",
            "preserved_data": "SU(5), A5 and the desired 3+2 stabilizer type",
            "certificate": "urt_su5_adjoint_breaking_no_go_results.json",
        },
        {
            "name": "adjoint_Higgs_radial_scale",
            "parameter": "dimensionless breaking amplitude q in lattice units",
            "domain": "R_{>0}",
            "preserved_data": "same invariant potential form and 3+2 orbit type",
            "certificate": "urt_su5_adjoint_breaking_no_go_results.json",
        },
        {
            "name": "physical_clock_rate",
            "parameter": "kappa a_*/c or seconds per update",
            "domain": "R_{>0}",
            "preserved_data": "Gibbs state, detailed balance, entropy arrow and per-step ordering",
            "certificate": "urt_clock_orientation_scale_no_go_results.json",
        },
        {
            "name": "cut_project_window_scale",
            "parameter": "R in internal-lattice units",
            "domain": "R_{>0}",
            "preserved_data": "A5, reversal, Hodge metric and regular model-set axioms",
            "certificate": "urt_cut_project_window_no_go_results.json",
        },
        {
            "name": "cut_project_window_shape",
            "parameter": "epsilon in the h6 deformation",
            "domain": "open interval about zero",
            "preserved_data": "A5, reversal, smooth convexity and fixed window volume",
            "certificate": "urt_cut_project_window_no_go_results.json",
        },
        {
            "name": "measurement_response",
            "parameter": "alpha in p_i proportional to |amplitude_i|^(2 alpha)",
            "domain": "R_{>0}",
            "preserved_data": "normalization, continuity, phase blindness, covariance and certainty",
            "certificate": "urt_born_measurement_boundary_results.json",
        },
    ]

    out = {
        "certificate": "URT master affine-identifiability and completion-moduli no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "master_functional": (
            "F_{eta,K}(rho)=D(rho||rho0)+eta Tr(rho K), Tr rho=1"
        ),
        "exact_affine_theorem": {
            "transformation": "K'=aK+bI, eta'=eta/a, with a>0 and b real",
            "functional_identity": (
                "F_{eta',K'}(rho)=F_{eta,K}(rho)+eta b/a"
            ),
            "Gibbs_identity": (
                "rho_{eta',K'}=rho_{eta,K}; "
                "Z_{eta',K'}=exp(-eta b/a) Z_{eta,K}"
            ),
            "quotient_statement": (
                "Every normalized-state output factors through eta K modulo R I. "
                "The state can identify neither an additive energy zero nor a "
                "separate cost scale and inverse-depth scale."
            ),
            "noncommuting_witnesses": witnesses,
            "maximum_witness_residual": maximum_residual,
            "status": "E",
        },
        "outputs_that_factor_through_the_quotient": [
            "the normalized Gibbs minimizer rho",
            "von Neumann entropy and state-only expectation values",
            "probability ratios encoded by rho",
            "symmetry/covariance of rho",
            "stationary points and tangent variations of F on Tr rho=1",
        ],
        "outputs_not_fixed_by_the_quotient": [
            "the additive vacuum/free-energy zero",
            "a physical energy unit separate from eta",
            "a kinetic generator or seconds per relaxation step",
            "couplings not already specified as operators in K",
            "a physical measurement/instrument interpretation of rho",
        ],
        "sector_independent_completion_moduli": moduli,
        "conservative_currently_unfixed_direction_count": len(moduli),
        "count_scope": (
            "This counts independently unconstrained sector choices under the "
            "presently proved kinematic axioms.  It is not an exhaustive parameter "
            "count or a claimed manifold dimension, because a coupled continuum "
            "completion has not been constructed.  Conditional new "
            "axioms such as a ball window or Gleason noncontextuality can remove a "
            "listed direction only by being explicitly added."
        ),
        "logical_consequence": {
            "non_uniqueness": (
                "There are continuous sectorwise inequivalent extensions sharing "
                "every presently certified finite algebraic and symmetry identity; "
                "even one such direction is enough to refute uniqueness from the "
                "current axioms."
            ),
            "arithmetic_limit": (
                "Further exact calculation inside one chosen completion cannot turn "
                "the choice into a theorem from the weaker axiom set."
            ),
            "minimum_repair_type": (
                "At least one genuinely new non-homogeneous microscopic law must "
                "couple sectors and fix action normalization, vacuum zero, clock, "
                "measurement and locality data; separate optimization slogans do not."
            ),
        },
        "verdict": {
            "unique_theory_from_current_axioms": "F",
            "mathematical_subtheorems": "many E/C results retained",
            "empirical_theory_of_nature": "U and unvalidated",
            "no_go": (
                "The current Cathedral/URT axioms leave at least ten explicit "
                "continuous sector choices unconstrained.  Therefore the "
                "framework is not yet a unique theory of nature, regardless of the "
                "exactness of its internal finite theorems."
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