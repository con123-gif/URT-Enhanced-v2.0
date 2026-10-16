"""Regression gates for new finite Maxwell and non-Abelian Berry/BKM mechanisms.

Runs source scripts in isolated processes. Scripts write no fixture files.
"""
import os,sys,subprocess,json,importlib.util
from pathlib import Path
import pytest
ROOT=Path(__file__).resolve().parents[1]
DIR=ROOT/"research_archive/2026-10-16_sourced_gauge_hidden_berry"
ENV={**os.environ,"OPENBLAS_NUM_THREADS":"1","OMP_NUM_THREADS":"1"}

def run(name,timeout=90):
 p=DIR/name
 done=subprocess.run([sys.executable,str(p)],cwd=DIR,
   check=True,capture_output=True,text=True,env=ENV,timeout=timeout)
 return json.loads(done.stdout)

@pytest.mark.skipif(importlib.util.find_spec("numpy") is None,reason="requires NumPy")
def test_sourced_maxwell_on_actual_icosahedron():
 r=run("sourced_maxwell_exact.py")
 assert r["chain_composition_zero"]
 assert r["current_continuity_Ward_residual"]<1e-12
 assert r["Gauss_law_residual"]<1e-12
 assert r["hidden_current_static_residual"]<1e-12
 assert abs(r["hidden_equal_norm_energy_ratio"]-5/3)<1e-12
 assert r["pair_resistance"]=={
   "adjacent":"11/30","distance2":"7/15","antipodal":"1/2"}
 assert r["pair_counts"]=={
   "adjacent":30,"distance2":30,"antipodal":6}
 assert r["continuum_icosahedral_Maxwell_symbol_error"]<1e-12
 assert r["finite_shift_gauge_error"]<1e-10

@pytest.mark.skipif(
  any(importlib.util.find_spec(x) is None for x in ("numpy","sympy")),
  reason="requires NumPy and SymPy")
def test_exact_berry_and_u8_lie_closure():
 r=run("hidden_berry_exact.py",timeout=120)
 assert r["rational_commutant_constraint_rank"]==63
 assert r["associative_rank_by_word_degree"]==[1,12,62,64]
 assert r["Lie_u8_rank_by_commutator_depth"]==[12,39,63,64]
 assert r["Berry_total_strength"]=="14912/3375"
 assert r["Berry_off_quartet_strength"]=="4/5"
 assert abs(r["BKM_orbit_Hessian_value"]-2.3982894745923344)<1e-10

@pytest.mark.skipif(
  any(importlib.util.find_spec(x) is None for x in ("numpy","scipy")),
  reason="requires NumPy and SciPy")
def test_positive_density_berry_BKM_entropy():
 r=run("berry_bkm_positive_state_test.py")
 assert abs(r["Berry_interquartet_curvature_norm_squared"]-.8)<1e-11
 assert abs(r["unitary_orbit_entropy_Hessian"]-2.3982894745923344)<1e-10
 assert r["full_positive_density_orbit_checks"][-1]["difference_from_theorem"]<1e-6
