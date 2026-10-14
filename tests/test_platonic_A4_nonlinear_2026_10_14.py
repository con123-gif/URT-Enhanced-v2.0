"""Regression gates for the Platonic-to-A4 and quartic singlet calculations."""
from pathlib import Path
import runpy

ROOT=Path(__file__).resolve().parents[1]/"research_archive"

def test_nested_platonic_a4_roots():
    data=runpy.run_path(str(ROOT/"platonic_A4_emergence_2026_10_14.py"))
    assert len(data["cubes"])==5
    assert data["roots"].shape==(20,20)
    assert data["np"].linalg.matrix_rank(data["roots"],tol=1e-9)==4

def test_quartic_four_site_gate():
    data=runpy.run_path(str(ROOT/"platonic_quartic_gate_2026_10_14.py"))
    assert data["np"].linalg.matrix_rank(data["W"],tol=1e-9)==15
    assert len(data["nz"])==120
