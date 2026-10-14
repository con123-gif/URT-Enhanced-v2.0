"""Regression checks for the nested Platonic incidence computation.

The research verifier requires NumPy, already a declared project dependency.
"""
from pathlib import Path
import runpy


def test_platonic_hidden_fusion():
    root = Path(__file__).resolve().parents[1]
    namespace = runpy.run_path(str(root / "research_archive" /
                                   "platonic_hidden_fusion_2026_10_14.py"))
    result = namespace["run"]()
    h = result["hidden_counts"]
    assert h["tetrahedron"] == (0, 0)
    assert h["cube"] == (4, 2)
    assert h["octahedron"] == (2, 4)
    assert h["icosahedron"] == (0, 8)
    assert h["dodecahedron"] == (8, 0)
    assert h["decahedron"] == (1, 4)
    assert result["nested_cubes"] == 5
    assert result["combined_rank"] == 13
    assert result["odd_tetra_rank"] == 4
    assert result["cube_projector_error"] < 1e-10
    assert result["tetra_projector_error"] < 1e-10
    assert result["urt_symplectic_error"] < 1e-12
