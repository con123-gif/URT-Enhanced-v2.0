"""
The centred icosahedral graph G_{13}.

    13 vertices  =  1 centre  +  12 surface vertices
    36 edges     =  12 (centre → surface)  +  24 (surface ring)

Surface ring: each surface vertex i (1..12) connects to neighbours
under the Z_12 Cayley graph with generators {1, 5, 7, 11} mod 12.

Note: the Cathedral integer E = 30 counts the edges of the standard
icosahedron (V=12, degree-5 surface), not |E(G_{13})|.

Total degree = 12 + 12·5 = 72 = D!·V  →  tr(L) = D!·V.

Laplacian spectrum (multiplicities in parentheses):
    λ ∈  { 0(1) , 3(2) , 5(6) , 7(2) , 9(1) , 13(1) }
"""
from __future__ import annotations

import numpy as np

from .foundations import D, N, V, q


_RING_OFFSETS: tuple[int, ...] = (1, 5, 7, 11)


def adjacency() -> np.ndarray:
    A = np.zeros((N, N), dtype=float)
    A[0, 1:] = 1.0
    A[1:, 0] = 1.0
    for i in range(1, N):
        for k in _RING_OFFSETS:
            j = (i - 1 + k) % V + 1
            A[i, j] = 1.0
            A[j, i] = 1.0
    return A


def laplacian() -> np.ndarray:
    A = adjacency()
    return np.diag(A.sum(axis=1)) - A


def spectrum() -> np.ndarray:
    eigs = np.linalg.eigvalsh(laplacian())
    return np.sort(eigs)


def cathedral_eigenvalues() -> tuple[tuple[float, int], ...]:
    eigs = spectrum()
    eigs_rounded = np.round(eigs).astype(int)
    distinct, counts = np.unique(eigs_rounded, return_counts=True)
    return tuple((int(v), int(c)) for v, c in zip(distinct, counts))


def heat_kernel(t: float) -> np.ndarray:
    """13×13 heat kernel K(t) = exp(−tL) via eigendecomposition."""
    L = laplacian()
    eigs, vecs = np.linalg.eigh(L)
    weights = np.exp(-t * eigs)
    return (vecs * weights) @ vecs.T


def spectral_zeta(s: float) -> float:
    """Spectral zeta ζ_G(s) = Σ_{k: λ_k>0} λ_k^{−s}."""
    return (2.0 * 3.0 ** (-s) + 6.0 * 5.0 ** (-s)
            + 2.0 * 7.0 ** (-s) + 9.0 ** (-s) + 13.0 ** (-s))


def graph_diameter() -> int:
    A = adjacency()
    n = A.shape[0]
    diam = 0
    for src in range(n):
        dist = [-1] * n
        dist[src] = 0
        queue = [src]
        head = 0
        while head < len(queue):
            v = queue[head]; head += 1
            for w in range(n):
                if A[v, w] > 0 and dist[w] == -1:
                    dist[w] = dist[v] + 1
                    queue.append(w)
        diam = max(diam, max(dist))
    return diam


def isoperimetric_number() -> float:
    from itertools import combinations
    A = adjacency()
    n = A.shape[0]
    best = float("inf")
    for size in range(1, n // 2 + 1):
        for S in combinations(range(n), size):
            S_set = set(S)
            boundary = sum(
                1
                for u in S_set
                for v in range(n)
                if v not in S_set and A[u, v] > 0
            )
            ratio = boundary / size
            if ratio < best:
                best = ratio
    return best


def graph_audit() -> bool:
    A = adjacency()
    L = laplacian()
    degs = A.sum(axis=1)
    ok = True
    ok &= A.shape == (N, N)
    ok &= np.allclose(A, A.T)
    ok &= float(degs[0]) == float(V)
    ok &= bool(np.all(degs[1:] == q))
    ok &= int(degs.sum()) == 6 * V
    ok &= abs(float(np.trace(L)) - D * 2 * V) < 1e-12
    eigs = spectrum()
    ok &= bool(np.allclose(eigs, np.round(eigs), atol=1e-10))
    cath = cathedral_eigenvalues()
    expected = ((0, 1), (3, 2), (5, 6), (7, 2), (9, 1), (13, 1))
    ok &= cath == expected
    ok &= sum(v * m for v, m in cath) == 6 * V
    K0 = heat_kernel(0.0)
    ok &= K0.shape == (N, N)
    ok &= bool(np.allclose(K0, np.eye(N), atol=1e-10))
    K_inf = heat_kernel(1e4)
    ok &= bool(np.allclose(K_inf, np.full((N, N), 1.0 / N), atol=1e-6))
    zeta1 = spectral_zeta(1.0)
    eigs_pos = [e for e in np.round(eigs).astype(int) if e > 0]
    zeta1_ref = sum(1.0 / e for e in eigs_pos)
    ok &= abs(zeta1 - zeta1_ref) < 1e-12
    diam = graph_diameter()
    ok &= isinstance(diam, int) and diam > 0
    h = isoperimetric_number()
    ok &= h > 0
    return bool(ok)


__all__ = [
    "adjacency", "laplacian", "spectrum", "cathedral_eigenvalues",
    "heat_kernel", "spectral_zeta", "graph_diameter", "isoperimetric_number",
    "graph_audit",
]
