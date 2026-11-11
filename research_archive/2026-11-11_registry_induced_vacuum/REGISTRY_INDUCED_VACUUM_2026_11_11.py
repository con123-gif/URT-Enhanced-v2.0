#!/usr/bin/env python3
"""Q16: the induced vacuum of the full 96-state charge registry on the v61 links.

Premise (declared, conditional): each of the 96 archived registry states s carries the v61 Wilson operator with link
phases scaled by its charge in units of 1/3, c_s = 3 q_s (Q96 from the native operator archive). Q4 showed the archive
defines no other join of registry and lattice, so this tensor-product premise is a choice, stated as such.
Induced action with no bare gauge term:
    Gamma_Q(theta) = - sum_s log|det H(c_s theta)|,   H = the archived v61 operator (r, M, 1/16 unchanged).

Certified:
  1. Charge content c in {0, +-1, +-2, +-3} with multiplicities from Q96 (Tr Q^2 = 32, sum c^2 = 288).
  2. Charge conjugation: |det H(-theta)| = |det H(theta)| on the stored theta* and on test configurations,
     so Gamma_Q = 36 G(theta) + 36 G(2 theta) + 12 G(3 theta) + const with G = -log|det H|.
  3. theta = 0 is a saddle: the Hessian is 288 Pi(0) (Pi = single-charge kernel), 72 unstable physical modes.
  4. The single-charge vacuum theta* is NOT stationary for Gamma_Q (physical gradient printed).
  5. L-BFGS from theta* and from random starts; the lowest point found is refined by Newton on the 481 physical
     directions, checked to be a strict local minimum, and its elementary loop fluxes are classified.
Census evidence only: no claim that the lowest point found is the global minimum.
"""
from __future__ import annotations

import collections
import json
import sys
from pathlib import Path

import numpy as np
from scipy.optimize import minimize

HERE = Path(__file__).resolve().parent
IND = HERE.parent / "2026-11-10_induced_photon"
sys.path.insert(0, str(IND))
import INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10 as K           # noqa: E402  (archived v61 operator, kernels)
import INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10 as V        # noqa: E402  (gamma, gradient, cycles, fluxes)

MICRO = (HERE.parents[1] / "research_archive/2026-10-17_original_oct08_source/common_action_work/matter"
         / "microscopic_source_currents_operators.npz")


def charges() -> dict:
    if not MICRO.is_file():
        import runpy
        argv = sys.argv
        runpy.run_path(str(HERE.parents[1] / "research_archive/cathedral_arf_runner/run_native_source.py"), run_name="__main__")
        sys.argv = argv
    Q = np.load(MICRO)["Q96"]
    c = np.round(3 * np.linalg.eigvalsh(Q)).astype(int)
    assert np.allclose(3 * np.linalg.eigvalsh(Q), c)
    return dict(sorted(collections.Counter(c.tolist()).items()))


def make(mult: dict):
    pos = {abs(c): 0 for c in mult if c}
    for c, n in mult.items():
        if c:
            pos[abs(c)] += n

    def f(theta):
        val = 0.0; grad = np.zeros_like(theta)
        for c, n in pos.items():
            val += n * V.gamma(c * theta)
            grad += n * c * V.gradient(c * theta)
        return val, grad

    def hess(theta):
        return sum(n * c * c * K.kernels(K.H_of(c * theta), theta=c * theta)[0] for c, n in pos.items())
    return f, hess, pos


def main() -> int:
    n_random = int(sys.argv[1]) if len(sys.argv) > 1 else 3
    out: dict = {}
    mult = charges()
    out["charge_multiplicities_units_of_one_third"] = {str(k): v for k, v in mult.items()}
    out["sum_c2"] = int(sum(n * c * c for c, n in mult.items()))
    assert out["sum_c2"] == 288

    theta_star = np.load(IND / "theta_star_2026_11_10.npy")
    rng = np.random.default_rng(20261111)
    tests = [theta_star] + [rng.uniform(-np.pi, np.pi, K.nlink) for _ in range(3)]
    cc = max(abs(V.gamma(t) - V.gamma(-t)) for t in tests)
    out["charge_conjugation_max_difference"] = float(cc)
    assert cc < 1e-8, "|det H(-theta)| != |det H(theta)|"

    f, hess, pos = make(mult)
    out["effective_weights"] = {str(c): n for c, n in pos.items()}
    pb = V.physical_basis()
    zero = np.zeros(K.nlink)
    w0 = np.linalg.eigvalsh(pb.T @ hess(zero) @ pb)
    out["theta0"] = {"physical_negative_modes": int(np.sum(w0 < -1e-9)), "min": float(w0.min()), "max": float(w0.max())}
    assert out["theta0"]["physical_negative_modes"] == 72

    g_star = np.linalg.norm(pb.T @ f(theta_star)[1])
    out["theta_star_physical_gradient_norm_under_Gamma_Q"] = float(g_star)

    def descend(x0):
        """L-BFGS, then escape any saddle along its most negative physical mode, until the Hessian is PD."""
        x, escapes, saddles = x0, 0, []
        while True:
            r = minimize(f, x, jac=True, method="L-BFGS-B", options={"maxiter": 20000, "gtol": 1e-10, "ftol": 1e-15})
            x = r.x
            w, U = np.linalg.eigh(pb.T @ hess(x) @ pb)
            if w[0] > 1e-9 or escapes >= 12:
                break
            saddles.append((float(r.fun), int(np.sum(w < -1e-9))))
            v = pb @ U[:, 0]
            trial = [x + s * t * v for t in (0.05, 0.2, 0.6) for s in (1, -1)]
            x = min(trial, key=lambda y: f(y)[0])
            escapes += 1
        for _ in range(6):                                  # Newton polish inside a PD basin
            b = pb.T @ f(x)[1]
            if np.linalg.norm(b) < 1e-12:
                break
            step = pb @ np.linalg.solve(pb.T @ hess(x) @ pb, b)
            if f(x - step)[0] > f(x)[0] + 1e-9:
                break
            x = x - step
        return x, escapes, saddles

    starts = [("theta_star", theta_star)] + [(f"random{i}", rng.uniform(-np.pi, np.pi, K.nlink)) for i in range(n_random)]
    runs = []
    for name, x0 in starts:
        xr, nesc, sad = descend(x0)
        runs.append((float(f(xr)[0]), name, xr, nesc, sad))
    runs.sort(key=lambda t: t[0])
    out["census"] = [{"start": nm, "Gamma_Q": round(v, 8), "saddle_escapes": ne,
                      "saddles_passed": [{"Gamma_Q": round(a, 6), "unstable_modes": b} for a, b in sd]}
                     for v, nm, _, ne, sd in runs]

    best_val, best_name, x = runs[0][:3]
    hb = np.linalg.eigvalsh(pb.T @ hess(x) @ pb)
    G0 = f(zero)[0]
    out["best"] = {"start": best_name, "Gamma_Q": float(f(x)[0]), "Gamma_Q_minus_flat": float(f(x)[0] - G0),
                   "physical_gradient_norm": float(np.linalg.norm(pb.T @ f(x)[1])),
                   "hessian_min": float(hb.min()), "hessian_max": float(hb.max()),
                   "physical_negative_modes": int(np.sum(hb < -1e-9)),
                   "single_charge_Gamma_at_best_minus_at_theta_star": float(V.gamma(x) - V.gamma(theta_star))}
    for L in (3, 4):
        fl = np.abs(V.fluxes(V.cycles(L), x)) / np.pi
        cnt = collections.Counter(np.round(fl, 6))
        out[f"flux_classes_over_pi_L{L}"] = {f"{k:.6f}": v for k, v in sorted(cnt.items())}
    np.save(HERE / "theta_registry_best_2026_11_11.npy", x)

    print(json.dumps(out, indent=2))
    (HERE / "REGISTRY_INDUCED_VACUUM_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    assert out["theta_star_physical_gradient_norm_under_Gamma_Q"] > 1e-6, "theta* unexpectedly stationary"
    assert out["best"]["physical_gradient_norm"] < 1e-8 and out["best"]["physical_negative_modes"] == 0
    print(f"PASS: registry action Gamma_Q = 36G(t)+36G(2t)+12G(3t); flat links unstable (72 modes); theta* not stationary; "
          f"best local minimum found {out['best']['Gamma_Q_minus_flat']:.6f} below flat, strict on the physical modes.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
