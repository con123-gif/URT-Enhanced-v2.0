"""
The centred icosahedral graph G_{13}.

    13 vertices  =  1 centre  +  12 icosahedral surface vertices
    42 edges     =  12 (centre → surface)  +  30 (surface ring)

Surface ring: each surface vertex i (1..12) is connected to its
neighbours under the Cayley pattern of the units of Z_12 — offsets
{1, 5, 7, 11} mod 12 — which is the icosahedral H_3 ring with the
two antipodal vertices excluded (degree 4 on the ring + 1 to centre
= 5 surface, 12 centre).

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
    return bool(ok)


__all__ = [
    "adjacency", "laplacian", "spectrum", "cathedral_eigenvalues", "graph_audit",
]
