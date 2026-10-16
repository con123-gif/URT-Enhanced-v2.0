"""Run the verified augmented 64-cell / hidden-loop / center-4 synthesis.

No result files are written or modified. SymPy full polynomial equality
is an optional additional independently-executed gate.
"""
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import pytest

ROOT=Path(__file__).resolve().parents[1]
SCRIPT=ROOT/"research_archive/2026-10-16_center4_synthesis/center4_unified_audit.py"

@pytest.mark.skipif(
    importlib.util.find_spec("numpy") is None or
    importlib.util.find_spec("scipy") is None,
    reason="NumPy/SciPy required")
def test_center4_basic_spectrum_and_gauge_covariance():
    env={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1"}
    run=subprocess.run([sys.executable,str(SCRIPT)],cwd=SCRIPT.parent,
        check=True,capture_output=True,text=True,timeout=90,env=env)
    report=json.loads(run.stdout)
    assert report["exact_augmented_chain_ranks"]==[1,11,19,1]
    assert report["edge_exact_coexact_harmonic_dimensions"]==[11,19,0]
    assert report["edge_trace_split"]==[60,60]
    assert report["64_dirac_zero_modes"]==0
    assert report["64_dirac_spectrum_residual"]<1e-12
    assert report["Wilson_gauge_covariance_error"]<1e-12
    assert report["physical_Yang_Mills_massless_proved"] is False
    assert [z["critical_half_gap"] for z in report["intertwiners"]]==[1.,2.,1.]

@pytest.mark.skipif(
    any(importlib.util.find_spec(n) is None for n in ("numpy","scipy","sympy")),
    reason="Exact full polynomial requires NumPy, SciPy and SymPy")
def test_center4_exact_integer_charpoly():
    env={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1"}
    run=subprocess.run([sys.executable,str(SCRIPT),"--exact"],
        cwd=SCRIPT.parent,check=True,capture_output=True,text=True,timeout=90,env=env)
    report=json.loads(run.stdout)
    assert report["exact_integer_charpoly_verified"] is True
