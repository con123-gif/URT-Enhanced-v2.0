#!/usr/bin/env python3
"""
CATHEDRAL / URT FULL CLOSURE AUDIT

Reconstructs and tests, without observed particle or cosmological inputs:

1. Icosahedral A5 action and shell irreducible carriers 3, 3'.
2. Hidden face quartet 4 and the unique Clebsch map 4 -> Hom(3,3').
3. The complete covariance response F: Herm(4) -> Herm(3).
4. The 30-state oriented-edge mean-field completion in 5 + 3.
5. The full chiral edge vacuum and its Hessian.
6. The complex cone-quadrature charge-word Dirac operator.
7. Exact complex characteristic-polynomial identities.
8. Internal singular spectra, mixing matrices, Jarlskog invariants, and heat traces.

No observed masses, CKM/PMNS entries, gauge couplings, or cosmological targets
are used. The program prints only internal outputs of the declared operators.
"""

from __future__ import annotations

import itertools
import math
from collections import Counter

import networkx as nx
import numpy as np
from scipy.linalg import null_space
from scipy.optimize import root

TOL = 1.0e-9
SQRT5 = math.sqrt(5.0)
PHI = (1.0 + SQRT5) / 2.0
GAMMA = 1.0 / 81.0
DELTA = 3.0 / 20.0 - (1.0 - GAMMA) * math.pi / (13.0 * PHI)
ETA = -math.log(DELTA)


def permutation_matrix(p: tuple[int, ...]) -> np.ndarray:
    out = np.zeros((len(p), len(p)), dtype=float)
    out[list(p), np.arange(len(p))] = 1.0
    return out


def compose(p: tuple[int, ...], q: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(p[q[i]] for i in range(len(q)))


def inverse(p: tuple[int, ...]) -> tuple[int, ...]:
    ans = [0] * len(p)
    for i, j in enumerate(p):
        ans[j] = i
    return tuple(ans)


def group_order(p: tuple[int, ...], identity: tuple[int, ...]) -> int:
    cur = identity
    for n in range(1, 61):
        cur = compose(p, cur)
        if cur == identity:
            return n
    raise RuntimeError("Order exceeded 60")


# ---------------------------------------------------------------------------
# 1. ICOSAHEDRON AND A5
# ---------------------------------------------------------------------------

verts = []
for aa, bb in [(1.0, PHI), (1.0, -PHI), (-1.0, PHI), (-1.0, -PHI)]:
    verts.append((0.0, aa, bb))
    verts.append((aa, bb, 0.0))
    verts.append((bb, 0.0, aa))
verts = np.asarray(verts, dtype=float)
vunit = verts / np.linalg.norm(verts[0])

dist = np.linalg.norm(verts[:, None, :] - verts[None, :, :], axis=-1)
edge_len = np.min(dist[dist > 1.0e-10])
adj = np.isclose(dist, edge_len, atol=1.0e-10).astype(int)
np.fill_diagonal(adj, 0)
graph = nx.from_numpy_array(adj)
edges = list(graph.edges())

faces = [
    tuple(c)
    for c in itertools.combinations(range(12), 3)
    if adj[c[0], c[1]] and adj[c[0], c[2]] and adj[c[1], c[2]]
]
face_index = {frozenset(f): i for i, f in enumerate(faces)}

group: list[tuple[int, ...]] = []
rotations: dict[tuple[int, ...], np.ndarray] = {}
for mapping in nx.algorithms.isomorphism.GraphMatcher(graph, graph).isomorphisms_iter():
    p_arr = np.asarray([mapping[i] for i in range(12)], dtype=int)
    rt, *_ = np.linalg.lstsq(verts, verts[p_arr], rcond=None)
    rot = rt.T
    err = np.max(np.abs(verts @ rot.T - verts[p_arr]))
    if err < 1.0e-8 and np.linalg.det(rot) > 0.9:
        p = tuple(p_arr.tolist())
        group.append(p)
        rotations[p] = rot

assert len(group) == 60
identity = tuple(range(12))

lap_shell = np.diag(adj.sum(axis=1)) - adj
evals, evecs = np.linalg.eigh(lap_shell)
q3 = evecs[:, np.isclose(evals, 5.0 - SQRT5, atol=TOL)]
q3p = evecs[:, np.isclose(evals, 5.0 + SQRT5, atol=TOL)]

incidence = np.zeros((20, 12), dtype=float)
for i, f in enumerate(faces):
    incidence[i, list(f)] = 1.0

adj_face = np.zeros((20, 20), dtype=float)
for i in range(20):
    for j in range(i + 1, 20):
        if len(set(faces[i]).intersection(faces[j])) == 2:
            adj_face[i, j] = adj_face[j, i] = 1.0
lap_face = np.diag(adj_face.sum(axis=1)) - adj_face

_, _, vh = np.linalg.svd(incidence.T, full_matrices=True)
rank_b = np.linalg.matrix_rank(incidence.T, tol=1.0e-10)
q_hidden = vh.T[:, rank_b:]
hidden_evals, hidden_vecs = np.linalg.eigh(q_hidden.T @ lap_face @ q_hidden)
q4 = q_hidden @ hidden_vecs[:, np.isclose(hidden_evals, 3.0, atol=TOL)]

reps: dict[tuple[int, ...], tuple[np.ndarray, np.ndarray, np.ndarray]] = {}
for p in group:
    pv = permutation_matrix(p)
    pf = tuple(face_index[frozenset(p[v] for v in f)] for f in faces)
    pface = permutation_matrix(pf)
    reps[p] = (
        q3.T @ pv @ q3,
        q3p.T @ pv @ q3p,
        q4.T @ pface @ q4,
    )


# ---------------------------------------------------------------------------
# 2. UNIQUE CLEBSCH 4 -> Hom(3,3')
# ---------------------------------------------------------------------------

constraints = []
for p in group:
    r3, r3p, r4 = reps[p]
    r_hom = np.kron(r3, r3p)
    constraints.append(
        np.kron(np.eye(4), r_hom) - np.kron(r4.T, np.eye(9))
    )
clebsch_null = null_space(np.vstack(constraints))
assert clebsch_null.shape[1] == 1

clebsch = clebsch_null[:, 0].reshape((9, 4), order="F")
clebsch /= math.sqrt(float(np.trace(clebsch.T @ clebsch)) / 4.0)
assert np.max(np.abs(clebsch.T @ clebsch - np.eye(4))) < 1.0e-8


def t_of_h(h: np.ndarray) -> np.ndarray:
    return (clebsch @ h).reshape((3, 3), order="F")


# ---------------------------------------------------------------------------
# 3. S3 CHARGE PLANE -> HIDDEN QUARTET
# ---------------------------------------------------------------------------

orders = {p: group_order(p, identity) for p in group}
r = next(p for p in group if orders[p] == 3)
r2 = compose(r, r)
c3 = {identity, r, r2}

normalizer = []
for p in group:
    pinv = inverse(p)
    conjugate = {compose(compose(p, h), pinv) for h in c3}
    if conjugate == c3:
        normalizer.append(p)
assert len(normalizer) == 6

s = next(
    p for p in normalizer
    if orders[p] == 2 and compose(compose(p, r), p) == inverse(r)
)

b2 = np.array([[1.0, -1.0, 0.0], [1.0, 1.0, -2.0]], dtype=float).T
b2, _ = np.linalg.qr(b2)

r_slot = (1, 2, 0)
s_slot = (1, 0, 2)
r2r = b2.T @ permutation_matrix(r_slot) @ b2
r2s = b2.T @ permutation_matrix(s_slot) @ b2
r4r = reps[r][2]
r4s = reps[s][2]

j_constraints = np.vstack([
    np.kron(np.eye(2), r4r) - np.kron(r2r.T, np.eye(4)),
    np.kron(np.eye(2), r4s) - np.kron(r2s.T, np.eye(4)),
])
j_null = null_space(j_constraints)
assert j_null.shape[1] == 1

j_embed = j_null[:, 0].reshape((4, 2), order="F")
j_embed /= math.sqrt(float(np.trace(j_embed.T @ j_embed)) / 2.0)
assert np.max(np.abs(j_embed.T @ j_embed - np.eye(2))) < 1.0e-8


def charge_coords(q: np.ndarray) -> np.ndarray:
    q = np.asarray(q)
    if abs(np.sum(q)) > 1.0e-10:
        raise ValueError("Charge word must sum to zero")
    return b2.T @ q


def quadratic_covariant(q: np.ndarray) -> np.ndarray:
    aa, bb, cc = np.asarray(q, dtype=float)
    raw = np.array([bb * cc, cc * aa, aa * bb], dtype=float)
    return raw - np.mean(raw)


# ---------------------------------------------------------------------------
# 4. COMPLETE COVARIANCE RESPONSE F: Herm(4) -> Herm(3)
# ---------------------------------------------------------------------------

c_mats = [t_of_h(np.eye(4)[i]) for i in range(4)]


def f_response(s4: np.ndarray) -> np.ndarray:
    out = np.zeros((3, 3), dtype=complex)
    for aa in range(4):
        for bb in range(4):
            out += s4[aa, bb] * (c_mats[aa].conj().T @ c_mats[bb])
    return out


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


hb4 = hermitian_basis(4)
hb3 = hermitian_basis(3)

f_matrix = np.zeros((9, 16), dtype=float)
for j_col, source in enumerate(hb4):
    target = f_response(source)
    for i_row, basis in enumerate(hb3):
        f_matrix[i_row, j_col] = float(
            np.real(np.trace(basis.conj().T @ target))
        )

f_singular = np.linalg.svd(f_matrix, compute_uv=False)
expected_f_singular = np.array(
    [2.0 / math.sqrt(3.0)]
    + [math.sqrt(2.0 / 3.0)] * 5
    + [math.sqrt(2.0) / 3.0] * 3
)
assert np.max(np.abs(np.sort(f_singular)[::-1] - expected_f_singular)) < 1.0e-8


# Intertwiner from the numerical triplet basis to geometric R^3.
geom_constraints = []
for p in group:
    r3 = reps[p][0]
    geom_constraints.append(
        np.kron(np.eye(3), rotations[p]) - np.kron(r3.T, np.eye(3))
    )
geom_null = null_space(np.vstack(geom_constraints))
assert geom_null.shape[1] == 1
o_map = geom_null[:, 0].reshape((3, 3), order="F")
o_map /= math.sqrt(float(np.trace(o_map.T @ o_map)) / 3.0)
assert np.max(np.abs(o_map.T @ o_map - np.eye(3))) < 1.0e-8


def coordinates(mat: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    return np.array(
        [float(np.real(np.trace(b.conj().T @ mat))) for b in basis],
        dtype=float,
    )


def from_coordinates(coords: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    out = np.zeros_like(basis[0])
    for val, basis_mat in zip(coords, basis):
        out += val * basis_mat
    return out


BETA5 = math.sqrt(2.0 / 3.0)
BETA3 = math.sqrt(2.0) / 3.0


def cross_matrix(x: np.ndarray) -> np.ndarray:
    x = np.asarray(x, dtype=float)
    return np.array(
        [[0.0, -x[2], x[1]], [x[2], 0.0, -x[0]], [-x[1], x[0], 0.0]],
        dtype=float,
    )


def j5_source(x_q3: np.ndarray) -> np.ndarray:
    target_coords = coordinates(x_q3, hb3)
    source_coords = f_matrix.T @ target_coords / BETA5
    return np.real_if_close(from_coordinates(source_coords, hb4))


def j3_source(m_q3: np.ndarray) -> np.ndarray:
    target = 1j * cross_matrix(m_q3) / math.sqrt(2.0)
    target_coords = coordinates(target, hb3)
    source_coords = f_matrix.T @ target_coords / BETA3
    return from_coordinates(source_coords, hb4)


# ---------------------------------------------------------------------------
# 5. 30-STATE ORIENTED EDGE ALPHABET IN 5 + 3
# ---------------------------------------------------------------------------

edge_data = []
for i, j in edges:
    u = vunit[i]
    v = vunit[j]
    q_u = np.outer(u, u) - np.eye(3) / 3.0
    q_v = np.outer(v, v) - np.eye(3) / 3.0
    x_edge = math.sqrt(15.0) / 4.0 * (q_u + q_v)
    m_edge = (u + v) / np.linalg.norm(u + v)
    assert abs(np.linalg.norm(x_edge, "fro") - 1.0) < 1.0e-10
    assert abs(np.linalg.norm(m_edge) - 1.0) < 1.0e-10
    edge_data.append((i, j, x_edge, m_edge))
assert len(edge_data) == 30

# Exact pair-distribution relative to a reference oriented edge.
x_ref = edge_data[0][2]
m_ref = edge_data[0][3]
dot_pairs = Counter()
for _, _, x_edge, m_edge in edge_data:
    dot_pairs[
        (
            round(float(np.tensordot(x_ref, x_edge, axes=2)), 12),
            round(float(m_ref @ m_edge), 12),
        )
    ] += 1

# Orthonormal fiveplet basis Sym^2_0(R^3).
e5 = [
    np.diag([1.0, -1.0, 0.0]) / math.sqrt(2.0),
    np.diag([1.0, 1.0, -2.0]) / math.sqrt(6.0),
]
for i, j in [(0, 1), (0, 2), (1, 2)]:
    mat = np.zeros((3, 3), dtype=float)
    mat[i, j] = mat[j, i] = 1.0 / math.sqrt(2.0)
    e5.append(mat)

alphabet = []
for _, _, x_edge, m_edge in edge_data:
    x_coords = np.array([np.tensordot(b, x_edge, axes=2) for b in e5])
    alphabet.append(np.concatenate([x_coords, m_edge]))
alphabet = np.asarray(alphabet)

x_frame = alphabet[:, :5].T @ alphabet[:, :5] / 30.0
m_frame = alphabet[:, 5:].T @ alphabet[:, 5:] / 30.0
cross_frame = alphabet[:, :5].T @ alphabet[:, 5:] / 30.0
assert np.max(np.abs(x_frame - np.eye(5) / 5.0)) < 1.0e-10
assert np.max(np.abs(m_frame - np.eye(3) / 3.0)) < 1.0e-10
assert np.max(np.abs(cross_frame)) < 1.0e-10

# Solve the full stabilizer-fixed problem for one oriented edge.
#
# The stabilizer of an oriented edge is C2. Its fixed subspace has dimension
# three inside the fiveplet and dimension one inside the triplet. A two-variable
# ansatz H = r X_e, xi = t m_e is therefore only a radial restriction and is
# not the exact full stationary problem.

i0, j0, x0, m0 = edge_data[0]
u0 = vunit[i0]
v0 = vunit[j0]
d0_vec = (u0 - v0) / np.linalg.norm(u0 - v0)
n0_vec = np.cross(m0, d0_vec)
n0_vec /= np.linalg.norm(n0_vec)
edge_frame = np.column_stack([m0, d0_vec, n0_vec])

# Orthonormal C2-fixed fiveplet basis in the edge frame.
e_a = edge_frame @ np.diag([2.0, -1.0, -1.0]) @ edge_frame.T / math.sqrt(6.0)
e_b = edge_frame @ np.diag([0.0, 1.0, -1.0]) @ edge_frame.T / math.sqrt(2.0)
e_c_local = np.array(
    [[0.0, 0.0, 0.0],
     [0.0, 0.0, 1.0 / math.sqrt(2.0)],
     [0.0, 1.0 / math.sqrt(2.0), 0.0]],
    dtype=float,
)
e_c = edge_frame @ e_c_local @ edge_frame.T

def five_coords(mat: np.ndarray) -> np.ndarray:
    return np.array([np.tensordot(b, mat, axes=2) for b in e5])

fixed_basis = np.column_stack([
    np.concatenate([five_coords(e_a), np.zeros(3)]),
    np.concatenate([five_coords(e_b), np.zeros(3)]),
    np.concatenate([five_coords(e_c), np.zeros(3)]),
    np.concatenate([np.zeros(5), m0]),
])
assert np.max(np.abs(fixed_basis.T @ fixed_basis - np.eye(4))) < 1.0e-10


def free_energy_field(field: np.ndarray) -> float:
    exponents = ETA * (alphabet @ field)
    max_exp = float(np.max(exponents))
    log_mean = max_exp + math.log(float(np.mean(np.exp(exponents - max_exp))))
    return 0.5 * float(field @ field) - log_mean / ETA


def mean_field(field: np.ndarray) -> np.ndarray:
    exponents = ETA * (alphabet @ field)
    exponents -= np.max(exponents)
    weights = np.exp(exponents)
    weights /= np.sum(weights)
    return weights @ alphabet


def fixed_equations_4(coeffs: np.ndarray) -> np.ndarray:
    field = fixed_basis @ coeffs
    return coeffs - fixed_basis.T @ mean_field(field)


# The stable chiral branch is reached from the aligned edge initial condition.
full_root = root(
    fixed_equations_4,
    np.array([0.92, 0.37, 0.0, 0.99], dtype=float),
)
assert full_root.success
A_CHIRAL, B_CHIRAL, C_CHIRAL, T_CHIRAL = [
    float(x) for x in full_root.x
]
FULL_FIELD = fixed_basis @ full_root.x
assert np.linalg.norm(FULL_FIELD - mean_field(FULL_FIELD)) < 1.0e-8

H_CHIRAL = A_CHIRAL * e_a + B_CHIRAL * e_b + C_CHIRAL * e_c
XI_CHIRAL = T_CHIRAL * m0
R_CHIRAL = float(np.linalg.norm(H_CHIRAL))


def hessian_field(field: np.ndarray) -> np.ndarray:
    exponents = ETA * (alphabet @ field)
    exponents -= np.max(exponents)
    weights = np.exp(exponents)
    weights /= np.sum(weights)
    mean = weights @ alphabet
    centred = alphabet - mean
    covariance = centred.T @ (weights[:, None] * centred)
    return np.eye(8) - ETA * covariance


hessian_chiral = np.linalg.eigvalsh(hessian_field(FULL_FIELD))
assert np.min(hessian_chiral) > 0.0

# Retain the old fiveplet-only stationary point and test it in all eight
# directions. It is a saddle once the oriented triplet is admitted.
def fiveplet_radial_equation(x: np.ndarray) -> np.ndarray:
    field = np.concatenate([x[0] * five_coords(x0), np.zeros(3)])
    mean = mean_field(field)
    return np.array([x[0] - mean[:5] @ five_coords(x0)])


fiveplet_root = root(fiveplet_radial_equation, np.array([0.90]))
R_FIVE = float(fiveplet_root.x[0])
FIVE_FIELD = np.concatenate([R_FIVE * five_coords(x0), np.zeros(3)])
hessian_five = np.linalg.eigvalsh(hessian_field(FIVE_FIELD))

# Build the source covariance and target generation response.
h_chiral_q3 = o_map.T @ H_CHIRAL @ o_map
m0_q3 = o_map.T @ m0
j5 = j5_source(h_chiral_q3)
j3 = j3_source(m0_q3)

source_covariance = (
    np.eye(4) + j5 + T_CHIRAL * j3
) / 9.0
source_cov_eigs = np.linalg.eigvalsh(source_covariance)
assert np.min(source_cov_eigs) > 0.0

generation_response = f_response(source_covariance)
generation_eigs = np.linalg.eigvalsh(generation_response)
generation_singular = np.sqrt(generation_eigs)

# The fiveplet is diagonal in the edge frame on the stable branch.
h_diag = np.diag(edge_frame.T @ H_CHIRAL @ edge_frame)
h_m, h_d, h_n = [float(x) for x in h_diag]
theta_intrinsic = 0.5 * math.atan2(
    2.0 * (T_CHIRAL / 27.0),
    (math.sqrt(2.0 / 3.0) / 9.0) * (h_d - h_n),
)

# For orbit enumeration, rotate the complete reference order parameter through
# A5. The stabilizer has order two, so there are exactly 30 vacua.
full_vacua = []
for p in group:
    rot = rotations[p]
    h_rot = rot @ H_CHIRAL @ rot.T
    xi_rot = rot @ XI_CHIRAL
    field_rot = np.concatenate([five_coords(h_rot), xi_rot])
    if all(np.linalg.norm(field_rot - old) > 1.0e-8 for old in full_vacua):
        full_vacua.append(field_rot)
assert len(full_vacua) == 30

edge_unitaries = []
for field in full_vacua:
    h_mat = sum(field[i] * e5[i] for i in range(5))
    xi_vec = field[5:]
    response = (
        4.0 / 27.0 * np.eye(3)
        + math.sqrt(2.0 / 3.0) / 9.0 * h_mat
        + 1j / 27.0 * cross_matrix(xi_vec)
    )
    _, unitary = np.linalg.eigh(response)
    edge_unitaries.append(unitary)

def jarlskog(v: np.ndarray) -> float:
    return float(
        np.imag(v[0, 0] * v[1, 1] * np.conj(v[0, 1]) * np.conj(v[1, 0]))
    )


mixing_classes: dict[tuple[float, ...], dict[str, object]] = {}
for i in range(30):
    for j in range(30):
        mix = edge_unitaries[i].conj().T @ edge_unitaries[j]
        key = tuple(np.round(np.abs(mix).flatten(), 10))
        if key not in mixing_classes:
            mixing_classes[key] = {"count": 0, "j_values": set()}
        mixing_classes[key]["count"] = int(mixing_classes[key]["count"]) + 1
        mixing_classes[key]["j_values"].add(round(jarlskog(mix), 12))


# ---------------------------------------------------------------------------
# 6. COMPLEX CONE-QUADRATURE CHARGE-WORD DIRAC OPERATOR
# ---------------------------------------------------------------------------

words = {
    "u": np.array([1.0, 3.0, -4.0]),
    "d": np.array([1.0, -3.0, 2.0]),
    "e": np.array([-3.0, -3.0, 6.0]),
    "nu": np.array([-3.0, 3.0, 0.0]),
}
multiplicity = {"u": 3, "d": 3, "e": 1, "nu": 1}


def complex_word(q: np.ndarray) -> np.ndarray:
    g = quadratic_covariant(q)
    return q / 3.0 + 1j * DELTA * g / 5.0


def dirac_from_word(w: np.ndarray) -> np.ndarray:
    hidden = j_embed @ charge_coords(w)
    return t_of_h(hidden)


def complex_polynomial_invariants(w: np.ndarray) -> tuple[float, float, float]:
    n_inv = float(np.vdot(w, w).real)
    s_inv = complex(np.dot(w, w))
    p_inv = complex(np.prod(w))
    e2 = 8.0 * n_inv * n_inv / 27.0 - 5.0 * abs(s_inv) ** 2 / 108.0
    det_k = 20.0 * abs(p_inv) ** 2 / 27.0
    return n_inv, e2, det_k


sectors = {}
a_trace = 0.0
b_trace = 0.0
for name, q in words.items():
    w = complex_word(q)
    t_mat = dirac_from_word(w)
    k_mat = t_mat.conj().T @ t_mat
    eigvals, eigvecs = np.linalg.eigh(k_mat)
    singular = np.sqrt(np.maximum(eigvals, 0.0))

    n_inv = float(np.vdot(w, w).real)
    s_inv = complex(np.dot(w, w))
    p_inv = complex(np.prod(w))

    trace2_formula = n_inv
    trace4_formula = (
        11.0 * n_inv * n_inv / 27.0
        + 5.0 * abs(s_inv) ** 2 / 54.0
    )
    det_formula = 20.0 * abs(p_inv) ** 2 / 27.0

    assert abs(float(np.trace(k_mat).real) - trace2_formula) < 1.0e-8
    assert abs(float(np.trace(k_mat @ k_mat).real) - trace4_formula) < 1.0e-8
    assert abs(float(np.linalg.det(k_mat).real) - det_formula) < 1.0e-8

    n_poly, e2_poly, det_poly = complex_polynomial_invariants(w)
    roots = np.sort(
        np.real_if_close(
            np.roots([1.0, -n_poly, e2_poly, -det_poly])
        ).astype(float)
    )
    assert np.max(np.abs(roots - eigvals)) < 1.0e-8

    sectors[name] = {
        "w": w,
        "t": t_mat,
        "k": k_mat,
        "eigenvalues": eigvals,
        "singular": singular,
        "unitary": eigvecs,
    }
    a_trace += multiplicity[name] * float(np.trace(k_mat).real)
    b_trace += multiplicity[name] * float(np.trace(k_mat @ k_mat).real)

a_formula = 16.0 * (100.0 + 183.0 * DELTA**2) / 75.0
b_formula = (
    976.0 / 27.0
    + (946432.0 / 6075.0) * DELTA**2
    + (420592.0 / 1875.0) * DELTA**4
)
assert abs(a_trace - a_formula) < 1.0e-8
assert abs(b_trace - b_formula) < 1.0e-8

v_ud = sectors["u"]["unitary"].conj().T @ sectors["d"]["unitary"]
u_en = sectors["e"]["unitary"].conj().T @ sectors["nu"]["unitary"]


# ---------------------------------------------------------------------------
# 7. REPORT
# ---------------------------------------------------------------------------

np.set_printoptions(precision=12, suppress=True)

print("=" * 80)
print("CATHEDRAL / URT FULL CLOSURE AUDIT")
print("=" * 80)
print("phi                         =", format(PHI, ".15f"))
print("Delta                       =", format(DELTA, ".15f"))
print("eta_Delta                   =", format(ETA, ".15f"))
print()

print("A5 / CLEBSCH")
print("  group order                =", len(group))
print("  Clebsch multiplicity       =", clebsch_null.shape[1])
print("  F singular values          =", f_singular)
print("  expected                   =", expected_f_singular)
print()

print("ORIENTED EDGE ALPHABET")
print("  exact (X0.Xe, m0.me) counts:")
for key, value in sorted(dot_pairs.items()):
    print("   ", key, "x", value)
print("  origin Hessian 5-sector    =", 1.0 - ETA / 5.0)
print("  origin Hessian 3-sector    =", 1.0 - ETA / 3.0)
print("  old fiveplet-only root     =", format(R_FIVE, ".15f"))
print("  old root full min Hessian  =", format(float(np.min(hessian_five)), ".15f"))
print("  full C2 coefficients       =", (A_CHIRAL, B_CHIRAL, C_CHIRAL, T_CHIRAL))
print("  fiveplet norm              =", format(R_CHIRAL, ".15f"))
print("  full chiral potential      =", format(free_energy_field(FULL_FIELD), ".15f"))
print("  full Hessian eigenvalues   =", hessian_chiral)
print("  source covariance eigen    =", source_cov_eigs)
print("  generation K eigenvalues   =", generation_eigs)
print("  generation singular values =", generation_singular)
print("  intrinsic angle degrees    =", theta_intrinsic * 180.0 / math.pi)
print("  pairwise mixing classes    =", len(mixing_classes))
print(
    "  pairwise |J| values        =",
    sorted({abs(v) for d in mixing_classes.values() for v in d["j_values"]}),
)
print()

print("COMPLEX CONE-QUADRATURE DIRAC")
print("  universal polynomial:")
print("    lambda^3 - n lambda^2")
print("    + [8 n^2/27 - 5 |s|^2/108] lambda")
print("    - 20 |p|^2/27")
for name in ["u", "d", "e", "nu"]:
    print(" ", name, "singular =", sectors[name]["singular"])
print("  weighted a trace           =", format(a_trace, ".15f"))
print("  weighted b trace           =", format(b_trace, ".15f"))
print("  b/a^2                      =", format(b_trace / (a_trace * a_trace), ".15f"))
print()

print("INTERNAL MIXING OUTPUTS")
print("  |U_u^* U_d| =")
print(np.abs(v_ud))
print("  J_ud =", format(jarlskog(v_ud), ".15f"))
print("  |U_e^* U_nu| =")
print(np.abs(u_en))
print("  J_e_nu =", format(jarlskog(u_en), ".15f"))
print()

print("AUDIT CONCLUSION")
print("  * The 15-state fiveplet root is a saddle after the oriented triplet is included.")
print("  * The minimal joint 30-state completion has 30 stable chiral edge vacua.")
print("  * The complex 4_3 + i 4_5 quadrature gives an exact CP-capable cubic polynomial.")
print("  * The resulting dimensionless spectra and mixing matrices are fixed internal outputs.")
print("  * Absolute masses and couplings still require a declared action normalization and scale.")