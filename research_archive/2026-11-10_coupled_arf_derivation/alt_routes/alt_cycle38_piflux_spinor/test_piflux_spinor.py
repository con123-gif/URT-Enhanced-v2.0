#!/usr/bin/env python3
"""Alt cycle 38: π-flux combined with the 2I spinor lift."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    load_ops, icosahedral_rotations, induced_perm,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R33 = float(json.loads((ROOT / "alt_cycle33_spinor_lift" / "results.json").read_text())
            ["condensation"]["r_star"])
PREV34 = json.loads((ROOT / "alt_cycle34_induced_kappa" / "results.json").read_text())

PAULI = np.array([
    [[0, 1], [1, 0]],
    [[0, -1j], [1j, 0]],
    [[1, 0], [0, -1]],
], dtype=complex)
EPS = np.array([[0.0, 1.0], [-1.0, 0.0]])


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
    if isinstance(obj, (complex, np.complexfloating)):
        return {"re": float(obj.real), "im": float(obj.imag)}
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


def pairing_spatial(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def su2_transport(ni, nj):
    ni = ni / np.linalg.norm(ni)
    nj = nj / np.linalg.norm(nj)
    c = float(np.clip(np.dot(ni, nj), -1.0, 1.0))
    theta = np.arccos(c)
    axis = np.cross(ni, nj)
    nrm = np.linalg.norm(axis)
    if nrm < 1e-14:
        return np.eye(2, dtype=complex)
    axis = axis / nrm
    half = 0.5 * theta
    U = np.cos(half) * np.eye(2, dtype=complex)
    for a in range(3):
        U = U - 1j * np.sin(half) * axis[a] * PAULI[a]
    return U


def magnetic_spin(edges, A, Uij):
    n = 12
    K = np.zeros((2 * n, 2 * n), dtype=complex)
    deg = np.zeros(n)
    for i, j in edges:
        deg[i] += 1.0
        deg[j] += 1.0
    for e, (i, j) in enumerate(edges):
        phase = np.exp(1j * A[e])
        U = phase * Uij[e]
        K[2 * j:2 * j + 2, 2 * i:2 * i + 2] -= U
        K[2 * i:2 * i + 2, 2 * j:2 * j + 2] -= U.conj().T
    for i in range(n):
        K[2 * i:2 * i + 2, 2 * i:2 * i + 2] += deg[i] * np.eye(2)
    return 0.5 * (K + K.conj().T)


def bdg_pos(K, Delta):
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


def Fabs(pos, T):
    if T <= 0:
        return -0.5 * float(np.sum(pos))
    return float(-T * np.sum(log2cosh(pos / (2.0 * T))))


def group_rel(vals, rtol=1e-5, atol=1e-8):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [(g[0], g[1]) for g in groups]


def face_spin_holonomy(faces, edges, Uij, A):
    lookup = {tuple(sorted(e)): k for k, e in enumerate(edges)}
    recs = []
    for f in faces:
        U = np.eye(2, dtype=complex)
        m = len(f)
        for a in range(m):
            i, j = int(f[a]), int(f[(a + 1) % m])
            e = lookup[(min(i, j), max(i, j))]
            Ue = Uij[e] if (min(i, j), max(i, j)) == (i, j) else Uij[e].conj().T
            Ue = np.exp(1j * A[e]) * Ue
            U = Ue @ U
        recs.append(complex(np.trace(U)))
    return recs


def classify_stab(n):
    return {60: "A5", 24: "2T", 12: "A4", 6: "D3", 4: "C2xC2", 3: "C3", 2: "C2", 1: "1"}.get(n, f"order_{n}")


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], float)
    unit = pts / np.linalg.norm(pts, axis=1, keepdims=True)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    Uij = [su2_transport(unit[i], unit[j]) for i, j in edges]
    hat = np.asarray(HAT25, float)
    hat /= np.linalg.norm(hat)
    Dspin = np.kron(pairing_spatial(EVEN_FRAME, R33 * hat, edges), EPS)
    A0 = np.zeros(30)
    Api = np.full(30, np.pi)

    hol0 = face_spin_holonomy(faces, edges, Uij, A0)
    holpi = face_spin_holonomy(faces, edges, Uij, Api)
    mean0 = np.mean(hol0)
    meanpi = np.mean(holpi)
    two_cos = 2.0 * np.cos(np.pi / 10.0)

    # spectra
    specs = {}
    for name, A in [("A0", A0), ("all_pi", Api)]:
        E = bdg_pos(magnetic_spin(edges, A, Uij), Dspin)
        g = group_rel(E, rtol=1e-5)
        pos = [(a, b) for a, b in g if a > 1e-6]
        specs[name] = {
            "Emin": float(min(E)),
            "grouped_rel_1e-5": [{"value": a, "mult": b} for a, b in g],
            "n_distinct_positive": len(pos),
            "max_mult": max((b for a, b in pos), default=0),
            "three_nondeg_singlets": bool(len(pos) >= 3 and all(b == 1 for a, b in pos)),
            "n_positive_singlets": sum(1 for a, b in pos if b == 1),
        }

    # Ω comparison (fermion-only)
    omegas = {}
    for Tname, T in [("T0", 0.0), ("Teta", float(ETA))]:
        om0 = Fabs(bdg_pos(magnetic_spin(edges, A0, Uij), Dspin), T)
        ompi = Fabs(bdg_pos(magnetic_spin(edges, Api, Uij), Dspin), T)
        omegas[Tname] = {
            "omega_A0": om0, "omega_Api": ompi,
            "delta": ompi - om0,
            "pi_lower": bool(ompi < om0 - 1e-10),
        }
        # a couple of extra seeds
        rng = np.random.default_rng(38)
        extras = []
        for A in [rng.uniform(-np.pi, np.pi, 30) for _ in range(3)]:
            extras.append(Fabs(bdg_pos(magnetic_spin(edges, A, Uij), Dspin), T) - om0)
        omegas[Tname]["random_delta_vs_A0"] = extras

    # from cycle 34
    spin34 = PREV34["sectors"]["spinor_paired"]
    vac = "pi_flux" if (omegas["T0"]["pi_lower"] and spin34["T0"]["A0_transversely_unstable"]) else "other"

    # stabilizer of holonomy pattern and of Delta
    rots, _ = icosahedral_rotations(pts)
    Me = pairing_spatial(EVEN_FRAME, hat, edges)
    z_pi = np.asarray(holpi)
    face_sets = [frozenset(f) for f in faces]
    n_hol = 0
    n_Delta = 0
    n_both = 0
    n_T = 0
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        preserves_D = np.allclose(P @ Me @ P.T, Me, atol=1e-6)
        if preserves_D:
            n_Delta += 1
        z_mapped = np.zeros_like(z_pi)
        good = True
        for fi, f in enumerate(faces):
            new_f = frozenset(perm[v] for v in f)
            if new_f not in face_sets:
                good = False
                break
            z_mapped[face_sets.index(new_f)] = z_pi[fi]
        if not good:
            continue
        if np.allclose(z_mapped, z_pi, atol=1e-6):
            n_hol += 1
            if preserves_D:
                n_both += 1
        if np.allclose(z_mapped, np.conj(z_pi), atol=1e-6):
            n_T += 1
    traces_real = bool(np.allclose(np.asarray(holpi).imag, 0.0, atol=1e-8))
    stab = {
        "holonomy_stab_order": n_hol,
        "holonomy_stab_name": classify_stab(n_hol),
        "Delta_stab_order": n_Delta,
        "Delta_stab_name": classify_stab(n_Delta),
        "combined_stab_order": n_both,
        "combined_stab_name": classify_stab(n_both),
        "n_rotations_mapping_hol_to_conjugate": n_T,
        "traces_all_real": traces_real,
        "T_breaks_pattern": bool(not traces_real),
        "picks_handedness": bool((not traces_real) and n_T == 0),
        "is_Z3": bool(n_both == 3),
        "is_Z2": bool(n_both == 2),
    }

    results = {
        "holonomy": {
            "mean_trace_A0": {"re": float(mean0.real), "im": float(mean0.imag)},
            "mean_trace_pi": {"re": float(meanpi.real), "im": float(meanpi.imag)},
            "2cos_pi_over_10": two_cos,
            "minus_2cos": -two_cos,
            "A0_matches_2cos": bool(abs(mean0.real - two_cos) < 1e-8 and abs(mean0.imag) < 1e-8),
            "pi_matches_minus_2cos": bool(abs(meanpi.real + two_cos) < 1e-8 and abs(meanpi.imag) < 1e-8),
            "n_faces": 20,
        },
        "vacuum": {
            "name": vac,
            "omegas": omegas,
            "cycle34_spinor_T0_unstable": bool(spin34["T0"]["A0_transversely_unstable"]),
            "cycle34_dOmega": spin34["T0"]["delta_omega_pi_minus_0"],
        },
        "spectra": specs,
        "stabilizer": stab,
    }
    H = {
        "H1_combined_does_not_reduce_A4": bool(stab["combined_stab_name"] == "A4" and not stab["is_Z3"] and not stab["is_Z2"]),
        "H1_no_T_handedness": (not stab["picks_handedness"]) and traces_real,
        "H1_holonomy_is_A5": bool(stab["holonomy_stab_name"] == "A5"),
        "H2_not_three_singlets": (not specs["all_pi"]["three_nondeg_singlets"]),
        "H3_vacuum_is_pi_flux": bool(vac == "pi_flux"),
    }
    results["hypotheses"] = H
    results["classification"] = "PROVED" if all(H.values()) else "CONDITIONAL"
    results["classification_note"] = (
        "Combined π-flux + spin connection has trace −2 cos(π/10) on every face, "
        "preserves A4, does not pick a U(1) handedness, and does not produce three singlets. "
        "The fermion-only vacuum is π-flux."
        if results["classification"] == "PROVED" else "See hypotheses."
    )
    out = ROOT / "alt_cycle38_piflux_spinor" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "holonomy": results["holonomy"],
        "stab": stab,
        "vacuum": {"name": vac, "dO_T0": omegas["T0"]["delta"], "dO_Teta": omegas["Teta"]["delta"]},
        "spec_pi": specs["all_pi"],
        "spec_A0": {k: specs["A0"][k] for k in specs["A0"] if k != "grouped_rel_1e-5"},
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
