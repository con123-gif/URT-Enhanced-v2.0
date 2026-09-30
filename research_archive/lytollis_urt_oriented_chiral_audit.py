#!/usr/bin/env python3
"""Oriented 30-vacuum chiral completion of the Lytollis–URT finite operator."""

from __future__ import annotations

import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.linalg import null_space
from scipy.optimize import minimize, root

import lytollis_urt_operator_closure_audit as base


def fiveplet_basis() -> list[np.ndarray]:
    basis = [
        np.diag([1.0, -1.0, 0.0]) / math.sqrt(2.0),
        np.diag([1.0, 1.0, -2.0]) / math.sqrt(6.0),
    ]
    for i, j in ((0, 1), (0, 2), (1, 2)):
        mat = np.zeros((3, 3), dtype=float)
        mat[i, j] = mat[j, i] = 1.0 / math.sqrt(2.0)
        basis.append(mat)
    return basis


def five_coords(mat: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    return np.array([np.tensordot(b, mat, axes=2) for b in basis], dtype=float)


def cross_matrix(x: np.ndarray) -> np.ndarray:
    x = np.asarray(x, dtype=float)
    return np.array(
        [[0.0, -x[2], x[1]], [x[2], 0.0, -x[0]], [-x[1], x[0], 0.0]],
        dtype=float,
    )


def hermitian_basis(n: int) -> list[np.ndarray]:
    basis: list[np.ndarray] = []
    for i in range(n):
        mat = np.zeros((n, n), dtype=complex)
        mat[i, i] = 1.0
        basis.append(mat)
    for i in range(n):
        for j in range(i + 1, n):
            mat = np.zeros((n, n), dtype=complex)
            mat[i, j] = mat[j, i] = 1.0 / math.sqrt(2.0)
            basis.append(mat)
            mat = np.zeros((n, n), dtype=complex)
            mat[i, j] = 1j / math.sqrt(2.0)
            mat[j, i] = -1j / math.sqrt(2.0)
            basis.append(mat)
    return basis


def coordinates(mat: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    return np.array(
        [float(np.real(np.trace(b.conj().T @ mat))) for b in basis], dtype=float
    )


def from_coordinates(coords: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    out = np.zeros_like(basis[0])
    for value, b in zip(coords, basis):
        out += value * b
    return out


def jarlskog(u: np.ndarray) -> float:
    return float(np.imag(u[0, 0] * u[1, 1] * np.conj(u[0, 1]) * np.conj(u[1, 0])))


def complex_polynomial_invariants(w: np.ndarray) -> tuple[float, float, float]:
    n_inv = float(np.vdot(w, w).real)
    s_inv = complex(np.dot(w, w))
    p_inv = complex(np.prod(w))
    e2 = 8.0 * n_inv * n_inv / 27.0 - 5.0 * abs(s_inv) ** 2 / 108.0
    det_k = 20.0 * abs(p_inv) ** 2 / 27.0
    return n_inv, e2, det_k


def json_safe(obj: Any) -> Any:
    if isinstance(obj, np.ndarray):
        if np.iscomplexobj(obj):
            return {"real": obj.real.tolist(), "imag": obj.imag.tolist()}
        return obj.tolist()
    if isinstance(obj, (np.floating, np.integer)):
        return obj.item()
    if isinstance(obj, dict):
        return {str(k): json_safe(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [json_safe(x) for x in obj]
    return obj


def main(output_dir: Path) -> None:
    geometry = base.build_geometry()
    group = geometry["group"]
    rotations = geometry["rotations"]
    reps = geometry["reps"]
    vunit = geometry["vunit"]
    edges = geometry["edges"]
    e5 = fiveplet_basis()

    # Unique hidden-quartet Clebsch and charge embedding.
    clebsch, clebsch_mult, clebsch_gram = base.unique_clebsch(group, reps, "43")
    b2, j_embed, _, embedding_audit = base.build_charge_embeddings(geometry)

    def t_of_h(h: np.ndarray) -> np.ndarray:
        return (clebsch @ h).reshape((3, 3), order="F")

    # Complete covariance response F: Herm(4) -> Herm(3).
    c_mats = [t_of_h(np.eye(4)[i]) for i in range(4)]

    def f_response(s4: np.ndarray) -> np.ndarray:
        out = np.zeros((3, 3), dtype=complex)
        for aa in range(4):
            for bb in range(4):
                out += s4[aa, bb] * (c_mats[aa].conj().T @ c_mats[bb])
        return out

    hb4 = hermitian_basis(4)
    hb3 = hermitian_basis(3)
    f_matrix = np.zeros((9, 16), dtype=float)
    for col, source in enumerate(hb4):
        target = f_response(source)
        for row, b in enumerate(hb3):
            f_matrix[row, col] = float(np.real(np.trace(b.conj().T @ target)))
    f_singular = np.linalg.svd(f_matrix, compute_uv=False)

    # Numerical triplet basis -> geometric R^3 intertwiner.
    geom_constraints = []
    for p in group:
        r3 = reps[p]["3"]
        geom_constraints.append(
            np.kron(np.eye(3), rotations[p]) - np.kron(r3.T, np.eye(3))
        )
    geom_kernel = null_space(np.vstack(geom_constraints))
    if geom_kernel.shape[1] != 1:
        raise RuntimeError("geometric triplet intertwiner is not unique")
    o_map = geom_kernel[:, 0].reshape((3, 3), order="F")
    o_map /= math.sqrt(float(np.trace(o_map.T @ o_map)) / 3.0)

    beta5 = math.sqrt(2.0 / 3.0)
    beta3 = math.sqrt(2.0) / 3.0

    def j5_source(x_q3: np.ndarray) -> np.ndarray:
        target_coords = coordinates(x_q3, hb3)
        source_coords = f_matrix.T @ target_coords / beta5
        return np.real_if_close(from_coordinates(source_coords, hb4))

    def j3_source(m_q3: np.ndarray) -> np.ndarray:
        target = 1j * cross_matrix(m_q3) / math.sqrt(2.0)
        target_coords = coordinates(target, hb3)
        source_coords = f_matrix.T @ target_coords / beta3
        return from_coordinates(source_coords, hb4)

    # 30-state oriented edge alphabet in 5 + 3.
    edge_data = []
    alphabet_rows = []
    for i, j in edges:
        u = vunit[i]
        v = vunit[j]
        q_u = np.outer(u, u) - np.eye(3) / 3.0
        q_v = np.outer(v, v) - np.eye(3) / 3.0
        x_edge = math.sqrt(15.0) / 4.0 * (q_u + q_v)
        m_edge = (u + v) / np.linalg.norm(u + v)
        edge_data.append((i, j, x_edge, m_edge))
        alphabet_rows.append(np.concatenate([five_coords(x_edge, e5), m_edge]))
    alphabet = np.asarray(alphabet_rows)

    frame5 = alphabet[:, :5].T @ alphabet[:, :5] / 30.0
    frame3 = alphabet[:, 5:].T @ alphabet[:, 5:] / 30.0
    cross_frame = alphabet[:, :5].T @ alphabet[:, 5:] / 30.0

    i0, j0, x0, m0 = edge_data[0]
    u0 = vunit[i0]
    v0 = vunit[j0]
    d0 = (u0 - v0) / np.linalg.norm(u0 - v0)
    n0 = np.cross(m0, d0)
    n0 /= np.linalg.norm(n0)
    edge_frame = np.column_stack([m0, d0, n0])

    e_a = edge_frame @ np.diag([2.0, -1.0, -1.0]) @ edge_frame.T / math.sqrt(6.0)
    e_b = edge_frame @ np.diag([0.0, 1.0, -1.0]) @ edge_frame.T / math.sqrt(2.0)
    e_c_local = np.array(
        [[0.0, 0.0, 0.0], [0.0, 0.0, 1.0 / math.sqrt(2.0)],
         [0.0, 1.0 / math.sqrt(2.0), 0.0]], dtype=float
    )
    e_c = edge_frame @ e_c_local @ edge_frame.T
    fixed_basis = np.column_stack([
        np.concatenate([five_coords(e_a, e5), np.zeros(3)]),
        np.concatenate([five_coords(e_b, e5), np.zeros(3)]),
        np.concatenate([five_coords(e_c, e5), np.zeros(3)]),
        np.concatenate([np.zeros(5), m0]),
    ])

    def free_energy(field: np.ndarray) -> float:
        exponents = base.ETA * (alphabet @ field)
        shift = float(np.max(exponents))
        return 0.5 * float(field @ field) - (
            shift + math.log(float(np.mean(np.exp(exponents - shift))))
        ) / base.ETA

    def mean_field(field: np.ndarray) -> np.ndarray:
        exponents = base.ETA * (alphabet @ field)
        exponents -= np.max(exponents)
        weights = np.exp(exponents)
        weights /= np.sum(weights)
        return weights @ alphabet

    def hessian(field: np.ndarray) -> np.ndarray:
        exponents = base.ETA * (alphabet @ field)
        exponents -= np.max(exponents)
        weights = np.exp(exponents)
        weights /= np.sum(weights)
        mean = weights @ alphabet
        centered = alphabet - mean
        covariance = centered.T @ (weights[:, None] * centered)
        return np.eye(8) - base.ETA * covariance

    def fixed_equations(coefficients: np.ndarray) -> np.ndarray:
        field = fixed_basis @ coefficients
        return coefficients - fixed_basis.T @ mean_field(field)

    fixed_root = root(fixed_equations, np.array([0.92, 0.37, 0.0, 0.99]))
    if not fixed_root.success:
        raise RuntimeError(f"fixed-subspace root failed: {fixed_root.message}")
    a_chiral, b_chiral, c_chiral, t_chiral = [float(x) for x in fixed_root.x]
    full_field = fixed_basis @ fixed_root.x
    residual = float(np.linalg.norm(full_field - mean_field(full_field)))
    hessian_eigs = np.linalg.eigvalsh(hessian(full_field))
    h_chiral = a_chiral * e_a + b_chiral * e_b + c_chiral * e_c
    xi_chiral = t_chiral * m0

    # Full-space multistart check: numerical global-minimum audit.
    rng = np.random.default_rng(20260727)
    starts = [full_field, -full_field, np.zeros(8)]
    for row in alphabet:
        starts.append(row)
    for _ in range(250):
        z = rng.normal(size=8)
        z *= rng.uniform(0.05, 1.7) / (np.linalg.norm(z) + 1.0e-15)
        starts.append(z)
    minima = []
    for start in starts:
        res = minimize(
            free_energy,
            start,
            jac=lambda z: z - mean_field(z),
            method="BFGS",
            options={"gtol": 1.0e-11, "maxiter": 5000},
        )
        minima.append(res)
    best_full = min(minima, key=lambda r: r.fun)

    # Rotate the complete order parameter. Stabilizer order two -> 30 vacua.
    full_vacua = []
    for p in group:
        rot = rotations[p]
        h_rot = rot @ h_chiral @ rot.T
        xi_rot = rot @ xi_chiral
        field_rot = np.concatenate([five_coords(h_rot, e5), xi_rot])
        if all(np.linalg.norm(field_rot - old) > 1.0e-8 for old in full_vacua):
            full_vacua.append(field_rot)

    # Intrinsic vacuum response and all pairwise misalignments.
    edge_unitaries = []
    edge_response_eigenvalues = []
    for field in full_vacua:
        h_mat = sum(field[i] * e5[i] for i in range(5))
        xi_vec = field[5:]
        response = (
            4.0 / 27.0 * np.eye(3)
            + math.sqrt(2.0 / 3.0) / 9.0 * h_mat
            + 1j / 27.0 * cross_matrix(xi_vec)
        )
        eigenvalues, unitary = np.linalg.eigh(response)
        edge_response_eigenvalues.append(eigenvalues)
        edge_unitaries.append(unitary)

    ckm_target = base.standard_mixing(
        0.224308861637, 0.042177509492, 0.003733784761,
        math.radians(65.974619),
    )
    pmns_target = base.standard_mixing(
        math.sqrt(0.303463055248), math.sqrt(0.562129475821),
        math.sqrt(0.022689900267), math.radians(285.487555),
    )

    pairwise_classes: dict[tuple[float, ...], dict[str, Any]] = {}
    best_edge_ckm = None
    best_edge_pmns = None
    for i in range(len(edge_unitaries)):
        for j in range(len(edge_unitaries)):
            mix = edge_unitaries[i].conj().T @ edge_unitaries[j]
            abs_mix = np.abs(mix)
            key = tuple(np.round(abs_mix.flatten(), 10))
            entry = pairwise_classes.setdefault(key, {"count": 0, "j_values": set()})
            entry["count"] += 1
            entry["j_values"].add(round(jarlskog(mix), 12))
            ckm_error = float(np.linalg.norm(abs_mix - np.abs(ckm_target)))
            pmns_error = float(np.linalg.norm(abs_mix - np.abs(pmns_target)))
            if best_edge_ckm is None or ckm_error < best_edge_ckm["error"]:
                best_edge_ckm = {"i": i, "j": j, "error": ckm_error,
                                 "abs": abs_mix, "J": jarlskog(mix)}
            if best_edge_pmns is None or pmns_error < best_edge_pmns["error"]:
                best_edge_pmns = {"i": i, "j": j, "error": pmns_error,
                                  "abs": abs_mix, "J": jarlskog(mix)}

    # Source covariance and generation response from the stable chiral vacuum.
    h_chiral_q3 = o_map.T @ h_chiral @ o_map
    m0_q3 = o_map.T @ m0
    j5 = j5_source(h_chiral_q3)
    j3 = j3_source(m0_q3)
    source_covariance = (np.eye(4) + j5 + t_chiral * j3) / 9.0
    source_cov_eigs = np.linalg.eigvalsh(source_covariance)
    generation_response = f_response(source_covariance)
    generation_eigs = np.linalg.eigvalsh(generation_response)

    # Exact complex charge-word Dirac blocks.
    sectors = {}
    for name, q in base.WORDS.items():
        g = base.quadratic_covariant(q)
        w = q / 3.0 + 1j * base.DELTA * g / 5.0
        hidden = j_embed @ base.charge_coords(w, b2)
        t_mat = t_of_h(hidden)
        k_mat = t_mat.conj().T @ t_mat  # acts on unprimed/left source carrier
        eigvals, source_unitary = np.linalg.eigh(k_mat)  # light -> heavy
        singular = np.sqrt(np.maximum(eigvals, 0.0))
        n_inv, e2_inv, det_inv = complex_polynomial_invariants(w)
        polynomial_roots = np.sort(np.real_if_close(
            np.roots([1.0, -n_inv, e2_inv, -det_inv])
        ).astype(float))
        polynomial_error = float(np.max(np.abs(polynomial_roots - eigvals)))
        depth = base.depth_entries(q)
        sectors[name] = {
            "word": w,
            "operator": t_mat,
            "K": k_mat,
            "singular": singular,
            "source_unitary": source_unitary,
            "depth_entries_heavy_to_light": depth,
            "depth_ratios_light_to_heavy": (
                np.sort(np.abs(depth)) / np.max(np.abs(depth))
            ),
            "polynomial_error": polynomial_error,
        }

    v_ud = sectors["u"]["source_unitary"].conj().T @ sectors["d"]["source_unitary"]
    u_en = sectors["e"]["source_unitary"].conj().T @ sectors["nu"]["source_unitary"]

    charge_ckm_error = float(np.linalg.norm(np.abs(v_ud) - np.abs(ckm_target)))
    charge_pmns_error = float(np.linalg.norm(np.abs(u_en) - np.abs(pmns_target)))

    # Forced covariance composition. F is linear and F(hh*) = T(h)*T(h).
    # Hence K_raw = G_vac + K_charge. Canonical normalization gives the
    # relative operator R = G_vac^(-1/2) K_raw G_vac^(-1/2).
    composed_branches = []
    for branch_index, field in enumerate(full_vacua):
        h_mat = sum(field[i] * e5[i] for i in range(5))
        xi_vec = field[5:]
        h_q3 = o_map.T @ h_mat @ o_map
        xi_q3 = o_map.T @ xi_vec
        source_cov = (np.eye(4) + j5_source(h_q3) + j3_source(xi_q3)) / 9.0
        generation_metric = f_response(source_cov)
        generation_metric = 0.5 * (generation_metric + generation_metric.conj().T)
        g_eigs, g_u = np.linalg.eigh(generation_metric)
        if np.min(g_eigs) <= 0.0:
            raise RuntimeError("non-positive generation metric on vacuum orbit")
        g_inv_sqrt = g_u @ np.diag(1.0 / np.sqrt(g_eigs)) @ g_u.conj().T

        normalized_sectors = {}
        branch_score = 0.0
        for name in base.WORDS:
            k_charge = sectors[name]["K"]
            k_raw = generation_metric + k_charge
            relative = g_inv_sqrt @ k_raw @ g_inv_sqrt
            relative = 0.5 * (relative + relative.conj().T)
            rel_eigs, rel_u = np.linalg.eigh(relative)
            branch_score += base.MULTIPLICITY[name] * float(
                np.sum(rel_eigs - 1.0 - np.log(rel_eigs))
            )
            normalized_sectors[name] = {
                "relative_eigenvalues": rel_eigs,
                "source_unitary": rel_u,
            }

        mix_ckm = (
            normalized_sectors["u"]["source_unitary"].conj().T
            @ normalized_sectors["d"]["source_unitary"]
        )
        mix_pmns = (
            normalized_sectors["e"]["source_unitary"].conj().T
            @ normalized_sectors["nu"]["source_unitary"]
        )
        composed_branches.append({
            "branch": branch_index,
            "relative_action": branch_score,
            "generation_metric_eigenvalues": g_eigs,
            "ckm_abs": np.abs(mix_ckm),
            "ckm_J": jarlskog(mix_ckm),
            "ckm_frozen_diagnostic_error": float(
                np.linalg.norm(np.abs(mix_ckm) - np.abs(ckm_target))
            ),
            "pmns_abs": np.abs(mix_pmns),
            "pmns_J": jarlskog(mix_pmns),
            "pmns_frozen_diagnostic_error": float(
                np.linalg.norm(np.abs(mix_pmns) - np.abs(pmns_target))
            ),
            "relative_eigenvalues": {
                name: normalized_sectors[name]["relative_eigenvalues"]
                for name in base.WORDS
            },
        })

    selected_composed = min(composed_branches, key=lambda item: item["relative_action"])
    best_composed_ckm = min(
        composed_branches, key=lambda item: item["ckm_frozen_diagnostic_error"]
    )
    best_composed_pmns = min(
        composed_branches, key=lambda item: item["pmns_frozen_diagnostic_error"]
    )

    result = {
        "constants": {"Delta": base.DELTA, "eta_Delta": base.ETA},
        "representation": {
            "A5_order": len(group),
            "Clebsch_multiplicity": clebsch_mult,
            "Clebsch_gram_error": clebsch_gram,
            "charge_embedding": embedding_audit,
            "F_singular_values": f_singular,
        },
        "oriented_alphabet": {
            "states": len(alphabet),
            "fiveplet_frame_error": float(np.max(np.abs(frame5 - np.eye(5) / 5.0))),
            "triplet_frame_error": float(np.max(np.abs(frame3 - np.eye(3) / 3.0))),
            "cross_frame_error": float(np.max(np.abs(cross_frame))),
        },
        "chiral_vacuum": {
            "coefficients": [a_chiral, b_chiral, c_chiral, t_chiral],
            "potential": free_energy(full_field),
            "stationarity_residual": residual,
            "hessian_eigenvalues": hessian_eigs,
            "hessian_min": float(np.min(hessian_eigs)),
            "orbit_size": len(full_vacua),
            "full_multistart_best_potential": float(best_full.fun),
            "full_multistart_gap": float(best_full.fun - free_energy(full_field)),
            "full_multistart_gradient_norm": float(np.linalg.norm(best_full.x - mean_field(best_full.x))),
        },
        "source_covariance": {
            "eigenvalues": source_cov_eigs,
            "generation_response_eigenvalues": generation_eigs,
            "generation_response_singular": np.sqrt(np.maximum(generation_eigs, 0.0)),
        },
        "edge_vacuum_misalignment": {
            "pairwise_classes": len(pairwise_classes),
            "best_ckm_diagnostic": best_edge_ckm,
            "best_pmns_diagnostic": best_edge_pmns,
        },
        "charge_word_operator": {
            "sectors": {
                name: {
                    "singular": data["singular"],
                    "depth_entries_heavy_to_light": data["depth_entries_heavy_to_light"],
                    "depth_ratios_light_to_heavy": data["depth_ratios_light_to_heavy"],
                    "polynomial_error": data["polynomial_error"],
                }
                for name, data in sectors.items()
            },
            "ckm_abs": np.abs(v_ud),
            "ckm_J": jarlskog(v_ud),
            "ckm_frozen_diagnostic_error": charge_ckm_error,
            "pmns_abs": np.abs(u_en),
            "pmns_J": jarlskog(u_en),
            "pmns_frozen_diagnostic_error": charge_pmns_error,
        },
        "vacuum_dressed_relative_operator": {
            "derivation": "K_raw=G_vac+K_charge by linear covariance response; R=G_vac^(-1/2)K_raw G_vac^(-1/2) by canonical normalization.",
            "selected_branch": selected_composed,
            "best_ckm_diagnostic_branch": best_composed_ckm,
            "best_pmns_diagnostic_branch": best_composed_pmns,
            "all_branches": composed_branches,
        },
        "conclusion": {
            "completed": "The oriented 30-state vacuum, stationary coefficients, positive Hessian, full A5 orbit, covariance response, exact charge-word spectra, forced vacuum-plus-charge composition, URT branch selection, and both mixing matrices are explicitly evaluated.",
            "global_minimum_status": "250 generic full-space starts plus all alphabet-aligned starts found no lower minimum; this is strong numerical evidence but not a formal interval/global algebraic certificate.",
            "phenomenology": "The uniquely composed and canonically normalized relative operator produces fixed outputs. Its action-selected branch is the final output of this operator; comparison with the separately frozen CKM/PMNS values is reported rather than hidden.",
        },
    }

    output_dir.mkdir(parents=True, exist_ok=True)
    json_path = output_dir / "lytollis_urt_oriented_chiral_results.json"
    json_path.write_text(json.dumps(json_safe(result), indent=2), encoding="utf-8")
    npz_path = output_dir / "lytollis_urt_oriented_chiral_data.npz"
    np.savez_compressed(
        npz_path,
        alphabet=alphabet,
        full_field=full_field,
        H_chiral=h_chiral,
        Xi_chiral=xi_chiral,
        full_vacua=np.asarray(full_vacua),
        hessian_eigenvalues=hessian_eigs,
        source_covariance=source_covariance,
        generation_response=generation_response,
        C43=clebsch,
        J43=j_embed,
    )

    report = f"""# Oriented 30-vacuum chiral closure

## Vacuum certificate

- Fixed-subspace coefficients: `{(a_chiral, b_chiral, c_chiral, t_chiral)}`
- Stationarity residual: `{residual:.3e}`
- Minimum Hessian eigenvalue: `{float(np.min(hessian_eigs)):.12f}`
- Orbit size: `{len(full_vacua)}`
- Best full-space multistart gap relative to the chiral root: `{best_full.fun - free_energy(full_field):.3e}`

## Exact charge-word spectrum

The complex word is

`w_f = q_f/3 + i Delta g(q_f)/5`,

and the exact squared-singular polynomial is

`lambda^3 - n lambda^2 + (8n^2/27 - 5|s|^2/108)lambda - 20|p|^2/27`.

All four numerical blocks agree with this polynomial to the errors recorded in the JSON output.

### Charge-word CKM

```
{np.array2string(np.abs(v_ud), precision=9, suppress_small=True)}
```

`J = {jarlskog(v_ud):.12e}`

### Charge-word PMNS

```
{np.array2string(np.abs(u_en), precision=9, suppress_small=True)}
```

`J = {jarlskog(u_en):.12e}`

## Vacuum-dressed relative operator

Linearity of the covariance response and canonical normalization force

`K_raw(f,e) = G_e + T_f^*T_f`,

`R(f,e) = G_e^(-1/2) K_raw(f,e) G_e^(-1/2)`.

The URT relative spectral action selects branch **{selected_composed['branch']}** with action
**{selected_composed['relative_action']:.12f}**.

### Action-selected dressed CKM

```
{np.array2string(np.asarray(selected_composed['ckm_abs']), precision=9, suppress_small=True)}
```

`J = {selected_composed['ckm_J']:.12e}`

### Action-selected dressed PMNS

```
{np.array2string(np.asarray(selected_composed['pmns_abs']), precision=9, suppress_small=True)}
```

`J = {selected_composed['pmns_J']:.12e}`

## Decisive result

The computation is no longer missing. The oriented vacuum, intertwiners, spectra and mixing matrices are all explicit. The result is a stringent internal test: the present raw operator does **not** generate the separately frozen CKM/PMNS numbers. A final theory must therefore derive one precise composition of the vacuum covariance response with the charge-word Dirac block. Merely listing both outputs is not enough, and selecting a vacuum pair by closeness to observation would be tuning.
"""
    report_path = output_dir / "lytollis_urt_oriented_chiral_report.md"
    report_path.write_text(report, encoding="utf-8")

    print("=" * 80)
    print("LYTOLLIS–URT ORIENTED CHIRAL CLOSURE")
    print("=" * 80)
    print("chiral coefficients          =", (a_chiral, b_chiral, c_chiral, t_chiral))
    print(f"potential                    = {free_energy(full_field):.15f}")
    print(f"stationarity residual        = {residual:.3e}")
    print(f"Hessian minimum              = {float(np.min(hessian_eigs)):.12f}")
    print(f"full multistart gap          = {best_full.fun - free_energy(full_field):.3e}")
    print(f"vacuum orbit size            = {len(full_vacua)}")
    print("charge-word |V_CKM| =")
    print(np.abs(v_ud))
    print(f"charge-word J_CKM            = {jarlskog(v_ud):.12e}")
    print("charge-word |U_PMNS| =")
    print(np.abs(u_en))
    print(f"charge-word J_PMNS           = {jarlskog(u_en):.12e}")
    print(f"CKM diagnostic error         = {charge_ckm_error:.12f}")
    print(f"PMNS diagnostic error        = {charge_pmns_error:.12f}")
    print(f"best edge-pair CKM error      = {best_edge_ckm['error']:.12f}")
    print(f"best edge-pair PMNS error     = {best_edge_pmns['error']:.12f}")
    print(f"dressed selected branch       = {selected_composed['branch']}")
    print(f"dressed relative action       = {selected_composed['relative_action']:.12f}")
    print("dressed |V_CKM| =")
    print(np.asarray(selected_composed["ckm_abs"]))
    print(f"dressed J_CKM                 = {selected_composed['ckm_J']:.12e}")
    print("dressed |U_PMNS| =")
    print(np.asarray(selected_composed["pmns_abs"]))
    print(f"dressed J_PMNS                = {selected_composed['pmns_J']:.12e}")
    print(f"dressed CKM diagnostic error  = {selected_composed['ckm_frozen_diagnostic_error']:.12f}")
    print(f"dressed PMNS diagnostic error = {selected_composed['pmns_frozen_diagnostic_error']:.12f}")
    print("results                      =", json_path)
    print("data                         =", npz_path)
    print("report                       =", report_path)


if __name__ == "__main__":
    main(Path(__file__).resolve().parent)