
from __future__ import annotations

import json
import math
from collections import defaultdict
from pathlib import Path

import numpy as np
from scipy.linalg import expm

DATA = Path("/mnt/data/urt_seed_geometry_matrices.npz")
OUT = Path("/mnt/data")

z = np.load(DATA)
phi = float(z["phi"])
vertices = z["vertices"]
adjacency = z["adjacency"]
faces = z["faces"]
face_adjacency = z["face_adjacency"]
face_normals = z["face_normals"]
H3 = z["H3"]
H5 = z["H5"]
J43 = z["J43"]
J45 = z["J45"]
J5 = z["J5"]
rotations = z["rotations"]

delta = 3 / 20 - 80 * math.pi / (1053 * phi)
eta_delta = -math.log(delta)
eta_IR = phi**2 * eta_delta

# The shell depth uses the hidden-complement / visible-direction ratio.
eta_Q = (10 / 3) * eta_delta

# The dual-face route uses the already frozen IR entropy depth.
eta_L = eta_IR

# Frozen comparison targets used elsewhere in the project.
V_TARGET = np.array([0.224308861637, 0.042177509492, 0.003733784761])
JQ_TARGET = 3.141364407664e-5
S12_TARGET = 0.303463055248
S23_TARGET = 0.562129475821
S13_TARGET = 0.022689900267
U_TARGET = np.array([
    math.sqrt(S12_TARGET * (1 - S13_TARGET)),
    math.sqrt(S23_TARGET * (1 - S13_TARGET)),
    math.sqrt(S13_TARGET),
])

# ---------------------------------------------------------------------------
# A5 actions and the six unoriented fivefold axes
# ---------------------------------------------------------------------------

vertex_permutations = []
for R in rotations:
    p = []
    for v in vertices:
        p.append(int(np.argmin(np.linalg.norm(vertices - R @ v, axis=1))))
    vertex_permutations.append(tuple(p))

unit_vertices = vertices / np.linalg.norm(vertices, axis=1, keepdims=True)
vertex_antipode = {
    i: int(np.argmin(np.linalg.norm(unit_vertices + v, axis=1)))
    for i, v in enumerate(unit_vertices)
}
vertex_axis_pairs = sorted({
    tuple(sorted((i, vertex_antipode[i]))) for i in range(12)
})
vertex_axis_lookup = {pair: i for i, pair in enumerate(vertex_axis_pairs)}
vertex_axis_representatives = [pair[0] for pair in vertex_axis_pairs]

rho6 = []
axis_permutations = []
orders = []

for p in vertex_permutations:
    axis_perm = []
    for a, b in vertex_axis_pairs:
        image = tuple(sorted((p[a], p[b])))
        axis_perm.append(vertex_axis_lookup[image])

    P = np.zeros((6, 6))
    for source, target in enumerate(axis_perm):
        P[target, source] = 1.0

    rho6.append(P)
    axis_permutations.append(tuple(axis_perm))

    current = list(range(6))
    for n in range(1, 7):
        current = [axis_perm[current[i]] for i in range(6)]
        if current == list(range(6)):
            orders.append(n)
            break

rho6 = np.asarray(rho6)
order2 = [i for i, order in enumerate(orders) if order == 2]
order5 = [i for i, order in enumerate(orders) if order == 5]

def grading_basis(t_index: int) -> tuple[np.ndarray, np.ndarray]:
    permutation = axis_permutations[t_index]
    visited: set[int] = set()
    transpositions: list[tuple[int, int]] = []
    fixed: list[int] = []

    for i, j in enumerate(permutation):
        if i in visited:
            continue
        if i == j:
            fixed.append(i)
            visited.add(i)
        else:
            transpositions.append(tuple(sorted((i, j))))
            visited.update((i, j))

    transpositions = sorted(set(transpositions))
    fixed = sorted(fixed)
    E = np.eye(6)

    left = np.column_stack([
        (E[:, a] - E[:, b]) / math.sqrt(2)
        for a, b in transpositions
    ])
    right = np.column_stack(
        [
            (E[:, a] + E[:, b]) / math.sqrt(2)
            for a, b in transpositions
        ] + [E[:, i] for i in fixed]
    )
    return left, right

def full_support_forks(
    t_index: int,
    left: np.ndarray,
    right: np.ndarray,
) -> list[tuple[int, tuple[tuple[int, ...], tuple[int, ...]]]]:
    output = []
    seen = set()

    for r_index in order5:
        Y = right.T @ rho6[r_index] @ left
        if abs(np.sum(Y * Y) - 1.5) > 1e-9:
            continue
        if not np.all(np.linalg.norm(Y, axis=1) > 1e-10):
            continue

        arrows = [
            (a, i)
            for a in range(4)
            for i in range(2)
            if abs(Y[a, i]) > 1e-10
        ]
        partition = tuple(
            tuple(sorted(a for a, i in arrows if i == column))
            for column in (0, 1)
        )
        if partition not in seen:
            seen.add(partition)
            output.append((r_index, partition))

    return output

# ---------------------------------------------------------------------------
# Shell: six axes and fifteen antipodal edge ribbons
# ---------------------------------------------------------------------------

signed_K6 = np.zeros((6, 6), dtype=int)
for a, i in enumerate(vertex_axis_representatives):
    for b, j in enumerate(vertex_axis_representatives):
        if a == b:
            continue
        if adjacency[i, j] > 0.5:
            signed_K6[a, b] = 1
        elif adjacency[i, vertex_antipode[j]] > 0.5:
            signed_K6[a, b] = -1
        else:
            raise RuntimeError("The shell axis pair has no icosahedral edge.")

shell_edges = [
    (i, j)
    for i in range(12)
    for j in range(i + 1, 12)
    if adjacency[i, j] > 0.5
]

symmetric_basis = [
    np.diag([1, -1, 0]) / math.sqrt(2),
    np.diag([1, 1, -2]) / math.sqrt(6),
]
for a, b in ((0, 1), (0, 2), (1, 2)):
    M = np.zeros((3, 3))
    M[a, b] = M[b, a] = 1 / math.sqrt(2)
    symmetric_basis.append(M)
symmetric_basis = np.asarray(symmetric_basis)

def traceless_quadratic(u: np.ndarray) -> np.ndarray:
    return np.outer(u, u) - np.eye(3) / 3

edge_fiveplet = []
edge_H3 = []
edge_H5 = []

for i, j in shell_edges:
    X = (
        math.sqrt(15) / 4
        * (
            traceless_quadratic(unit_vertices[i])
            + traceless_quadratic(unit_vertices[j])
        )
    )
    edge_fiveplet.append([
        np.sum(B * X) for B in symmetric_basis
    ])

    adjacent_faces = np.array([
        1.0 if i in face and j in face else 0.0
        for face in faces
    ])
    edge_H3.append(H3.T @ adjacent_faces)
    edge_H5.append(H5.T @ adjacent_faces)

edge_fiveplet = np.asarray(edge_fiveplet)
edge_H3 = np.asarray(edge_H3)
edge_H5 = np.asarray(edge_H5)

vertex_to_axis = {}
for a, pair in enumerate(vertex_axis_pairs):
    for vertex in pair:
        vertex_to_axis[vertex] = a

axis_pair_edges: defaultdict[tuple[int, int], list[int]] = defaultdict(list)
for edge_index, (i, j) in enumerate(shell_edges):
    pair = tuple(sorted((vertex_to_axis[i], vertex_to_axis[j])))
    axis_pair_edges[pair].append(edge_index)

shell_fiveplet_even = np.zeros((6, 6, 5))
shell_H3_odd = np.zeros((6, 6, 4))
shell_H5_even = np.zeros((6, 6, 4))

for (a, b), edge_indices in axis_pair_edges.items():
    positive = [
        edge_index
        for edge_index in edge_indices
        if vertex_axis_representatives[a] in shell_edges[edge_index]
    ]
    if len(positive) != 1:
        raise RuntimeError("Unable to orient shell ribbon rails.")

    ep = positive[0]
    em = edge_indices[0] if edge_indices[1] == ep else edge_indices[1]

    shell_fiveplet_even[a, b] = shell_fiveplet_even[b, a] = (
        edge_fiveplet[ep] + edge_fiveplet[em]
    ) / math.sqrt(2)

    shell_H5_even[a, b] = shell_H5_even[b, a] = (
        edge_H5[ep] + edge_H5[em]
    ) / math.sqrt(2)

    shell_H3_odd[a, b] = (
        edge_H3[ep] - edge_H3[em]
    ) / math.sqrt(2)
    shell_H3_odd[b, a] = -shell_H3_odd[a, b]

# ---------------------------------------------------------------------------
# Dual face graph: twenty faces -> ten antipodal face axes -> Petersen quotient
# ---------------------------------------------------------------------------

unit_normals = face_normals / np.linalg.norm(
    face_normals, axis=1, keepdims=True
)
face_antipode = {
    i: int(np.argmin(np.linalg.norm(unit_normals + n, axis=1)))
    for i, n in enumerate(unit_normals)
}
face_axis_pairs = sorted({
    tuple(sorted((i, face_antipode[i]))) for i in range(20)
})
face_axis_representatives = [pair[0] for pair in face_axis_pairs]

face_to_axis = {}
for a, pair in enumerate(face_axis_pairs):
    for face in pair:
        face_to_axis[face] = a

dual_edges = [
    (i, j)
    for i in range(20)
    for j in range(i + 1, 20)
    if face_adjacency[i, j] > 0.5
]

face_axis_edge_pairs: defaultdict[
    tuple[int, int], list[tuple[int, int]]
] = defaultdict(list)

for i, j in dual_edges:
    pair = tuple(sorted((face_to_axis[i], face_to_axis[j])))
    face_axis_edge_pairs[pair].append((i, j))

dual_H3_odd = np.zeros((10, 10, 4))
dual_H5_even = np.zeros((10, 10, 4))
signed_Petersen = np.zeros((10, 10), dtype=int)

for (a, b), rails in face_axis_edge_pairs.items():
    positive = [
        rail for rail in rails
        if face_axis_representatives[a] in rail
    ]
    if len(positive) != 1:
        raise RuntimeError("Unable to orient dual-face ribbon rails.")

    rp = positive[0]
    rm = rails[0] if rails[1] == rp else rails[1]

    vp = np.zeros(20)
    vm = np.zeros(20)
    vp[list(rp)] = 1.0
    vm[list(rm)] = 1.0

    odd = (vp - vm) / math.sqrt(2)
    even = (vp + vm) / math.sqrt(2)

    x3 = H3.T @ odd
    x5 = H5.T @ even

    dual_H3_odd[a, b] = x3
    dual_H3_odd[b, a] = -x3
    dual_H5_even[a, b] = dual_H5_even[b, a] = x5

    signed_Petersen[a, b] = signed_Petersen[b, a] = (
        1 if face_axis_representatives[b] in rp else -1
    )

# Unsigned incidence between six vertex axes and ten antipodal face axes.
# Each face axis contains exactly three vertex axes.
unsigned_incidence = np.zeros((6, 10))

for face_axis, face_index in enumerate(face_axis_representatives):
    for vertex in faces[face_index]:
        unsigned_incidence[vertex_to_axis[int(vertex)], face_axis] = 1.0

# ---------------------------------------------------------------------------
# Correct Galois-sheet transfer
# ---------------------------------------------------------------------------
#
# J43, J45 and J5 take values in Hom(3,3'), not End(3).
# The transfer must therefore act on 3 plus 3' and be off-diagonal.
# The previous one-sheet multiplication is not used here.
# ---------------------------------------------------------------------------

def vec_to_matrix(v: np.ndarray) -> np.ndarray:
    return v.reshape(3, 3).T

def build_shell_bipartite(
    sign3: int,
    sign5: int,
) -> np.ndarray:
    T = np.zeros((36, 36), dtype=complex)

    for a in range(6):
        for b in range(a + 1, 6):
            for output_axis, input_axis in ((a, b), (b, a)):
                vector = (
                    (J5 @ shell_fiveplet_even[output_axis, input_axis]) / 7
                    + sign3
                    * (J43 @ shell_H3_odd[output_axis, input_axis]) / 3
                    + 1j
                    * sign5
                    * (J45 @ shell_H5_even[output_axis, input_axis]) / 5
                )
                M = vec_to_matrix(vector)

                prime_output = 18 + 3 * output_axis
                unprime_input = 3 * input_axis

                T[
                    prime_output:prime_output + 3,
                    unprime_input:unprime_input + 3,
                ] = M
                T[
                    unprime_input:unprime_input + 3,
                    prime_output:prime_output + 3,
                ] = M.conj().T

    return T

def build_face_bipartite(
    sign3: int,
    sign5: int,
) -> np.ndarray:
    T = np.zeros((60, 60), dtype=complex)

    for a in range(10):
        for b in range(a + 1, 10):
            if (
                np.linalg.norm(dual_H3_odd[a, b])
                + np.linalg.norm(dual_H5_even[a, b])
                < 1e-12
            ):
                continue

            for output_axis, input_axis in ((a, b), (b, a)):
                vector = (
                    sign3
                    * (J43 @ dual_H3_odd[output_axis, input_axis]) / 3
                    + 1j
                    * sign5
                    * (J45 @ dual_H5_even[output_axis, input_axis]) / 5
                )
                M = vec_to_matrix(vector)

                prime_output = 30 + 3 * output_axis
                unprime_input = 3 * input_axis

                T[
                    prime_output:prime_output + 3,
                    unprime_input:unprime_input + 3,
                ] = M
                T[
                    unprime_input:unprime_input + 3,
                    prime_output:prime_output + 3,
                ] = M.conj().T

    return T

def cross_sheet_heat(
    T: np.ndarray,
    eta: float,
    node_count: int,
) -> np.ndarray:
    eigenvalues = np.linalg.eigvalsh(T)
    alpha = float(eigenvalues[-1])
    K = expm(eta * (T - alpha * np.eye(T.shape[0])))
    size = 3 * node_count
    return K[size:, :size]

def chiral_blocks(
    cross_sheet: np.ndarray,
    left: np.ndarray,
    right: np.ndarray,
) -> np.ndarray:
    tensor = cross_sheet.reshape(6, 3, 6, 3)
    return np.einsum(
        "pa,pAqB,qi->aiAB",
        right,
        tensor,
        left,
        optimize=True,
    )

def diagonalize_left(M: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    values, vectors = np.linalg.eigh(M.conj().T @ M)
    order = np.argsort(values)
    singular = np.sqrt(np.maximum(values[order], 0.0))
    return singular, vectors[:, order]

def mixing(
    A: np.ndarray,
    B: np.ndarray,
) -> tuple[np.ndarray, np.ndarray, np.ndarray, float]:
    singular_A, U_A = diagonalize_left(A)
    singular_B, U_B = diagonalize_left(B)
    V = U_A.conj().T @ U_B
    J = float(np.imag(
        V[0, 0]
        * V[1, 1]
        * np.conj(V[0, 1])
        * np.conj(V[1, 0])
    ))
    return singular_A, singular_B, np.abs(V), J

def quark_score(V: np.ndarray, J: float) -> float:
    entries = np.array([V[0, 1], V[1, 2], V[0, 2]])
    eps = 1e-9
    score = np.sum(np.log((entries + eps) / (V_TARGET + eps)) ** 2)
    score += 0.15 * math.log(
        (abs(J) + eps) / (JQ_TARGET + eps)
    ) ** 2
    return float(score)

def lepton_score(U: np.ndarray) -> float:
    entries = np.array([U[0, 1], U[1, 2], U[0, 2]])
    eps = 1e-9
    return float(np.sum(
        np.log((entries + eps) / (U_TARGET + eps)) ** 2
    ))

def solve_quark() -> dict:
    best = None

    for sign3 in (1, -1):
        for sign5 in (1, -1):
            T = build_shell_bipartite(sign3, sign5)
            cross = cross_sheet_heat(T, eta_Q, 6)

            for t_index in order2:
                left, right = grading_basis(t_index)
                blocks = chiral_blocks(cross, left, right)

                for r_index, partition in full_support_forks(
                    t_index, left, right
                ):
                    for left_column in (0, 1):
                        rows = list(partition[left_column])

                        for u_row, d_row in (rows, rows[::-1]):
                            su, sd, V, J = mixing(
                                blocks[u_row, left_column],
                                blocks[d_row, left_column],
                            )
                            record = {
                                "score": quark_score(V, J),
                                "sign3": sign3,
                                "sign5": sign5,
                                "grading_index": t_index,
                                "holonomy_index": r_index,
                                "left_column": left_column,
                                "u_row": u_row,
                                "d_row": d_row,
                                "fork_partition": [
                                    list(x) for x in partition
                                ],
                                "CKM_abs": V.tolist(),
                                "J_CKM": J,
                                "spectra": {
                                    "u": (su / max(su)).tolist(),
                                    "d": (sd / max(sd)).tolist(),
                                },
                            }
                            if best is None or record["score"] < best["score"]:
                                best = record

    assert best is not None
    return best

def solve_lepton() -> dict:
    best = None
    B = np.kron(unsigned_incidence, np.eye(3))

    for sign3 in (1, -1):
        for sign5 in (1, -1):
            T = build_face_bipartite(sign3, sign5)
            face_cross = cross_sheet_heat(T, eta_L, 10)
            species_cross = B @ face_cross @ B.T

            for t_index in order2:
                left, right = grading_basis(t_index)
                blocks = chiral_blocks(species_cross, left, right)

                for r_index, partition in full_support_forks(
                    t_index, left, right
                ):
                    for left_column in (0, 1):
                        rows = list(partition[left_column])

                        for e_row, nu_row in (rows, rows[::-1]):
                            se, sn, U, J = mixing(
                                blocks[e_row, left_column],
                                blocks[nu_row, left_column],
                            )
                            record = {
                                "score": lepton_score(U),
                                "sign3": sign3,
                                "sign5": sign5,
                                "grading_index": t_index,
                                "holonomy_index": r_index,
                                "left_column": left_column,
                                "e_row": e_row,
                                "nu_row": nu_row,
                                "fork_partition": [
                                    list(x) for x in partition
                                ],
                                "PMNS_abs": U.tolist(),
                                "J_PMNS": J,
                                "spectra": {
                                    "e": (se / max(se)).tolist(),
                                    "nu": (sn / max(sn)).tolist(),
                                },
                            }
                            if best is None or record["score"] < best["score"]:
                                best = record

    assert best is not None
    return best

quark = solve_quark()
lepton = solve_lepton()

def mixing_angles(M: np.ndarray) -> dict:
    s13 = float(M[0, 2] ** 2)
    s12 = float(M[0, 1] ** 2 / (1 - s13))
    s23 = float(M[1, 2] ** 2 / (1 - s13))
    return {
        "sin2_theta12": s12,
        "sin2_theta23": s23,
        "sin2_theta13": s13,
    }

results = {
    "constants": {
        "phi": phi,
        "delta": delta,
        "eta_delta": eta_delta,
        "eta_Q_10_over_3_eta_delta": eta_Q,
        "eta_L_eta_IR": eta_L,
    },
    "exact_geometry": {
        "signed_K6": signed_K6.tolist(),
        "signed_K6_squared": (signed_K6 @ signed_K6).tolist(),
        "signed_K6_eigenvalues": np.linalg.eigvalsh(
            signed_K6
        ).tolist(),
        "signed_Petersen_eigenvalues": np.linalg.eigvalsh(
            signed_Petersen
        ).tolist(),
        "unsigned_incidence_gram": (
            unsigned_incidence @ unsigned_incidence.T
        ).tolist(),
        "shell_ribbon_norms": {
            "fiveplet_even": math.sqrt(2),
            "H3_odd": math.sqrt(4 / 5),
            "H5_even": math.sqrt(4 / 15),
        },
        "dual_ribbon_norms": {
            "H3_odd": math.sqrt(4 / 5),
            "H5_even": math.sqrt(4 / 15),
        },
    },
    "quark": quark,
    "lepton": lepton,
    "quark_angles": mixing_angles(np.asarray(quark["CKM_abs"])),
    "lepton_angles": mixing_angles(np.asarray(lepton["PMNS_abs"])),
}

(OUT / "urt_corrected_dual_ribbon_results.json").write_text(
    json.dumps(results, indent=2),
    encoding="utf-8",
)

report = f"""CORRECTED URT DUAL-RIBBON RESULT
================================

CENTRAL CORRECTION
------------------
J43, J45 and J5 take values in Hom(3,3'), not End(3).

The earlier 18x18 one-sheet ribbon calculation multiplied these 3x3
arrays as though they were endomorphisms of one triplet. That composition
was not valid.

The corrected transfer acts on both Galois sheets:

    (six axes) x (3 + 3')       for the shell,
    (ten face axes) x (3 + 3') for the dual face graph.

Every local ribbon matrix is inserted off-diagonally together with its
adjoint. The shell and dual propagators are therefore 36x36 and 60x60.

EXACT VISUAL GEOMETRY
---------------------
1. The icosahedral shell is the antipodal two-cover of a signed K6:

       S^2 = 5 I6,

   with eigenvalues -sqrt(5) x3 and +sqrt(5) x3.

2. The dodecahedral face graph is the antipodal two-cover of a signed
   Petersen graph on ten face axes.

3. Every shell or dual-face quotient edge is a two-rail ribbon.

4. Ribbon parity is exact:

       shell even -> fiveplet + H5,
       shell odd  -> H3,

       dual even  -> H5,
       dual odd   -> H3.

5. The unsigned six-axis / ten-face-axis incidence D satisfies

       D D^T = 3 I6 + 2 J6,

   with eigenvalues 15 x1 and 3 x5.

QUARK ROUTE
-----------
The shell route is evaluated at

    eta_Q = (10/3) eta_delta
          = {eta_Q:.15f}.

The best finite orientation/label branch is

|V_CKM| =
{np.asarray(quark["CKM_abs"])}

J_CKM = {quark["J_CKM"]:.12e}

Principal entries:

|V_us| = {quark["CKM_abs"][0][1]:.12f}
|V_cb| = {quark["CKM_abs"][1][2]:.12f}
|V_ub| = {quark["CKM_abs"][0][2]:.12f}

Normalized primitive transfer spectra:

u = {np.asarray(quark["spectra"]["u"])}
d = {np.asarray(quark["spectra"]["d"])}

LEPTON ROUTE
------------
The dual face/shadow route is evaluated at the already frozen IR depth

    eta_L = eta_IR
          = {eta_L:.15f}.

The colorless endpoint map is the unsigned incidence D.

|U_PMNS| =
{np.asarray(lepton["PMNS_abs"])}

J_PMNS = {lepton["J_PMNS"]:.12e}

Derived angle variables:

sin^2(theta12) = {results["lepton_angles"]["sin2_theta12"]:.12f}
sin^2(theta23) = {results["lepton_angles"]["sin2_theta23"]:.12f}
sin^2(theta13) = {results["lepton_angles"]["sin2_theta13"]:.12f}

Normalized primitive transfer spectra:

e  = {np.asarray(lepton["spectra"]["e"])}
nu = {np.asarray(lepton["spectra"]["nu"])}

SCIENTIFIC STATUS
-----------------
The corrected two-sheet architecture generates:

* hierarchical quark mixing;
* large lepton mixing;
* nonzero quark and lepton CP invariants;
* distinct noncommuting generation blocks from actual shell and dual paths.

It does not yet derive physical fermion mass ratios. The singular spectra
printed above are transfer spectra. No theorem currently identifies them
with renormalized pole or running masses.

The finite orientation and endpoint labels were selected by exhaustive
comparison with the frozen target matrices. They are discrete choices,
not continuous fitted coefficients, but this means the matrices are not
yet blind predictions.

The previous one-sheet near-CKM result at eta = (5/2) eta_delta is
withdrawn because its composition law was invalid.
"""

(OUT / "urt_corrected_dual_ribbon_report.txt").write_text(
    report,
    encoding="utf-8",
)

print(report)