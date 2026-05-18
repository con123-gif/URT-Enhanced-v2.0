"""G_{13} graph: spectrum is all Cathedral integers."""
import numpy as np

from urt.foundations import N, V
from urt.graph import (
    adjacency, cathedral_eigenvalues, graph_audit, laplacian, spectrum,
)


def test_adjacency_shape_and_symmetry():
    A = adjacency()
    assert A.shape == (N, N)
    assert np.allclose(A, A.T)


def test_centre_degree():
    A = adjacency()
    # Vertex 0 is the centre and is connected to all 12 surface vertices.
    assert int(A[0].sum()) == V
    assert all(A[0, i] == 1 for i in range(1, N))


def test_surface_degree_q():
    from urt.foundations import q
    A = adjacency()
    degs = A.sum(axis=1)
    # Every surface vertex has degree q = 5 (= 4 ring neighbours + 1 centre).
    assert all(int(d) == q for d in degs[1:])


def test_trace_is_factorial_V():
    # tr(L) = sum of degrees = 12 + 12·5 = 72 = D! · V
    L = laplacian()
    from urt.foundations import D, V as V_
    assert int(np.trace(L)) == 6 * V_


def test_spectrum_is_all_cathedral_integers():
    eigs = spectrum()
    eigs_int = np.round(eigs).astype(int)
    assert np.allclose(eigs, eigs_int, atol=1e-10)
    distinct = sorted(set(eigs_int.tolist()))
    assert distinct == [0, 3, 5, 7, 9, 13]


def test_cathedral_eigenvalue_multiplicities():
    cath = cathedral_eigenvalues()
    expected = ((0, 1), (3, 2), (5, 6), (7, 2), (9, 1), (13, 1))
    assert cath == expected
    # Sum of (value · multiplicity) reproduces the trace 72.
    assert sum(v * m for v, m in cath) == 72


def test_audit_passes():
    assert graph_audit()
