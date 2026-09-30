import itertools
import math

import networkx as nx
import numpy as np
from scipy.linalg import null_space

# CATHEDRAL FINITE DIRAC TRACE AUDIT
# Reconstructs:
#   1) the icosahedral A5 action,
#   2) 3, 3', and hidden 4 carriers,
#   3) the unique 4 -> Hom(3,3') Clebsch embedding,
#   4) the S3 charge-plane -> hidden-4 embedding,
#   5) basis-invariant finite Dirac traces.
#
# No observed masses, CKM values, or gauge targets are used.

TOL = 1.0e-9
phi = (1.0 + math.sqrt(5.0)) / 2.0
gamma = 1.0 / 81.0
Delta = 3.0 / 20.0 - (1.0 - gamma) * math.pi / (13.0 * phi)

# ---------------------------------------------------------------------
# ICOSAHEDRON
# ---------------------------------------------------------------------

verts = []
for a, b in [(1.0, phi), (1.0, -phi), (-1.0, phi), (-1.0, -phi)]:
    verts.append((0.0, a, b))
    verts.append((a, b, 0.0))
    verts.append((b, 0.0, a))
verts = np.asarray(verts, dtype=float)

dist = np.linalg.norm(verts[:, None, :] - verts[None, :, :], axis=-1)
edge_len = np.min(dist[dist > 1.0e-10])
A = np.isclose(dist, edge_len, atol=1.0e-10).astype(int)
np.fill_diagonal(A, 0)

graph = nx.from_numpy_array(A)

faces = [
    tuple(c)
    for c in itertools.combinations(range(12), 3)
    if A[c[0], c[1]] and A[c[0], c[2]] and A[c[1], c[2]]
]
face_index = {frozenset(f): i for i, f in enumerate(faces)}

# ---------------------------------------------------------------------
# ORIENTATION-PRESERVING ICOSAHEDRAL GROUP = A5
# ---------------------------------------------------------------------

group = []
for mapping in nx.algorithms.isomorphism.GraphMatcher(graph, graph).isomorphisms_iter():
    p = np.asarray([mapping[i] for i in range(12)], dtype=int)
    RT, *_ = np.linalg.lstsq(verts, verts[p], rcond=None)
    R = RT.T
    err = np.max(np.abs(verts @ R.T - verts[p]))
    if err < 1.0e-8 and np.linalg.det(R) > 0.9:
        group.append(tuple(p.tolist()))

assert len(group) == 60
group_index = {p: i for i, p in enumerate(group)}
identity = tuple(range(12))


def compose(p, q):
    return tuple(p[q[i]] for i in range(len(q)))


def inverse(p):
    ans = [0] * len(p)
    for i, j in enumerate(p):
        ans[j] = i
    return tuple(ans)


def order(p):
    cur = identity
    for n in range(1, 61):
        cur = compose(p, cur)
        if cur == identity:
            return n
    raise RuntimeError("Order exceeded 60")


def permutation_matrix(p):
    P = np.zeros((len(p), len(p)), dtype=float)
    P[list(p), np.arange(len(p))] = 1.0
    return P


# ---------------------------------------------------------------------
# SHELL 3, 3' AND FACE HIDDEN 4
# ---------------------------------------------------------------------

L_shell = np.diag(A.sum(axis=1)) - A
evals, evecs = np.linalg.eigh(L_shell)

Q3 = evecs[:, np.isclose(evals, 5.0 - math.sqrt(5.0), atol=TOL)]
Q3p = evecs[:, np.isclose(evals, 5.0 + math.sqrt(5.0), atol=TOL)]

B = np.zeros((20, 12), dtype=float)
for i, f in enumerate(faces):
    B[i, list(f)] = 1.0

A_face = np.zeros((20, 20), dtype=float)
for i in range(20):
    for j in range(i + 1, 20):
        if len(set(faces[i]).intersection(faces[j])) == 2:
            A_face[i, j] = A_face[j, i] = 1.0
L_face = np.diag(A_face.sum(axis=1)) - A_face

_, _, vh = np.linalg.svd(B.T, full_matrices=True)
rankB = np.linalg.matrix_rank(B.T, tol=1.0e-10)
Qhidden = vh.T[:, rankB:]
hidden_evals, hidden_vecs = np.linalg.eigh(Qhidden.T @ L_face @ Qhidden)
Q4 = Qhidden @ hidden_vecs[:, np.isclose(hidden_evals, 3.0, atol=TOL)]

reps = {}
for p in group:
    Pv = permutation_matrix(p)
    pf = tuple(face_index[frozenset(p[v] for v in f)] for f in faces)
    Pf = permutation_matrix(pf)

    R3 = Q3.T @ Pv @ Q3
    R3p = Q3p.T @ Pv @ Q3p
    R4 = Q4.T @ Pf @ Q4
    reps[p] = (R3, R3p, R4)

# ---------------------------------------------------------------------
# UNIQUE A5 CLEBSCH: 4 -> Hom(3,3')
# ---------------------------------------------------------------------

constraints = []
for p in group:
    R3, R3p, R4 = reps[p]
    Rhom = np.kron(R3, R3p)  # column-major vec(T) -> vec(R3p T R3^-1)
    constraints.append(
        np.kron(np.eye(4), Rhom) - np.kron(R4.T, np.eye(9))
    )

Ceq = np.vstack(constraints)
Cnull = null_space(Ceq)
assert Cnull.shape[1] == 1

Clebsch = Cnull[:, 0].reshape((9, 4), order="F")
scale = np.sqrt(np.trace(Clebsch.T @ Clebsch) / 4.0)
Clebsch = Clebsch / scale

assert np.max(np.abs(Clebsch.T @ Clebsch - np.eye(4))) < 1.0e-8


def T_of_h(h):
    return (Clebsch @ h).reshape((3, 3), order="F")


# ---------------------------------------------------------------------
# NORMALIZER S3 AND UNIQUE CHARGE-PLANE EMBEDDING 2 -> 4
# ---------------------------------------------------------------------

orders = {p: order(p) for p in group}
r = next(p for p in group if orders[p] == 3)
r2 = compose(r, r)
C3 = {identity, r, r2}

normalizer = []
for p in group:
    pinv = inverse(p)
    conj = {compose(compose(p, h), pinv) for h in C3}
    if conj == C3:
        normalizer.append(p)

assert len(normalizer) == 6
s = next(
    p for p in normalizer
    if orders[p] == 2 and compose(compose(p, r), p) == inverse(r)
)

# Standard 2D S3 carrier as the sum-zero plane in R^3.
B2 = np.array([[1.0, -1.0, 0.0], [1.0, 1.0, -2.0]], dtype=float).T
B2, _ = np.linalg.qr(B2)

r_slot = (1, 2, 0)
s_slot = (1, 0, 2)
R2r = B2.T @ permutation_matrix(r_slot) @ B2
R2s = B2.T @ permutation_matrix(s_slot) @ B2

R4r = reps[r][2]
R4s = reps[s][2]

Jconstraints = np.vstack([
    np.kron(np.eye(2), R4r) - np.kron(R2r.T, np.eye(4)),
    np.kron(np.eye(2), R4s) - np.kron(R2s.T, np.eye(4)),
])
Jnull = null_space(Jconstraints)
assert Jnull.shape[1] == 1

J = Jnull[:, 0].reshape((4, 2), order="F")
J = J / math.sqrt(np.trace(J.T @ J) / 2.0)
assert np.max(np.abs(J.T @ J - np.eye(2))) < 1.0e-8


def charge_plane_coords(q):
    q = np.asarray(q, dtype=float)
    assert abs(np.sum(q)) < 1.0e-12
    return B2.T @ q


def quadratic_covariant(q):
    a, b, c = np.asarray(q, dtype=float)
    raw = np.array([b * c, c * a, a * b], dtype=float)
    return raw - np.mean(raw)


def hidden_source(q):
    # H3 stationary response 1/3, H5 stationary response 1/5.
    # The l=4 cone carrier is one radial degree above l=3, hence Delta.
    q = np.asarray(q, dtype=float)
    g = quadratic_covariant(q)
    w = q / 3.0 + Delta * g / 5.0
    return J @ charge_plane_coords(w), w


# ---------------------------------------------------------------------
# UNIVERSAL DIRAC TRACE IDENTITIES
# ---------------------------------------------------------------------

# Evaluate normalization constants on simple S3-plane vectors.
w_test = np.array([1.0, -1.0, 0.0])
h_test = J @ charge_plane_coords(w_test)
T_test = T_of_h(h_test)

assert np.allclose(
    np.sort(np.linalg.svd(T_test, compute_uv=False) ** 2),
    np.array([0.0, 1.0, 1.0]),
    atol=1.0e-8,
)

w_cubic = np.array([1.0, 1.0, -2.0])
h_cubic = J @ charge_plane_coords(w_cubic)
T_cubic = T_of_h(h_cubic)
det_constant = np.linalg.det(T_cubic) / np.prod(w_cubic)
det_constant = abs(det_constant)

expected_det_constant = 2.0 * math.sqrt(15.0) / 9.0
assert abs(det_constant - expected_det_constant) < 1.0e-8


def invariants(w):
    w = np.asarray(w, dtype=float)
    K = 0.5 * float(w @ w)
    M = float(np.prod(w))
    return K, M


def predicted_singular_square_polynomial(K, M):
    # lambda^3 - 2K lambda^2 + K^2 lambda - (20/27) M^2
    return np.array([1.0, -2.0 * K, K * K, -(20.0 / 27.0) * M * M])


words = {
    "u": np.array([1.0, 3.0, -4.0]),
    "d": np.array([1.0, -3.0, 2.0]),
    "e": np.array([-3.0, -3.0, 6.0]),
    "nu": np.array([-3.0, 3.0, 0.0]),
}

multiplicity = {"u": 3, "d": 3, "e": 1, "nu": 1}

blocks = {}
for name, q in words.items():
    h, w = hidden_source(q)
    T = T_of_h(h)
    Aop = T.T @ T
    K, M = invariants(w)

    tr2 = float(np.trace(Aop))
    tr4 = float(np.trace(Aop @ Aop))
    determinant = float(np.linalg.det(T))

    assert abs(tr2 - 2.0 * K) < 1.0e-8
    assert abs(tr4 - 2.0 * K * K) < 1.0e-8
    assert abs(abs(determinant) - expected_det_constant * abs(M)) < 1.0e-8

    poly = predicted_singular_square_polynomial(K, M)
    roots = np.sort(np.real_if_close(np.roots(poly)).astype(float))
    direct = np.sort(np.linalg.eigvalsh(Aop))
    assert np.max(np.abs(roots - direct)) < 1.0e-8

    blocks[name] = {
        "T": T,
        "K": K,
        "M": M,
        "singular_values": np.sqrt(np.maximum(direct, 0.0)),
        "tr_Y2": tr2,
        "tr_Y4": tr4,
    }

a_trace = sum(multiplicity[n] * blocks[n]["tr_Y2"] for n in blocks)
b_trace = sum(multiplicity[n] * blocks[n]["tr_Y4"] for n in blocks)

# Exact polynomial values derived algebraically:
a_formula = 16.0 * (183.0 * Delta * Delta + 100.0) / 75.0
b_formula = (
    976.0 / 27.0
    + (384.0 / 5.0) * Delta
    + (99584.0 / 225.0) * Delta * Delta
    + (1728.0 / 5.0) * Delta ** 3
    + (420592.0 / 1875.0) * Delta ** 4
)

assert abs(a_trace - a_formula) < 1.0e-8
assert abs(b_trace - b_formula) < 1.0e-8

# ---------------------------------------------------------------------
# STANDARD FINITE GAUGE TRACE
# ---------------------------------------------------------------------

# Per generation, particle states only:
trY2_one_generation = (
    6.0 * (1.0 / 6.0) ** 2
    + 3.0 * (2.0 / 3.0) ** 2
    + 3.0 * (1.0 / 3.0) ** 2
    + 2.0 * (1.0 / 2.0) ** 2
    + 1.0
)
trSU2_one_generation = 3.0 * 0.5 + 0.5
trSU3_one_generation = 2.0 * 0.5 + 0.5 + 0.5

assert abs(trY2_one_generation - 10.0 / 3.0) < 1.0e-12
assert abs(trSU2_one_generation - 2.0) < 1.0e-12
assert abs(trSU3_one_generation - 2.0) < 1.0e-12

print("=" * 76)
print("CATHEDRAL FINITE DIRAC TRACE AUDIT")
print("=" * 76)
print("Delta =", format(Delta, ".15f"))
print()
print("UNIVERSAL 2 -> 4 -> Hom(3,3') IDENTITIES")
print("  Tr(T^*T)             = 2 K")
print("  Tr((T^*T)^2)         = 2 K^2")
print("  |det T|              = (2 sqrt(15)/9) |M|")
print("  charpoly(T^*T)       = l^3 - 2K l^2 + K^2 l - (20/27)M^2")
print()
print("FOUR CHARGE-WORD BLOCKS")
for name in ["u", "d", "e", "nu"]:
    b = blocks[name]
    print(
        "  %-3s K=% .12f M=% .12f  singular=%s"
        % (
            name,
            b["K"],
            b["M"],
            np.array2string(b["singular_values"], precision=12),
        )
    )
print()
print("FINITE YUKAWA HEAT TRACES")
print("  a = Tr(Y^*Y weighted by colour)       =", format(a_trace, ".15f"))
print("  a exact polynomial                    = 16(183 Delta^2+100)/75")
print("  b = Tr((Y^*Y)^2 weighted by colour)   =", format(b_trace, ".15f"))
print("  b/a^2                                 =", format(b_trace / (a_trace * a_trace), ".15f"))
print()
print("BARE 96-STATE GAUGE TRACE RATIOS")
print("  U(1)_Y : SU(2) : SU(3) = 5/3 : 1 : 1")
print("  canonical spectral-boundary sin^2(theta_W) = 3/8")
print()
print("AUDIT RESULT")
print("The charge-plane Cathedral bridge gives a universal cubic Dirac polynomial.")
print("Its quadratic and quartic heat traces are fixed by K alone; cubic orientation M")
print("controls determinant/hierarchy. The standard finite gauge trace gives 3/8,")
print("not 3/13, so the old weak-angle slot is not the bare gauge coefficient of this")
print("canonical finite spectral action.")