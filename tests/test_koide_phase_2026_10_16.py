"""Koide/URT October 16 source-independent phase mathematics and regression."""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import pytest

ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/"research_archive/2026-10-16_koide_phase"

def test_charge_plane_and_mass_ratio_against_sources():
    result=subprocess.run([sys.executable,str(BASE/"koide_phase_independent_check.py")],
             cwd=BASE,check=True,text=True,capture_output=True,timeout=30)
    out=json.loads(result.stdout)
    assert out["original_URT_charge_plane"]["all_loop_phases_zero"]
    assert out["original_URT_charge_plane"]["trace_h"]==112
    assert out["original_URT_charge_plane"]["rank_one_identity_residual"]<1e-10
    assert 441<out["rational_2_over_9_test"]["mu_e_ratio_discrepancy_sigma"]<443
    assert abs(out["exact_Q_hypothesis"]["delta_inferred_from_measured_mu_e"]-0.222222047073)<1e-10
    assert abs(out["rational_2_over_9_test"]["Q_shift_from_2_over_3"]+1.4214639e-7)<1e-11
    assert abs(out["rational_2_over_9_test"]["tau_pull_sigma_if_Q_relaxed"])<1.

@pytest.mark.skipif(importlib.util.find_spec("numpy") is None,reason="NumPy unavailable")
def test_circulant_koide_trace_and_det_invariants():
    result=subprocess.run([sys.executable,str(BASE/"koide_circulant_invariant_gate.py")],
             cwd=BASE,check=True,text=True,capture_output=True,timeout=30)
    assert "PASS exact trace Q=2/3 and determinant phase identity" in result.stdout
