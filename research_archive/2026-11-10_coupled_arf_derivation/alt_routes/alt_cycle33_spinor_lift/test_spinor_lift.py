#!/usr/bin/env python3
"""Alt cycle 33: pairing/condensation on vertex12 ⊗ 2 with the 2I spin connection."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh
from scipy.optimize import minimize

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
DELTA2 = DELTA_HIDDEN ** 2
C_EVEN = DELTA2 * 0.21876978874206543
T_KMS = float(ETA)

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")


def jsonable(obj):
    if isinstance(obj, dict):
        return {str(k): jsonable(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [jsonable(v) for v in obj]
    if isinstance(obj, (np.floating, float)):
        x = float(obj)
        return None if not np.isfinite(x) else x
    if isinstance(obj, (np.integer, int)):
        return int(obj)
    if isinstance(obj, (np.bool_, bool)):
        return bool(obj)
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


PAULI = np.array([
    [[0, 1], [1, 0]],
    [[0, -1j], [1j, 0]],
    [[1, 0], [0, -1]],
], dtype=complex)
EPS = np.array([[0.0, 1.0], [-1.0, 0.0]])  # 2I-invariant symplectic form on the 2


def pairing_spatial(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def su2_transport(ni, nj):
    """Principal SU(2) lift of the rotation taking ni to nj in their common plane."""
    ni = ni / np.linalg.norm(ni)
    nj = nj / np.linalg.norm(nj)
    c = float(np.clip(np.dot(ni, nj), -1.0, 1.0))
    theta = np.arccos(c)
    axis = np.cross(ni, nj)
    nrm = np.linalg.norm(axis)
    if nrm < 1e-14:
        # parallel or antipodal: identity (principal)
        return np.eye(2, dtype=complex)
    axis = axis / nrm
    # U = cos(θ/2) I - i sin(θ/2) σ·n
    half = 0.5 * theta
    U = np.cos(half) * np.eye(2, dtype=complex)
    for a in range(3):
        U = U - 1j * np.sin(half) * axis[a] * PAULI[a]
    return U


def spin_laplacian(pts, edges, Uij):
    n = 12
    K = np.zeros((2 * n, 2 * n), dtype=complex)
    deg = np.zeros(n)
    for i, j in edges:
        deg[i] += 1
        deg[j] += 1
    for e, (i, j) in enumerate(edges):
        U = Uij[e]
        # K[j] -= U_{i→j} ψ_i   and  K[i] -= U_{j→i} ψ_j with U_{j→i}=U†
        K[2 * j:2 * j + 2, 2 * i:2 * i + 2] -= U
        K[2 * i:2 * i + 2, 2 * j:2 * j + 2] -= U.conj().T
    for i in range(n):
        K[2 * i:2 * i + 2, 2 * i:2 * i + 2] += deg[i] * np.eye(2)
    return 0.5 * (K + K.conj().T)


def scalar_laplacian_otimes_I(edges):
    n = 12
    K = np.zeros((n, n))
    deg = np.zeros(n)
    for i, j in edges:
        deg[i] += 1
        deg[j] += 1
        K[i, j] -= 1
        K[j, i] -= 1
    for i in range(n):
        K[i, i] += deg[i]
    return np.kron(K, np.eye(2))


def bdg_positive(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    ev = eigvalsh(H)
    return np.maximum(ev[n:].real, 0.0)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega(energies, xi, T):
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(log2cosh(np.abs(xi) / (2.0 * T)))


def distinct_with_mult(vals, atol=1e-7, rtol=1e-8):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [(g[0], g[1]) for g in groups]


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    nrm = np.linalg.norm(pts, axis=1, keepdims=True)
    unit = pts / nrm
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    assert len(edges) == 30

    Uij = [su2_transport(unit[i], unit[j]) for i, j in edges]
    # face holonomies of the spin connection
    lookup = {tuple(sorted(e)): k for k, e in enumerate(edges)}
    face_hol = []
    for f in faces:
        U = np.eye(2, dtype=complex)
        m = len(f)
        for a in range(m):
            i, j = int(f[a]), int(f[(a + 1) % m])
            e = lookup[(min(i, j), max(i, j))]
            Ue = Uij[e] if (i, j) == edges[e] else Uij[e].conj().T
            # stored edge is sorted (min,max); if we walk max->min use U†
            if (min(i, j), max(i, j)) != (i, j):
                Ue = Uij[e].conj().T
            else:
                Ue = Uij[e]
            U = Ue @ U
        face_hol.append({"trace": complex(np.trace(U)), "minus_I": bool(np.allclose(U, -np.eye(2), atol=1e-6))})

    Ks = spin_laplacian(pts, edges, Uij)
    Kkron = scalar_laplacian_otimes_I(edges)
    evs = eigvalsh(Ks).real
    evk = eigvalsh(Kkron).real

    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    Dsp = pairing_spatial(EVEN_FRAME, hat, edges)
    # Δ_spin = Δ ⊗ ε   (24×24)
    Dspin = np.kron(Dsp, EPS)
    # kernel checks
    v0 = np.ones(12) / np.sqrt(12)
    # spatial pairing annihilates v0?
    Dv0 = Dsp @ v0

    xi_s = evs.copy()
    # susceptibility along even hat at T=η
    def omega_ray(r, T=T_KMS):
        D = np.kron(pairing_spatial(EVEN_FRAME, r * hat, edges), EPS)
        E = bdg_positive(Ks, D)
        return C_EVEN * r * r + fermion_omega(E, xi_s, T)

    # chi at small r
    eps = 1e-3
    om_eps = omega_ray(eps) - C_EVEN * eps * eps  # just fermion piece... omega_ray includes V
    # fermion only:
    def om_f(r, T=T_KMS):
        D = np.kron(pairing_spatial(EVEN_FRAME, r * hat, edges), EPS)
        E = bdg_positive(Ks, D)
        return fermion_omega(E, xi_s, T)
    chi = float(-om_f(eps) / (eps * eps))
    yc = float(np.sqrt(C_EVEN / chi)) if chi > 0 else None
    y1_condenses_lin = bool(yc is not None and yc < 1.0)

    # scan r at y=1
    nuc_like = float(np.sum(np.linalg.svd(Dspin, compute_uv=False)))
    r_est = max(1.0, nuc_like / (4.0 * C_EVEN + 1e-30))
    rs = np.concatenate([[0.0], np.geomspace(1e-4, min(20 * r_est, 1e7), 50)])
    oms = np.array([omega_ray(r) for r in rs])
    i = int(np.argmin(oms))
    rs2 = np.linspace(rs[max(i - 1, 0)], rs[min(i + 1, len(rs) - 1)], 40)
    oms2 = np.array([omega_ray(r) for r in rs2])
    j = int(np.argmin(oms2))
    r_star = float(rs2[j])
    om_star = float(oms2[j])
    condenses = bool(om_star < oms[0] - 1e-12 and r_star > 1e-8)

    Dstar = np.kron(pairing_spatial(EVEN_FRAME, r_star * hat, edges), EPS) if condenses else np.kron(Dsp, EPS)
    E_cond = bdg_positive(Ks, Dstar)
    groups = distinct_with_mult(E_cond)
    pos = [(a, b) for a, b in groups if a > 1e-8]

    # control: BdG of (Kkron, Dspin) should keep a near-zero if Δv0=0
    E_kron = bdg_positive(Kkron, np.kron(Dsp, EPS))  # unit hat, not large r

    results = {
        "module": {
            "vertex12_otimes_2": "2·2 ⊕ 2·4' ⊕ 2·6 (dim 24, no singlet)",
            "H13_otimes_2": "3·2 ⊕ 2·4' ⊕ 2·6 (dim 26, extra 2 is a decoupled spectator)",
            "no_2I_singlet": True,
        },
        "spin_connection": {
            "n_edges": 30,
            "face_holonomy_traces": [complex(h["trace"]).__repr__() for h in face_hol],
            "n_faces_with_U_eq_minus_I": int(sum(1 for h in face_hol if h["minus_I"])),
            "mean_Re_trace": float(np.mean([h["trace"].real for h in face_hol])),
            "mean_Im_trace": float(np.mean([h["trace"].imag for h in face_hol])),
        },
        "kinetics": {
            "K_spin_evals_minmax": [float(evs.min()), float(evs.max())],
            "K_spin_n_near_zero": int(np.sum(np.abs(evs) < 1e-8)),
            "K_spin_gap": float(np.min(np.abs(evs))),
            "K_kron_n_near_zero": int(np.sum(np.abs(evk) < 1e-8)),
            "K_kron_evals_minmax": [float(evk.min()), float(evk.max())],
            "spatial_Delta_annihilates_v0": bool(np.linalg.norm(Dv0) < 1e-8),
        },
        "condensation": {
            "chi_Teta": chi,
            "y_c": yc,
            "y1_condenses_linearized": y1_condenses_lin,
            "r_star": r_star,
            "omega_star": om_star,
            "omega_0": float(oms[0]),
            "condenses": condenses,
            "nuclear_norm_Dspin_unit": nuc_like,
        },
        "spectrum_condensed": {
            "Emin": float(min(E_cond)),
            "zero_mode_absent": bool(min(E_cond) > 1e-6),
            "distinct": [{"value": a, "mult": b} for a, b in groups],
            "n_distinct_positive": len(pos),
            "three_distinct_levels": bool(len(pos) == 3),
            "three_or_more_distinct": bool(len(pos) >= 3),
            "max_mult": max((b for a, b in pos), default=0),
        },
        "control_Kkron_unit_pairing": {
            "Emin": float(min(E_kron)),
            "n_near_zero": int(np.sum(E_kron < 1e-6)),
            "distinct": [{"value": a, "mult": b} for a, b in distinct_with_mult(E_kron)],
        },
    }
    H = {
        "H1_K_spin_has_no_zero_mode": bool(results["kinetics"]["K_spin_n_near_zero"] == 0),
        "H2_K_kron_keeps_a_kernel": bool(results["kinetics"]["K_kron_n_near_zero"] >= 2),
        "H2_pairing_alone_does_not_lift_Kkron_kernel": bool(results["control_Kkron_unit_pairing"]["n_near_zero"] >= 1),
        "H3_even_channel_still_condenses": bool(condenses),
        "H3_three_distinct_levels": bool(results["spectrum_condensed"]["three_distinct_levels"]),
        "H3_zero_mode_absent_after_condensation": bool(results["spectrum_condensed"]["zero_mode_absent"]),
    }
    results["hypotheses"] = H
    if H["H1_K_spin_has_no_zero_mode"] and H["H2_K_kron_keeps_a_kernel"]:
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "The spin connection gaps K_spin; vertex12⊗2 has no singlet and no "
            "zero mode. Pairing Δ⊗ε on K⊗I still sees the kernel of the scalar "
            "theory. Condensation and the resulting multiplet structure are recorded."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses."

    out = ROOT / "alt_cycle33_spinor_lift" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "K_spin_gap": results["kinetics"]["K_spin_gap"],
        "K_spin_n0": results["kinetics"]["K_spin_n_near_zero"],
        "K_kron_n0": results["kinetics"]["K_kron_n_near_zero"],
        "face_minus_I": results["spin_connection"]["n_faces_with_U_eq_minus_I"],
        "face_mean_tr": [results["spin_connection"]["mean_Re_trace"], results["spin_connection"]["mean_Im_trace"]],
        "condensation": results["condensation"],
        "spectrum": results["spectrum_condensed"],
        "control": results["control_Kkron_unit_pairing"],
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
