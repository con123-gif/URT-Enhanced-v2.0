"""Public URT factory and backwards-compatibility smoke test."""
from pathlib import Path
import numpy as np
from cathedral_core.urt import native_urt_spatial_dynamics
from cathedral_core.spatial_dynamics import NativeURTSpatialDynamics
from cathedral_core.full_dynamics import NativeURTFullDynamics

ORIGINAL=Path(__file__).resolve().parents[1]/'research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py'

def test_public_factory_uses_original_all_five_engine():
    engine=native_urt_spatial_dynamics(ORIGINAL,spacing=(1.2,2.,3.))
    assert isinstance(engine,NativeURTSpatialDynamics)
    assert isinstance(engine,NativeURTFullDynamics)
    assert engine.spacing==(1.2,2.,3.)
    assert engine.H.shape==(190,190)
    assert engine.Hbits.shape==(64,64)
    state=engine.new_spatial_state((2,1,1))
    energy,gz,gy=engine.energy_gradient(state)
    assert np.isfinite(energy) and abs(energy)<1e-14
    assert not np.any(gz) and not np.any(gy)