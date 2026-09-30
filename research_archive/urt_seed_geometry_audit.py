#!/usr/bin/env python3
"""
URT centred-icosahedral seed audit.

Constructs directly from the 12 standard icosahedral vertices:
  * 12x12 adjacency matrix
  * 20 triangular faces
  * 42x13 vertex-edge coboundary d0
  * 20x42 edge-face coboundary d1
  * 20x12 unsigned face-vertex incidence B
  * Hodge ranks and Betti numbers
  * all 60 orientation-preserving A5 rotations
  * 3, 3', 5, 4_3 and 4_5 representation matrices
  * normalized A5 intertwiners into Hom(3,3')
  * representative edge K4 character projectors Q1,Q2,Q3
  * exact mixed 4_3 x 4_5 quadratic portal tensors to 3 and 3'

Outputs:
  urt_seed_geometry_matrices.npz
  urt_seed_geometry_report.txt
"""

from __future__ import annotations

import itertools
import math
from pathlib import Path

import numpy as np
from scipy import linalg as la


OUT_DIR = Path("/mnt/data")
TOL = 1.0e-8

phi = (1.0 + math.sqrt(5.0)) / 2.0

# ---------------------------------------------------------------------------
# 1. Standard icosahedral vertices, edge length 2
# ---------------------------------------------------------------------------

vertices = np.array(
    [
        [0.0, 1.0, phi],
        [0.0, 1.0, -phi],
        [0.0, -1.0, phi],
        [0.0, -1.0, -phi],
        [1.0, phi, 0.0],
        [1.0, -phi, 0.0],
        [-1.0, phi, 0.0],
        [-1.0, -phi, 0.0],
        [phi, 0.0, 1.0],
        [phi, 0.0, -1.0],
        [-phi, 0.0, 1.0],
        [-phi, 0.0, -1.0],
    ],
    dtype=float,
)

dist = np.linalg.norm(vertices[:, None, :] - vertices[None, :, :], axis=2)
adjacency = (np.abs(dist - 2.0) < TOL).astype(float)
np.fill_diagonal(adjacency, 0.0)

if not np.all(adjacency.sum(axis=1) == 5):
    raise RuntimeError("Icosahedral adjacency construction failed.")

# ---------------------------------------------------------------------------
# 2. Faces, consistently outward oriented
# ---------------------------------------------------------------------------

faces: list[tuple[int, int, int]] = []

for triple in itertools.combinations(range(12), 3):
    i, j, k = triple
    if adjacency[i, j] and adjacency[i, k] and adjacency[j, k]:
        tri = [i, j, k]
        x, y, z = vertices[tri]
        normal = np.cross(y - x, z - x)
        centre = (x + y + z) / 3.0
        if np.dot(normal, centre) < 0.0:
            tri = [i, k, j]
        faces.append(tuple(tri))

if len(faces) != 20:
    raise RuntimeError(f"Expected 20 faces, found {len(faces)}.")

# ---------------------------------------------------------------------------
# 3. Full centred cochain complex
# ---------------------------------------------------------------------------

shell_edges = sorted(
    {
        tuple(sorted((i, j)))
        for i in range(12)
        for j in range(i + 1, 12)
        if adjacency[i, j]
    }
)

spokes = [(i, 12) for i in range(12)]
edges = shell_edges + spokes

if len(shell_edges) != 30 or len(edges) != 42:
    raise RuntimeError("Edge construction failed.")

edge_index = {edge: idx for idx, edge in enumerate(edges)}

d0 = np.zeros((42, 13), dtype=float)
for edge_idx, (i, j) in enumerate(edges):
    d0[edge_idx, i] = -1.0
    d0[edge_idx, j] = 1.0

d1 = np.zeros((20, 42), dtype=float)
for face_idx, (i, j, k) in enumerate(faces):
    for a, b in ((i, j), (j, k), (k, i)):
        edge = tuple(sorted((a, b)))
        sign = 1.0 if (a, b) == edge else -1.0
        d1[face_idx, edge_index[edge]] = sign

chain_residual = np.linalg.norm(d1 @ d0)

rank_d0 = np.linalg.matrix_rank(d0, tol=1.0e-9)
rank_d1 = np.linalg.matrix_rank(d1, tol=1.0e-9)

b0 = 13 - rank_d0
b1 = 42 - rank_d0 - rank_d1
b2 = 20 - rank_d1

DX = np.block(
    [
        [np.zeros((13, 13)), d0.T, np.zeros((13, 20))],
        [d0, np.zeros((42, 42)), d1.T],
        [np.zeros((20, 13)), d1, np.zeros((20, 20))],
    ]
)

# ---------------------------------------------------------------------------
# 4. Unsigned face-vertex incidence and dual-face Laplacian
# ---------------------------------------------------------------------------

B = np.zeros((20, 12), dtype=float)
for face_idx, face in enumerate(faces):
    B[face_idx, list(face)] = 1.0

BTB_residual = np.linalg.norm(B.T @ B - (5.0 * np.eye(12) + 2.0 * adjacency))

face_adjacency = np.zeros((20, 20), dtype=float)
for i, j in itertools.combinations(range(20), 2):
    if len(set(faces[i]).intersection(faces[j])) == 2:
        face_adjacency[i, j] = 1.0
        face_adjacency[j, i] = 1.0

Lf = 3.0 * np.eye(20) - face_adjacency

# Outward unit face normals
face_normals = []

for face in faces:
    x, y, z = vertices[list(face)]
    normal = np.cross(y - x, z - x)
    normal /= np.linalg.norm(normal)
    if np.dot(normal, (x + y + z) / 3.0) < 0.0:
        normal = -normal
    face_normals.append(normal)

face_normals = np.asarray(face_normals)

N_gram_residual = np.linalg.norm(
    face_normals.T @ face_normals - (20.0 / 3.0) * np.eye(3)
)

face_triplet_residual = np.linalg.norm(
    Lf @ face_normals - (3.0 - math.sqrt(5.0)) * face_normals
)

# ---------------------------------------------------------------------------
# 5. Eigenspace helper
# ---------------------------------------------------------------------------

def eigenspace_symmetric(matrix: np.ndarray, eigenvalue: float, tol: float = 1.0e-7) -> np.ndarray:
    values, vectors = np.linalg.eigh(matrix)
    return vectors[:, np.abs(values - eigenvalue) < tol]


U3 = vertices.copy()
U3 = U3 @ np.linalg.inv(la.sqrtm(U3.T @ U3))
U3 = np.real_if_close(U3)

U3p = eigenspace_symmetric(adjacency, -math.sqrt(5.0))
U5 = eigenspace_symmetric(adjacency, -1.0)

H3 = eigenspace_symmetric(Lf, 3.0)
H5 = eigenspace_symmetric(Lf, 5.0)

shadow_kernel_residual = max(np.linalg.norm(B.T @ H3), np.linalg.norm(B.T @ H5))

# ---------------------------------------------------------------------------
# 6. Enumerate all 60 orientation-preserving icosahedral rotations
# ---------------------------------------------------------------------------

reference_indices = (0, 1, 4)
X_reference = vertices[list(reference_indices)].T
reference_gram = X_reference.T @ X_reference

rotations: list[np.ndarray] = []
vertex_permutations: list[tuple[int, ...]] = []

for images in itertools.permutations(range(12), 3):
    Y = vertices[list(images)].T

    if np.max(np.abs(Y.T @ Y - reference_gram)) > TOL:
        continue

    rotation = Y @ np.linalg.inv(X_reference)

    if np.max(np.abs(rotation.T @ rotation - np.eye(3))) > TOL:
        continue

    if np.linalg.det(rotation) < 1.0 - TOL:
        continue

    mapped_vertices = (rotation @ vertices.T).T
    permutation: list[int] = []
    valid = True

    for mapped_vertex in mapped_vertices:
        distances = np.linalg.norm(vertices - mapped_vertex, axis=1)
        target = int(np.argmin(distances))

        if distances[target] > 1.0e-7:
            valid = False
            break

        permutation.append(target)

    if valid and tuple(permutation) not in vertex_permutations:
        rotations.append(rotation)
        vertex_permutations.append(tuple(permutation))

if len(rotations) != 60:
    raise RuntimeError(f"Expected 60 rotations, found {len(rotations)}.")

face_lookup = {tuple(sorted(face)): idx for idx, face in enumerate(faces)}

vertex_permutation_matrices = []
face_permutation_matrices = []

for permutation in vertex_permutations:
    Pv = np.zeros((12, 12), dtype=float)
    for source, target in enumerate(permutation):
        Pv[target, source] = 1.0

    Pf = np.zeros((20, 20), dtype=float)
    for source_face, face in enumerate(faces):
        image = tuple(sorted(permutation[v] for v in face))
        target_face = face_lookup[image]
        Pf[target_face, source_face] = 1.0

    vertex_permutation_matrices.append(Pv)
    face_permutation_matrices.append(Pf)

rho3 = [U3.T @ P @ U3 for P in vertex_permutation_matrices]
rho3p = [U3p.T @ P @ U3p for P in vertex_permutation_matrices]
rho5 = [U5.T @ P @ U5 for P in vertex_permutation_matrices]
rhoH3 = [H3.T @ P @ H3 for P in face_permutation_matrices]
rhoH5 = [H5.T @ P @ H5 for P in face_permutation_matrices]

# Hom(3,3') action in column-major vectorization:
# vec(M) -> (rho3 \otimes rho3') vec(M)
rho_hom = [np.kron(R3, R3p) for R3, R3p in zip(rho3, rho3p)]

# ---------------------------------------------------------------------------
# 7. Character projectors in Hom(3,3')
# ---------------------------------------------------------------------------

chi4 = np.array([np.trace(R) for R in rhoH3])
chi5 = np.array([np.trace(R) for R in rho5])

Pi4 = sum(character * representation for character, representation in zip(chi4, rho_hom))
Pi4 *= 4.0 / 60.0

Pi5 = sum(character * representation for character, representation in zip(chi5, rho_hom))
Pi5 *= 5.0 / 60.0

# ---------------------------------------------------------------------------
# 8. Reynolds-polar normalized intertwiners
# ---------------------------------------------------------------------------

rng = np.random.default_rng(20260730)

def reynolds_polar_intertwiner(source_representation: list[np.ndarray], source_dimension: int) -> np.ndarray:
    seed = rng.normal(size=(9, source_dimension))

    averaged = sum(
        target @ seed @ source.T
        for target, source in zip(rho_hom, source_representation)
    ) / 60.0

    gram = averaged.T @ averaged
    values, vectors = np.linalg.eigh(gram)

    if np.min(values) <= 1.0e-12:
        raise RuntimeError("Reynolds seed failed to produce a full-rank intertwiner.")

    inverse_square_root = vectors @ np.diag(1.0 / np.sqrt(values)) @ vectors.T
    return averaged @ inverse_square_root


J43 = reynolds_polar_intertwiner(rhoH3, 4)
J45 = reynolds_polar_intertwiner(rhoH5, 4)
J5 = reynolds_polar_intertwiner(rho5, 5)

intertwiner_residual_43 = max(
    np.linalg.norm(target @ J43 - J43 @ source)
    for target, source in zip(rho_hom, rhoH3)
)

intertwiner_residual_45 = max(
    np.linalg.norm(target @ J45 - J45 @ source)
    for target, source in zip(rho_hom, rhoH5)
)

intertwiner_residual_5 = max(
    np.linalg.norm(target @ J5 - J5 @ source)
    for target, source in zip(rho_hom, rho5)
)

# ---------------------------------------------------------------------------
# 9. Representative edge K4 depth projectors
#
# Use edge (vertex 1, vertex 3) in one-based notation, i.e. (0,2).
# Its edge frame is the coordinate frame:
#   midpoint axis = z
#   difference axis = y
#   third K4 axis = x
# One C3 orientation orders z -> y -> x.
# ---------------------------------------------------------------------------

Q1 = np.diag([0.0, 0.0, 1.0])  # z-axis
Q2 = np.diag([0.0, 1.0, 0.0])  # y-axis
Q3 = np.diag([1.0, 0.0, 0.0])  # x-axis

Delta_symbolic_order = np.array([0, 1, 2], dtype=int)

# ---------------------------------------------------------------------------
# 10. Exact quadratic portal tensors
#
# h = H3 z3 + H5 z5 in face space.
# Visible vertex response:
#   q = U_out^T B^T (h \odot h).
#
# Because Sym^2(4) = 1 + 4 + 5, the 3 and 3' outputs vanish on the
# diagonal 4_3 x 4_3 and 4_5 x 4_5 blocks. They arise only from 4_3 x 4_5.
# ---------------------------------------------------------------------------

H_shadow = np.column_stack([H3, H5])

def quadratic_tensor(output_basis: np.ndarray) -> np.ndarray:
    face_to_output = B @ output_basis
    tensors = []

    for coordinate in range(output_basis.shape[1]):
        diagonal = np.diag(face_to_output[:, coordinate])
        tensors.append(H_shadow.T @ diagonal @ H_shadow)

    return np.asarray(tensors)


portal_tensor_3 = quadratic_tensor(U3)
portal_tensor_3p = quadratic_tensor(U3p)

# Bilinear mixed maps include factor 2 from (h3+h5)^2.
portal_map_3 = np.array(
    [2.0 * portal_tensor_3[i, :4, 4:].reshape(-1) for i in range(3)]
)

portal_map_3p = np.array(
    [2.0 * portal_tensor_3p[i, :4, 4:].reshape(-1) for i in range(3)]
)

singular_3 = np.linalg.svd(portal_map_3, compute_uv=False)
singular_3p = np.linalg.svd(portal_map_3p, compute_uv=False)

portal_block_residual = max(
    np.linalg.norm(portal_tensor_3[:, :4, :4]),
    np.linalg.norm(portal_tensor_3[:, 4:, 4:]),
    np.linalg.norm(portal_tensor_3p[:, :4, :4]),
    np.linalg.norm(portal_tensor_3p[:, 4:, 4:]),
)

portal_ratio = singular_3[0] / singular_3p[0]

# ---------------------------------------------------------------------------
# 11. Save matrices
# ---------------------------------------------------------------------------

np.savez_compressed(
    OUT_DIR / "urt_seed_geometry_matrices.npz",
    phi=phi,
    vertices=vertices,
    adjacency=adjacency,
    faces=np.asarray(faces, dtype=int),
    edges=np.asarray(edges, dtype=int),
    d0=d0,
    d1=d1,
    DX=DX,
    B=B,
    face_adjacency=face_adjacency,
    Lf=Lf,
    face_normals=face_normals,
    U3=U3,
    U3p=U3p,
    U5=U5,
    H3=H3,
    H5=H5,
    rotations=np.asarray(rotations),
    Pi4=Pi4,
    Pi5=Pi5,
    J43=J43,
    J45=J45,
    J5=J5,
    Q1=Q1,
    Q2=Q2,
    Q3=Q3,
    portal_tensor_3=portal_tensor_3,
    portal_tensor_3p=portal_tensor_3p,
    portal_map_3=portal_map_3,
    portal_map_3p=portal_map_3p,
)

# ---------------------------------------------------------------------------
# 12. Report
# ---------------------------------------------------------------------------

report = f"""
URT CENTRED-ICOSAHEDRAL SEED AUDIT
==================================

Geometry
--------
Vertices                         : 13 (12 shell + centre)
Edges                            : 42 (30 shell + 12 spokes)
Faces                            : 20
Every shell vertex degree        : {int(adjacency.sum(axis=1)[0])}
Number of A5 rotations           : {len(rotations)}

Cochain/Hodge audit
-------------------
||d1 d0||                        : {chain_residual:.3e}
rank(d0)                         : {rank_d0}
rank(d1)                         : {rank_d1}
Betti numbers                    : ({b0}, {b1}, {b2})
dim ker(DX)                      : {b0 + b1 + b2}

Incidence audit
---------------
||B^T B - (5I+2A)||              : {BTB_residual:.3e}
rank(B)                          : {np.linalg.matrix_rank(B)}
dim ker(B^T)                     : {20 - np.linalg.matrix_rank(B)}
||B^T H3|| or ||B^T H5||        : {shadow_kernel_residual:.3e}

Face-normal triplet
-------------------
||N^T N - (20/3)I||              : {N_gram_residual:.3e}
||Lf N - (3-sqrt(5))N||          : {face_triplet_residual:.3e}

Hom(3,3') character projectors
------------------------------
rank(Pi4)                        : {np.trace(Pi4):.12f}
rank(Pi5)                        : {np.trace(Pi5):.12f}
||Pi4^2-Pi4||                    : {np.linalg.norm(Pi4 @ Pi4 - Pi4):.3e}
||Pi5^2-Pi5||                    : {np.linalg.norm(Pi5 @ Pi5 - Pi5):.3e}
||Pi4+Pi5-I||                    : {np.linalg.norm(Pi4 + Pi5 - np.eye(9)):.3e}

Normalized intertwiners
-----------------------
||J43^T J43-I||                  : {np.linalg.norm(J43.T @ J43 - np.eye(4)):.3e}
||J45^T J45-I||                  : {np.linalg.norm(J45.T @ J45 - np.eye(4)):.3e}
||J5^T J5-I||                    : {np.linalg.norm(J5.T @ J5 - np.eye(5)):.3e}
equivariance residual J43        : {intertwiner_residual_43:.3e}
equivariance residual J45        : {intertwiner_residual_45:.3e}
equivariance residual J5         : {intertwiner_residual_5:.3e}

Representative edge depth projectors
------------------------------------
Q1 = diag(0,0,1)
Q2 = diag(0,1,0)
Q3 = diag(1,0,0)

R_Delta = Q1 + Delta Q2 + Delta^2 Q3
        = diag(Delta^2, Delta, 1)
in this representative edge frame.
The opposite C3 orientation swaps Q2 and Q3.

Quadratic portal
----------------
Diagonal triplet-block residual  : {portal_block_residual:.3e}
singular values 4_3 x 4_5 -> 3  : {singular_3}
singular values 4_3 x 4_5 -> 3' : {singular_3p}

Exact squared singular values:
  4_3 x 4_5 -> 3  : (20 + 8 sqrt(5))/15
  4_3 x 4_5 -> 3' : (20 - 8 sqrt(5))/15

Physical/conjugate amplitude ratio:
  s_3 / s_3' = {portal_ratio:.15f}
  phi^3       = {phi**3:.15f}

Power ratio:
  (s_3/s_3')^2 = phi^6 = {phi**6:.15f}

Key correction
--------------
The depth projectors Q1,Q2,Q3 are 3x3 projectors on the generation triplet.
They are not 9x9 projectors on the shadow cone.

The physical 3 and conjugate 3' quadratic portal channels are generated
only by the mixed 4_3 x 4_5 term. The diagonal 4_3 x 4_3 and 4_5 x 4_5
terms cannot generate triplets because:

  Sym^2(4) = 1 + 4 + 5.

This computation removes the claimed Clebsch-Gordan wall.
"""

(OUT_DIR / "urt_seed_geometry_report.txt").write_text(report.strip() + "\n", encoding="utf-8")

print(report.strip())
print()
print(f"Saved: {OUT_DIR / 'urt_seed_geometry_matrices.npz'}")
print(f"Saved: {OUT_DIR / 'urt_seed_geometry_report.txt'}")