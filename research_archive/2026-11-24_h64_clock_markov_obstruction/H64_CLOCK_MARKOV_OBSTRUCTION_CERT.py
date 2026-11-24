#!/usr/bin/env python3
"""Native H64 Markov theorem and charge-two clock obstruction certificate.

This separates the genuine 64-history pair-flip probability generator from
the complex gauge-covariant 24-clock amplitude semigroup.  It adds no rates,
metric map, stochastic completion, or fitted constant.
"""
from __future__ import annotations

import itertools
import json
from pathlib import Path
import runpy
import sys

import numpy as np
from scipy.linalg import expm


SCRIPT_DIR = Path(__file__).resolve().parent
ARCHIVE_RELATIVE = (
    Path("research_archive")
    / "2026-11-07_joint_interacting_native"
    / "cathedral_constructed_joint_dynamics_2026_11_07.py"
)
for candidate in (SCRIPT_DIR, *SCRIPT_DIR.parents):
    if (candidate / ARCHIVE_RELATIVE).is_file():
        ROOT = candidate
        break
else:
    raise FileNotFoundError(f"repository root containing {ARCHIVE_RELATIVE} not found")
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from cathedral_core.native_urt import NativeURTEngine


TOL = 2.0e-11


def pair_flip_laplacian() -> tuple[np.ndarray, np.ndarray]:
    states = np.array(list(itertools.product((-1, 1), repeat=6)), dtype=int)
    lookup = {tuple(state): index for index, state in enumerate(states)}
    laplacian = np.zeros((64, 64), dtype=float)
    for index, state in enumerate(states):
        for left in range(6):
            for right in range(left + 1, 6):
                target = state.copy()
                target[left] *= -1
                target[right] *= -1
                laplacian[index, lookup[tuple(target)]] = -1.0
        laplacian[index, index] = 15.0
    return states, laplacian


def relative_entropy(probability: np.ndarray, reference: np.ndarray) -> float:
    return float(np.sum(probability * np.log(probability / reference)))


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = NativeURTEngine(native)
    states, reconstructed = pair_flip_laplacian()
    hbits = dynamics.Hbits
    assert np.max(np.abs(hbits - reconstructed)) < TOL
    generator = -hbits

    # This is a genuine continuous-time probability generator on each parity
    # component: nonnegative off diagonal rates and zero column/row sums.
    off_diagonal = generator.copy()
    np.fill_diagonal(off_diagonal, 0.0)
    assert np.min(off_diagonal) >= 0.0
    assert np.max(np.abs(np.sum(generator, axis=0))) < TOL
    assert np.max(np.abs(np.sum(generator, axis=1))) < TOL
    parity = np.prod(states, axis=1)
    spectrum = np.linalg.eigvalsh(hbits)
    expected_spectrum = {0.0: 2, 10.0: 12, 16.0: 30, 18.0: 20}
    measured_spectrum = {
        eigenvalue: int(np.count_nonzero(np.abs(spectrum - eigenvalue) < TOL))
        for eigenvalue in expected_spectrum
    }
    assert measured_spectrum == expected_spectrum

    # Concrete deterministic entropy-contraction witness on the even sector.
    indices = np.flatnonzero(parity == 1)
    sector_laplacian = hbits[np.ix_(indices, indices)]
    stationary = np.full(32, 1.0 / 32.0)
    initial = np.arange(1.0, 33.0)
    initial /= np.sum(initial)
    times = np.array([0.0, 0.01, 0.05, 0.1, 0.2, 0.5, 1.0])
    divergences = []
    entropy_productions = []
    mass_residuals = []
    minimum_probabilities = []
    for time in times:
        probability = expm(-time * sector_laplacian) @ initial
        divergence = relative_entropy(probability, stationary)
        production = float(
            np.dot(sector_laplacian @ probability, np.log(probability / stationary))
        )
        divergences.append(divergence)
        entropy_productions.append(production)
        mass_residuals.append(abs(float(np.sum(probability)) - 1.0))
        minimum_probabilities.append(float(np.min(probability)))
    assert np.max(np.diff(divergences)) <= TOL
    assert min(entropy_productions) >= -TOL
    assert max(mass_residuals) < TOL
    assert min(minimum_probabilities) > 0.0

    # The original charge-two clock connection is a magnetic/covariant
    # Laplacian.  Its gauge-invariant cycle holonomy is nontrivial.
    theta = np.full(dynamics.N, dynamics.golden_angle)
    clock_laplacian = dynamics.clock_laplacian(theta, 2)
    link_phase = np.exp(2j * dynamics.golden_angle)
    holonomy = link_phase ** dynamics.N
    holonomy_distance = float(abs(holonomy - 1.0))
    # theta=2*pi/phi^2, so holonomy=exp(2*pi*i*48/phi^2).  Since phi^2 is
    # irrational, 48/phi^2 is not an integer.  The numerical lower bound is
    # deliberately coarse and merely certifies the evaluated native constant.
    assert holonomy_distance > 1.0
    assert np.max(np.abs(clock_laplacian - clock_laplacian.conj().T)) < TOL
    assert np.max(np.abs(np.imag(clock_laplacian))) > 0.9
    clock_row_sum_norm = float(np.linalg.norm(clock_laplacian @ np.ones(24)))
    assert clock_row_sum_norm > 1.0

    # A diagonal gauge can move link phases but cannot change their product.
    gauge = np.arange(dynamics.N, dtype=float) ** 2 / dynamics.N**2
    transformed_links = np.array(
        [
            link_phase * np.exp(1j * (gauge[(j + 1) % dynamics.N] - gauge[j]))
            for j in range(dynamics.N)
        ]
    )
    transformed_holonomy = np.prod(transformed_links)
    assert abs(transformed_holonomy - holonomy) < TOL

    # Directly evolve a clock delta under the exact clock factor of the native
    # H64/24 semigroup.  A stochastic column must be real, nonnegative and
    # sum to one; this native covariant amplitude column has none of those
    # properties at t=0.1.
    time = 0.1
    clock_column = expm(-time * dynamics.r**2 * clock_laplacian)[:, 0]
    clock_imaginary_norm = float(np.linalg.norm(np.imag(clock_column)))
    clock_minimum_real = float(np.min(np.real(clock_column)))
    clock_mass = complex(np.sum(clock_column))
    assert clock_imaginary_norm > 0.1
    assert clock_minimum_real < 0.0
    assert abs(clock_mass - 1.0) > 0.1

    # Hbits and the clock factor commute on their tensor product.  Multiplying
    # by the valid history probability column cannot repair the clock failure.
    history_column = expm(-time * hbits)[:, 0]
    assert np.min(history_column) >= -TOL
    assert abs(float(np.sum(history_column)) - 1.0) < TOL
    full_column = np.outer(clock_column, history_column)
    full_mass = complex(np.sum(full_column))
    assert np.linalg.norm(np.imag(full_column)) > 0.04
    assert abs(full_mass - 1.0) > 0.1

    result = {
        "status": "PASS",
        "native_H64_probability_theorem": {
            "states": 64,
            "closed_parity_components": 2,
            "component_size": 32,
            "spectrum_multiplicities": {
                str(int(key)): value for key, value in measured_spectrum.items()
            },
            "component_spectral_gap": 10.0,
            "entropy_witness": [
                {
                    "time": float(time_value),
                    "relative_entropy": float(divergence),
                    "entropy_production": float(production),
                }
                for time_value, divergence, production in zip(
                    times, divergences, entropy_productions
                )
            ],
            "maximum_mass_residual": max(mass_residuals),
        },
        "native_charge_two_clock_obstruction": {
            "theta": dynamics.golden_angle,
            "link_phase": [float(link_phase.real), float(link_phase.imag)],
            "cycle_holonomy": [float(holonomy.real), float(holonomy.imag)],
            "cycle_holonomy_distance_from_one": holonomy_distance,
            "clock_row_sum_norm": clock_row_sum_norm,
            "delta_evolution_time": time,
            "delta_column_imaginary_norm": clock_imaginary_norm,
            "delta_column_minimum_real_part": clock_minimum_real,
            "delta_column_sum": [float(clock_mass.real), float(clock_mass.imag)],
            "full_H64_clock_column_sum": [
                float(full_mass.real),
                float(full_mass.imag),
            ],
        },
        "interpretation": (
            "-Hbits is an exact reversible two-component Markov generator and "
            "contracts relative entropy to the uniform law in each parity "
            "component.  The full charge-two 24-clock factor has nontrivial "
            "golden holonomy and evolves complex amplitudes, not probabilities. "
            "Therefore the full H64/24 relaxation cannot supply a KMS or horizon "
            "entropy-production law without a separately declared positive, "
            "probability-preserving clock/occupation generator."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
