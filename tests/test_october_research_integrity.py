"""Prevent October 2026 executable-archive regressions.

Checks Python syntax across archived research scripts without importing heavy
scientific libraries, and independently regenerates the October 16 theorem JSON
where NumPy is available. The optional full integrated runner smoke test requires
SymPy, is run in its own directory, and reports failure as a real test failure.
"""
from __future__ import annotations
import ast
import importlib.util
import json
import os
import subprocess
import sys
from pathlib import Path
import pytest

ROOT=Path(__file__).resolve().parents[1]
OCT15=ROOT/"research_archive/2026-10-15_icosahedral_125_DEC_H64"
OCT16=ROOT/"research_archive/2026-10-16_multicell_gravity"

@pytest.mark.parametrize("filename",[
 "cathedral_unified_urt_runner.py",
 "cathedral_entanglement_spin2_exact.py",
 "cathedral_operator_audit.py",
 "cathedral_strict_64_closure.py"])
def test_oct15_scripts_compile(filename):
    p=OCT15/filename
    compile(p.read_text(encoding="utf-8"),str(p),"exec")

@pytest.mark.parametrize("filename",[
 "cathedral_multicell_three_theorems_2026_10_16.py",
 "cathedral_four_links_audit_2026_10_16.py",
 "cathedral_five_stage_audit_2026_10_16.py"])
def test_oct16_scripts_compile(filename):
    p=OCT16/filename
    ast.parse(p.read_text(encoding="utf-8"),filename=str(p))

@pytest.mark.skipif(importlib.util.find_spec("numpy") is None,reason="NumPy unavailable")
def test_theorem_generated_json_has_committed_schema(tmp_path):
    import numpy as np
    p=OCT16/"cathedral_multicell_three_theorems_results_2026_10_16.json"
    archived=json.loads(p.read_text(encoding="utf-8"))
    env={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1"}
    output=tmp_path/"generated_theorem_results.json"
    done=subprocess.run([sys.executable,str(OCT16/"cathedral_multicell_three_theorems_2026_10_16.py"),
                         "--output",str(output)],
                        cwd=OCT16,env=env,check=True,text=True,capture_output=True,timeout=90)
    produced=json.loads(output.read_text(encoding="utf-8"))
    assert json.loads(p.read_text(encoding="utf-8"))==archived
    def compare_keys_and_values(x,y):
        assert type(x)==type(y)
        if isinstance(x,dict):
            assert set(x)==set(y)
            for k in x: compare_keys_and_values(x[k],y[k])
        elif isinstance(x,list):
            assert len(x)==len(y)
            for a,b in zip(x,y):compare_keys_and_values(a,b)
        elif isinstance(x,(float,int)) and not isinstance(x,bool):
            assert np.isclose(x,y,rtol=1e-7,atol=2e-14)
        else: assert x==y
    compare_keys_and_values(archived,produced)

@pytest.mark.skipif(importlib.util.find_spec("sympy") is None,reason="SymPy unavailable")
def test_integrated_urt_runner_executes_when_sympy_installed():
    env={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1"}
    done=subprocess.run([sys.executable,str(OCT15/"cathedral_unified_urt_runner.py")],
         cwd=OCT15,env=env,check=True,capture_output=True,text=True,timeout=180)
    assert "PASS: integrated finite Cathedral × URT experiment" in done.stdout
