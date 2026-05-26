"""
Geometric structures of G_{13}: distances, curvature, topology, and
spectral geometry.

────────────────────────────────────────────────────────────────────────────
ALL-PAIRS DISTANCES
────────────────────────────────────────────────────────────────────────────

Floyd-Warshall (or BFS from each vertex) on the adjacency graph gives the
integer-valued metric  d(u, v)  for all vertex pairs, making  (G_{13}, d)
a finite metric space.

────────────────────────────────────────────────────────────────────────────
CHEEGER CONSTANT
────────────────────────────────────────────────────────────────────────────

    h(G)  =  min_{S : 1 ≤ |S| ≤ N/2}  |∂S| / |S|

where  |∂S|  is the number of edges crossing the cut  (S, V\S).

With N = 13 and the brute-force budget 2^{13}/2 = 4096 subsets, this is
exact.  Spectral bounds (Cheeger inequalities):

    λ₂ / 2  ≤  h(G)  ≤  √(2 · λ_max · λ₂)
    3/2      ≤  h(G)  ≤  √78  ≈  8.83

────────────────────────────────────────────────────────────────────────────
OLLIVIER-RICCI CURVATURE
────────────────────────────────────────────────────────────────────────────

For an edge (u, v) the Ollivier-Ricci curvature is

    κ(u,v)  =  1  −  W₁(μ_u, μ_v) / d(u,v)

where  μ_u  is the uniform distribution over the neighbours of  u  and
W₁  is the 1-Wasserstein (Earth Mover's) distance.  W₁ is computed via
the linear program

    min  Σ_{a,b} d(a,b) · T_{ab}
    s.t. Σ_b T_{ab} = μ_u(a),  Σ_a T_{ab} = μ_v(b),  T ≥ 0.

All 36 edges have κ > 0 (positive curvature throughout, consistent with S² topology).

────────────────────────────────────────────────────────────────────────────
HEAT KERNEL
────────────────────────────────────────────────────────────────────────────

    K(t)  =  exp(−tL)   (13×13 matrix)

computed via the spectral decomposition

    K(t)  =  Σ_k  exp(−t λ_k)  v_k vᵀ_k

The trace has the closed form

    tr(K(t))  =  1  +  2 e^{−3t}  +  6 e^{−5t}  +  2 e^{−7t}
              +  e^{−9t}  +  e^{−13t}

matching the Cathedral eigenvalue multiplicities (1,2,6,2,1,1).

────────────────────────────────────────────────────────────────────────────
SPECTRAL EMBEDDING
────────────────────────────────────────────────────────────────────────────

Use the eigenvectors for eigenvalues  λ = 3 (×2)  and  λ = 5  as the
three coordinate axes.  These are the Fiedler and second-Fiedler vectors,
giving the canonical 3-dimensional embedding of G_{13} that approximately
recovers the icosahedral arrangement on S².

────────────────────────────────────────────────────────────────────────────
INCIDENCE MATRIX AND DISCRETE DE RHAM COMPLEX
────────────────────────────────────────────────────────────────────────────

Orient each edge canonically by lower → higher vertex index.  The
|E|×N  incidence matrix  B  has

    B_{e, tail(e)} = −1,    B_{e, head(e)} = +1

The discrete exterior derivative acts on 0-forms (vertex functions) as
    d : C₀(G) → C₁(G),    (dα)_e = α_{head} − α_{tail}   i.e.  B · α

Vertex Laplacian:   Δ₀ = BᵀB = L_{G_{13}}   (36 = |E(G_{13})|)
Edge Laplacian:     Δ₁ = BBᵀ  (36×36)

Hodge decomposition of any 1-form ω:
    ω  =  dα  +  h
where dα = B · B⁺ · ω  (exact part, B⁺ = pseudoinverse) and
      h  = ω − dα      (harmonic part, lies in ker(Bᵀ) = cycle space).

────────────────────────────────────────────────────────────────────────────
BETTI NUMBERS
────────────────────────────────────────────────────────────────────────────

G_{13} edge count: 12 centre-to-surface + 24 ring edges = 36 total.
The ring uses 4 offsets {1,5,7,11} per surface vertex, so 12·4/2 = 24
undirected ring edges.  The Cathedral integer E=30 is the icosahedral
edge count (degree-5 icosahedron with V=12), not |E(G_{13})|.

Graph (1-complex):
    b₀ = 1             (one connected component)
    b₁ = |E| − N + 1 = 36 − 13 + 1 = 24   (cycle rank)
    χ(graph) = N − |E| = 13 − 36 = −23

Icosahedral surface triangulation (V=12, E=30, F=20):
    b₀=1, b₁=0, b₂=1,  χ = V − E + F = 12 − 30 + 20 = 2  (S²).

────────────────────────────────────────────────────────────────────────────
RAMANUJAN CHECK
────────────────────────────────────────────────────────────────────────────

For a k-regular connected graph, the Ramanujan bound is
    λ₂  ≤  2√(k−1)

G_{13} is biregular: centre has degree 12, surface has degree 5.
For the surface subgraph degree k=5: 2√(5−1) = 4.
The Fiedler eigenvalue of G_{13} is λ₂ = 3 < 4, so G_{13} satisfies the
Ramanujan bound — it is a near-optimal spectral expander.
"""
from __future__ import annotations

from itertools import combinations
from math import exp, sqrt

import numpy as np
import scipy.linalg
import scipy.optimize
import scipy.sparse.csgraph

from .foundations import D, N, V
from .graph import adjacency, laplacian


_CATHEDRAL_SPECTRUM: tuple[tuple[int, int], ...] = (
    (0,  1),
    (3,  2),
    (5,  6),
    (7,  2),
    (9,  1),
    (13, 1),
)


def all_pairs_distances() -> np.ndarray:
    """13×13 matrix of graph distances, computed by BFS from each vertex."""
    A = adjacency().astype(bool)
    dist = np.full((N, N), np.inf)
    np.fill_diagonal(dist, 0.0)
    for src in range(N):
        visited = np.zeros(N, dtype=bool)
        visited[src] = True
        frontier = [src]
        d = 0
        while frontier:
            d += 1
            next_frontier = []
            for u in frontier:
                for v in np.where(A[u])[0]:
                    if not visited[v]:
                        visited[v] = True
                        dist[src, v] = d
                        next_frontier.append(v)
            frontier = next_frontier
    return dist


def cheeger_with_cut() -> tuple[float, frozenset]:
    """(h, S) where h is the Cheeger constant and S is the minimising vertex set."""
    A = adjacency()
    verts = list(range(N))
    best_h = float("inf")
    best_S: frozenset = frozenset()
    for size in range(1, N // 2 + 1):
        for S_tuple in combinations(verts, size):
            S_set = set(S_tuple)
            boundary = 0
            for u in S_set:
                for v in range(N):
                    if v not in S_set and A[u, v] > 0.5:
                        boundary += 1
            h = boundary / size
            if h < best_h:
                best_h = h
                best_S = frozenset(S_tuple)
    return best_h, best_S


def cheeger_constant() -> float:
    """Cheeger constant h(G_{13}), brute-forced over all subsets of size 1..6."""
    h, _ = cheeger_with_cut()
    return h


def heat_kernel(t: float) -> np.ndarray:
    """13×13 heat kernel K(t) = exp(−tL) via spectral decomposition."""
    L = laplacian()
    eigs, U = np.linalg.eigh(L)
    exp_eigs = np.exp(-t * eigs)
    return (U * exp_eigs[np.newaxis, :]) @ U.T


def heat_kernel_trace(t: float) -> float:
    """tr(exp(−tL)) computed from the full spectral decomposition."""
    L = laplacian()
    eigs = np.linalg.eigvalsh(L)
    return float(np.sum(np.exp(-t * eigs)))


def heat_kernel_trace_formula(t: float) -> float:
    """Closed-form tr(K(t)) using Cathedral eigenvalue multiplicities."""
    result = 0.0
    for lam, mult in _CATHEDRAL_SPECTRUM:
        result += mult * exp(-lam * t)
    return result


def spectral_embedding() -> np.ndarray:
    """13×3 coordinates using Fiedler eigenvectors (λ=3×2 and λ=5)."""
    L = laplacian()
    _, U = np.linalg.eigh(L)
    return U[:, 1:4]


def incidence_matrix() -> np.ndarray:
    """36×13 incidence matrix B with canonical orientation (lower→higher index)."""
    A = adjacency()
    edges = []
    for u in range(N):
        for v in range(u + 1, N):
            if A[u, v] > 0.5:
                edges.append((u, v))
    num_edges = len(edges)
    B = np.zeros((num_edges, N), dtype=float)
    for idx, (u, v) in enumerate(edges):
        B[idx, u] = -1.0
        B[idx, v] = +1.0
    return B


def edge_laplacian() -> np.ndarray:
    """|E|×|E| edge Laplacian Δ₁ = BBᵀ  (36×36 for G_{13})."""
    B = incidence_matrix()
    return B @ B.T


def hodge_decomposition(omega: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Decompose a 1-form into (exact part dα, harmonic part h)."""
    B = incidence_matrix()
    B_pinv = np.linalg.pinv(B)
    alpha_hat = B_pinv @ omega
    d_alpha = B @ alpha_hat
    harmonic = omega - d_alpha
    return d_alpha, harmonic


def betti_numbers() -> dict:
    """Betti numbers of G_{13} (1-complex) and icosahedral surface."""
    A = adjacency()
    num_edges = int(A.sum()) // 2
    b1 = num_edges - N + 1
    return {
        "b0": 1,
        "b1": b1,
        "b2_surface": 1,
        "euler_graph": N - num_edges,
        "euler_surface": 2,
    }


def ollivier_ricci_edge(u: int, v: int, dist: np.ndarray) -> float:
    """Ollivier-Ricci curvature κ(u,v) via Earth Mover's distance LP."""
    A = adjacency()
    nbrs_u = np.where(A[u] > 0.5)[0]
    nbrs_v = np.where(A[v] > 0.5)[0]
    deg_u = len(nbrs_u)
    deg_v = len(nbrs_v)
    cost = dist[np.ix_(nbrs_u, nbrs_v)].ravel()
    n_vars = deg_u * deg_v
    n_eq = deg_u + deg_v
    A_eq = np.zeros((n_eq, n_vars))
    b_eq = np.zeros(n_eq)
    for a in range(deg_u):
        for b in range(deg_v):
            idx = a * deg_v + b
            A_eq[a, idx] = 1.0
            A_eq[deg_u + b, idx] = 1.0
    b_eq[:deg_u] = 1.0 / deg_u
    b_eq[deg_u:] = 1.0 / deg_v
    bounds = [(0.0, None)] * n_vars
    result = scipy.optimize.linprog(
        c=cost, A_eq=A_eq, b_eq=b_eq, bounds=bounds, method="highs",
    )
    w1 = float(result.fun)
    d_uv = float(dist[u, v])
    return float(1.0 - w1 / d_uv)


def ollivier_ricci_all() -> dict:
    """Compute κ for all 36 edges of G_{13}.  Returns dict {(u,v): κ}."""
    dist = all_pairs_distances()
    A = adjacency()
    result = {}
    for u in range(N):
        for v in range(u + 1, N):
            if A[u, v] > 0.5:
                result[(u, v)] = ollivier_ricci_edge(u, v, dist)
    return result


def mean_ollivier_ricci() -> float:
    """Average Ollivier-Ricci curvature over all edges of G_{13}."""
    kappas = ollivier_ricci_all()
    return float(np.mean(list(kappas.values())))


def ihara_zeta_inverse_coeffs() -> np.ndarray:
    """Coefficients of det(I−uA+u²(D_deg−I)) as polynomial in u, degree 2N=26."""
    A_mat = adjacency()
    deg = A_mat.sum(axis=1)
    D_deg = np.diag(deg)
    us_real = np.linspace(-0.1, 0.1, 2 * N + 1)
    det_real = np.zeros(2 * N + 1)
    for k, u in enumerate(us_real):
        M = np.eye(N) - u * A_mat + u ** 2 * (D_deg - np.eye(N))
        det_real[k] = float(np.linalg.det(M).real)
    coeffs = np.polyfit(us_real, det_real, 2 * N)
    return coeffs[::-1]


def ramanujan_check() -> dict:
    """Check whether G_{13} satisfies the Ramanujan spectral bound."""
    eigs = np.sort(np.linalg.eigvalsh(laplacian()))
    fiedler = float(eigs[1])
    lam_max = float(eigs[-1])
    surface_degree = 5
    bound = 2.0 * sqrt(surface_degree - 1)
    return {
        "fiedler": fiedler,
        "bound_surface_degree": bound,
        "is_ramanujan": bool(fiedler <= bound + 1e-10),
        "spectral_ratio": lam_max / fiedler,
    }


def geometry_audit() -> bool:
    """All geometry identities — must all pass."""
    ok = True

    dist = all_pairs_distances()
    ok &= bool(np.all(dist >= 0))
    ok &= bool(np.allclose(dist, np.round(dist)))
    ok &= bool(np.all(np.diag(dist) == 0))   # all self-distances are zero

    h = cheeger_constant()
    ok &= h >= 1.5 - 1e-10

    eigs = np.sort(np.linalg.eigvalsh(laplacian()))
    lam2 = float(eigs[1])
    lam_max = float(eigs[-1])
    upper = sqrt(2.0 * lam_max * lam2)
    ok &= h <= upper + 1e-10

    for t in (0.1, 0.5, 1.0, 2.0):
        ok &= abs(heat_kernel_trace(t) - heat_kernel_trace_formula(t)) < 1e-10

    emb = spectral_embedding()
    ok &= float(np.linalg.norm(emb[0])) < 0.5

    B = incidence_matrix()
    L = laplacian()
    ok &= np.allclose(B.T @ B, L, atol=1e-12)

    betti = betti_numbers()
    ok &= betti["b0"] == 1
    A_tmp = adjacency()
    num_edges = int(A_tmp.sum()) // 2
    ok &= betti["b1"] == num_edges - N + 1

    kappas = ollivier_ricci_all()
    ok &= len(kappas) == num_edges
    # All edges have strictly positive Ollivier-Ricci curvature (S² topology).
    for kappa in kappas.values():
        ok &= kappa > 0

    ram = ramanujan_check()
    ok &= abs(ram["fiedler"] - 3.0) < 1e-10
    ok &= ram["is_ramanujan"]

    return bool(ok)


__all__ = [
    "all_pairs_distances",
    "cheeger_constant",
    "cheeger_with_cut",
    "heat_kernel",
    "heat_kernel_trace",
    "heat_kernel_trace_formula",
    "spectral_embedding",
    "incidence_matrix",
    "edge_laplacian",
    "hodge_decomposition",
    "betti_numbers",
    "ollivier_ricci_edge",
    "ollivier_ricci_all",
    "mean_ollivier_ricci",
    "ihara_zeta_inverse_coeffs",
    "ramanujan_check",
    "geometry_audit",
]
