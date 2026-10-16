"""Smoke-check the original finite icosahedral POVM and BKM source script."""
import subprocess
import sys
from pathlib import Path
import numpy as np

ROOT=Path(__file__).resolve().parents[1]
SCRIPT=ROOT/"research_archive/2026-10-16_hidden_visible_povm/hidden_visible_povm_check.py"

def test_hidden_visible_povm_complete_and_symmetry_resolved():
    result=subprocess.run([sys.executable,str(SCRIPT)],
        cwd=SCRIPT.parent,text=True,capture_output=True,check=True,timeout=60)
    assert "PASS hidden POVM" in result.stdout
    assert "Face quartets parity: 4_3=odd, 4_5=even" in result.stdout
    assert "Response 3-to-3prime ratio phi^6:" in result.stdout

def test_response_constants_derived_without_external_data():
    from cathedral_core.constants import PHI,DELTA,ETA_DELTA
    chi=8*ETA_DELTA*(1+DELTA**2)/(1-DELTA**2)
    a=1/(4*(1+DELTA**2))
    b=DELTA**2*a
    r3=2*(5+2*np.sqrt(5))/(135*chi)
    r3p=2*(5-2*np.sqrt(5))/(135*chi)
    r5=a/75+b/27
    assert np.isclose(r3/r3p,PHI**6,rtol=1e-12)
    assert 0<r3p<r3<r5
