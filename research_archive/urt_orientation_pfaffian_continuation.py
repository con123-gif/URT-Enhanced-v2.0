#!/usr/bin/env python3
"""Degree-five branch-orientation and KO-6/Pfaffian continuation.

This is the next blind calculation recorded in Cathedral_Live_State.md.
It uses no particle masses, CKM/PMNS entries, or other observational targets.

The certificate:

1. builds the branch-doubled Wilson operator W=diag(L,R) and orientation
   operator tau_3=diag(-I,+I);
2. exhausts all 2^5 ordered branch words and classifies the real closed
   degree-five trace invariants;
3. verifies gauge and A5 covariance and the reversal parity of the two
   surviving invariants;
4. embeds tau_3 in the four-block KO-6 completion; and
5. tests whether the finite Majorana/Pfaffian construction fixes the
   coefficient of the unique chi*Omega_5 interaction.

The result is deliberately status-controlled: the invariant direction is
unique, but its action coefficient is not fixed by the presently declared
relative-information, KO-6, or Pfaffian axioms.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parent
WILSON_PATH = ROOT / "urt_wilson_history_continuation.py"


def load_wilson_module():
    spec = importlib.util.spec_from_file_location("wilson_current", WILSON_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {WILSON_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


wilson = load_wilson_module()


def block_diag(*blocks: np.ndarray) -> np.ndarray:
    rows = sum(block.shape[0] for block in blocks)
    cols = sum(block.shape[1] for block in blocks)
    out = np.zeros((rows, cols), dtype=np.result_type(*blocks))
    i = j = 0
    for block in blocks:
        r, c = block.shape
        out[i : i + r, j : j + c] = block
        i += r
        j += c
    return out


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def permutation_cycles(monomial: np.ndarray) -> list[list[int]]:
    permutation = np.argmax(np.abs(monomial), axis=1)
    if not np.all(np.sum(np.abs(monomial) > 1.0e-12, axis=1) == 1):
        raise RuntimeError("matrix is not row-monomial")
    if len(set(permutation.tolist())) != len(permutation):
        raise RuntimeError("matrix support is not a permutation")
    unseen = set(range(len(permutation)))
    cycles = []
    while unseen:
        start = min(unseen)
        cycle = []
        current = start
        while current not in cycle:
            cycle.append(current)
            unseen.discard(current)
            current = int(permutation[current])
        if current != start:
            raise RuntimeError("permutation cycle did not return to its start")
        cycles.append(cycle)
    return cycles


def enumerate_degree_five(left: np.ndarray, right: np.ndarray) -> list[dict[str, Any]]:
    support_left = (np.abs(left) > 1.0e-12).astype(int)
    support_right = (np.abs(right) > 1.0e-12).astype(int)
    out = []
    for letters in itertools.product("LR", repeat=5):
        value = np.eye(left.shape[0], dtype=complex)
        support = np.eye(left.shape[0], dtype=int)
        for letter in letters:
            value = value @ (left if letter == "L" else right)
            support = support @ (
                support_left if letter == "L" else support_right
            )
        trace = np.trace(value)
        out.append(
            {
                "word": "".join(letters),
                "fixed_states": int(round(float(np.trace(support)))),
                "trace": complex_payload(trace),
                "trace_abs": float(abs(trace)),
            }
        )
    return out


def ko6_matrices(m: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Return D, grading and the linear part of the KO-6 antiunitary J."""
    n = m.shape[0]
    zero = np.zeros_like(m)
    identity = np.eye(n, dtype=complex)
    d = np.block(
        [
            [zero, m.conj().T, zero, zero],
            [m, zero, zero, zero],
            [zero, zero, zero, m.T],
            [zero, zero, m.conj(), zero],
        ]
    )
    grading = block_diag(-identity, identity, identity, -identity)
    j_linear = np.block(
        [
            [zero, zero, identity, zero],
            [zero, zero, zero, identity],
            [identity, zero, zero, zero],
            [zero, identity, zero, zero],
        ]
    )
    return d, grading, j_linear


def pfaffian_family(left: np.ndarray, right: np.ndarray, amplitude: float) -> dict[str, Any]:
    """Evaluate the exact finite Pfaffian witness family.

    For A_s(a)=[[0,-K_s^T],[K_s,0]] with K_s=I-a U_s and dimension 60,
    Pf(A_s)=det(K_s).  Since U_L and U_R each consist of twelve five-cycles,

      det(I-a L)=(1-a^5 exp(-i*pi/6))^12,
      det(I-a R)=(1-a^5 exp(+i*pi/6))^12.

    The half log-Pfaffian ratio has leading orientation term
    -6 a^5 Omega_5.  The free amplitude a supplies an explicit witness that
    the symmetry class does not fix the coupling coefficient.
    """
    if not 0.0 < amplitude < 1.0:
        raise ValueError("the witness amplitude must lie in (0,1)")
    identity = np.eye(left.shape[0], dtype=complex)
    k_left = identity - amplitude * left
    k_right = identity - amplitude * right
    sign_left, logabs_left = np.linalg.slogdet(k_left)
    sign_right, logabs_right = np.linalg.slogdet(k_right)
    numeric_left = float(logabs_left) + 1j * float(np.angle(sign_left))
    numeric_right = float(logabs_right) + 1j * float(np.angle(sign_right))
    exact_left = 12.0 * np.log(
        1.0 - amplitude**5 * np.exp(-1j * math.pi / 6.0)
    )
    exact_right = 12.0 * np.log(
        1.0 - amplitude**5 * np.exp(1j * math.pi / 6.0)
    )
    log_ratio = numeric_right - numeric_left
    half_phase_action = log_ratio / (2.0j)
    return {
        "amplitude": float(amplitude),
        "interpretation": (
            "1/2 is the classical Haar transfer weight; 1/sqrt(2) is the "
            "Kraus/Stinespring amplitude.  The present axioms do not identify "
            "either with the relative hopping strength in the finite Dirac/Pfaffian."
        ),
        "log_pfaffian_left": complex_payload(numeric_left),
        "log_pfaffian_right": complex_payload(numeric_right),
        "determinant_formula_residual": float(
            max(abs(numeric_left - exact_left), abs(numeric_right - exact_right))
        ),
        "log_pfaffian_ratio": complex_payload(log_ratio),
        "half_log_ratio_phase_action": float(np.real(half_phase_action)),
        "half_log_ratio_imaginary_residual": float(abs(np.imag(half_phase_action))),
        "degree_five_coefficient_of_Omega5": float(-6.0 * amplitude**5),
        "exact_action_minus_degree_five_term": float(
            np.real(half_phase_action) + 6.0 * amplitude**5
        ),
        "positive_cost_minmax_left": [
            float(np.linalg.eigvalsh(k_left.conj().T @ k_left)[0]),
            float(np.linalg.eigvalsh(k_left.conj().T @ k_left)[-1]),
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    dual_hopf, face_spinors, links = wilson.dual_hopf_certificate(
        geometry, history
    )
    left, right, _ = wilson.history_transfer(history, links)
    identity60 = np.eye(60, dtype=complex)

    words = enumerate_degree_five(left, right)
    closed = [item for item in words if item["fixed_states"]]
    if [item["word"] for item in closed] != ["LLLLL", "RRRRR"]:
        raise RuntimeError("unexpected closed degree-five word")

    left5 = np.linalg.matrix_power(left, 5)
    right5 = np.linalg.matrix_power(right, 5)
    target_left = np.exp(-1j * math.pi / 6.0) * identity60
    target_right = np.exp(1j * math.pi / 6.0) * identity60

    doubled_wilson = block_diag(left, right)
    tau3 = block_diag(-identity60, identity60)
    branch_swap = np.block(
        [[np.zeros_like(identity60), identity60], [identity60, np.zeros_like(identity60)]]
    )
    doubled_fifth = np.linalg.matrix_power(doubled_wilson, 5)
    omega5_complex = -1j * np.trace(tau3 @ doubled_fifth) / 60.0
    even5 = np.real(np.trace(doubled_fifth)) / 120.0
    swapped_wilson = branch_swap @ doubled_wilson @ branch_swap
    swapped_omega = -1j * np.trace(
        tau3 @ np.linalg.matrix_power(swapped_wilson, 5)
    ) / 60.0
    swapped_even = np.real(
        np.trace(np.linalg.matrix_power(swapped_wilson, 5))
    ) / 120.0

    # Gauge covariance of each branch, not only their average.
    rng = np.random.default_rng(20260903)
    phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = wilson.generic_hopf_links(
        history["normals"], history["adjacency"], phases
    )
    left_g, right_g, _ = wilson.history_transfer(history, transformed_links)
    state_gauge = np.diag(
        [np.exp(1j * phases[a]) for a, _ in history["states"]]
    )
    gauge_residual = max(
        np.linalg.norm(left_g - state_gauge.conj().T @ left @ state_gauge),
        np.linalg.norm(right_g - state_gauge.conj().T @ right @ state_gauge),
    )

    # A5 covariance of each oriented branch.
    a5_residual = 0.0
    for p in (history["edge_half_turn"], history["face_rotation"]):
        action = wilson.twisted_state_action(
            geometry, history, face_spinors, p
        )
        a5_residual = max(
            a5_residual,
            float(np.linalg.norm(action @ left - left @ action)),
            float(np.linalg.norm(action @ right - right @ action)),
        )

    # The conjugate relation is geometric, not special to the uniform Hopf
    # connection.  Test it on a generic unitary edge connection.
    generic_links = np.zeros((20, 20), dtype=complex)
    for i in range(20):
        for j in range(i + 1, 20):
            if history["adjacency"][i, j]:
                value = np.exp(1j * rng.uniform(-math.pi, math.pi))
                generic_links[i, j] = value
                generic_links[j, i] = np.conj(value)
    generic_left, generic_right, _ = wilson.history_transfer(
        history, generic_links
    )
    generic_conjugation_residual = abs(
        np.trace(np.linalg.matrix_power(generic_right, 5))
        - np.conj(np.trace(np.linalg.matrix_power(generic_left, 5)))
    )

    # Hodge chirality and branch orientation are both reversal-odd; their
    # tensor product is reversal-even.
    identity3 = np.eye(3)
    zero3 = np.zeros((3, 3))
    hodge_chirality = block_diag(identity3, -identity3)
    hodge_swap = np.block([[zero3, identity3], [identity3, zero3]])
    combined_parity = np.kron(hodge_chirality, tau3)
    combined_swap = np.kron(hodge_swap, branch_swap)

    # Lift tau_3 into the four KO-6 blocks.  It is grading-even, J-odd and
    # commutes with the branch-diagonal Dirac operator.
    d_ko6, grading_ko6, j_linear = ko6_matrices(doubled_wilson)
    tau3_ko6 = block_diag(tau3, tau3, -tau3, -tau3)
    ko6_base = wilson.ko6_completion_certificate(doubled_wilson)
    tau3_ko6_residuals = {
        "commutes_D": float(np.linalg.norm(tau3_ko6 @ d_ko6 - d_ko6 @ tau3_ko6)),
        "commutes_grading": float(
            np.linalg.norm(tau3_ko6 @ grading_ko6 - grading_ko6 @ tau3_ko6)
        ),
        "J_odd": float(
            np.linalg.norm(j_linear @ tau3_ko6.conj() + tau3_ko6 @ j_linear)
        ),
    }
    d_sign, d_logabs = np.linalg.slogdet(d_ko6)

    # Naive finite Pfaffian phase is blind: for the canonical antisymmetric
    # chiral block, Pf([[0,-M^T],[M,0]])=det(M), and det L=det R=1.
    sign_left, logabs_left = np.linalg.slogdet(left)
    sign_right, logabs_right = np.linalg.slogdet(right)
    cycle_lengths_left = sorted(len(cycle) for cycle in permutation_cycles(left))
    cycle_lengths_right = sorted(len(cycle) for cycle in permutation_cycles(right))

    pfaffian_witnesses = [
        pfaffian_family(left, right, 0.5),
        pfaffian_family(left, right, 1.0 / math.sqrt(2.0)),
    ]
    coefficient_spread = abs(
        pfaffian_witnesses[0]["degree_five_coefficient_of_Omega5"]
        - pfaffian_witnesses[1]["degree_five_coefficient_of_Omega5"]
    )

    out = {
        "certificate": "URT degree-five orientation/Pfaffian continuation",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "branch_doubled_algebra": {
            "history_space": "C^2_branch tensor C^60_directed-edge",
            "W": "diag(L,R)",
            "tau3": "diag(-I60,+I60)",
            "left_fifth_residual": float(np.linalg.norm(left5 - target_left)),
            "right_fifth_residual": float(np.linalg.norm(right5 - target_right)),
            "tau3_square_residual": float(
                np.linalg.norm(tau3 @ tau3 - np.eye(120))
            ),
            "tau3_commutes_W_residual": float(
                np.linalg.norm(tau3 @ doubled_wilson - doubled_wilson @ tau3)
            ),
            "branch_swap_flips_tau3_residual": float(
                np.linalg.norm(branch_swap @ tau3 @ branch_swap + tau3)
            ),
        },
        "degree_five_exhaustion": {
            "ordered_words_tested": len(words),
            "closed_words": closed,
            "nonclosed_trace_max": float(
                max(item["trace_abs"] for item in words if not item["fixed_states"])
            ),
            "left_cycle_lengths": cycle_lengths_left,
            "right_cycle_lengths": cycle_lengths_right,
            "complex_closed_trace_dimension": 2,
            "real_invariant_dimension": 2,
            "reversal_even_dimension": 1,
            "reversal_odd_dimension": 1,
            "hodge_linear_reversal_even_coupling_dimension": 1,
            "theorem": (
                "Only L^5 and R^5 close on the regular A5 history set.  Reality pairs "
                "their traces, reversal splits the resulting real plane into one even "
                "and one odd line, and Hodge chirality is reversal-odd.  Therefore the "
                "real degree-five interaction linear in Hodge chirality is spanned by "
                "chi*Omega5 and is one-dimensional."
            ),
        },
        "normalized_scalars": {
            "E5_definition": "Re Tr(W^5)/120",
            "E5": float(even5),
            "E5_target": math.sqrt(3.0) / 2.0,
            "E5_target_error": float(abs(even5 - math.sqrt(3.0) / 2.0)),
            "Omega5_definition": "-i Tr(tau3 W^5)/60",
            "Omega5": float(np.real(omega5_complex)),
            "Omega5_reality_residual": float(abs(np.imag(omega5_complex))),
            "Omega5_target_error": float(abs(np.real(omega5_complex) - 1.0)),
            "branch_swapped_E5": float(swapped_even),
            "branch_swapped_Omega5": float(np.real(swapped_omega)),
            "branch_swap_even_residual": float(abs(swapped_even - even5)),
            "branch_swap_odd_residual": float(abs(swapped_omega + omega5_complex)),
            "generic_unitary_connection_R5_equals_conj_L5_residual": float(
                generic_conjugation_residual
            ),
        },
        "symmetry": {
            "random_U1_gauge_covariance_residual": float(gauge_residual),
            "A5_generator_covariance_residual": float(a5_residual),
            "hodge_swap_flips_chirality_residual": float(
                np.linalg.norm(
                    hodge_swap @ hodge_chirality @ hodge_swap
                    + hodge_chirality
                )
            ),
            "combined_hodge_branch_coupling_reversal_residual": float(
                np.linalg.norm(
                    combined_swap @ combined_parity @ combined_swap
                    - combined_parity
                )
            ),
        },
        "KO6_branch_orientation": {
            "base_completion": ko6_base,
            "tau3_lift": "diag(tau3,tau3,-tau3,-tau3)",
            "tau3_lift_residuals": tau3_ko6_residuals,
            "full_D_determinant": complex_payload(
                np.exp(float(d_logabs)) * d_sign
            ),
            "phase_cancellation_identity": (
                "The unreduced four-block completion contains M, M^T and their "
                "conjugates; det(D_M)=|det(M)|^4 (up to the fixed even-dimensional "
                "block sign), so its full determinant/spectral action cannot retain "
                "an orientation phase.  A chiral Pfaffian must be defined on the "
                "physical half-space, which is precisely part of the still-open "
                "doubling-safe lattice-Dirac gate."
            ),
        },
        "naive_pfaffian_phase": {
            "identity": (
                "Pf([[0,-M^T],[M,0]])=det(M) for the even dimensions used here"
            ),
            "det_L": complex_payload(
                np.exp(float(logabs_left)) * sign_left
            ),
            "det_R": complex_payload(
                np.exp(float(logabs_right)) * sign_right
            ),
            "det_L_minus_one": float(
                abs(np.exp(float(logabs_left)) * sign_left - 1.0)
            ),
            "det_R_minus_one": float(
                abs(np.exp(float(logabs_right)) * sign_right - 1.0)
            ),
            "conclusion": (
                "The unshifted finite KO-6/Majorana Pfaffian is orientation-blind: "
                "the twelve pentagon phases sum to +/-2*pi, so det L=det R=1."
            ),
        },
        "shifted_pfaffian_family": {
            "definition": (
                "A_s(a)=[[0,-(I-a U_s)^T],[I-a U_s,0]], 0<a<1"
            ),
            "exact_ratio": (
                "Pf A_R/Pf A_L=[(1-a^5 exp(+i*pi/6))/(1-a^5 exp(-i*pi/6))]^12"
            ),
            "degree_five_expansion": (
                "(chi/(2i)) log(Pf A_R/Pf A_L) = -6 chi a^5 Omega5 + O(a^10)"
            ),
            "witnesses": pfaffian_witnesses,
            "degree_five_coefficient_spread": float(coefficient_spread),
        },
        "relative_information_no_go": {
            "family": (
                "For every 0<a<1, K_s(a)=(I-aU_s)^*(I-aU_s)>=0 and the same "
                "relative-information functional has the unique Gibbs minimizer "
                "rho_a proportional to exp(log rho0-eta K_s(a))."
            ),
            "nonidentifiability": (
                "Relative information selects rho after K is supplied; it does not "
                "select the hopping ratio a or the coefficient lambda in "
                "lambda*chi*Omega5.  Adding any real lambda*chi*Omega5 preserves "
                "reality, U(1), A5 and reversal symmetry."
            ),
            "quadratic_lattice_functional_scope": (
                "The Hessian of sum ||Psi_y-U_xy Psi_x||^2 plus a real local "
                "potential is Hermitian and has the same determinant under flux "
                "conjugation.  It can generate reversal-even Wilson traces only.  "
                "Omega5 can enter through a genuinely chiral fermion Pfaffian, and "
                "then its coefficient depends on the hopping-to-onsite ratio and on "
                "the chosen chiral measure."
            ),
            "phase_is_not_a_convex_energy": (
                "arg Pf is a phase (defined modulo 2*pi), not a bounded real KL cost. "
                "Turning it into a minimizable real term requires an additional "
                "branch/interference prescription, which the current master "
                "functional does not supply."
            ),
        },
        "verdict": {
            "invariant_direction": (
                "CLOSED/EXACT: the allowed real reversal-compatible degree-five "
                "Hodge-orientation coupling is one-dimensional, span{chi*Omega5}."
            ),
            "geometric_normalization": (
                "CLOSED/EXACT: division by 60 makes Omega5=1 on the certified "
                "unit-flux regular Hopf connection."
            ),
            "dynamical_coefficient": (
                "UNDERDETERMINED: KO-6 kinematics and the unshifted Pfaffian are "
                "blind to Omega5; shifted Pfaffians form a continuous admissible "
                "family whose degree-five coefficient is -6a^5."
            ),
            "flavour_action": (
                "NOT FROZEN: no blind mass/CKM/PMNS evaluation is licensed by this result."
            ),
            "minimal_missing_premise": (
                "Derive the dimensionless diagonal-to-history hopping ratio (or an "
                "equivalent normalized antisymmetric fermion operator and chiral "
                "measure) from the microscopic lattice action; this must be done "
                "together with the doubling-safe chiral lattice-Dirac construction."
            ),
        },
    }

    payload = json.dumps(out, indent=2)
    if args.output is None:
        print(payload)
    else:
        args.output.write_text(payload + "\n", encoding="utf-8")
        print(
            json.dumps(
                {
                    "output": str(args.output),
                    "closed_words": [item["word"] for item in closed],
                    "Omega5": out["normalized_scalars"]["Omega5"],
                    "coupling_dimension": out["degree_five_exhaustion"][
                        "hodge_linear_reversal_even_coupling_dimension"
                    ],
                    "coefficient_status": "UNDERDETERMINED",
                },
                indent=2,
            )
        )


if __name__ == "__main__":
    main()