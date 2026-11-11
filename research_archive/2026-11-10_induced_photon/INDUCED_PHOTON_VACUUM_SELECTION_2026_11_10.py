#!/usr/bin/env python3
"""The native v61 Wilson sea selects its own gauge vacuum: a deformed pi/2-flux phase.

Setting (no inserted weights or couplings). The archived v61 Hermitian Wilson operator
H(theta) = gamma5 (D_W(e^{i theta}) - M) on the 6x2x2x2 lattice (48 sites, 11 link directions, 528
compact U(1) link phases; r, M and the 1/16 temporal weight exactly as archived). The induced
Euclidean action of the sea, with no bare gauge term:
    Gamma(theta) = -log|det H(theta)|.
It is invariant under H -> cH, so it carries no overall coupling-scale freedom.

Certified here (exact checks on the stored configuration theta_star_2026_11_10.npy, so nothing rests
on how it was found):
  1. theta = 0 is a stationary saddle: gradient 0, Hessian indefinite on the 481 physical modes.
  2. theta* is a stationary point: physical gradient < 1e-10 after Newton refinement.
  3. theta* is a strict local minimum: the Hessian on the 481 physical (non-gauge) modes is positive
     definite. The induced photon is stable around theta*, not around theta = 0.
  4. Gamma(theta*) - Gamma(0) = -99.10469... : |det H| is e^99.1 times larger at theta*.
  5. The spectral gap opens from 0.8256 to 1.8840, and H(theta*) has 5 distinct |eigenvalue| levels.
  6. Gauge-invariant content: every elementary loop flux (all 2304 triangles and 32160 four-cycles) lies
     in {0, pi, pi/2 +- eps, pi - 2 eps, 2 eps, 4 eps} with one number eps = 0.0050756...*pi.
  7. Census: L-BFGS from random starts finds no configuration with lower Gamma. This is evidence, not
     a proof, that theta* is the global minimum.
Scope: the vacuum of the induced action of THIS archived operator. The constants r, M and the
temporal weight 1/16 are v61 inputs whose own derivation is a separate audit; continuum matching of
any coupling extracted around theta* is open.
"""
from __future__ import annotations

import collections
import json
import sys
from pathlib import Path

import numpy as np
from scipy.optimize import minimize

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10 as K  # noqa: E402  (v61 operator, links, kernels)

NL, NS = K.nlink, K.nsite
XS, YS = K.edges[:, 0], K.edges[:, 1]


def gamma(theta: np.ndarray) -> float:
    return -np.linalg.slogdet(K.H_of(theta))[1]


def gradient(theta: np.ndarray) -> np.ndarray:
    G = np.linalg.inv(K.H_of(theta))
    Gb = G.reshape(NS, 4, NS, 4).transpose(0, 2, 1, 3)
    t = K.hops * np.exp(1j * theta)[:, None, None]
    tr = (np.einsum("lij,lji->l", Gb[YS, XS], 1j * t)
          + np.einsum("lij,lji->l", Gb[XS, YS], -1j * np.conj(np.transpose(t, (0, 2, 1)))))
    return -tr.real


def physical_basis() -> np.ndarray:
    U, s, _ = np.linalg.svd(K.incidence, full_matrices=False)
    gauge = U[:, : int(np.sum(s > 1e-9))]
    return np.linalg.svd(np.eye(NL) - gauge @ gauge.T)[0][:, : NL - gauge.shape[1]]


def cycles(length: int) -> list:
    adj = collections.defaultdict(list)
    for l, (x, y) in enumerate(K.edges):
        adj[x].append((y, l, +1)); adj[y].append((x, l, -1))
    found = {}
    for s in range(NS):
        stack = [(s, [], [s])]
        while stack:
            v, steps, path = stack.pop()
            for w, l, sg in adj[v]:
                if steps and l == steps[-1][0]:
                    continue
                if w == s and len(steps) == length - 1:
                    cyc = steps + [(l, sg)]
                    key = frozenset(li for li, _ in cyc)
                    if len(key) == length and key not in found:
                        found[key] = cyc
                elif w not in path and len(steps) < length - 1:
                    stack.append((w, steps + [(l, sg)], path + [w]))
    return list(found.values())


def fluxes(cycs: list, theta: np.ndarray) -> np.ndarray:
    return np.array([(sum(sg * theta[l] for l, sg in c) + np.pi) % (2 * np.pi) - np.pi for c in cycs])


def main() -> int:
    out = {}
    pb = physical_basis()
    zero = np.zeros(NL)
    g0 = gamma(zero)
    Pi0, _, _ = K.kernels(K.H_of(zero))
    w0 = np.linalg.eigvalsh(pb.T @ Pi0 @ pb)
    out["theta0"] = {"Gamma": g0, "grad_norm": float(np.linalg.norm(gradient(zero))),
                     "physical_negative_modes": int(np.sum(w0 < -1e-9)),
                     "physical_positive_modes": int(np.sum(w0 > 1e-9)),
                     "hessian_min": float(w0.min()), "hessian_max": float(w0.max())}

    theta = np.load(HERE / "theta_star_2026_11_10.npy")
    for _ in range(4):                                   # Newton refinement on the physical subspace
        Pi, _, _ = K.kernels(K.H_of(theta), theta=theta)
        b = pb.T @ gradient(theta)
        if np.linalg.norm(b) < 1e-14:
            break
        theta = theta - pb @ np.linalg.solve(pb.T @ Pi @ pb, b)
    Pi, _, _ = K.kernels(K.H_of(theta), theta=theta)
    w = np.linalg.eigvalsh(pb.T @ Pi @ pb)
    gs = gamma(theta)
    e0, es = np.linalg.eigvalsh(K.H_of(zero)), np.linalg.eigvalsh(K.H_of(theta))
    out["theta_star"] = {"Gamma": gs, "Gamma_minus_Gamma0": gs - g0,
                         "physical_grad_norm": float(np.linalg.norm(pb.T @ gradient(theta))),
                         "hessian_min": float(w.min()), "hessian_max": float(w.max()),
                         "physical_negative_modes": int(np.sum(w < -1e-12)),
                         "gap_theta0": float(np.min(np.abs(e0))), "gap_theta_star": float(np.min(np.abs(es))),
                         "distinct_abs_eigenvalue_levels": int(len(set(np.round(np.abs(es), 9))))}

    classes = {}
    for L in (3, 4):
        cs = cycles(L)
        f = np.abs(fluxes(cs, theta)) / np.pi
        classes[L] = collections.Counter(np.round(f, 10))
    eps = min(v for L in classes for v in classes[L] if v > 1e-9)          # smallest nonzero |flux|/pi
    eps = eps / 2                                                            # it is 2*eps (four-cycles)
    allowed = {0.0, 1.0, 0.5 - eps, 0.5 + eps, 1 - 2 * eps, 2 * eps, 4 * eps}
    stray = [v for L in classes for v in classes[L] if min(abs(v - a) for a in allowed) > 1e-8]
    out["flux_classes_over_pi"] = {str(L): {f"{v:.10f}": c for v, c in sorted(classes[L].items())} for L in classes}
    out["eps_over_pi"] = eps
    out["eps_radians"] = eps * np.pi
    out["flux_values_outside_family"] = stray

    rng = np.random.default_rng(20261110)
    census = []
    for _ in range(int(sys.argv[1]) if len(sys.argv) > 1 else 4):
        r = minimize(lambda x: (gamma(x), gradient(x)), rng.uniform(-np.pi, np.pi, NL), jac=True,
                     method="L-BFGS-B", options={"maxiter": 6000, "gtol": 1e-9, "ftol": 1e-15})
        census.append(round(float(r.fun), 9))
    out["census_minima_found"] = sorted(census)
    out["census_lower_than_theta_star"] = [c for c in census if c < gs - 1e-7]

    print(json.dumps(out, indent=2, default=float))
    (HERE / "INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10.json").write_text(json.dumps(out, indent=2, default=float) + "\n")

    assert out["theta0"]["grad_norm"] < 1e-10 and out["theta0"]["physical_negative_modes"] > 0
    assert out["theta_star"]["physical_grad_norm"] < 1e-10, "theta* is not stationary"
    assert out["theta_star"]["hessian_min"] > 0, "theta* is not a strict local minimum"
    assert out["theta_star"]["Gamma_minus_Gamma0"] < -99.0
    assert not stray, f"flux values outside the one-parameter family: {stray}"
    assert not out["census_lower_than_theta_star"], "a lower minimum exists: theta* is not the global minimum"
    print(f"PASS: theta=0 is a saddle ({out['theta0']['physical_negative_modes']} unstable physical modes); "
          f"the sea selects a stable deformed pi/2-flux vacuum, Gamma* - Gamma(0) = {gs - g0:.6f}, "
          f"eps = {eps:.10f} pi.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
