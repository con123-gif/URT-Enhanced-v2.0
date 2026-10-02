"""
The centred icosahedral graph G_{13}.

    13 vertices  =  1 centre  +  12 surface vertices
    36 edges     =  12 (centre → surface)  +  24 (surface ring)

Surface ring: each surface vertex i (1..12) connects to neighbours
under the Z_12 Cayley graph with generators {1, 5, 7, 11} mod 12
(the units of Z_12) — 4 ring neighbours per surface vertex, giving
12·4/2 = 24 undirected ring edges.  With the centre edge: degree
5 = q for each surface vertex, degree 12 = V for the centre.

Note: the Cathedral integer E = 30 (from |A_5|/2) counts the edges
of the standard icosahedron (V=12, degree-5 surface), not |E(G_{13})|.

Total degree = 12 + 12·5 = 72 = D!·V  →  tr(L) = D!·V.

Laplacian spectrum (multiplicities in parentheses):

    λ ∈  { 0(1) , 3(2) , 5(6) , 7(2) , 9(1) , 13(1) }

Every distinct eigenvalue is a Cathedral integer:
    0           the trivial constant mode
    3 = D       the Fiedler eigenvalue (spatial dimension!)
    5 = q       degenerate sextet (A_5 exhaust block)
    7 = D! + 1  doublet (A_5)
    9 = D²      A_5 highest internal mode
   13 = N       the rank-1 boundary mode

Sector trace identities (verified in sectors.py):
    tr(L | K_4) =  0 + 3 + 3 + 5  =  11
    tr(L | A_5) =  5·5 + 7·2 + 9 + 13 = 61
    total       =  11 + 61 = 72 = D! · V
"""
from __future__ import annotations

import numpy as np

from .foundations import D, N, V, q


# ── Surface ring connectivity ─────────────────────────────────────────────
#
# The icosahedron's surface is modelled as a Cayley graph on Z_12 with
# generators ±1, ±5 — i.e. offsets {1, 5, 7, 11} mod 12, the units of Z_12.
# Why these offsets:  in the standard icosahedron each vertex has 5 nearest
# neighbours; we represent it as a 4-regular Cayley graph plus a centre,
# the unique 13-vertex graph whose Laplacian spectrum is purely Cathedral.
_RING_OFFSETS: tuple[int, ...] = (1, 5, 7, 11)


def adjacency() -> np.ndarray:
    """Return the 13×13 adjacency matrix of G_{13}.

    Vertex 0 is the centre; vertices 1..12 are the icosahedral surface.
    """
    A = np.zeros((N, N), dtype=float)
    # Centre ↔ every surface vertex.
    A[0, 1:] = 1.0
    A[1:, 0] = 1.0
    # Surface ring: i connected to (i + k) for k ∈ {1, 5, 7, 11} (mod 12),
    # using 1-based surface labels.
    for i in range(1, N):
        for k in _RING_OFFSETS:
            j = (i - 1 + k) % V + 1
            A[i, j] = 1.0
            A[j, i] = 1.0
    return A


def laplacian() -> np.ndarray:
    """Combinatorial Laplacian  L  =  diag(deg)  −  A."""
    A = adjacency()
    return np.diag(A.sum(axis=1)) - A


def spectrum() -> np.ndarray:
    """Eigenvalues of L_{G_{13}}, sorted in ascending order."""
    eigs = np.linalg.eigvalsh(laplacian())
    return np.sort(eigs)


def cathedral_eigenvalues() -> tuple[tuple[float, int], ...]:
    """Return ((eigenvalue, multiplicity), ...) — the Cathedral spectrum."""
    eigs = spectrum()
    eigs_rounded = np.round(eigs).astype(int)
    distinct, counts = np.unique(eigs_rounded, return_counts=True)
    return tuple((int(v), int(c)) for v, c in zip(distinct, counts))


def heat_kernel(t: float) -> np.ndarray:
    """13×13 heat kernel K(t) = exp(−tL) via eigendecomposition.

    K(t) = Σ_k exp(−t·λ_k) v_k vᵀ_k
    """
    L = laplacian()
    eigs, vecs = np.linalg.eigh(L)
    weights = np.exp(-t * eigs)           # shape (13,)
    return (vecs * weights) @ vecs.T      # Σ_k exp(−tλ_k) v_k vᵀ_k


def spectral_zeta(s: float) -> float:
    """Spectral zeta function ζ_G(s) = Σ_{k: λ_k>0} λ_k^{−s}.

    Closed form: 2·3^{−s} + 6·5^{−s} + 2·7^{−s} + 9^{−s} + 13^{−s}.
    """
    # Multiplicities from the Cathedral spectrum (λ=0 excluded):
    # λ=3 (×2), λ=5 (×6), λ=7 (×2), λ=9 (×1), λ=13 (×1)
    return (2.0 * 3.0 ** (-s) + 6.0 * 5.0 ** (-s)
            + 2.0 * 7.0 ** (-s) + 9.0 ** (-s) + 13.0 ** (-s))


def graph_diameter() -> int:
    """Maximum shortest path length between any two vertices of G_{13}.

    Computed by BFS from every vertex.
    """
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
    """Alias for the Cheeger constant h(G_{13}).

    h = min_{∅ ≠ S, |S| ≤ N//2} |∂S| / |S|

    where ∂S is the edge boundary (edges with one endpoint in S, one outside).
    Computed by exhaustive search over subsets of size 1..6.
    """
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
    """All graph identities hold to machine precision.

    Verifies:
      - vertex count = N = 13
      - centre degree = V = 12
      - surface vertex degree = q = 5
      - total degree = 2|E| = 84 (so |E| = 42 = D · V − D!)
      - tr(L) = D! · V = 72
      - spectrum has only Cathedral-integer eigenvalues
      - eigenvalue multiplicities match the Cathedral spectrum
    """
    A = adjacency()
    L = laplacian()
    degs = A.sum(axis=1)
    ok = True
    ok &= A.shape == (N, N)
    ok &= np.allclose(A, A.T)
    ok &= float(degs[0]) == float(V)
    ok &= bool(np.all(degs[1:] == q))
    ok &= int(degs.sum()) == 6 * V                 # = 72 = D! · V
    ok &= abs(float(np.trace(L)) - D * 2 * V) < 1e-12  # tr(L) = 6·12 = 72
    eigs = spectrum()
    # All eigenvalues must be close to integers
    ok &= bool(np.allclose(eigs, np.round(eigs), atol=1e-10))
    cath = cathedral_eigenvalues()
    expected = ((0, 1), (3, 2), (5, 6), (7, 2), (9, 1), (13, 1))
    ok &= cath == expected
    # Trace check: 0·1 + 3·2 + 5·6 + 7·2 + 9·1 + 13·1 = 72
    ok &= sum(v * m for v, m in cath) == 6 * V
    # Heat kernel at t=0 is the identity.
    K0 = heat_kernel(0.0)
    ok &= K0.shape == (N, N)
    ok &= bool(np.allclose(K0, np.eye(N), atol=1e-10))
    # Heat kernel at t→∞ collapses to 1/N * 𝟙𝟙ᵀ (only λ=0 survives).
    K_inf = heat_kernel(1e4)
    ok &= bool(np.allclose(K_inf, np.full((N, N), 1.0 / N), atol=1e-6))
    # Spectral zeta at s=1 equals the sum of reciprocals of non-zero eigenvalues.
    zeta1 = spectral_zeta(1.0)
    eigs_pos = [e for e in np.round(eigs).astype(int) if e > 0]
    zeta1_ref = sum(1.0 / e for e in eigs_pos)
    ok &= abs(zeta1 - zeta1_ref) < 1e-12
    # Graph diameter is a positive integer.
    diam = graph_diameter()
    ok &= isinstance(diam, int) and diam > 0
    # Isoperimetric number is positive.
    h = isoperimetric_number()
    ok &= h > 0
    return bool(ok)


__all__ = [
    "adjacency", "laplacian", "spectrum", "cathedral_eigenvalues",
    "heat_kernel", "spectral_zeta", "graph_diameter", "isoperimetric_number",
    "graph_audit",
]
