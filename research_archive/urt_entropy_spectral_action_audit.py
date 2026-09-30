#!/usr/bin/env python3
"""Generic and entropy-selected spectral-action audit for Cathedral/URT.

The ordinary four-dimensional spectral action Tr f(|D|/Lambda) contains three
independent cutoff moments multiplying the volume, Einstein and dimension-four
heat coefficients.  A three-exponential family proves their local independence.

There is a stronger mathematically natural candidate: the von Neumann entropy
of the fermionic KMS state obtained by second-quantizing a spectral triple is
Tr h(beta D), with h(x)=log(1+exp(-x))+x/(1+exp(x)) for x>=0.  This fixes the
three moments to log(2), (9/4)zeta(3), and (225/8)zeta(5).

That is a genuine reduction of arbitrariness, but it is conditional on a
self-adjoint one-particle Dirac generator and a KMS scale.  Cathedral/URT has
not uniquely selected that generator, its finite/Yukawa block, the beta-to-
eta normalization, the overall boson/fermion action normalization, or the
chiral determinant phase.  The even entropy spectral action cannot see the
last of these at all.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np
from scipy.integrate import quad
from scipy.special import zeta


def entropy_cutoff(x: float) -> float:
    if x > 40.0:
        # Stable asymptotic form; both terms are O((1+x)e^-x).
        return (1.0 + x) * math.exp(-x)
    return math.log1p(math.exp(-x)) + x / (1.0 + math.exp(x))


def determinant_3(matrix: list[list[Fraction]]) -> Fraction:
    a = matrix
    return (
        a[0][0] * (a[1][1] * a[2][2] - a[1][2] * a[2][1])
        - a[0][1] * (a[1][0] * a[2][2] - a[1][2] * a[2][0])
        + a[0][2] * (a[1][0] * a[2][1] - a[1][1] * a[2][0])
    )


def finite_cathedral_kms_audit() -> dict[str, Any]:
    eta = 5.995797986741314
    delta_project = 0.002489189840420375
    delta = math.exp(-eta)

    passive_probabilities = []
    passive_energies = []
    for bits in itertools.product((0, 1), repeat=4):
        occupation = sum(bits)
        passive_energies.append(float(occupation))
        passive_probabilities.append(delta**occupation / (1.0 + delta) ** 4)
    passive_probabilities = np.asarray(passive_probabilities)
    passive_entropy = float(
        -np.sum(passive_probabilities * np.log(passive_probabilities))
    )
    passive_entropy_formula = 4.0 * entropy_cutoff(eta)

    # Fock space of two zero modes and one mode of energy 2 has four states in
    # each energy sector.  Adding 3I to the many-body cost gives the stored 3/5
    # spectrum without changing the normalized Gibbs state.
    hidden_energies = []
    for bits in itertools.product((0, 1), repeat=3):
        hidden_energies.append(float(2 * bits[2]))
    hidden_energies = np.asarray(hidden_energies)
    hidden_weights = np.exp(-eta * hidden_energies)
    hidden_probabilities = hidden_weights / np.sum(hidden_weights)
    hidden_entropy = float(
        -np.sum(hidden_probabilities * np.log(hidden_probabilities))
    )
    p5 = delta**2 / (1.0 + delta**2)
    binary_entropy = -p5 * math.log(p5) - (1.0 - p5) * math.log(1.0 - p5)
    hidden_entropy_formula = 2.0 * math.log(2.0) + entropy_cutoff(2.0 * eta)

    return {
        "eta_Delta": eta,
        "Delta_project": delta_project,
        "Delta_minus_exp_minus_eta_residual": abs(delta_project - delta),
        "passive_prior": {
            "one_particle_generator": "D0=I4 on V4_C",
            "Fock_density": "rho0=exp(-eta N)/(1+exp(-eta))^4=Delta^N/(1+Delta)^4",
            "Fock_dimension": len(passive_probabilities),
            "probability_normalization_residual": float(
                abs(np.sum(passive_probabilities) - 1.0)
            ),
            "direct_entropy": passive_entropy,
            "spectral_entropy": passive_entropy_formula,
            "entropy_identity_residual": abs(
                passive_entropy - passive_entropy_formula
            ),
            "identity": "S(rho0)=4 h(eta_Delta)",
        },
        "hidden_3_5_block": {
            "one_particle_generator": "D_hidden=diag(0,0,2)",
            "many_body_spectrum_before_shift": {"0": 4, "2": 4},
            "stored_cost": "K=3 I8+dGamma(D_hidden), with spectrum 3^4+5^4",
            "additive_shift_scope": "3 I8 changes Z but not the normalized state",
            "p5": p5,
            "p5_minus_Fermi_occupation_residual": abs(
                p5 - 1.0 / (1.0 + math.exp(2.0 * eta))
            ),
            "direct_entropy": hidden_entropy,
            "stored_binary_formula": math.log(4.0) + binary_entropy,
            "spectral_entropy": hidden_entropy_formula,
            "maximum_entropy_identity_residual": max(
                abs(hidden_entropy - (math.log(4.0) + binary_entropy)),
                abs(hidden_entropy - hidden_entropy_formula),
            ),
            "identity": "S_hidden=2 log(2)+h(2 eta_Delta)=log(4)+H2(p5)",
        },
        "interpretation": (
            "The finite passive and hidden entropy formulas are exact fermionic "
            "KMS spectral entropies.  This fixes h on those finite generators; it "
            "does not identify either generator with the full fluctuated spacetime/"
            "history/Yukawa Dirac operator."
        ),
        "status": "E",
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    scales = (1, 2, 3)
    # Columns are f_s(x)=e^{-s x}; rows are f(0), int x f, int x^3 f.
    generic_moment_matrix = [
        [Fraction(1, 1) for _ in scales],
        [Fraction(1, scale**2) for scale in scales],
        [Fraction(6, scale**4) for scale in scales],
    ]
    generic_determinant = determinant_3(generic_moment_matrix)
    if generic_determinant == 0:
        raise RuntimeError("generic cutoff moments unexpectedly dependent")

    f0 = math.log(2.0)
    f2_exact = 9.0 * float(zeta(3.0, 1.0)) / 4.0
    f4_exact = 225.0 * float(zeta(5.0, 1.0)) / 8.0
    f2_integral, f2_error = quad(
        lambda x: entropy_cutoff(x) * x, 0.0, np.inf, epsabs=1.0e-12
    )
    f4_integral, f4_error = quad(
        lambda x: entropy_cutoff(x) * x**3, 0.0, np.inf, epsabs=1.0e-11
    )
    finite_kms = finite_cathedral_kms_audit()

    out = {
        "certificate": "URT generic and entropy-selected spectral-action audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "generic_four_dimensional_spectral_action": {
            "definition": "S_f(D,Lambda)=Tr f(|D|/Lambda)",
            "asymptotic_structure": (
                "S_f ~ f4 Lambda^4 a0(D^2)+f2 Lambda^2 a2(D^2)+"
                "f0 a4(D^2)+lower-scale terms"
            ),
            "moments": {
                "f0": "f(0)",
                "f2": "integral_0^infinity f(x) x dx",
                "f4": "integral_0^infinity f(x) x^3 dx",
            },
            "continuum_roles": {
                "f4_Lambda4_a0": "volume/cosmological term",
                "f2_Lambda2_a2": "Einstein-Hilbert and quadratic scalar terms",
                "f0_a4": "gauge kinetic, Higgs quartic and curvature-squared terms",
            },
            "independence_witness": {
                "cutoffs": ["exp(-x)", "exp(-2x)", "exp(-3x)"],
                "moment_matrix_rows_f0_f2_f4": [
                    [str(value) for value in row]
                    for row in generic_moment_matrix
                ],
                "determinant": str(generic_determinant),
                "positive_family_note": (
                    "A positive linear combination with all coefficients positive "
                    "has an open neighbourhood of positive coefficient choices, so "
                    "the three moments vary independently without violating positivity."
                ),
            },
            "theorem": (
                "A generic positive cutoff function introduces at least three "
                "independent continuum coefficients; the finite algebra does not "
                "select the function f."
            ),
            "status": "E conditional on a four-dimensional spectral triple",
        },
        "fermionic_entropy_spectral_action": {
            "construction": (
                "Second-quantize the real Hilbert space of a self-adjoint spectral "
                "triple, use the dynamics generated by exp(i t D), and take its "
                "fermionic KMS state at inverse temperature beta."
            ),
            "universal_even_function": (
                "h(x)=log(1+exp(-x))+x/(1+exp(x)) for x>=0, extended evenly"
            ),
            "entropy_identity": "S_von_Neumann=Tr h(beta D)",
            "exact_moments": {
                "h0": "log(2)",
                "h2": "(9/4) zeta(3)",
                "h4": "(225/8) zeta(5)",
                "general": (
                    "integral_0^infinity h(x)x^(m-1)dx="
                    "(m+1)Gamma(m)(1-2^(-m))zeta(m+1)"
                ),
            },
            "numerical_values": {
                "h0": f0,
                "h2": f2_exact,
                "h4": f4_exact,
            },
            "quadrature_audit": {
                "h2_integral": f2_integral,
                "h2_formula_residual": abs(f2_integral - f2_exact),
                "h2_quad_error_estimate": f2_error,
                "h4_integral": f4_integral,
                "h4_formula_residual": abs(f4_integral - f4_exact),
                "h4_quad_error_estimate": f4_error,
            },
            "primary_reference": {
                "authors": "A. H. Chamseddine, A. Connes, W. D. van Suijlekom",
                "title": "Entropy and the spectral action",
                "arXiv": "1809.02944",
            },
            "advance": (
                "If this KMS/second-quantization construction is adopted, the arbitrary "
                "cutoff shape and its three moment ratios are replaced by one universal "
                "function."
            ),
            "status": "E as a mathematical theorem; C as a Cathedral action premise",
        },
        "exact_Cathedral_finite_KMS_factorization": finite_kms,
        "Cathedral_input_audit": {
            "Dirac_generator": (
                "The full chiral history/overlap/finite Dirac operator is not uniquely "
                "selected; the history kernel, wall/regulator data and finite Yukawa "
                "block remain open."
            ),
            "KMS_scale": (
                "Only the product beta|D| enters h(beta D).  Identifying beta with "
                "eta_Delta requires a common normalization between the hidden cost "
                "and the one-particle Dirac generator, which has not been derived."
            ),
            "continuum_triple": (
                "The A4 principal symbol and Hopf chart are conditional carriers, not "
                "a closed fluctuated four-dimensional spectral triple with a proved "
                "heat expansion for the selected microscopic operator."
            ),
            "overall_relative_normalization": (
                "Turning dimensionless von Neumann entropy into the physical bosonic "
                "action relative to the fermionic term is itself an action postulate."
            ),
            "vacuum_term": (
                "The h4 volume coefficient is conditionally correlated, but normalized "
                "KMS states remain blind to an additive microscopic identity and do "
                "not forbid an independent vacuum counterterm."
            ),
        },
        "orientation_no_go": {
            "evenness": "h(D)=h(-D) and the action depends only on |D|",
            "existing_exact_identity": (
                "Flux-conjugate Cathedral branches have the same positive spectrum, "
                "so every real Tr f(D^dagger D), including the entropy function, agrees."
            ),
            "consequence": (
                "The entropy spectral action cannot select the determinant-line/chiral "
                "phase lambda or recover Omega5 orientation.  A chiral Pfaffian/measure "
                "trivialization remains separate."
            ),
            "status": "E",
        },
        "verdict": {
            "generic_spectral_action_closes_parameters": "F",
            "universal_entropy_cutoff_ratios": "E conditional",
            "unique_Cathedral_spectral_action": "U",
            "determinant_phase_from_spectral_action": "F",
            "advance": (
                "Fermionic KMS entropy is the first principled candidate found that "
                "fixes the cutoff-moment ratios, and both stored finite Cathedral "
                "entropy formulas are exactly finite fermionic KMS spectral "
                "entropies.  The finite factorization still does not identify the "
                "full fluctuated generator or close its beta normalization, boson/"
                "fermion action normalization, vacuum prescription, and chiral "
                "measure."
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