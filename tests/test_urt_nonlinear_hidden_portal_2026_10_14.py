"""Regression of the nonlinear route through the dodecahedral hidden kernel."""
import runpy
from pathlib import Path

def test_linear_obstruction_has_nonlinear_portal():
    source=Path(__file__).resolve().parents[1]/"research_archive"/"urt_nonlinear_hidden_portal_2026_10_14.py"
    data=runpy.run_path(str(source))
    assert data["ranks"]==[4,4,8]
    assert [data["r3"],data["r5"],data["r8"]]==[4,4,8]
    assert data["E_next"]<data["E"]
