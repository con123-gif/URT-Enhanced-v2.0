"""Regression test: nonzero quadratic hidden return despite absent linear A5 map.

This safeguards the scope of the no-go, not an identification with physics.
"""
from pathlib import Path
import runpy
import numpy as np


def test_urt_nonlinear_hidden_reopening():
    root = Path(__file__).resolve().parents[1]
    d = runpy.run_path(str(root / "research_archive" /
                           "urt_hidden_nonlinear_return_2026_10_14.py"))
    assert d["linear"] == 0
    assert d["quadratic"] == 4
    assert np.linalg.matrix_rank(d["j"], tol=1e-9) == 8
    assert np.linalg.eigvalsh(d["t"]).min() > 0
    assert np.linalg.norm(d["ret"](d["x"])) > 0
    assert np.linalg.norm(d["ret"](np.zeros(12))) < 1e-12
    assert np.linalg.norm(d["der"]) > 1e-6
