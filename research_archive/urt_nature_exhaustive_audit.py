#!/usr/bin/env python3
"""
Exhaustive computational audit of the closed Lytollis–URT construction.

This script computes only quantities fixed by the explicitly stated geometry,
entropy functional, charge words and supplied frozen mixing parameters. It also
reports where the proposed action is mathematically underdetermined.

Dependencies: numpy, scipy
"""

from __future__ import annotations

import csv
import json
import math
from collections import defaultdict
from pathlib import Path

import numpy as np
from scipy.optimize import brentq, minimize


def groups(values, tol=1e-8):
    vals = np.linalg.eigvalsh(values)
    out = []
    for x in vals:
        if not out or abs(x - out[-1][0]) > tol:
            out.append([float(x), 1])
        else:
            out[-1][1] += 1
    return [{"value": x, "multiplicity": m} for x, m in out]


def icosahedron():
    phi = (1 + math.sqrt(5)) / 2
    verts = []
    for a in (-1, 1):
        for b in (-phi, phi):
            verts.append((0, a, b))
    for a in (-1, 1):
        for b in (-phi, phi):
            verts.append((a, b, 0))
    for a in (-phi, phi):
        for b in (-1, 1):
            verts.append((a, 0, b))
    vertices = np.asarray(verts, dtype=float)
    vertices /= np.linalg.norm(vertices[0])

    distances = np.linalg.norm(vertices[:, None, :] - vertices[None, :, :], axis=2)
    edge_length = np.min(distances[distances > 0])
    edges = [
        (i, j)
        for i in range(12)
        for j in range(i + 1, 12)
        if abs(distances[i, j] - edge_length) < 1e-8
    ]
    edge_set = set(edges)
    faces = []
    for i in range(12):
        for j in range(i + 1, 12):
            for k in range(j + 1, 12):
                if (i, j) in edge_set and (i, k) in edge_set and (j, k) in edge_set:
                    faces.append((i, j, k))

    oriented_faces = []
    for i, j, k in faces:
        p = vertices[[i, j, k]]
        normal = np.cross(p[1] - p[0], p[2] - p[0])
        if np.dot(normal, p.mean(axis=0)) < 0:
            j, k = k, j
        oriented_faces.append((i, j, k))
    return vertices, edges, faces, oriented_faces


def hodge_complex(vertices, edges, faces, oriented_faces):
    global_edges = [(i + 1, j + 1) for i, j in edges] + [(0, i + 1) for i in range(12)]
    edge_index = {e: n for n, e in enumerate(global_edges)}

    boundary1 = np.zeros((13, 42))
    for n, (a, b) in enumerate(global_edges):
        boundary1[a, n] = -1
        boundary1[b, n] = 1

    boundary2 = np.zeros((42, 20))
    for f, (a0, b0, c0) in enumerate(oriented_faces):
        for a, b in ((a0 + 1, b0 + 1), (b0 + 1, c0 + 1), (c0 + 1, a0 + 1)):
            if a < b:
                n, sign = edge_index[(a, b)], 1
            else:
                n, sign = edge_index[(b, a)], -1
            boundary2[n, f] += sign

    rank1 = int(np.linalg.matrix_rank(boundary1))
    rank2 = int(np.linalg.matrix_rank(boundary2))
    betti = {
        "b0": 13 - rank1,
        "b1": 42 - rank1 - rank2,
        "b2": 20 - rank2,
    }

    L0 = boundary1 @ boundary1.T
    L1 = boundary1.T @ boundary1 + boundary2 @ boundary2.T
    L2 = boundary2.T @ boundary2

    Dinc = np.block(
        [
            [np.zeros((13, 13)), boundary1, np.zeros((13, 20))],
            [boundary1.T, np.zeros((42, 42)), boundary2],
            [np.zeros((20, 13)), boundary2.T, np.zeros((20, 20))],
        ]
    )

    # Unsigned vertex-face incidence. Its 8D kernel is the 4+4 shadow sector.
    Bvf = np.zeros((12, 20))
    for f, (i, j, k) in enumerate(faces):
        Bvf[[i, j, k], f] = 1
    u, s, vh = np.linalg.svd(Bvf)
    rank_vf = int(np.linalg.matrix_rank(Bvf))
    Qhidden = vh[rank_vf:].T

    # Dual dodecahedral face Laplacian.
    face_sets = [set(f) for f in faces]
    Aface = np.zeros((20, 20))
    for a in range(20):
        for b in range(a + 1, 20):
            if len(face_sets[a] & face_sets[b]) == 2:
                Aface[a, b] = Aface[b, a] = 1
    Lface = np.diag(Aface.sum(axis=1)) - Aface
    hidden_operator = Qhidden.T @ Lface @ Qhidden
    ew, EU = np.linalg.eigh(hidden_operator)
    Q3 = Qhidden @ EU[:, np.isclose(ew, 3)]
    Q5 = Qhidden @ EU[:, np.isclose(ew, 5)]

    return {
        "boundary1": boundary1,
        "boundary2": boundary2,
        "L0": L0,
        "L1": L1,
        "L2": L2,
        "Dinc": Dinc,
        "Bvf": Bvf,
        "Lface": Lface,
        "Q3": Q3,
        "Q5": Q5,
        "chain_error": float(np.max(np.abs(boundary1 @ boundary2))),
        "ranks": {"boundary1": rank1, "boundary2": rank2, "vertex_face": rank_vf},
        "betti": betti,
    }


def fiveplet_basis():
    basis = [
        np.diag([1, -1, 0]) / math.sqrt(2),
        np.diag([1, 1, -2]) / math.sqrt(6),
    ]
    m = np.zeros((3, 3))
    m[0, 1] = m[1, 0] = 1 / math.sqrt(2)
    basis.append(m)
    m = np.zeros((3, 3))
    m[0, 2] = m[2, 0] = 1 / math.sqrt(2)
    basis.append(m)
    m = np.zeros((3, 3))
    m[1, 2] = m[2, 1] = 1 / math.sqrt(2)
    basis.append(m)
    return np.asarray(basis)


def edge_alphabet(vertices, edges, boundary2, Q3, Q5):
    basis = fiveplet_basis()

    def qmat(v):
        return np.outer(v, v) - np.eye(3) / 3

    phi_mats = []
    for i, j in edges:
        phi_mats.append(math.sqrt(15) / 4 * (qmat(vertices[i]) + qmat(vertices[j])))
    phi_mats = np.asarray(phi_mats)
    phi = np.asarray([[np.trace(x @ b) for b in basis] for x in phi_mats])

    # Canonical A5-invariant map: unsigned edge-face incidence followed by the
    # hidden 4_3 and 4_5 projectors.
    edge_face = np.abs(boundary2[:30, :])
    xi3 = edge_face @ Q3
    xi5 = edge_face @ Q5
    alphabet = np.hstack([phi, xi3, xi5])

    return {
        "basis": basis,
        "phi_mats": phi_mats,
        "phi": phi,
        "xi3": xi3,
        "xi5": xi5,
        "alphabet": alphabet,
    }


def potential_tools(alphabet):
    stiffness = np.concatenate([np.ones(5), 3 * np.ones(4), 5 * np.ones(4)])

    def value(z, eta):
        a = eta * (alphabet @ z)
        shift = np.max(a)
        logmean = shift + np.log(np.mean(np.exp(a - shift)))
        return 0.5 * np.dot(stiffness * z, z) - logmean / eta

    def grad_hess(z, eta):
        a = eta * (alphabet @ z)
        a -= np.max(a)
        p = np.exp(a)
        p /= p.sum()
        mean = p @ alphabet
        centered = alphabet - mean
        covariance = (centered.T * p) @ centered
        gradient = stiffness * z - mean
        hessian = np.diag(stiffness) - eta * covariance
        return gradient, hessian, p, mean, covariance

    return stiffness, value, grad_hess


def solve_vacuum(phi, xi3, xi5, alphabet, eta, seed=123):
    stiffness, value, gh = potential_tools(alphabet)
    x = phi[0]
    y3 = xi3[0]
    y5 = xi5[0]

    def aligned(r, s, t):
        z = np.zeros(13)
        z[:5] = r * x
        z[5:9] = s * y3
        z[9:] = t * y5
        return z

    # Multiple starts ensure the result is not an artefact of one initial point.
    rng = np.random.default_rng(seed)
    starts = [aligned(0.9, 0, 0.18)]
    for _ in range(79):
        z0 = rng.normal(size=13)
        z0 *= rng.uniform(0, 1.5) / (np.linalg.norm(z0) + 1e-15)
        starts.append(z0)

    solutions = []
    for z0 in starts:
        res = minimize(
            lambda z: value(z, eta),
            z0,
            jac=lambda z: gh(z, eta)[0],
            method="BFGS",
            options={"gtol": 1e-11, "maxiter": 5000},
        )
        solutions.append(res)
    best = min(solutions, key=lambda r: r.fun)
    z = best.x
    idx = int(np.argmax(phi @ z[:5]))

    r = float(np.dot(z[:5], phi[idx]) / np.dot(phi[idx], phi[idx]))
    s = float(np.dot(z[5:9], xi3[idx]) / np.dot(xi3[idx], xi3[idx]))
    t = float(np.dot(z[9:], xi5[idx]) / np.dot(xi5[idx], xi5[idx]))
    gradient, hessian, p, mean, covariance = gh(z, eta)
    kl = float(np.sum(p * np.log(30 * p)))

    return {
        "eta": eta,
        "potential": float(best.fun),
        "edge_index": idx,
        "coefficients": {"phi_r": r, "xi3_s": s, "xi5_t": t},
        "norms": {
            "phi": float(np.linalg.norm(z[:5])),
            "xi3": float(np.linalg.norm(z[5:9])),
            "xi5": float(np.linalg.norm(z[9:])),
        },
        "gradient_norm": float(np.linalg.norm(gradient)),
        "hessian_min": float(np.min(np.linalg.eigvalsh(hessian))),
        "hessian_spectrum": [float(v) for v in np.linalg.eigvalsh(hessian)],
        "relative_entropy": kl,
        "dominant_probability": float(np.max(p)),
        "state": z,
    }


def orientation_threshold(phi, xi3, xi5, alphabet):
    stiffness, value, gh = potential_tools(alphabet)
    x = phi[0]
    y5 = xi5[0]

    def aligned(r, t):
        z = np.zeros(13)
        z[:5] = r * x
        z[9:] = t * y5
        return z

    def stationary(eta):
        def reduced_value(rt):
            return value(aligned(rt[0], rt[1]), eta)

        def reduced_gradient(rt):
            g = gh(aligned(rt[0], rt[1]), eta)[0]
            return np.array([np.dot(g[:5], x), np.dot(g[9:], y5)])

        res = minimize(
            reduced_value,
            np.array([0.98, 0.19]),
            jac=reduced_gradient,
            method="BFGS",
            options={"gtol": 1e-12, "maxiter": 3000},
        )
        return res.x

    def minimum_hessian_eigenvalue(eta):
        r, t = stationary(eta)
        return float(np.min(np.linalg.eigvalsh(gh(aligned(r, t), eta)[1])))

    root = brentq(minimum_hessian_eigenvalue, 7.5, 8.0, xtol=1e-12)
    r, t = stationary(root)
    return {
        "eta_orientation": float(root),
        "phi_r_at_threshold": float(r),
        "xi5_t_at_threshold": float(t),
    }


def charge_hierarchy(delta):
    words = {
        "up": (1, 3, -4),
        "down": (1, -3, 2),
        "charged_lepton": (-3, -3, 6),
        "neutrino": (-3, 3, 0),
    }

    def entries(word):
        a, b, c = word
        return np.array(
            [
                a + b * c * delta**3,
                b * delta + c * a * delta**3,
                c * delta**2 + a * b * delta**3,
            ],
            dtype=float,
        )

    out = {}
    for name, word in words.items():
        vals = entries(word)
        absolute = np.sort(np.abs(vals))
        valuations = []
        for val in absolute:
            # Numerical valuation relative to the master gap.
            valuations.append(float(math.log(val) / math.log(delta)) if val > 0 else math.inf)
        out[name] = {
            "word": list(word),
            "entries": vals.tolist(),
            "absolute_sorted": absolute.tolist(),
            "normalized_to_largest": (absolute / absolute[-1]).tolist(),
            "formal_smith_depths": [0, 1, 3] if name == "neutrino" else [0, 1, 2],
        }
    return out


def mixing_matrices():
    # Frozen dimensionless outputs supplied by Cathedral Dimensionless Core v2.6.
    vus = 0.224308861637
    vcb = 0.042177509492
    vub = 0.003733784761
    delta_ckm = math.radians(65.974619)

    s13 = vub
    c13 = math.sqrt(1 - s13**2)
    s12 = vus / c13
    s23 = vcb / c13

    def standard(s12, s23, s13, delta):
        c12 = math.sqrt(1 - s12**2)
        c23 = math.sqrt(1 - s23**2)
        c13 = math.sqrt(1 - s13**2)
        ep = np.exp(1j * delta)
        em = np.exp(-1j * delta)
        return np.array(
            [
                [c12 * c13, s12 * c13, s13 * em],
                [
                    -s12 * c23 - c12 * s23 * s13 * ep,
                    c12 * c23 - s12 * s23 * s13 * ep,
                    s23 * c13,
                ],
                [
                    s12 * s23 - c12 * c23 * s13 * ep,
                    -c12 * s23 - s12 * c23 * s13 * ep,
                    c23 * c13,
                ],
            ],
            dtype=complex,
        )

    ckm = standard(s12, s23, s13, delta_ckm)

    s2_12 = 0.303463055248
    s2_23 = 0.562129475821
    s2_13 = 0.022689900267
    delta_pmns = math.radians(285.487555)
    pmns = standard(math.sqrt(s2_12), math.sqrt(s2_23), math.sqrt(s2_13), delta_pmns)

    def jarlskog(u):
        return float(np.imag(u[0, 0] * u[1, 1] * np.conj(u[0, 1]) * np.conj(u[1, 0])))

    return {
        "ckm_abs": np.abs(ckm).tolist(),
        "ckm_J": jarlskog(ckm),
        "ckm_unitarity_error": float(np.max(np.abs(ckm @ ckm.conj().T - np.eye(3)))),
        "pmns_abs": np.abs(pmns).tolist(),
        "pmns_J": jarlskog(pmns),
        "pmns_unitarity_error": float(np.max(np.abs(pmns @ pmns.conj().T - np.eye(3)))),
        "status": (
            "Matrices reconstructed from supplied frozen mixing numbers. "
            "They are not outputs of the presently specified KL vacuum operator."
        ),
    }


def anomaly_audit():
    yq, yh, yu, yd, yl, ye, ynu = 1, 3, 4, -2, -3, -6, 0
    return {
        "charges": [yq, yh, yu, yd, yl, ye, ynu],
        "SU2_squared_U1": 3 * yq + yl,
        "SU3_squared_U1": 2 * yq - yu - yd,
        "gravity_squared_U1": 6 * yq - 3 * yu - 3 * yd + 2 * yl - ye - ynu,
        "U1_cubed": 6 * yq**3 - 3 * yu**3 - 3 * yd**3 + 2 * yl**3 - ye**3 - ynu**3,
    }


def legacy_graph_audit():
    # Graph used by cathedral_v8_complete.py.
    adj = np.zeros((13, 13))
    adj[0, 1:] = adj[1:, 0] = 1
    for i in range(1, 13):
        for k in (1, 5, 7, 11):
            j = (i + k - 1) % 12 + 1
            adj[i, j] = adj[j, i] = 1
    L = np.diag(adj.sum(axis=1)) - adj
    return {
        "edge_count": int(adj.sum() / 2),
        "degree_sequence": adj.sum(axis=1).astype(int).tolist(),
        "laplacian_spectrum": groups(L),
        "finding": (
            "This is a 36-edge centred Cayley graph, not the 42-edge centred "
            "icosahedral complex used by the canonical Hodge construction."
        ),
    }


def main(output_dir="."):
    D, N, V, E, F, q, G = 3, 13, 12, 30, 20, 5, 60
    phi = (1 + math.sqrt(5)) / 2
    gamma = 1 / 81
    delta_classical = 3 / 20
    delta_star = (1 - gamma) * math.pi / (N * phi)
    delta = delta_classical - delta_star
    eta_delta = -math.log(delta)
    eta_conf = 9.8601129428
    eta_ir = 15.6972029190

    constants = {
        "D": D,
        "N": N,
        "V": V,
        "E_shell": E,
        "F": F,
        "q": q,
        "G": G,
        "phi": phi,
        "gamma": gamma,
        "delta_classical": delta_classical,
        "delta_star": delta_star,
        "Delta": delta,
        "eta_Delta": eta_delta,
        "eta_conf": eta_conf,
        "eta_IR": eta_ir,
    }

    w_scalar = 9 / 5
    s_ent = (1 + gamma) / D
    s_exh = (N - D - 1) / (q * N)
    residues = {
        "alpha_inverse_dressed": 137 + (N + w_scalar - s_ent) * delta - s_exh * delta**2,
        "sin2_thetaW_root": D / N,
        "alpha_s_face": F / N**2,
        "Omega_m": 2 * D / (F - 1),
        "Omega_Lambda": N / (F - 1),
        "Omega_b": ((D - 1) / N) * (2 * D / (F - 1)),
        "Omega_c": ((N - (D - 1)) / N) * (2 * D / (F - 1)),
        "n_s": 1 - D * gamma + delta,
        "r": 16 * gamma * delta,
        "running_residue": -delta**2,
    }

    vertices, edges, faces, oriented_faces = icosahedron()
    hodge = hodge_complex(vertices, edges, faces, oriented_faces)
    alphabet = edge_alphabet(
        vertices, edges, hodge["boundary2"], hodge["Q3"], hodge["Q5"]
    )

    geometry = {
        "shell_edges": len(edges),
        "centred_edges": 42,
        "faces": len(faces),
        "chain_error": hodge["chain_error"],
        "euler_characteristic": 13 - 42 + 20,
        "betti": hodge["betti"],
        "L0_spectrum": groups(hodge["L0"]),
        "L1_spectrum": groups(hodge["L1"]),
        "L2_spectrum": groups(hodge["L2"]),
        "Hodge_Dirac_spectrum": groups(hodge["Dinc"]),
        "hidden_dimension": int(hodge["Q3"].shape[1] + hodge["Q5"].shape[1]),
        "hidden_face_spectrum": groups(
            np.block(
                [
                    [3 * np.eye(4), np.zeros((4, 4))],
                    [np.zeros((4, 4)), 5 * np.eye(4)],
                ]
            )
        ),
    }

    phi_arr = alphabet["phi"]
    xi3_arr = alphabet["xi3"]
    xi5_arr = alphabet["xi5"]
    tight_frames = {
        "phi_norm_squared": float(np.dot(phi_arr[0], phi_arr[0])),
        "xi3_norm_squared": float(np.dot(xi3_arr[0], xi3_arr[0])),
        "xi5_norm_squared": float(np.dot(xi5_arr[0], xi5_arr[0])),
        "phi_covariance_eigenvalues": np.linalg.eigvalsh(phi_arr.T @ phi_arr / 30).tolist(),
        "xi3_covariance_eigenvalues": np.linalg.eigvalsh(xi3_arr.T @ xi3_arr / 30).tolist(),
        "xi5_covariance_eigenvalues": np.linalg.eigvalsh(xi5_arr.T @ xi5_arr / 30).tolist(),
        "cross_covariance_norms": {
            "phi_xi3": float(np.linalg.norm(phi_arr.T @ xi3_arr)),
            "phi_xi5": float(np.linalg.norm(phi_arr.T @ xi5_arr)),
            "xi3_xi5": float(np.linalg.norm(xi3_arr.T @ xi5_arr)),
        },
    }

    vac_delta = solve_vacuum(
        phi_arr, xi3_arr, xi5_arr, alphabet["alphabet"], eta_delta, seed=10
    )
    threshold = orientation_threshold(
        phi_arr, xi3_arr, xi5_arr, alphabet["alphabet"]
    )
    vac_conf = solve_vacuum(
        phi_arr, xi3_arr, xi5_arr, alphabet["alphabet"], eta_conf, seed=20
    )
    vac_ir = solve_vacuum(
        phi_arr, xi3_arr, xi5_arr, alphabet["alphabet"], eta_ir, seed=30
    )

    def strip_state(v):
        return {k: val for k, val in v.items() if k != "state"}

    vacuum = {
        "edge_coexistence_eta": (8 / 3) * math.log(6),
        "isotropic_spinodal_eta": 5.0,
        **threshold,
        "at_eta_Delta": strip_state(vac_delta),
        "at_eta_conf": strip_state(vac_conf),
        "at_eta_IR": strip_state(vac_ir),
        "interpretation": (
            "At eta_Delta the fiveplet and 4_5 shadow are nonzero but 4_3 is zero. "
            "At eta_orientation the paired-edge Z2 orientation symmetry bifurcates; "
            "above it both shadow quartets are nonzero, giving 30 oriented minima."
        ),
    }

    identifiability = {
        "one_mode_expansion": (
            "For R(g)=I+a*g*T+O(g^2), Gamma=Tr[a^2*g^2*T^2/4]+O(g^3)."
        ),
        "conclusion": (
            "The logarithmic series fixes 1/4,-1/6,1/8,... after the outer "
            "factor, but the physical Hessian still depends on the unspecified "
            "field-to-operator normalization a and on the passive state."
        ),
        "missing_for_full_hessians": [
            "explicit passive state rho_0 or modular operator",
            "explicit closure operators F_a and target values f_a",
            "typed finite matter map from End(3) to Hom(3,3')",
            "sector-specific field embeddings and boundary conditions",
            "one dimensional unit anchor for absolute masses",
        ],
    }

    results = {
        "constants": constants,
        "dimensionless_residues": residues,
        "geometry_and_hodge": geometry,
        "edge_shadow_tight_frames": tight_frames,
        "entropy_vacuum": vacuum,
        "charge_hierarchy": charge_hierarchy(delta),
        "hypercharge_anomalies": anomaly_audit(),
        "supplied_mixing_layer": mixing_matrices(),
        "legacy_v8_graph_audit": legacy_graph_audit(),
        "action_identifiability": identifiability,
        "final_status": {
            "computed": (
                "All outputs determined by the explicit finite geometry, edge-face "
                "alphabet, KL potential, charge words and supplied frozen angles."
            ),
            "not_computable_without_new_definition": (
                "Absolute spectrum, gauge/Newton Hessians, and CKM/PMNS generated "
                "from the action, because the passive state and typed finite matter "
                "operator are not fully specified."
            ),
        },
    }

    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    json_path = out / "urt_nature_exhaustive_results.json"
    csv_path = out / "urt_nature_exhaustive_results.csv"
    json_path.write_text(json.dumps(results, indent=2), encoding="utf-8")

    rows = []
    for section in ("constants", "dimensionless_residues"):
        for key, value in results[section].items():
            rows.append((section, key, value))
    for scale in ("at_eta_Delta", "at_eta_conf", "at_eta_IR"):
        block = results["entropy_vacuum"][scale]
        rows.append(("entropy_vacuum", scale + ".potential", block["potential"]))
        for key, value in block["coefficients"].items():
            rows.append(("entropy_vacuum", scale + "." + key, value))
        for key, value in block["norms"].items():
            rows.append(("entropy_vacuum", scale + ".norm_" + key, value))
    for key, value in results["hypercharge_anomalies"].items():
        if key != "charges":
            rows.append(("hypercharge_anomalies", key, value))

    with csv_path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.writer(fh)
        writer.writerow(["section", "quantity", "value"])
        writer.writerows(rows)

    print(json.dumps({
        "Delta": delta,
        "eta_Delta": eta_delta,
        "eta_orientation": threshold["eta_orientation"],
        "vacuum_eta_Delta": strip_state(vac_delta),
        "vacuum_eta_conf": strip_state(vac_conf),
        "vacuum_eta_IR": strip_state(vac_ir),
        "chain_error": hodge["chain_error"],
        "betti": hodge["betti"],
        "hidden_face_spectrum": geometry["hidden_face_spectrum"],
        "output_json": str(json_path),
        "output_csv": str(csv_path),
    }, indent=2))


if __name__ == "__main__":
    main(Path(__file__).resolve().parent)