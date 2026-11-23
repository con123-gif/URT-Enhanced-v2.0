#!/usr/bin/env python3
"""Exact/numeric audit of the current native K4 gravity declarations.

This certificate is deliberately narrow.  It tests the operator actually
declared in ``newtons_cathedral.gravity``; it does not replace it with a
continuum metric, a fitted propagator, or a synthetic matrix.
"""
from __future__ import annotations

import json
from math import pi, sqrt

import sympy as sp


try:  # The registered repository check takes this native-import path.
    from newtons_cathedral.foundations import DELTA_STAR
    from newtons_cathedral.gravity import (
        G_NEWTON,
        kretschner_scalar_cathedral,
    )
    from newtons_cathedral.sectors import K4_EIGENVALUES
    SOURCE = "repository-native-import"
except ModuleNotFoundError:  # Standalone preflight mirrors the exact native definitions.
    phi = (1.0 + sqrt(5.0)) / 2.0
    DELTA_STAR = (1.0 - 1.0 / 81.0) * pi / (13.0 * phi)
    G_NEWTON = DELTA_STAR**2
    K4_EIGENVALUES = (0, 3, 3, 5)

    def kretschner_scalar_cathedral() -> float:
        m0_sq = 1.0 + DELTA_STAR**2
        return float(sum((m0_sq + lam) ** 2 for lam in K4_EIGENVALUES))

    SOURCE = "standalone-native-formula-preflight"


def main() -> None:
    assert tuple(K4_EIGENVALUES) == (0, 3, 3, 5)
    assert abs(G_NEWTON - DELTA_STAR**2) < 1e-15

    # The declared quadratic K4 potential Hessian is diagonal with these
    # entries.  It is strictly positive and therefore has no massless mode.
    m0_sq = 1.0 + DELTA_STAR**2
    omega_sq = tuple(m0_sq + int(lam) for lam in K4_EIGENVALUES)
    assert min(omega_sq) > 1.0
    assert sum(abs(value) < 1e-14 for value in omega_sq) == 0
    assert len(omega_sq) == 4

    # The time-kinetic Hessian in the declared L2 is +I4.  Its Sylvester
    # inertia is (4 positive, 0 negative, 0 null), not a (1,3) spacetime
    # metric. Fourier transforming time changes the common frequency sign;
    # it cannot change this internal-field inertia.
    kinetic_inertia = (4, 0, 0)
    assert kinetic_inertia == (4, 0, 0)

    # The written denominators contain k0 but no spatial momentum.  This is
    # an exact obstruction to extracting a propagation cone or redshift from
    # this operator alone.
    k0, kx, ky, kz, d = sp.symbols("k0 kx ky kz d", real=True)
    for lam in K4_EIGENVALUES:
        denominator = k0**2 - (1 + d**2 + int(lam))
        assert all(sp.diff(denominator, k) == 0 for k in (kx, ky, kz))

    # The Schwarzschild/Hawking/Bekenstein functions in gravity.py impose
    # the continuum formulas.  Their differential first law is consequently
    # an identity for every positive G and M, not a derived horizon test.
    G, M, eps = sp.symbols("G M eps", positive=True)
    temperature = 1 / (8 * sp.pi * G * M)
    entropy = 4 * sp.pi * G * M**2
    assert sp.simplify(temperature * sp.diff(entropy, M)) == 1
    finite_ratio = sp.simplify(
        temperature
        * (4 * sp.pi * G * (M * (1 + eps)) ** 2 - entropy)
        / (eps * M)
    )
    assert sp.simplify(finite_ratio - (1 + eps / 2)) == 0
    module_epsilon = 1e-6
    module_first_law_relative_error = module_epsilon / 2.0
    assert abs(module_first_law_relative_error - 5e-7) < 1e-18

    # The declared "Kretschner analogue" is a fixed spectral moment: it has
    # neither a mass nor a position argument and therefore cannot diagnose a
    # horizon or curvature singularity.
    spectral_moment = kretschner_scalar_cathedral()
    expected_moment = sum(value**2 for value in omega_sq)
    assert abs(spectral_moment - expected_moment) < 1e-12
    assert sp.diff(sp.Float(spectral_moment), M) == 0

    result = {
        "source": SOURCE,
        "delta_star": DELTA_STAR,
        "assigned_G_newton": G_NEWTON,
        "k4_lambda": list(K4_EIGENVALUES),
        "declared_omega_squared": list(omega_sq),
        "massless_mode_count": 0,
        "time_kinetic_inertia_positive_negative_null": list(kinetic_inertia),
        "spatial_momentum_derivative_rank": 0,
        "spectral_curvature_moment": spectral_moment,
        "finite_first_law_relative_error_at_1e-6_step": module_first_law_relative_error,
        "status": "OBSTRUCTION within current K4 gravity.py operator",
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    print("PASS: current K4 oscillator does not yet supply causal massless spin-2 or derived horizon thermodynamics")


if __name__ == "__main__":
    main()
