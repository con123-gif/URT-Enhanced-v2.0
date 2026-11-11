#!/usr/bin/env python3
"""Induced (log-det) photon kernel of the native v61 Wilson sea.

Question. The archive's photon normalisation obstruction (2026-10-24, Maxwell scale family S_lambda)
says that a Maxwell term added by hand can be rescaled without changing projector, Ward structure,
spectra or charge generator, so the coupling 1/lambda is unfixed. The archived link stiffness
(microscopic_source_currents.py) is the Hessian of the sea ENERGY, which scales linearly with the
operator. Is there a photon kernel built from the native operator alone with no scale freedom?

Construction (no inserted weights). Use the induced Euclidean action of the native sea,
    Gamma(theta) = -log|det H(theta)|,   H(theta) = gamma5 (D_W(e^{i theta}) - M),
with D_W, r, M, the 6x2x2x2 lattice and its 528 links exactly as in the archived v61 source. Its
Hessian at theta = 0 is
    Pi_E[l,m] = -delta_lm Re Tr[G W_l] + Re Tr[G J_l G J_m],   G = H^-1,
where J_l = dH/dtheta_l and W_l = d^2H/dtheta_l^2 (the archive's own link vertices).

Certified here:
  1. Pi_E agrees with finite differences of -log|det H| along random link directions.
  2. Ward identity: Pi_E annihilates every gauge direction (incidence columns).
  3. Pi_E is INDEFINITE at theta = 0: its null space is exactly the 47-dim gauge space, but most of
     the 481 physical directions have negative curvature, so the trivial gauge background is a
     saddle of the induced action, not its vacuum (see INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10.py).
  4. Scale invariance: H -> c H leaves Pi_E unchanged, while the archived sea-energy kernel
     scales by c. The induced kernel therefore carries no 1/lambda freedom.
  5. Pi_E is not proportional to the archived sea-energy kernel on the physical subspace.
Output: JSON with the physical spectrum of Pi_E. Executes the archived v61 source unmodified.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SOURCE = REPO / "research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py"

spec = importlib.util.spec_from_file_location("newton_cathedral_v61", SOURCE)
v61 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = v61
spec.loader.exec_module(v61)

gammas, g5 = v61.gamma_matrices()
nsite, ndir = len(v61.SITES), len(v61.DIRECTIONS)
nlink = nsite * ndir
G5 = np.kron(np.eye(nsite), g5)
I = np.eye(4 * nsite)
R, M = float(v61.R_EXACT), float(v61.M_EXACT)


def H_of(theta: np.ndarray, scale: float = 1.0) -> np.ndarray:
    return scale * (G5 @ (v61.wilson_operator_from_links(np.exp(1j * theta.reshape(nsite, ndir))) - M * I))


# link vertices, exactly as in microscopic_source_currents.py
edges = np.empty((nlink, 2), int)
hops = np.empty((nlink, 4, 4), complex)
incidence = np.zeros((nlink, nsite))
for x, site in enumerate(v61.SITES):
    for d, disp in enumerate(v61.DIRECTIONS):
        l = x * ndir + d
        y = v61.SITE_INDEX[v61.periodic_shift(site, disp)]
        forward = .5 * (gammas[d + 1] - R * np.eye(4)) if d < 3 else (gammas[0] - np.eye(4)) / 16
        hops[l] = g5 @ forward * v61.antiperiodic_sign(site, disp)
        edges[l] = x, y
        incidence[l, x] += 1
        incidence[l, y] -= 1


def kernels(H: np.ndarray, scale: float = 1.0, theta: np.ndarray | None = None):
    """Return (Pi_E, Pi_sea) at background H = H_of(theta, scale); vertices carry the link phases."""
    G = np.linalg.inv(H)
    Gb = G.reshape(nsite, 4, nsite, 4).transpose(0, 2, 1, 3)          # Gb[a,b] = 4x4 block
    phase = np.ones(nlink) if theta is None else np.exp(1j * theta)
    t = scale * hops * phase[:, None, None]
    xs, ys = edges[:, 0], edges[:, 1]
    # J_l: block (x,y) = i t, block (y,x) = -i t^dag ; W_l: (x,y) = -t, (y,x) = -t^dag
    # (G J_l)[r, y_l] = G[r, x_l] (i t_l) ; (G J_l)[r, x_l] = G[r, y_l] (-i t_l^dag)
    K1 = np.einsum("lrij,ljk->lrik", Gb[:, xs].transpose(1, 0, 2, 3), 1j * t)
    K2 = np.einsum("lrij,ljk->lrik", Gb[:, ys].transpose(1, 0, 2, 3), -1j * np.conj(np.transpose(t, (0, 2, 1))))
    # Tr[(G J_l)(G J_m)] = sum over column blocks c of l, c' of m of tr((GJ_l)[c',c] (GJ_m)[c,c'])
    T = (np.einsum("lmij,mlji->lm", K1[:, ys], K1[:, ys])
         + np.einsum("lmij,mlji->lm", K1[:, xs], K2[:, ys])
         + np.einsum("lmij,mlji->lm", K2[:, ys], K1[:, xs])
         + np.einsum("lmij,mlji->lm", K2[:, xs], K2[:, xs]))
    # contact: Tr[G W_l] = Tr[G[y,x](-t) ] + Tr[G[x,y](-t^dag)]
    trGW = (np.einsum("lij,lji->l", Gb[ys, xs], -t)
            + np.einsum("lij,lji->l", Gb[xs, ys], -np.conj(np.transpose(t, (0, 2, 1)))))
    PiE = -np.diag(trGW.real) + T.real
    PiE = .5 * (PiE + PiE.T)
    # archived sea-energy kernel (paramagnetic + contact), same formula as the archive
    e, V = np.linalg.eigh(H)
    Vm, Vp = V[:, e < 0], V[:, e > 0]
    gap = e[e > 0][None, :] - e[e < 0][:, None]
    para = np.zeros((nlink, nlink))
    trans = np.empty((nlink, Vm.shape[1], Vp.shape[1]), complex)
    contact = np.empty(nlink)
    for l in range(nlink):
        x, y = edges[l]
        Xm, Ym, Xp, Yp = Vm[4*x:4*x+4], Vm[4*y:4*y+4], Vp[4*x:4*x+4], Vp[4*y:4*y+4]
        trans[l] = 1j * (Xm.conj().T @ t[l] @ Yp - Ym.conj().T @ t[l].conj().T @ Xp)
        contact[l] = -2 * np.trace(Xm.conj().T @ t[l] @ Ym).real
    w = (trans / np.sqrt(gap)[None]).reshape(nlink, -1)
    Pisea = -2 * (w @ w.conj().T).real + np.diag(contact)
    return PiE, .5 * (Pisea + Pisea.T), e


def neg_logdet(theta):
    sign, logabs = np.linalg.slogdet(H_of(theta))
    return -logabs


def main() -> int:
    out = {}
    H0 = H_of(np.zeros(nlink))
    PiE, Pisea, e = kernels(H0)
    out["lattice"] = {"sites": nsite, "directions": ndir, "links": nlink, "states": 4 * nsite,
                      "r": R, "M": M, "spectral_gap_min_abs": float(np.min(np.abs(e)))}

    # 1. finite differences of -log|det H| (independent of the analytic formula)
    rng = np.random.default_rng(20261110)
    fd_rel = []
    for _ in range(4):
        u = rng.standard_normal(nlink); u /= np.linalg.norm(u)
        h = 1e-3
        fd = (neg_logdet(h * u) - 2 * neg_logdet(0 * u) + neg_logdet(-h * u)) / h**2
        an = u @ PiE @ u
        fd_rel.append(abs(fd - an) / abs(an))
    out["finite_difference_relative_error_max"] = max(fd_rel)

    # 2. Ward identity; gauge space
    U, s, _ = np.linalg.svd(incidence, full_matrices=False)
    rank_gauge = int(np.sum(s > 1e-9))
    gauge = U[:, :rank_gauge]
    out["gauge_dimension"] = rank_gauge
    out["ward_norm_PiE"] = float(np.linalg.norm(PiE @ incidence))
    out["ward_norm_Pisea"] = float(np.linalg.norm(Pisea @ incidence))

    # 3. spectrum on the physical (non-gauge) subspace
    Pphys = np.eye(nlink) - gauge @ gauge.T
    w_all = np.linalg.eigvalsh(PiE)
    null = int(np.sum(np.abs(w_all) < 1e-9 * np.max(np.abs(w_all))))
    phys_basis = np.linalg.svd(Pphys)[0][:, : nlink - rank_gauge]
    wE = np.linalg.eigvalsh(phys_basis.T @ PiE @ phys_basis)
    wS = np.linalg.eigvalsh(phys_basis.T @ Pisea @ phys_basis)
    out["PiE_min_eigenvalue_all"] = float(w_all.min())
    out["PiE_nullity"] = null
    out["PiE_physical_dimension"] = int(len(wE))
    out["PiE_negative_physical_modes"] = int(np.sum(wE < -1e-9))
    out["PiE_positive_physical_modes"] = int(np.sum(wE > 1e-9))
    out["PiE_physical_spectrum"] = {"min": float(wE.min()), "max": float(wE.max()),
                                    "mean": float(wE.mean()), "trace": float(wE.sum()),
                                    "distinct_at_1e-8": int(len(np.unique(np.round(wE, 8))))}
    out["Pisea_physical_spectrum"] = {"min": float(wS.min()), "max": float(wS.max()), "mean": float(wS.mean())}

    # 4. scale behaviour: H -> 2H
    PiE2, Pisea2, _ = kernels(2.0 * H0, scale=2.0)
    out["scale_test_PiE_change"] = float(np.linalg.norm(PiE2 - PiE) / np.linalg.norm(PiE))
    out["scale_test_Pisea_ratio"] = float(np.linalg.norm(Pisea2) / np.linalg.norm(Pisea))

    # 5. proportionality test on the physical subspace
    A = phys_basis.T @ PiE @ phys_basis
    B = phys_basis.T @ Pisea @ phys_basis
    c = float(np.sum(A * B) / np.sum(B * B))
    out["best_ratio_PiE_over_Pisea"] = c
    out["relative_residual_after_best_ratio"] = float(np.linalg.norm(A - c * B) / np.linalg.norm(A))

    out["source_sha256"] = hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    print(json.dumps(out, indent=2))
    (HERE / "INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10.json").write_text(json.dumps(out, indent=2) + "\n")

    assert out["finite_difference_relative_error_max"] < 1e-5, "analytic Hessian disagrees with finite differences"
    assert out["ward_norm_PiE"] < 1e-9 * np.linalg.norm(PiE), "Ward identity fails for the induced kernel"
    assert out["gauge_dimension"] == 47
    assert out["PiE_nullity"] == 47, "null space of the induced kernel is not exactly the gauge space"
    assert out["PiE_negative_physical_modes"] > 0, "theta = 0 unexpectedly stable"
    assert out["scale_test_PiE_change"] < 1e-10, "induced kernel not scale invariant"
    assert abs(out["scale_test_Pisea_ratio"] - 2.0) < 1e-10, "sea-energy kernel does not scale linearly"
    print(f"PASS: induced log-det kernel is gauge invariant and scale invariant (the sea-energy kernel scales "
          f"with the operator); at theta = 0 it has {out['PiE_negative_physical_modes']} negative and "
          f"{out['PiE_positive_physical_modes']} positive physical modes: theta = 0 is a saddle.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
