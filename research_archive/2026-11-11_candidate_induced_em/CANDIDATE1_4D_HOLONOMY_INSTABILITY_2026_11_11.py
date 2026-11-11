#!/usr/bin/env python3
"""Candidate 1 in 4D: a dynamical photon removes the golden clock twist and the native vertex field becomes massless.

Setting (conditional, as in CANDIDATE1_INDUCED_EM_ICOSAHEDRON_2026_11_11.py, now on the 4D complex of Q25): complex vertex
cochains on 13-cell x 24-clock, spatial kinetic term the 13-cell graph Laplacian L13, temporal kinetic term the native clock
r^2 |z_{t+1} - e^{i theta} z_t|^2 with r = pi/e. In 4D the photon has temporal components, and the clock link phases ARE
those components (the native engine gauge-transforms them), so the uniform clock phase theta is a dynamical mode. Bosonic
induced action as a function of it:
    Gamma(theta) = sum_m log det( L13 + r^2 (2 - 2 cos(2 pi m/24 + theta)) ).
Certified:
  1. L13 has an exact zero mode (spectrum 0, 6-sqrt5 (3), 7 (5), 6+sqrt5 (3), 13).
  2. Gamma has period exactly 2 pi/24 and diverges to -infinity like 2 log|theta - 2 pi k/24| at theta = 2 pi k/24, where the
     m = -k clock mode makes the vertex field massless: the induced action is unbounded below.
  3. The golden value theta = 2 pi/phi^2 is not a minimum (Gamma(0.5) < Gamma(golden)); it lies 0.0438 rad from the singular
     point k = 9.
Consequence: in 4D, candidate 1 has no vacuum unless a gauge-covariant mass term is added; the native action supplies none
(Cbridge is not covariant under vertex phases). Consistent with the archived "the source-free Gaussian clock determinant does
not select the golden phase" (docs/RESEARCH_STATE.md section 3).
"""
from __future__ import annotations

import itertools
import json
import sys
from itertools import combinations
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
PHI = (1 + 5 ** 0.5) / 2
R = np.pi / np.e
GOLDEN = 2 * np.pi / PHI ** 2


def L13():
    sh = np.array([(0, a, b * PHI) for a, b in itertools.product((-1, 1), repeat=2)]
                  + [(a, b * PHI, 0) for a, b in itertools.product((-1, 1), repeat=2)]
                  + [(a * PHI, 0, b) for a, b in itertools.product((-1, 1), repeat=2)], float)
    A = np.zeros((13, 13))
    for i, j in combinations(range(12), 2):
        if abs(np.linalg.norm(sh[i] - sh[j]) - 2) < 1e-9:
            A[i + 1, j + 1] = A[j + 1, i + 1] = 1
    A[0, 1:] = A[1:, 0] = 1
    return np.diag(A.sum(1)) - A


def gamma(theta, L):
    return sum(np.linalg.slogdet(L + R * R * (2 - 2 * np.cos(2 * np.pi * m / 24 + theta)) * np.eye(13))[1] for m in range(24))


def main() -> int:
    L = L13()
    ev = np.sort(np.linalg.eigvalsh(L))
    out = {"L13_spectrum": [round(float(x), 9) for x in ev]}
    assert abs(ev[0]) < 1e-12 and np.allclose(sorted(set(np.round(ev, 9))), [0, 6 - 5 ** 0.5, 7, 6 + 5 ** 0.5, 13])
    g0 = gamma(GOLDEN, L)
    out["Gamma_golden"] = g0
    out["period_check"] = float(abs(gamma(GOLDEN + 2 * np.pi / 24, L) - g0))
    assert out["period_check"] < 1e-9
    k = round(GOLDEN / (2 * np.pi / 24))
    sing = 2 * np.pi * k / 24
    out["nearest_singular_point"] = {"k": int(k), "theta": sing, "distance_from_golden": float(abs(GOLDEN - sing))}
    eps = [1e-2, 1e-3, 1e-4, 1e-5, 1e-6]
    vals = [gamma(sing + e, L) for e in eps]
    slopes = [(vals[i + 1] - vals[i]) / np.log(eps[i + 1] / eps[i]) for i in range(len(eps) - 1)]
    out["Gamma_near_singular"] = {str(e): v for e, v in zip(eps, vals)}
    out["log_slopes"] = slopes
    assert all(abs(s - 2) < 1e-3 for s in slopes[1:]), slopes          # Gamma ~ 2 log|theta - theta_k|
    out["Gamma(0.5) - Gamma(golden)"] = gamma(0.5, L) - g0
    assert out["Gamma(0.5) - Gamma(golden)"] < 0
    print(json.dumps(out, indent=2))
    (HERE / "CANDIDATE1_4D_HOLONOMY_INSTABILITY_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    print("PASS: in 4D the clock holonomy is dynamical; Gamma is unbounded below (2 log) at theta = 2 pi k/24 where the vertex "
          "field is massless; the golden twist is not a minimum.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
